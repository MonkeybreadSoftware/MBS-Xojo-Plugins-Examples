#tag Class
Protected Class MyView
Inherits CustomNSViewMBS
	#tag Event
		Function beginGestureWithEvent(e as NSEventMBS) As boolean
		  window1.List.insertRow 0, CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function endGestureWithEvent(e as NSEventMBS) As boolean
		  window1.List.insertRow 0, CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function magnifyWithEvent(e as NSEventMBS) As boolean
		  window1.List.insertRow 0, CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function rotateWithEvent(e as NSEventMBS) As boolean
		  window1.List.insertRow 0, CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function swipeWithEvent(e as NSEventMBS) As boolean
		  window1.List.insertRow 0, CurrentMethodName
		  
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
