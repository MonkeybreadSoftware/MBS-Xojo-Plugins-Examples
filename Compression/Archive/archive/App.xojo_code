#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  CreateTestFiles
		  
		  CreateArchive SpecialFolder.Desktop.Child("test"), SpecialFolder.Desktop.child("test.tar"), ArchiveWriterMBS.kFilterNone, ArchiveWriterMBS.kFormatTar
		  CreateArchive SpecialFolder.Desktop.Child("test"), SpecialFolder.Desktop.child("test.tbz"), ArchiveWriterMBS.kFilterBZip2, ArchiveWriterMBS.kFormatTar
		  CreateArchive SpecialFolder.Desktop.Child("test"), SpecialFolder.Desktop.child("test.tgz"), ArchiveWriterMBS.kFilterGZip, ArchiveWriterMBS.kFormatTar
		  
		  CreateArchive SpecialFolder.Desktop.Child("test"), SpecialFolder.Desktop.child("test.uncompressed.zip"), ArchiveWriterMBS.kFilterNone, ArchiveWriterMBS.kFormatZip, 1
		  CreateArchive SpecialFolder.Desktop.Child("test"), SpecialFolder.Desktop.child("test.zip"), ArchiveWriterMBS.kFilterNone, ArchiveWriterMBS.kFormatZip, 2
		  
		  CreateArchive SpecialFolder.Desktop.Child("test"), SpecialFolder.Desktop.child("test.7z"), ArchiveWriterMBS.kFilterNone, ArchiveWriterMBS.kFormat7Zip
		  
		  log "done"
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CreateArchive(item as FolderItem, destFile as FolderItem, Filter as integer, Format as integer, ZipLevel as integer = 0)
		  dim flags as integer = 0
		  
		  flags = BitwiseOr(flags, ArchiveReaderMBS.kExtractTime)
		  flags = BitwiseOr(flags, ArchiveReaderMBS.kExtractPermission)
		  flags = BitwiseOr(flags, ArchiveReaderMBS.kExtractACL)
		  flags = BitwiseOr(flags, ArchiveReaderMBS.kExtractFileFlags)
		  
		  dim aw as new ArchiveWriterMBS
		  
		  aw.AddFilter filter
		  
		  if aw.Lasterror <> aw.kArchiveOK then
		    log "Failed to set filter with error "+str(aw.Lasterror)+": "+aw.ErrorString
		    exit
		  end if
		  
		  aw.SetFormat Format
		  
		  if aw.Lasterror <> aw.kArchiveOK then
		    log "Failed to set format with error "+str(aw.Lasterror)+": "+aw.ErrorString
		    exit
		  end if
		  
		  
		  
		  Select case ZipLevel
		  case 1
		    aw.ZipSetCompressionStore
		  case 2
		    aw.ZipSetCompressionDeflate
		  end Select
		  
		  log "Create "+destFile.name
		  
		  if not aw.CreateFile(destFile) then
		    
		    log "Failed to create file: "+aw.ErrorString
		    
		    return
		    
		  end if
		  
		  if not aw.SetCurrentWorkingDirectory(item.parent) then
		    log "Failed to set working directory."
		    return
		  end if
		  
		  
		  dim disk as new ArchiveReadDiskMBS
		  
		  
		  if not disk.Open(item.name) then
		    log "Failed to set item for compress."
		    return
		  end if
		  
		  
		  do
		    dim entry as ArchiveEntryMBS = disk.NextHeader
		    
		    if disk.Lasterror = disk.kArchiveEOF then
		      exit
		    end if
		    
		    if disk.Lasterror <> disk.kArchiveOK then
		      log "Failed to get next item with error "+str(disk.Lasterror)+": "+disk.ErrorString
		      exit
		    end if
		    
		    if entry = nil then
		      break
		      exit
		    end if
		    
		    dim PathName as string = entry.PathName
		    dim FileName as string = NthField(PathName, "/", CountFields(PathName,"/"))
		    if left(FileName,1) = "." then Continue // skip
		    
		    disk.Descend
		    
		    log "add "+PathName
		    
		    // make flat archive
		    'entry.PathName = filename
		    aw.WriteHeader entry
		    
		    if aw.Lasterror <> aw.kArchiveOK then
		      log "Failed to write header with error "+str(aw.Lasterror)+": "+aw.ErrorString
		      exit
		    end if
		    
		    dim size as int64 = aw.WriteData(disk)
		    log str(size)+" bytes"
		    
		    // optional close each item.
		    'aw.FinishEntry
		    
		    if aw.Lasterror <> aw.kArchiveOK then
		      log "Failed to finish entry with error "+str(aw.Lasterror)+": "+disk.ErrorString
		      exit
		    end if
		    
		  loop
		  
		  
		  
		  aw.Close
		  disk.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateTestFiles()
		  dim f as FolderItem = SpecialFolder.Desktop.Child("test")
		  
		  f.CreateAsFolder
		  
		  // write test file
		  dim t as TextOutputStream = TextOutputStream.Create(f.Child("test.txt"))
		  
		  t.WriteLine "Hello World"
		  
		  // write two files with logos
		  dim p as Picture = LogoMBS(500)
		  p.Save(f.Child("mbs.jpg"), p.SaveAsJPEG)
		  
		  p.Save(f.Child("logo.jpg"), p.SaveAsJPEG)
		  
		  // write second text file
		  t = TextOutputStream.Create(f.Child("other.txt"))
		  
		  t.WriteLine "Just a test"
		  
		  
		  // write 10 MB file with all zeros, good to compress
		  dim b as BinaryStream = BinaryStream.Create(f.Child("zeros.txt"), true)
		  dim m as new MemoryBlock(1024*1024*10)
		  
		  b.Write m
		  
		  
		  dim subfolder as FolderItem = f.Child("sub folder")
		  
		  subfolder.CreateAsFolder
		  p.Save(subfolder.Child("logo2.jpg"), p.SaveAsJPEG)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExtractArchive(ArchiveFile as FolderItem, Dest as FolderItem)
		  
		End Sub
	#tag EndMethod


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
