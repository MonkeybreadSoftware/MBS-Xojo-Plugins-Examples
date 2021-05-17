#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Sub Open()
		  call InternalSQLiteLibraryMBS.Use
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
