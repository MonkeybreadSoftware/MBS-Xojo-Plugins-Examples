#tag Class
Protected Class ZipArchive
Inherits ZipItem
	#tag Method, Flags = &h0
		Sub constructor(archive as folderitem)
		  //only call once
		  if archiveFile <> nil then return
		  
		  //get default settings
		  z_setDefaultOptions
		  
		  archiveFile = archive //set archive file
		  directory = true //archive is always a directory
		  
		  if archive.Exists then
		    
		    //open the archive
		    dim sr as new FileStream(archive,true)
		    
		    //find end of central directory record
		    
		    //work backwards to find signature
		    for i as integer = sr.getLength - 4 downto 0
		      sr.setPosition i
		      dim signature as UInt32 = sr.readUInt32
		      if signature = &h06054b50 then exit
		    next
		    
		    if sr.getPosition = 4 then
		      //failed to find central directory - file may be corrupt or not a zip file at all
		      return
		    else
		      
		      sr.skip 6
		      //get number of directory entries
		      dim entries as uint16 = sr.readUInt16
		      
		      //find and go to start of central directory
		      sr.skip 4
		      centralDirectoryStart = sr.readUInt32
		      sr.setPosition centralDirectoryStart
		      
		      //parse central directory file headers
		      for i as integer = 1 to entries
		        z_addChild z_readFileHeader(sr)
		      next
		      
		    end
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub delete(progress as ProgressMonitor = nil)
		  dim zp as ZipProgress
		  if progress <> nil then
		    zp = new ZipProgress(1,progress)
		  end
		  
		  //tag children for deletion
		  dim children() as ZipItem = getChildren
		  for i as integer = 0 to ubound(children)
		    children(i).z_tagForDeletion
		  next
		  
		  //compact file
		  z_compact zp
		  
		  //delete children
		  for i as integer = 0 to ubound(children)
		    children(i).z_delete
		  next
		  
		  //write central directory records
		  z_writeFileHeaders
		  
		  if progress <> nil then zp.increment 1 //notify completion 
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getArchive() As ZipArchive
		  return me
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getFileCount() As uint32
		  return files
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function getFileType() As FileType
		  dim f as new FileType
		  f.Name = "zip"
		  f.Extensions = ".zip"
		  return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getName() As string
		  return archiveFile.Name
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getParent() As ZipItem
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setCompressionOptions(options as CompressionOptions)
		  compressionOptions = options
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub z_compact(progress as ZipProgress)
		  //sort all items in archive by offset
		  dim offsets() as uint64
		  dim items() as ZipItem
		  z_collateItems offsets, items
		  offsets.Append centralDirectoryStart
		  
		  if progress <> nil then
		    //calculate amount of data that must be moved
		    dim counterStarted as Boolean = false
		    for i as integer = 0 to ubound(items)
		      if items(i).deleted then
		        counterStarted = true
		      elseif counterStarted then
		        progress.total = progress.total + offsets(i+1) - offsets(i)
		      end
		    next
		  end
		  
		  dim shift as uint64 = offsets(0) // would normally be zero, but just in case...
		  
		  //open archive input stream and skip to data location
		  dim fs as FileStream = new FileStream(archiveFile,true)
		  
		  for i as integer = 0 to ubound(items)
		    
		    dim offset as uint64 = offsets(i)
		    dim length as UInt64 = offsets(i+1) - offset
		    
		    dim item as ZipItem = items(i)
		    if item.deleted then
		      
		      //adjust shift
		      shift = shift + length
		      
		    elseif shift > 0 then
		      
		      //shift offset
		      item.relativeOffset = item.relativeOffset - shift
		      
		      //move data
		      fs.setPosition offset
		      dim total as uint64 = length
		      while total > 0
		        dim chunk as uint16 = min(total,compressionOptions.deflateWindow)
		        dim data as string = fs.readString(chunk)
		        fs.setPosition offset - shift
		        fs.writeString data
		        total = total - chunk
		        if progress <> nil  then progress.increment chunk
		      wend
		      
		    end
		    
		  next
		  
		  centralDirectoryStart = fs.getPosition
		  fs.truncate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function z_getCompressionBits(options as CompressionOptions) As uint16
		  if options.method <> CompressionMethod.deflate then
		    //leave bits empty
		    return &b0000000000000000
		  end
		  
		  select case options.deflateLevel
		  case DeflateLevel.normal
		    return &b0000000000000000
		  case DeflateLevel.maximum
		    return &b0000000000000010
		  case DeflateLevel.fast
		    return &b0000000000000100
		  case DeflateLevel.fastest
		    return &b0000000000000110
		  else
		    Raise new UnsupportedFormatException
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function z_getCRC(previous as uint32 = 0, data as string) As uint32
		  #pragma BoundsChecking false
		  #pragma NilObjectChecking false
		  #pragma BackgroundTasks false
		  
		  #if useMBS
		    
		    static z as new ZLibCompressMBS
		    
		    //use mbs zlib crc function
		    return z.CRC32(previous, data)
		    
		  #else
		    
		    //create crc table
		    if crc32Table(0) = 0 then
		      
		      'this is the official polynomial used by CRC32 in PKZip.
		      'often the polynomial is shown reversed (04C11DB7).
		      dim dwPolynomial As Int32 = &hEDB88320
		      dim i as Integer, j as Integer
		      
		      dim dwCrc As int32
		      
		      for i = 0 to 255
		        dwCrc = i
		        for j = 8 downto 1
		          If ((dwCrc and 1) > 0) Then
		            dwCrc = ((dwCrc and &hFFFFFFFE) \ 2) and &h7FFFFFFF
		            dwCrc = dwCrc xor dwPolynomial
		          Else
		            dwCrc = (((dwCrc and &hFFFFFFFE) \ 2) and &h7FFFFFFF)
		          End If
		        next
		        crc32Table(i) = dwCrc
		      next
		      
		    end
		    
		    //get crc
		    dim crc as uint32 = Bitwise.OnesComplement(previous)
		    dim iLookup as uint64
		    
		    dim size as uint32 = data.LenB
		    for i as uint32 = 1 to size
		      iLookup = (crc and &hFF) Xor data.MidB(i,1).Asc
		      crc = ((crc and &hFFFFFF00) \ &h100) and 16777215
		      crc = crc or crc32Table(iLookup)
		    next
		    
		    return Bitwise.OnesComplement(crc)
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function z_getDeflateLevel(flags as uint16) As DeflateLevel
		  flags = Bitwise.BitAnd(flags,&b0000000000000110)
		  select case flags
		  case 0
		    return DeflateLevel.normal
		  case 1
		    return DeflateLevel.maximum
		  case 2
		    return DeflateLevel.fast
		  case 3
		    return DeflateLevel.fastest
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function z_getMBSCompressionLevel(level as DeflateLevel) As uint8
		  select case level
		  case DeflateLevel.maximum
		    return 9
		  case DeflateLevel.normal
		    return 6
		  case DeflateLevel.fast
		    return 3
		  case DeflateLevel.fastest
		    return 0
		  else
		    Raise new UnsupportedFormatException
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function z_getZLibHeader(item as ZipItem) As string
		  #if useMBS
		    //get zlib header
		    return CompressZLibMBS("foo",z_getMBSCompressionLevel(item.compressionOptions.deflateLevel)).leftb(2)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function z_readCompressionMethod(sr as StreamReader) As CompressionMethod
		  select case sr.readUInt16
		  case 8
		    return CompressionMethod.deflate
		  case 0
		    return CompressionMethod.none
		  else
		    return CompressionMethod.unsupported
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function z_readFileHeader(sr as StreamReader) As ZipItem
		  dim item as new ZipItem
		  
		  //file header signature
		  if sr.readUInt32<> &h02014b50 then return nil //possibly corrupt?
		  
		  //version
		  call sr.readUInt8
		  
		  //file system
		  call sr.readUInt8
		  
		  //required version
		  if sr.readUInt16/10  > 2 then return nil //can't read it
		  
		  //general purpose bit flags
		  dim flags as UInt16 = sr.readUInt16
		  'flags = flags + &b0000000000000001 //file is encrypted
		  'flags = flags + &b0000000000000110 //compression bits
		  'flags = flags + &b0000000000001000 //crc32 field blank
		  'flags = flags + &b0000000000010000 //reserved for method 8
		  'flags = flags + &b0000000000100000 //patch data
		  'flags = flags + &b0000000001000000 //strong encryption
		  item.compressionOptions.deflateLevel = z_getDeflateLevel(flags)
		  
		  //compression method
		  item.compressionOptions.method = z_readCompressionMethod(sr)
		  
		  //time and date
		  item.modified = z_readTimeStamp(sr)
		  
		  //crc 32
		  item.crc = sr.readUInt32
		  //compressed size
		  item.compressedSize = sr.readUInt32
		  //uncompressed size
		  item.uncompressedSize = sr.readUInt32
		  
		  //file name length
		  dim pathLength as uint16= sr.readUInt16
		  //extra field length
		  dim extraFieldLength as uint16= sr.readUInt16
		  //file comment length
		  dim commentLength as uint16= sr.readUInt16
		  
		  //disk number start
		  call sr.readUInt16
		  
		  //internal file attributes
		  call sr.readUInt16
		  
		  //external file attibutes
		  call sr.readUInt32
		  
		  //relative offset of local header
		  item.relativeOffset = sr.readUInt32
		  
		  //file name
		  item.path = sr.readString(pathLength,encodings.DOSLatinUS)
		  item.name = NthField(item.path,"/",CountFields(item.path,"/"))
		  if item.name = "" then
		    item.name = NthField(item.path,"/",CountFields(item.path,"/")-1)
		    item.directory = true
		  end
		  
		  //extra data
		  call sr.readString(extraFieldLength)
		  
		  //file comment
		  item.comment = sr.readString(commentLength)
		  
		  return item
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function z_readTimeStamp(sr as StreamReader) As Date
		  dim d as new Date
		  
		  // get time
		  dim time as UInt16 = sr.readUInt16
		  d.Hour = Bitwise.BitAnd(time,63488) \ 2048
		  d.Minute = Bitwise.BitAnd(time,2016) \ 32
		  d.Second = Bitwise.BitAnd(time,31) * 2
		  
		  // get date
		  dim date as UInt16 = sr.readUInt16
		  d.Year = Bitwise.BitAnd(date,65024) \ 512 + 1980
		  d.Month =  Bitwise.BitAnd(date,480) \ 32
		  d.Day = Bitwise.BitAnd(date,31)
		  
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub z_setDefaultOptions()
		  //compression options
		  #if useMBS then
		    compressionOptions.method = CompressionMethod.deflate
		  #else
		    compressionOptions.method = CompressionMethod.none
		  #endif
		  compressionOptions.deflateLevel = DeflateLevel.normal
		  compressionOptions.deflateWindow = 32768
		  
		  //decompression options
		  expansionOptions.ignoreChecksum = false
		  expansionOptions.ignoreErrors = false
		  expansionOptions.replaceFiles = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub z_writeCompressionMethod(sw as StreamWriter, method as CompressionMethod)
		  select case method
		  case CompressionMethod.deflate
		    sw.writeUInt16 8
		  else
		    sw.writeUInt16 0
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub z_writeFile(sw as StreamWriter, item as ZipItem = nil, options as ExpansionOptions, progress as ZipProgress)
		  //open archive input stream and skip to data location
		  dim sr as FileStream = new FileStream(archiveFile,true)
		  sr.setPosition item.relativeOffset
		  
		  //local file header signature
		  if sr.readUInt32 <> &h04034b50 then return //not a valid file record
		  
		  //required version
		  dim version as single = sr.readUInt16/10
		  if version > 2 then return //incompatible version
		  
		  //general purpose bit flags
		  call sr.readUInt16
		  
		  //compression method
		  call sr.readUInt16
		  
		  //last modified time
		  call sr.readUInt16
		  //last modified date
		  call sr.readUInt16
		  
		  //crc 32
		  call sr.readUInt32
		  //compressed size
		  call sr.readUInt32
		  //uncompressed size
		  call sr.readUInt32
		  
		  //file name length
		  dim pathLength as uint16= sr.readUInt16
		  //extra field length
		  dim extraFieldLength as uint16= sr.readUInt16
		  
		  //file name
		  call sr.readString(pathLength,encodings.DOSLatinUS)
		  //extra data
		  call sr.readString(extraFieldLength)
		  
		  //file data
		  if useMBS and item.compressionOptions.method = CompressionMethod.deflate then
		    #if useMBS
		      //deflate (requires mbs)
		      dim total as uint64 = item.getCompressedSize
		      dim z as new ZLibDecompressMBS
		      z.InitZip
		      call z.setInput z_getZLibHeader(item)
		      do
		        if z.OutputSize = 0 and z.InputAvail = 0 then
		          dim chunk as UInt16 = min(total,compressionOptions.deflateWindow)
		          call z.setInput  sr.readString(chunk)
		          total = total - chunk
		          if progress <> nil then progress.increment chunk
		        end
		        z.ProcessZip
		        sw.writeString z.GetOutput
		      loop until z.OutputSize = 0 and z.InputAvail = 0 and total = 0
		      z.EndZip
		    #endif
		  else
		    //no compression
		    dim total as uint64 = item.getCompressedSize
		    while total > 0
		      dim chunk as UInt16 = min(total,compressionOptions.deflateWindow)
		      sw.writeString sr.readString(chunk)
		      total = total - chunk
		      if progress <> nil then progress.increment chunk
		    wend
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub z_writeFileHeader(sw as StreamWriter, item as Zipitem = nil)
		  //get compression options
		  dim compressionOptions as CompressionOptions = item.compressionOptions
		  #if not useMBS
		    compressionOptions.method = CompressionMethod.none
		  #endif
		  
		  //only write files or empty directories
		  if item.isDirectory then
		    directories = directories + 1
		    if ubound(item.getChildren) > -1 then return
		    compressionOptions.method = CompressionMethod.none
		    emptyDirectories = emptyDirectories + 1
		  else
		    files = files + 1
		  end
		  
		  //file header signature
		  sw.writeUInt32 &h02014b50
		  
		  //version
		  sw.writeUInt8  2*10 + 1
		  
		  //file system
		  #if TargetWin32
		    //should check for other windows filesystem types
		    sw.writeUInt8 FilesystemFAT
		  #elseif TargetMacOS
		    sw.writeUInt8 FilesystemOSX
		  #elseif TargetLinux
		    sw.writeUInt8 FilesystemUnix
		  #endif
		  
		  //required version
		  sw.writeUInt16 2*10 + 0
		  
		  //general purpose bit flags
		  dim flags as UInt16
		  'flags = flags + &b0000000000000001 //file is encrypted
		  flags = flags + z_getCompressionBits(compressionOptions) //compression bits
		  if compressionOptions.method = CompressionMethod.deflate then
		     flags = flags + &b0000000000001000 //crc32 field blank
		  end
		  'flags = flags + &b0000000000010000 //reserved for method 8
		  'flags = flags + &b0000000000100000 //patch data
		  'flags = flags + &b0000000001000000 //strong encryption
		  sw.writeUInt16 flags
		  
		  //compression method
		  z_writeCompressionMethod sw,compressionOptions.method
		  
		  //time and date
		  z_writeTimeStamp sw,item.modified
		  
		  //crc 32
		  sw.writeUInt32 item.crc
		  //compressed size
		  sw.writeUInt32 item.getCompressedSize
		  //uncompressed size
		  sw.writeUInt32 item.getUncompressedSize
		  
		  //file name length
		  sw.writeUInt16 item.getPath.LenB
		  //extra field length
		  sw.writeUInt16 item.extraData.LenB
		  //file comment length
		  sw.writeUInt16 item.getComment.LenB
		  
		  //disk number start
		  sw.writeUInt16 0
		  
		  //internal file attributes
		  sw.writeUInt16 0
		  
		  //external file attibutes
		  sw.writeUInt32 &h81a44000  //temporary
		  
		  //relative offset of local header
		  sw.writeUInt32 item.relativeOffset
		  
		  //file path
		  sw.writeString item.getPath
		  //extra field
		  sw.writeString item.extraData
		  //file comment
		  sw.writeString item.getComment
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub z_writeFileHeaders()
		  //reset counters
		  files = 0
		  directories = 0
		  emptyDirectories = 0
		  
		  //get output file stream
		  dim sw as new FileStream(archiveFile,true)
		  sw.skip centralDirectoryStart
		  
		  dim items() as ZipItem = getChildren
		  for i as integer = 0 to ubound(items)
		    items(i).z_writeFileHeader sw
		  next
		  
		  //digital signature ------------
		  
		  'sw.writeUInt32 &h05054b50 //header signature
		  'sw.writeUInt16 0 //data size
		  'no data
		  
		  dim cdLength as uint32 = sw.getLength - centralDirectoryStart
		  dim cdItems as uint32 = files + emptyDirectories
		  
		  //end of central directory record
		  sw.writeUInt32 &h06054b50 // signature
		  sw.writeUInt16 0 // disk number
		  sw.writeUInt16 0 // number of disk with start of central directory
		  sw.writeUInt16 cdItems // total number of file entries on this disk
		  sw.writeUInt16 cdItems // total number of file entries in the central directory
		  sw.writeUInt32 cdLength // central directory size
		  sw.writeUInt32 centralDirectoryStart // central directory offset
		  sw.writeUInt16 0 //comment length
		  'no comment
		  
		  //truncate file to this length
		  sw.truncate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub z_writeFileRecord(item as ZipItem = nil, data as FileStream, progress as ZipProgress)
		  #pragma NilObjectChecking false
		  #pragma BoundsChecking false
		  
		  //get compression options
		  dim compressionOptions as CompressionOptions = item.compressionOptions
		  #if not useMBS
		    compressionOptions.method = CompressionMethod.none
		  #endif
		  
		  if item.isDirectory then
		    //only write files or empty directories
		    if ubound(item.getChildren) > -1 then return
		    //don't compress directories
		    compressionOptions.method = CompressionMethod.none
		  end
		  
		  if item.uncompressedSize = 0 then
		    //don't compress empty files
		    compressionOptions.method = CompressionMethod.none
		  end
		  
		  //size of buffer used for copying data
		  const bufferSize = 1048576 //1 megabyte
		  
		  //file type
		  dim f as new FileType
		  f.Name = "zip"
		  f.Extensions = ".zip"
		  
		  //get output file stream
		  dim sw as new FileStream(archiveFile,f,true)
		  //skip to end of existing file records
		  sw.skip centralDirectoryStart
		  
		  //set relative offset of file record
		  item.relativeOffset = sw.getPosition
		  
		  sw.writeUInt32 &h04034b50 //local file header signature
		  
		  //required version
		  sw.writeUInt16 2*10 + 0
		  
		  //general purpose bit flags
		  dim flags as UInt16
		  'flags = flags + &b0000000000000001 //file is encrypted
		  flags = flags + z_getCompressionBits(compressionOptions) //compression bits
		  if compressionOptions.method = CompressionMethod.deflate then
		    flags = flags + &b0000000000001000 //crc32 field blank
		  end
		  'flags = flags + &b0000000000010000 //reserved for method 8
		  'flags = flags + &b0000000000100000 //patch data
		  'flags = flags + &b0000000001000000 //strong encryption
		  sw.writeUInt16 flags
		  
		  //compression method
		  z_writeCompressionMethod sw,compressionOptions.method
		  
		  //time and date
		  z_writeTimeStamp sw,item.modified
		  
		  //get crc for uncompressed data
		  if data <> nil then
		    if compressionOptions.method <> CompressionMethod.deflate then
		      dim total as uint64 = item.uncompressedSize
		      while total > 0
		        dim chunk as UInt16 = min(total,compressionOptions.deflateWindow)
		        item.crc = z_getCRC(item.crc,data.readString(chunk))
		        total = total - chunk
		        #if not useMBS
		          if progress <> nil then progress.increment chunk*0.75
		        #endif
		      wend
		      data.setPosition 0
		      item.compressedSize = item.uncompressedSize
		    end
		  else
		    item.crc = 0
		    item.compressedSize = 0
		  end
		  
		  if Bitwise.BitAnd(flags,&b0000000000001000) > 0 then
		    //crc 32
		    sw.writeUInt32 0
		    //compressed size
		    sw.writeUInt32 0
		    //uncompressed size
		    sw.writeUInt32 0
		  else
		    //crc 32
		    sw.writeUInt32 item.crc
		    //compressed size
		    sw.writeUInt32 item.getCompressedSize
		    //uncompressed size
		    sw.writeUInt32 item.getUncompressedSize
		  end
		  
		  //file name length
		  sw.writeUInt16 item.getPath.LenB
		  //extra field length
		  sw.writeUInt16 item.extraData.LenB
		  
		  //file name
		  sw.writeString item.getPath
		  //extra data
		  sw.writeString item.extraData
		  
		  //output
		  'dim output as string
		  if data <> nil then
		    if useMBS and compressionOptions.method = CompressionMethod.deflate then
		      //deflate (requires mbs)
		      #if useMBS
		        dim total as uint64 = item.uncompressedSize
		        dim z as new ZLibCompressMBS
		        dim stripHeader as boolean = true
		        z.InitZip z_getMBSCompressionLevel(compressionOptions.deflateLevel)
		        do
		          if z.InputAvail = 0 then
		            //add data to compression buffer
		            dim chunk as UInt16 = min(total,compressionOptions.deflateWindow)
		            dim block as string = data.readString(chunk)
		            if not z.setInput(block) then
		              beep
		            end
		            total = total - chunk
		            if progress <> nil then progress.increment chunk
		          end
		          z.ProcessZip //process data
		          if stripHeader then
		            //remove 2 byte zlib header
		            if z.OutputSize >= 2 then
		              item.compressedSize = item.compressedSize + z.OutputSize - 2
		              sw.writeString z.GetOutput.midb(3) //write all except first 2 bytes
		              stripHeader = false
		            end
		          else
		            //write data chunk
		            item.compressedSize = item.compressedSize + z.OutputSize
		            sw.writeString z.GetOutput
		          end
		        loop until z.InputAvail = 0 and total = 0
		        z.EndZip
		        item.compressedSize = item.compressedSize + z.OutputSize
		        sw.writeString z.GetOutput
		        sw.Rewind 4 //skip the last 4 bytes
		        item.compressedSize = item.compressedSize - 4
		        sw.writeString "PK" + chrb(7) + chrb(8) //bomarchiver puts pkzip footer here, but seems to be optional
		      #endif
		    else
		      //no compression
		      dim total as uint64 = item.uncompressedSize
		      while total > 0
		        dim chunk as UInt16 = min(total,compressionOptions.deflateWindow)
		        sw.writeString data.readString(chunk)
		        total = total - chunk
		        #if useMBS
		          if progress <> nil then progress.increment chunk
		        #else
		          if progress <> nil then progress.increment chunk*0.25
		        #endif
		      wend
		    end
		  end
		  
		  if Bitwise.BitAnd(flags,&b0000000000001000) > 0 then
		    //crc 32
		    sw.writeUInt32 item.crc
		    //compressed size
		    sw.writeUInt32 item.getCompressedSize
		    //uncompressed size
		    sw.writeUInt32 item.getUncompressedSize
		  end
		  
		  //truncate file to this length
		  centralDirectoryStart = sw.getPosition
		  sw.truncate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub z_writeTimeStamp(sw as StreamWriter, date as Date)
		  //if date not known, set to current time
		  if date = nil then date = new date
		  
		  //time
		  sw.writeUInt16 date.Hour * 2048 + date.Minute * 32 + date.Second \ 2
		  
		  //date
		  sw.writeUInt16 (max(date.Year,1980) - 1980) * 512 + date.Month * 32 + date.Day
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private archiveFile As folderitem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private centralDirectoryStart As uint64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared crc32Table(255) As int32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private directories As uint32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private emptyDirectories As uint32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private files As uint32
	#tag EndProperty


	#tag Constant, Name = useMBS, Type = Boolean, Dynamic = False, Default = \"true", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
