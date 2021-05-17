#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim f as folderItem
		  dim b as binaryStream
		  dim s as string
		  dim t,l as integer
		  dim m as MyBase64
		  
		  m=new MyBase64
		  
		  f=getopenFolderItem("special/any")
		  
		  b=f.openasbinaryFile(false)
		  s=b.read(b.length)
		  b.close
		  
		  l=lenb(s)
		  t=ticks
		  s=m.encodeBase64(s,76,chr(13))
		  t=ticks-t
		  
		  if s="" then
		    MsgBox "Encoding failed."
		  else
		    msgBox format(t/60,"0.0")+" Seconds which is "+format(l*60.0/1024.0/1024.0/t,"0.0")+" MegaBytes/s"
		    
		    f=getsaveFolderItem("application/binary",f.displayName+" base64")
		    b=f.createBinaryFile("application/binary")
		    b.write s
		    b.close
		  end if
		  
		  quit
		  exception
		    quit
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
