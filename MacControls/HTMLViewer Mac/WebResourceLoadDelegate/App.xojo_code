#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  if TargetMachO then
		    // ok
		  else
		    MsgBox "This project works only as MachO target on Mac OS X."
		  end if
		  
		  MainWindow.show
		  MainWindow.web.LoadURL "http://www.apple.com"
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
