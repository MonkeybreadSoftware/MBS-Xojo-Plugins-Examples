#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  if TargetMacOS then
		    if TargetMachO then
		      'ok
		    else
		      MsgBox "Please use MachO target. PEF Is not supported."
		    end if
		  end if
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
