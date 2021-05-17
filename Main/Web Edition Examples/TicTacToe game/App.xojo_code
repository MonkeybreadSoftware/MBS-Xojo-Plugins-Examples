#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Sub Open()
		  dim leer  as new Picture(100,100,32)
		  dim kreis as Picture = picture.Open(findFile("kreis.png"))
		  dim kreuz as Picture = picture.Open(findFile("kreuz.png"))
		  
		  KreisPic = new WebPicture(kreis, picture.FormatPNG)
		  kreuzPic = new WebPicture(kreuz, picture.FormatPNG)
		  leerPic  = new WebPicture(leer,  picture.FormatPNG)
		  
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
		KreisPic As WebPicture
	#tag EndProperty

	#tag Property, Flags = &h0
		KreuzPic As WebPicture
	#tag EndProperty

	#tag Property, Flags = &h0
		LeerPic As WebPicture
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
