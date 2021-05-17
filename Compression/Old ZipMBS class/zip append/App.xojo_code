#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // Run this app several times. 
		  // First time it creates zip archive
		  // Second time it adds files
		  
		  dim z as ZipMBS
		  dim f as FolderItem
		  dim d as date
		  dim info as ZipFileInfoMBS
		  
		  f=SpecialFolder.Desktop.Child("test.zip")
		  
		  dim mode as integer = ZipMBS.AppendStatusCreate
		  
		  if f.Exists then
		    mode = ZipMBS.AppendStatusAddInZip
		  end if
		  
		  z=new ZipMBS(f,mode)
		  
		  info=new ZipFileInfoMBS
		  info.SetDate new date
		  info.ExternalFileAttributes=0
		  info.InternalFileAttributes=0
		  info.DosDate=0
		  
		  dim r as new random
		  
		  dim filename as string = "test "+str(r.InRange(1, 1000))
		  
		  z.CreateFile filename, info, "", "", "", z.MethodDeflated, z.CompressionBestCompression
		  z.Write "Hello World in "+filename
		  z.CloseFile
		  
		  z.Close
		  
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
