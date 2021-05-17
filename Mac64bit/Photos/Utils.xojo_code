#tag Module
Protected Module Utils
	#tag Method, Flags = &h0
		Sub AddFolderWithTag(extends list as Listbox, text as string, ref as Variant)
		  List.AddFolder Text
		  List.RowTag(List.LastIndex) = ref
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRowWithTag(extends list as Listbox, text as string, ref as Variant)
		  List.AddRow Text
		  List.RowTag(List.LastIndex) = ref
		  
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
