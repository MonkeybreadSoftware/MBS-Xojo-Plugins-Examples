#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  #if TargetCocoa then
		    MsgBox "This example is for Mac OS X with Carbon only."
		  #elseif TargetCarbon then
		    // ok
		  #else
		    MsgBox "This example is for Mac OS X with Carbon only."
		  #endif
		  
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
