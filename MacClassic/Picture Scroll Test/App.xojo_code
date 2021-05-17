#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim p as Picture
		  dim f as FolderItem
		  
		  f=GetOpenFolderItem("any")
		  
		  if f<>nil then
		    p = f.OpenAsPicture
		    
		    Window1.testimage=p
		    window1.run
		  end if
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
