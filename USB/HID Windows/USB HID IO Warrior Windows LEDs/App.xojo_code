#tag Class
Protected Class App
Inherits Application
	#tag Property, Flags = &h0
		quitting As boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="quitting"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
