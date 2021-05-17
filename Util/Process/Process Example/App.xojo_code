#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Activate()
		  window1.update
		End Sub
	#tag EndEvent

	#tag Event
		Sub Deactivate()
		  'window1.update
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
