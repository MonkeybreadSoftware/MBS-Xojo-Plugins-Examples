#tag Class
Protected Class MBSLargeBinaryStream
Implements MBSStream
	#tag Method, Flags = &h0
		Sub Constructor(dest as LargeBinaryStreamMBS)
		  theDestination=dest
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Read(n as integer) As string
		  Return theDestination.Read(n)
		  Exception
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(data as string)
		  theDestination.Write data
		  Exception
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		For streams above 2 GB of content
		
	#tag EndNote


	#tag Property, Flags = &h0
		theDestination As LargeBinaryStreamMBS
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
			InitialValue="2147483648"
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
