#tag Class
Protected Class Sleeping
Inherits WakeNotifierMBS
	#tag Event
		Sub SleepDemand()
		  window1.list.addrow "SleepDemand"
		End Sub
	#tag EndEvent

	#tag Event
		Function SleepRequest() As boolean
		  window1.list.addrow "SleepRequest"
		End Function
	#tag EndEvent

	#tag Event
		Sub SleepRevoke()
		  window1.list.addrow "SleepRevoke"
		End Sub
	#tag EndEvent

	#tag Event
		Sub WakeUp()
		  window1.list.addrow "Wakeup"
		End Sub
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
