#tag Module
Protected Module GlobalStreamFunctions
	#tag Method, Flags = &h0
		Sub ArchiveFile(extends destStream as MBSStream, file as folderitem)
		  dim b as MBSBufferStream
		  Dim rs As ResStreamMBS
		  dim ls as LargeBinaryStreamMBS
		  dim mrs as MBSResStream
		  dim mls as MBSLargeBinaryStream
		  dim l as integer
		  dim DatLen,ResLen as Double
		  
		  // Buffer output
		  b=new MBSBufferStream(destStream, 100000)
		  
		  // Write Name
		  b.Write "NAME"
		  b.WriteString file.Name
		  
		  DatLen=file.LogicalFileDataLengthMBS
		  ResLen=file.LogicalFileResLengthMBS
		  
		  // Write Resourcefork size
		  b.Write "RSIZ"
		  b.WriteDouble ResLen
		  
		  // Write Datafork size
		  b.Write "DSIZ"
		  b.WriteDouble DatLen
		  
		  // Write Resourcefork
		  b.Write "RDAT"
		  
		  if ResLen>0 then
		    rs=file.OpenAsResStreamMBS(False)
		    if rs<>nil then
		      mrs=new MBSResStream(rs)
		      mrs.CopyStreamTo b,100000
		      mrs=nil // close it
		    end if
		  end if
		  
		  // Write Datafork
		  b.Write "DATA"
		  if DatLen>0 then
		    ls=file.OpenAsLargeBinaryStreamMBS(false)
		    if ls<>nil then
		      mls=new MBSLargeBinaryStream(ls)
		      mls.CopyStreamTo b,100000
		      mls=nil // close it
		    end if
		  end if
		  
		  // Write Comment
		  b.Write "COMM"
		  b.WriteString file.CommentMBS
		  
		  // Write modification date
		  b.Write "MDAT"
		  b.WriteDouble file.ModificationDate.TotalSeconds
		  
		  // Write modification date
		  b.Write "CDAT"
		  b.WriteDouble file.CreationDate.TotalSeconds
		  
		  // Write Finder flags
		  b.Write "FLAG"
		  l=file.GetFileFlagsMBS
		  if l<0 then // error
		    l=0
		  end if
		  b.WriteInteger l
		  
		  // Write MacType
		  #If RBVersion < 2019
		    b.Write "MTYP"
		    b.WriteString file.MacType
		    
		    // Write MacCreator
		    b.Write "MCRE"
		    b.WriteString file.MacCreator
		  #EndIf
		  
		  // Write access rights
		  b.Write "PERM"
		  b.WriteInteger GetFilePermission(file)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ArchiveFolder(extends destStream as MBSStream, folder as folderitem)
		  dim b as MBSBufferStream
		  Dim l As Integer
		  dim i,c as integer
		  dim f as FolderItem
		  
		  c=folder.Count
		  
		  // Buffer output
		  b=new MBSBufferStream(destStream, 100000)
		  
		  // Write Name
		  b.Write "NAME"
		  b.WriteString folder.Name
		  
		  // Write Datafork size
		  b.Write "COUN"
		  b.WriteInteger c
		  
		  // Write Comment
		  b.Write "COMM"
		  b.WriteString folder.CommentMBS
		  
		  // Write modification date
		  b.Write "MDAT"
		  b.WriteDouble folder.ModificationDate.TotalSeconds
		  
		  // Write modification date
		  b.Write "CDAT"
		  b.WriteDouble folder.CreationDate.TotalSeconds
		  
		  // Write Finder flags
		  b.Write "FLAG"
		  l=folder.GetFolderFlagsMBS
		  if l<0 then // error
		    l=0
		  end if
		  b.WriteInteger l
		  
		  // Write MacType
		  #If RBVersion < 2019
		    b.Write "MTYP"
		    b.WriteString folder.MacType
		    
		    // Write MacCreator
		    b.Write "MCRE"
		    b.WriteString folder.MacCreator
		  #EndIf
		  
		  for i=1 to c
		    f=folder.TrueItem(i)
		    
		    if f<>nil then
		      if f.Directory then
		        b.Write "FOLD"
		        b.ArchiveFolder f
		      else
		        b.Write "FILE"
		        b.ArchiveFile f
		      end if
		    end if
		  next
		  
		  b.Write "FEND"
		  
		  // Write access rights
		  b.Write "PERM"
		  b.WriteInteger GetFilePermission(folder)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyBytesTo(extends source As MBSStream, dest as MBSStream, bufsize as integer, bytes as integer)
		  dim s as string
		  dim c as integer // bytes left
		  dim n as integer // Bytes to copy now
		  
		  c=bytes
		  
		  n=c
		  if n>bufsize then
		    n=bufsize
		  end if
		  
		  s=source.read(n)
		  while s<>"" 
		    dest.Write s
		    c=c-lenb(s)
		    
		    n=c
		    if n>bufsize then
		      n=bufsize
		    end if
		    
		    s=source.read(n)
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyStreamTo(extends source As MBSStream, dest as MBSStream, bufsize as integer)
		  dim s as string
		  
		  s=source.read(bufsize)
		  while s<>"" 
		    dest.Write s
		    
		    s=source.read(bufsize)
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindRandomName(dest as folderitem, name as string) As folderitem
		  dim s as string
		  dim f as FolderItem
		  dim i as integer
		  
		  i=1
		  s=left(name,20)+"."+str(i)
		  f=Dest.TrueChild(s)
		  while f.exists
		    
		    i=i+1
		    s=left(name,20)+"."+str(i)
		    f=Dest.TrueChild(s)
		  wend
		  
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetFilePermission(file as folderitem) As integer
		  dim d as DarwinChmodMBS
		  
		  d=new DarwinChmodMBS
		  
		  if d.stat(file.UnixpathMBS)=0 then
		    Return d.mode
		  else
		    Return -1 // for error
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadDouble(extends b as mbsStream) As double
		  dim m as MemoryBlock
		  
		  m=b.Read(8)
		  m.LittleEndian=false
		  
		  Return m.DoubleValue(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadInteger(extends b as MBSStream) As integer
		  dim m as MemoryBlock
		  
		  m=b.Read(4)
		  m.LittleEndian=false
		  
		  Return m.Long(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadString(extends s as MBSStream) As string
		  dim m as MemoryBlock
		  dim e,l as integer
		  dim t as string
		  
		  m=s.Read(8)
		  m.LittleEndian=false
		  l=m.Long(0)
		  e=m.Long(4)
		  t=s.Read(l)
		  
		  SetEncodingOfStringMBS t,e
		  Return t
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetFilePermission(file as folderitem, p as integer)
		  dim d as DarwinChmodMBS
		  
		  if p>=0 then // no error on GetFilePermission
		    d=new DarwinChmodMBS
		    
		    if d.chmod(file.UnixpathMBS, p)=0 then
		      
		      if d.stat(file.UnixpathMBS)=0 then
		        
		        if p=d.mode then
		          'ok
		        else
		          MsgBox "Failed to set permissions for "+file.UnixpathMBS+" to "+oct(p)
		        end if
		      end if
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UnarchiveFile(extends st as MBSStream, folder as folderitem)
		  dim tag as string
		  dim Comment,Name as string
		  dim rsize, dsize as Double
		  dim file as FolderItem
		  dim rs as ResStreamMBS
		  dim ls as LargeBinaryStreamMBS
		  dim mrs as MBSResStream
		  dim mls as MBSLargeBinaryStream
		  dim e as integer
		  dim d as date
		  
		  tag=st.Read(4) // NAME
		  name=st.ReadString
		  
		  tag=st.Read(4) // RSIZ
		  RSIZE=st.ReadDouble
		  
		  tag=st.Read(4) // DSIZ
		  DSIZE=st.ReadDouble
		  
		  file=FindRandomName(folder,name)
		  
		  tag=st.Read(4) // RDAT
		  if rsize>0 then
		    rs=file.CreateResStreamMBS("????","????")
		    if rs<>nil then
		      mrs=new MBSResStream(rs)
		      st.CopyBytesTo mrs,100000,rsize
		      mrs=nil
		      rs=nil
		    else
		      MsgBox "Failed to create ResStream on "+file.name
		      Return
		    end if
		  end if
		  
		  tag=st.Read(4) // DATA
		  if dsize>0 then
		    if file.Exists then
		      ls=file.OpenAsLargeBinaryStreamMBS(true)
		    else
		      ls=file.CreateLargeBinaryStreamMBS("????","????")
		    end if
		    if ls<>nil then
		      mls=new MBSLargeBinaryStream(ls)
		      st.CopyBytesTo mls,100000,dsize
		      mls=nil
		      ls=nil
		    else
		      MsgBox "Failed to create LargeBinaryStream on "+file.name
		      Return
		    end if
		  end if
		  
		  tag=st.Read(4) // COMM
		  Comment=st.ReadString
		  file.CommentMBS=Comment
		  
		  tag=st.Read(4) // MDAT
		  d=new date
		  d.totalseconds=st.ReadDouble
		  file.ModificationDate=d
		  
		  tag=st.Read(4) // CDAT
		  d=new date
		  d.totalseconds=st.ReadDouble
		  #if not TargetLinux then
		    file.CreationDate=d
		  #endif
		  
		  tag=st.Read(4) // MTYP
		  If tag = "MTYP" Then
		    #If RBVersion < 2019
		      file.MacType=st.ReadString
		    #EndIf
		    tag=st.Read(4) // MCRE
		  End If
		  If tag = "MCRE" then
		    #If RBVersion < 2019
		      file.MacCreator=st.ReadString
		    #endif
		    tag=st.Read(4) // PERM
		  End If
		  
		  SetFilePermission file,st.ReadInteger
		  
		  file.Name=name // rename later so Finder will recognize the file changes
		  
		  tag=st.Read(4) // FLAG
		  e=file.SetFileFlagsMBS(st.ReadInteger)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UnarchiveFolder(extends st as MBSStream, destfolder as folderitem)
		  dim tag as string
		  dim Comment,Name as string
		  dim folder as FolderItem
		  dim e,count as integer
		  dim d as date
		  
		  tag=st.Read(4) // NAME
		  name=st.ReadString
		  
		  tag=st.Read(4) // COUN
		  Count=st.ReadInteger
		  
		  folder=FindRandomName(destfolder,name)
		  folder.CreateAsFolder
		  
		  tag=st.Read(4) // COMM
		  Comment=st.ReadString
		  folder.CommentMBS=Comment
		  
		  tag=st.Read(4) // MDAT
		  d=new date
		  d.totalseconds=st.ReadDouble
		  folder.ModificationDate=d
		  
		  tag=st.Read(4) // CDAT
		  d=new date
		  d.totalseconds=st.ReadDouble
		  #if not TargetLinux then
		    folder.CreationDate=d
		  #endif
		  
		  tag=st.Read(4) // FLAG
		  e=folder.SetFolderFlagsMBS(st.ReadInteger)
		  
		  tag=st.Read(4) // MTYP
		  If tag = "MTYP" Then
		    #If RBVersion < 2019 Then
		      folder.MacType=st.ReadString
		    #EndIf
		    
		    tag=st.Read(4) // MCRE
		  End If
		  
		  If tag = "MCRE" Then
		    folder.MacCreator=st.ReadString
		    tag=st.Read(4) // MCRE
		  End If
		  
		  while tag<>"FEND" 
		    if tag="FILE" then
		      st.UnarchiveFile folder
		    elseif tag="FOLD" then
		      st.UnarchiveFolder folder
		    end if
		    tag=st.Read(4)
		  wend
		  // on End, tag is FEND
		  
		  folder.Name=name
		  
		  tag=st.Read(4) // PERM
		  SetFilePermission folder,st.ReadInteger
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteDouble(extends b as mbsstream, value as double)
		  dim m as MemoryBlock
		  
		  m=NewMemoryBlock(8)
		  m.LittleEndian=false
		  m.DoubleValue(0)=value
		  
		  b.Write m
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteInteger(extends b as MBSStream, value as integer)
		  dim m as MemoryBlock
		  
		  m=NewMemoryBlock(4)
		  m.LittleEndian=false
		  m.Long(0)=value
		  
		  b.Write m
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteString(extends s as MBSStream, data as string)
		  dim m as MemoryBlock
		  dim l as integer
		  
		  l=lenb(data)
		  m=NewMemoryBlock(l+8)
		  m.LittleEndian=false
		  m.Long(0)=l
		  m.Long(4)=GetEncodingOfStringMBS(data)
		  m.StringValue(8,l)=data
		  
		  s.Write m
		End Sub
	#tag EndMethod


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
			InitialValue="2147483648"
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
End Module
#tag EndModule
