#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub NewDocument()
		  if DebugBuild then
		    dim file as FolderItem = SpecialFolder.Desktop.Child("test.pdf")
		    
		    if file<>Nil and file.Exists then
		      OpenDocument file
		    end if
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub OpenDocument(item As FolderItem)
		  dim w as new ViewerWindow
		  w.openfile item
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
