#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  #if TargetWin32 then
		    // ok
		  #else
		    MsgBox "This example is only for Windows."
		  #endif
		  
		  
		  System.DebugLog "Xojo "+RBVersionString
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
