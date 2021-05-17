#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  if TargetCocoa then
		    
		  else
		    MsgBox "This project needs a Cocoa target."
		  end if
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
