#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  const length = 10000000
		  
		  // Make a 10 MB big string with random data
		  ZeroBuffer = RandomBytesStringMBS(length)
		  
		  System.DebugLog "Start..."
		  
		  Write
		  'Read
		  
		  System.DebugLog "Finished."
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Read()
		  dim f as FolderItem
		  dim z as UnZipMBS
		  dim s as string
		  dim info as UnZipFileInfoMBS
		  
		  f=SpecialFolder.Desktop.Child("test.zip")
		  z=new UnZipMBS(f)
		  
		  if z.Handle = 0 then
		    MsgBox "Failed to open zip file."
		    Return
		  end if
		  
		  z.GoToFirstFile
		  if z.Lasterror <> 0 then
		    MsgBox "GoToFirstFile: "+str(z.Lasterror)
		    Return
		  end if
		  
		  do
		    info=z.FileInfo
		    
		    System.DebugLog "Reading file: "+z.FileName
		    
		    // filename like test1.txt"
		    dim size as integer = val(mid(z.FileName,5,1))
		    
		    z.OpenCurrentFile
		    if z.Lasterror <> 0 then
		      MsgBox "GoToFirstFile: "+str(z.Lasterror)
		      Return
		    end if
		    
		    for g as integer = 1 to size
		      
		      for n as integer = 1 to 100
		        
		        s = z.ReadCurrentFile(lenb(ZeroBuffer))
		        if s<>ZeroBuffer then
		          break
		          MsgBox "Failed: Data not correct. Buffer read too small."
		          Return
		        end if
		        
		      next
		    next
		    
		    System.DebugLog "Read "+Format(z.Position/1000/1000, "0")+" MB"
		    
		    z.CloseCurrentFile
		    z.GoToNextFile
		  loop until z.Lasterror<>0
		  
		  MsgBox "Everything okay."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write()
		  dim z as ZipMBS
		  dim f as FolderItem
		  dim d as new date
		  dim info as ZipFileInfoMBS
		  
		  f=SpecialFolder.Desktop.Child("test.zip")
		  
		  z=new ZipMBS(f,0)
		  
		  info=new ZipFileInfoMBS
		  info.SetDate d
		  
		  info.ExternalFileAttributes=0
		  info.InternalFileAttributes=0
		  info.DosDate=0 // auto
		  
		  dim size as integer = 3 // 3 GB
		  
		  System.DebugLog "Write test"+str(size)+".txt with "+str(size)+" GB."
		  
		  z.CreateFile("test"+str(size)+".txt", info, "", "", "", z.MethodDeflated, z.CompressionBestCompression, true)
		  
		  // for each GB
		  for j as integer = 1 to size
		    
		    // write a little bit more than 1 GB
		    for k as integer = 1 to 100
		      z.Write ZeroBuffer
		    next
		  next
		  
		  z.CloseFile
		  
		  z.Close("global comment")
		  
		  z = nil
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ZeroBuffer As string
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ZeroBuffer"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
