#tag Class
Protected Class ListItem
Inherits NSOutlineViewItemMBS
	#tag Method, Flags = &h0
		Sub Append(n as ListItem)
		  Children.Append n
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(v1 as Variant = nil, v2 as Variant = nil)
		  super.Constructor
		  
		  values.Append v1
		  values.Append v2
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Children() As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		Values() As Variant
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
	#tag EndViewBehavior
End Class
#tag EndClass
