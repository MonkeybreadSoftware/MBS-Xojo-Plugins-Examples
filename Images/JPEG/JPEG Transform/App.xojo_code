#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // make test image file
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("test.jpg")
		  
		  if not f.Exists then
		    dim p as Picture = LogoMBS(500)
		    
		    call f.SaveAsJPEGMBS(p, 90)
		  end if
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
