#tag Class
Protected Class MyWindowsMidiOutputMBS
Inherits WindowsMidiOutputMBS
	#tag Event
		Sub DeviceClose()
		  list.AddRow "Output: Close"
		End Sub
	#tag EndEvent

	#tag Event
		Sub DeviceDataSent()
		  list.AddRow "Output: Data sent"
		End Sub
	#tag EndEvent

	#tag Event
		Sub DeviceOpen()
		  list.AddRow "Output: Open"
		End Sub
	#tag EndEvent

	#tag Event
		Sub DevicePositionCallback()
		  list.AddRow "Output: Position Callback"
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
