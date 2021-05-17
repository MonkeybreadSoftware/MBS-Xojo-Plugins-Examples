#tag Class
Protected Class TOutRect
	#tag Property, Flags = &h0
		ColCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Current column
		#tag EndNote
		Column As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Space between columns
		#tag EndNote
		Distance As double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Original height of first output rectangle
		#tag EndNote
		Height As double
	#tag EndProperty

	#tag Property, Flags = &h0
		page As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Original x-coordinate of first output rectangle
		#tag EndNote
		PosX As double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Original y-coordinate of first output rectangle
		#tag EndNote
		PosY As double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Original width of first output rectangle
		#tag EndNote
		Width As double
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
			InitialValue="-2147483648"
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
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PosX"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PosY"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Distance"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Column"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColCount"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="page"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
