#tag Class
Protected Class MyWebUIDelegateMBS
Inherits WebUIDelegateMBS
	#tag Event
		Function GetStatusText() As String
		  Return StatusText
		End Function
	#tag EndEvent

	#tag Event
		Function IsStatusBarVisible() As boolean
		  Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Function SetStatusText(text as String) As boolean
		  StatusText = text
		  
		  window1.StaticText1.text = text
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		StatusText As string
	#tag EndProperty


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
		#tag ViewProperty
			Name="StatusText"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
