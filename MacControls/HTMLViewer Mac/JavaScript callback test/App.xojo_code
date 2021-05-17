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
		  
		  callback=new MyScriptCallback
		  MainWindow.show
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		callback As MyScriptCallback
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
