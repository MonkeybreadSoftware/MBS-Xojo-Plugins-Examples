#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Close()
		  Write "App.Close"
		  DelayMBS 0.5
		End Sub
	#tag EndEvent

	#tag Event
		Function HandleAppleEvent(theEvent As AppleEvent, eventClass As String, eventID As String) As Boolean
		  Write "HandleAppleEvent: "+eventClass+" "+eventid
		End Function
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
