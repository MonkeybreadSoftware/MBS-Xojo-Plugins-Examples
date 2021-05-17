#tag Module
Protected Module ListBoxTV_Support
	#tag Method, Flags = &h1
		Protected Function convertOSType(t as String) As String
		  if t.Len = 4 then
		    // convert OSType to UTI
		    t = UTTypeMBS.CreatePreferredIdentifierForTag (UTTypeMBS.kUTTagClassOSType, t, UTTypeMBS.kUTTypeData)
		  end if
		  return t
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function trimPeriod(s as String) As String
		  if s.Right(1) = "." then
		    return s.Left (s.Len-1)
		  else
		    return s
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
