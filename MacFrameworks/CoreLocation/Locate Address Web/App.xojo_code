#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Sub Open()
		  t = new CoreLocationEventsTimer
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		t As CoreLocationEventsTimer
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
