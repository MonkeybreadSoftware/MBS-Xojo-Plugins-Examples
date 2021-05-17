#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  e=new AppEvents
		  e.Listen
		  
		  DummyWindow.show
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		e As appevents
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
