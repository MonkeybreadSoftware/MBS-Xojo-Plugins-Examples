#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim s,d,e as FolderItem
		  
		  MsgBox "Please change the file paths!"
		  
		  s=SpecialFolder.Desktop.Child("MacExpo.pdf")
		  d=SpecialFolder.Desktop.Child("test.gz")
		  e=SpecialFolder.Desktop.Child("MacExpo2.pdf")
		  
		  if CompressFile(s,d) then
		    MsgBox "ok"
		  else
		    MsgBox "failed"
		  end if
		  
		  if Decompressfile(d,e,"application/binary") then
		    MsgBox "ok"
		  else
		    MsgBox "failed"
		  end if
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function CompressFile(source as folderitem, dest as folderitem) As boolean
		  dim z as GZipFileMBS
		  dim f as FolderItem
		  dim b as BinaryStream
		  
		  z=new GZipFileMBS
		  
		  b=source.OpenAsBinaryFile(false)
		  
		  if b<>nil then 
		    if z.Open(dest,"wb") then
		      while not b.eof
		        z.Write b.Read(1000000)
		        if z.Lasterror<>0 then
		          Return false
		        end if
		      wend
		      
		      z.Close
		      if z.Lasterror=0 then
		        Return true
		      end if
		    end if
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeCompressFile(source as folderitem, dest as folderitem, type as string) As boolean
		  dim z as GZipFileMBS
		  dim f as FolderItem
		  dim b as BinaryStream
		  
		  z=new GZipFileMBS
		  
		  b=dest.CreateBinaryFile(type)
		  
		  if b<>nil then 
		    if z.Open(source,"rb") then
		      while not z.eof
		        b.Write z.Read(1000000)
		        if z.Lasterror<>0 then
		          Return false
		        end if
		      wend
		      
		      z.Close
		      if z.Lasterror=0 then
		        Return true
		      end if
		    end if
		  end if
		  
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
