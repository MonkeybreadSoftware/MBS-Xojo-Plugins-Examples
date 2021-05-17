#tag Module
Protected Module Module1
	#tag Method, Flags = &h0
		Sub AddFolder(extends list as listbox, name as string, tag as Variant)
		  list.AddFolder name
		  list.RowTag(list.LastIndex) = tag
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FormatPoint(c as CGPointMBS) As string
		  if c = nil then
		    Return "n/a"
		  else
		    Return str(c.x)+"/"+str(c.y)
		  end if
		  
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
