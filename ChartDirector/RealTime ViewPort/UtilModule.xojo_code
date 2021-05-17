#tag Module
Protected Module UtilModule
	#tag Method, Flags = &h0
		Function DoubleArray(values() as double, Count as Integer, Offset as Integer = 0) As Double()
		  Dim u As Integer = values.Ubound
		  Dim c As Integer = u + 1
		  
		  If Offset = 0 And c = count Then
		    // full array
		    Return values
		  End If
		  
		  Dim r() As Double
		  u = Offset + count - 1
		  For i As Integer = Offset To u
		    r.Append values(i)
		  Next
		  
		  Return r
		  
		  
		  
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
