#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Sub Open(args() as String)
		  // you need to change file names or provide similar files
		  
		  dim f as FolderItem = FindFile("Jingle_Bells.m4v")
		  
		  if f = nil then
		    print "Failed to find Jingle_Bells.m4v file."
		    quit
		  end if
		  
		  
		  dim bM as binarystream = BinaryStream.Open(f)
		  dim bO as binarystream = BinaryStream.Open(f.Parent.Child("Jingle_Bells.ogg"))
		  
		  audioFileM4V = new WebFile
		  audioFileM4V.Data = bM.Read(BM.Length)
		  audioFileM4V.Filename = "music.m4a"
		  audioFileM4V.MIMEType = "audio/m4a"
		  audioFileM4V.Session = nil
		  
		  audioFileOGG = new WebFile
		  audioFileOGG.Data = bO.Read(BO.Length)
		  audioFileOGG.Filename = "music.ogg"
		  audioFileOGG.MIMEType = "audio/ogg"
		  audioFileOGG.Session = nil
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		audioFileM4V As WebFile
	#tag EndProperty

	#tag Property, Flags = &h0
		audioFileOGG As WebFile
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
