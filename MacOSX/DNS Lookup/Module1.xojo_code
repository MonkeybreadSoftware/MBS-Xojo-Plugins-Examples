#tag Module
Protected Module Module1
	#tag Method, Flags = &h0
		Sub AddFolder(extends p as listbox, s as string, v as Variant)
		  p.AddFolder s
		  p.celltag(p.lastindex,0)=v
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRow(extends p as listbox, s as string, v as Variant)
		  p.AddRow s
		  p.cell(p.lastindex,1)=v
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRow(extends p as PopupMenu, s as string, v as Variant)
		  p.AddRow s
		  p.RowTag(p.ListCount-1)=v
		  
		End Sub
	#tag EndMethod


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
End Module
#tag EndModule
