#tag Class
Protected Class App
Inherits Application
	#tag MenuHandler
		Function FileReadandWriteEvents() As Boolean Handles FileReadandWriteEvents.Action
			WindowReadWriteEvents.Show
			Return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileSimple() As Boolean Handles FileSimple.Action
			WindowSimple.Show
			Return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileWriteEvents() As Boolean Handles FileWriteEvents.Action
			WindowWriteEvents.Show
			Return true
		End Function
	#tag EndMenuHandler


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
