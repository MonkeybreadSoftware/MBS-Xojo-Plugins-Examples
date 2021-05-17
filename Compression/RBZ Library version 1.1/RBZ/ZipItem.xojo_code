#tag Class
Protected Class ZipItem
	#tag Method, Flags = &h0
		Sub addChild(item as folderitem, progress as ProgressMonitor)
		  addChild item, "", progress
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addChild(item as folderitem, comment as string = "", options as CompressionOptions, progress as ProgressMonitor = nil)
		  //set compression options
		  compressionOptions = options
		  
		  //add child
		  addChild item, comment, progress
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addChild(item as folderitem, comment as string = "", progress as ProgressMonitor = nil)
		  //add an item to directory
		  if not isDirectory then return // does nothing if item is not a directory
		  if item.name = ".DS_Store" then return // don't store system files
		  if item.Alias then return // don't store aliases
		  
		  dim zp as ZipProgress
		  if progress <> nil then
		    zp = new ZipProgress(z_precalculateSizes(item) + 1,progress)
		  end
		  
		  z_addChild item, comment, zp //add to internal structure and write file record to archive
		  z_writeFileHeaders //write central directory records
		  
		  if progress <> nil then zp.increment 1 //notify completion 
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub constructor(parent as ZipItem = nil)
		  if parent <> nil then
		    
		    //set parent
		    z_setParent parent
		    
		    //set defaults
		    compressionOptions = parent.compressionOptions
		    expansionOptions = parent.expansionOptions
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub delete(progress as ProgressMonitor = nil)
		  dim zp as ZipProgress
		  if progress <> nil then
		    zp = new ZipProgress(1,progress)
		  end
		  
		  z_tagForDeletion //recursively mark self and children for deletion
		  z_compact zp //compact the file 
		  z_delete //recursively delete self and children from archive
		  z_writeFileHeaders //write central directory records
		  
		  if progress <> nil then zp.increment 1 //notify completion 
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub expand(destinationDirectory as folderItem, options as ExpansionOptions, progress as ProgressMonitor = nil)
		  dim zp as ZipProgress
		  if progress <> nil then
		    zp = new ZipProgress(getCompressedSize + 1,progress)
		  end
		  
		  z_expand destinationDirectory, zp, options
		  
		  if progress <> nil then zp.increment 1 //notify completion
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub expand(destinationDirectory as folderItem, progress as ProgressMonitor = nil)
		  //neccessary to duplicate this code due to a strange crash which
		  //occurs if we attempt tp call other expand function
		  
		  dim zp as ZipProgress
		  if progress <> nil then
		    zp = new ZipProgress(getCompressedSize + 1,progress)
		  end
		  
		  z_expand destinationDirectory, zp, expansionOptions
		  
		  if progress <> nil then zp.increment 1 //notify completion
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getArchive() As zipArchive
		  return archive
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getChildren() As ZipItem()
		  //return clone of children array
		  dim c() as ZipItem
		  for i as integer = 0 to ubound(children)
		    c.Append children(i)
		  next
		  return c
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getComment() As string
		  return comment
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getCompressedSize() As uint64
		  if isDirectory and compressedSize = 0 then
		    for i as integer = 0 to UBound(children)
		      compressedSize = compressedSize + children(i).getCompressedSize
		    next
		  end
		  
		  return compressedSize
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub getCompressionOptions(byref options as CompressionOptions)
		  options = compressionOptions
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub getExpansionOptions(byref options as ExpansionOptions)
		  options = expansionOptions
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getModified() As date
		  return modified
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getName() As string
		  return name
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getParent() As ZipItem
		  return parent
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getPath() As string
		  dim path as string = me.path
		  if path.leftb(1) = "/" then path = path.midb(2)
		  if path <> "" and directory and path.rightb(1) <> "/" then path = path + "/"
		  return path
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getUncompressedSize() As uint64
		  if isDirectory and uncompressedSize = 0 then
		    for i as integer = 0 to UBound(children)
		      uncompressedSize = uncompressedSize + children(i).getUncompressedSize
		    next
		  end
		  
		  return uncompressedSize
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isDirectory() As boolean
		  return directory
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setExpansionOptions(options as ExpansionOptions)
		  expansionOptions = options
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub z_addChild(item as folderitem, comment as string = "", progress as ZipProgress)
		  if not isDirectory then return //not permitted
		  
		  dim child as new ZipItem(me)
		  child.name = z_cleanFileName(item.Name) //set file name
		  child.path = path +"/" + child.name //set file path
		  child.comment = comment.ConvertEncoding(Encodings.DOSLatinUS) //set file comment
		  child.modified = item.ModificationDate //set modification date
		  child.directory = item.Directory //set directory status
		  child.uncompressedSize = item.Length //set uncompressed file size
		  children.Append child // add to internal children array
		  
		  //handle children (do this before writing file records so we can tell if directories are empty)
		  for i as integer = 1 to item.Count
		    if item.item(i).name <> ".DS_Store" then child.z_addChild item.Item(i), progress //repeat for item contents
		  next
		  
		  //write the file record
		  if child.directory then
		    child.z_writeFileRecord nil, progress // write the directory record
		  else
		    child.z_writeFileRecord new FileStream(item), progress // write the file record
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub z_addChild(item as ZipItem)
		  if not isDirectory then return //not permitted
		  
		  //compare paths
		  dim mypath as string = getPath
		  dim childPath as string = item.getPath
		  
		  if childPath.lenb <= myPath.lenb then
		    return //something's gone wrong
		  end
		  
		  if childPath.leftb(mypath.lenb) <> mypath then
		    return //something's gone wrong
		  end
		  
		  dim relativePath as string = childPath.midb(mypath.lenb)
		  if relativePath.LeftB(1) = "/" then relativePath = relativePath.midb(2) //removing leading slash
		  if relativePath.rightb(1) = "/" then relativePath = relativePath.leftb(relativePath.lenb-1) //removing trailing slash
		  
		  if relativePath = item.name then
		    
		    //place item directly into this directory
		    children.Append item
		    item.z_setParent me
		    
		    //set defaults
		    item.compressionOptions.deflateWindow = me.compressionOptions.deflateWindow
		    item.expansionOptions = me.expansionOptions
		    
		  else
		    
		    dim nextDirectory as string = nthfield(relativePath,"/",1) //name of next directory in the path
		    
		    for i as integer = 0 to ubound(children)
		      if children(i).name = nextDirectory then
		        //add to existing directory
		        children(i).z_addChild(item)
		        return
		      end
		    next
		    
		    //create a new directory item
		    dim dir as new ZipItem(me)
		    children.Append dir
		    dir.name = nextDirectory //set directory name
		    dir.directory = true //is a directory (obviously)
		    dir.path = getPath + dir.name
		    
		    //add child to new item
		    dir.z_addChild(item)
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function z_cleanFileName(name as string) As string
		  //encode filename for dos compatibility
		  dim cleaned as string = name.ConvertEncoding(Encodings.DOSLatinUS)
		  cleaned = cleaned.ReplaceAllB("/",":")
		  
		  //avoid name clashes with siblings
		  for i as integer = 0 to ubound(children)
		    while children(i).name = cleaned
		      cleaned = z_incrementName(cleaned)
		    wend
		  next
		  
		  return cleaned
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub z_collateItems(offsets() as uint64, items() as ZipItem)
		  if isDirectory and ubound(children) > -1 then
		    
		    //non-empty directories aren't stored in archive, so skip and deal with children
		    for i as integer = 0 to ubound(children)
		      children(i).z_collateItems offsets, items
		    next
		    
		  else
		    
		    //insert in order of offset
		    //binary insertion sort would be faster but speed of this function is unlikely to be a bottleneck
		    if ubound(offsets) = -1 or relativeOffset > offsets(ubound(offsets)) then
		      offsets.Append relativeOffset
		      items.Append me
		    else
		      for i as integer = ubound(offsets) downto 0
		        if offsets(i) > relativeOffset then
		          offsets.Insert i, relativeOffset
		          items.Insert i, me
		          return
		        end
		      next
		    end
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub z_compact(progress as ZipProgress)
		  //write file data
		  ZipItem(archive).z_compact progress
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub z_delete()
		  //delete children
		  //work  on a duplicate of children array as
		  //array is manipulated by deletion process
		  dim children() as ZipItem = getChildren
		  for i as integer = 0 to ubound(children)
		    children(i).z_delete
		  next
		  
		  //remove self from parent
		  for i as integer = 0 to ubound(ZipItem(parent).children)
		    if ZipItem(parent).children(i) = me then
		      ZipItem(parent).children.Remove i
		      exit
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub z_expand(destinationDirectory as folderItem,  progress as ZipProgress, options as ExpansionOptions)
		  //must be a valid destination directory
		  if destinationDirectory = nil or not destinationDirectory.exists then return
		  if not destinationDirectory.directory then return
		  
		  //handle name clashes
		  dim name as string = me.name
		  #if TargetMacOS
		    name = name.ReplaceAllB(":","/")
		  #endif
		  if not options.replaceFiles then
		    for i as integer = 1 to destinationDirectory.Count
		      while destinationDirectory.item(i).name = name
		        //rename file to avoid clash
		        name = z_incrementName(name)
		      wend
		    next
		  end
		  
		  if directory then
		    
		    //create directory
		    dim dir as FolderItem = destinationDirectory.Child(name)
		    dir.CreateAsFolder
		    
		    //handle children
		    for i as integer = 0 to ubound(children)
		      children(i).z_expand dir, progress, options 
		    next
		    
		  else
		    
		    //create file
		    dim file as FolderItem = destinationDirectory.Child(name)
		    z_writeFile new FileStream(file), options, progress
		    
		    //set file modification date
		    if modified <> nil then file.ModificationDate = modified
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function z_incrementName(name as string) As string
		  //increment a file name number to prevent name clashes
		  //for example foo.txt becomes foo 1.txt, foo 1.txt becomes foo 2.txt, etc
		  
		  dim extension as string
		  dim theName as string
		  if CountFields(name,".") > 1 then
		    extension = "." + NthField(name,".",CountFields(name,"."))
		    theName = NthField(name,".",CountFields(name,".") - 1)
		  else
		    theName = name
		  end
		  
		  dim number as string
		  for i as integer = theName.LenB downto 1
		    dim char as string = theName.MidB(i,1)
		    if AscB(char) < 48 or AscB(char) > 57 then
		      if char <> " " then number = ""
		      exit
		    else
		      number = char + number
		    end
		  next
		  
		  if number <> "" then
		    return theName.LeftB(theName.LenB - number.LenB) + str(val(number) + 1) + extension
		  else
		    return theName + " 1" + extension
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function z_precalculateSizes(item as folderitem) As uint64
		  dim total as uint64
		  
		  if item.Directory then
		    //handle children
		    for i as integer = 1 to item.Count
		      if item.item(i).name <> ".DS_Store" then
		        total = total + z_precalculateSizes(item.Item(i)) //repeat for item contents
		      end
		    next
		    return total
		  end
		  
		  return total + item.Length
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub z_setParent(parent as ZipItem)
		  //set parent and archive properties
		  me.parent = parent
		  if parent isa ZipArchive then
		    archive = ZipArchive(parent)
		  else
		    archive = parent.archive
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub z_tagForDeletion()
		  //delete children
		  for i as integer = 0 to ubound(children)
		    children(i).z_tagForDeletion
		  next
		  
		  //tag
		  deleted = true
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub z_writeFile(sw as StreamWriter, item as ZipItem = nil, options as ExpansionOptions, progress as ZipProgress)
		  //write file data
		  ZipItem(archive).z_writeFile sw, me, options, progress
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub z_writeFileHeader(sw as StreamWriter, item as Zipitem = nil)
		  //write file header for this item
		  ZipItem(archive).z_writeFileHeader sw, me
		  
		  //handle children
		  for i as integer = 0 to ubound(children)
		    children(i).z_writeFileHeader sw
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub z_writeFileHeaders()
		  ZipItem(archive).z_writeFileHeaders
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub z_writeFileRecord(item as ZipItem = nil, data as FileStream, progress as ZipProgress)
		  ZipItem(archive).z_writeFileRecord me, data, progress
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected archive As ZipArchive
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected children() As ZipItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected comment As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected compressedSize As uint64
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected compressionOptions As CompressionOptions
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected crc As uint32
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected deleted As boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected directory As boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected expansionOptions As ExpansionOptions
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected extraData As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected modified As Date
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected name As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected parent As ZipItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected path As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected relativeOffset As uint64
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected uncompressedSize As uint64
	#tag EndProperty


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
