#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  if TargetMachO then
		    
		  else
		    MsgBox "This project needs a MachO target."
		  end if
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
