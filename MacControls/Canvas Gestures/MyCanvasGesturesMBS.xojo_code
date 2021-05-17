#tag Class
Protected Class MyCanvasGesturesMBS
Inherits CanvasGesturesMBS
	#tag Event
		Function beginGestureWithEvent(can as Canvas, e as NSEventMBS) As boolean
		  log CurrentMethodName
		End Function
	#tag EndEvent

	#tag Event
		Function endGestureWithEvent(can as Canvas, e as NSEventMBS) As boolean
		  log CurrentMethodName
		End Function
	#tag EndEvent

	#tag Event
		Function magnifyWithEvent(can as Canvas, e as NSEventMBS) As boolean
		  log CurrentMethodName+" "+str(e.magnification)
		End Function
	#tag EndEvent

	#tag Event
		Function rotateWithEvent(can as Canvas, e as NSEventMBS) As boolean
		  log CurrentMethodName+" "+str(e.rotation)
		End Function
	#tag EndEvent

	#tag Event
		Function scrollWheel(can as Canvas, e as NSEventMBS) As boolean
		  log CurrentMethodName
		End Function
	#tag EndEvent

	#tag Event
		Function smartMagnifyWithEvent(can as Canvas, e as NSEventMBS) As boolean
		  log CurrentMethodName
		End Function
	#tag EndEvent

	#tag Event
		Function swipeWithEvent(can as Canvas, e as NSEventMBS) As boolean
		  log CurrentMethodName
		End Function
	#tag EndEvent


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
