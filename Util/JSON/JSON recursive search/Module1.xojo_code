#tag Module
Protected Module Module1
	#tag Method, Flags = &h0
		Function ChildRecursive(extends j as JSONMBS, text as string) As JSONMBS
		  // do normal search
		  dim e as JSONMBS = j.Child(text)
		  if e <> nil then Return e
		  
		  // and search child nodes
		  dim child as JSONMBS = j.ChildNode
		  while child<>Nil 
		    dim r as JSONMBS = child.Child(text)
		    if r<>Nil then Return r
		    
		    child = child.NextNode
		  wend
		  
		End Function
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
