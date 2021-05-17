#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  if TargetWin32 = false then
		    MsgBox "This example is only for Windows."
		    quit
		  end if
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
