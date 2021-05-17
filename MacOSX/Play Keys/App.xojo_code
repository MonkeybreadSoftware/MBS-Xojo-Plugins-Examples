#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  if not TargetMacOS then
		    MsgBox "This example is Mac only."
		  end if
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
