#tag Class
Protected Class MBSResStream
Implements MBSStream
	#tag Method, Flags = &h0
		Sub Constructor(dest as ResstreamMBS)
		  theDestination=Dest
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Read(n as integer) As string
		  if theDestination<>nil then
		    Return theDestination.Read(n)
		  end if
		  
		  Exception
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(data as string)
		  if theDestination<>nil then
		    theDestination.Write data
		  end if
		  
		  Exception
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		theDestination As ResstreamMBS
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
