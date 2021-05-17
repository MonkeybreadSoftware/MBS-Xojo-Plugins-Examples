#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim f as FolderItem
		  dim p as Picture
		  
		  f=GetOpenFolderItem("special/any")
		  if f<>nil then
		    p=f.OpenAsPicture
		    
		    if p<>nil then
		      Window1.pic=p
		      Window1.draw
		    end if
		  end if
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
