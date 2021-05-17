#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub OpenDocument(item As FolderItem)
		  // Absolutepath gives short name, but I prefer long path.
		  
		  msgBox "You opened "+item.LongPathMBS+" using this application (made with REALbasic)."
		  quit
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
