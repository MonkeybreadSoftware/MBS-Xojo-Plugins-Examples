#tag Class
Protected Class MyCarbonSystemEventsMBS
Inherits CarbonSystemEventsMBS
	#tag Event
		Sub TimeDateChanged()
		  ' This even works in built applications.
		  List.InsertRow 0,"Time date changed."
		End Sub
	#tag EndEvent

	#tag Event
		Sub UserSessionActivated()
		  ' This even works in built applications.
		  List.InsertRow 0,"User session activated."
		End Sub
	#tag EndEvent

	#tag Event
		Sub UserSessionDeactivated()
		  ' This even works in built applications.
		  List.InsertRow 0,"User session deactivated."
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		list As listbox
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
	#tag EndViewBehavior
End Class
#tag EndClass
