#tag Class
Protected Class MyEvents
Inherits CarbonApplicationEventsMBS
	#tag Event
		Sub HotKeyPressed(signature as integer, id as integer)
		  Window1.ListBox1.AddRow "Hotkey pressed"
		  Window1.CollapsedMBS=not Window1.CollapsedMBS
		End Sub
	#tag EndEvent

	#tag Event
		Sub HotKeyReleased(signature as integer, id as integer)
		  Window1.ListBox1.AddRow "Hotkey released"
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
