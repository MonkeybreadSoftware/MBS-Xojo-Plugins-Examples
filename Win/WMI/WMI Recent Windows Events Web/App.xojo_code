#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Sub Open()
		  // required for Windows 8.1
		  call WindowsWMIMBS.InitSecurity(false)
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
