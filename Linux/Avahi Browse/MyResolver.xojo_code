#tag Class
Protected Class MyResolver
Inherits AvahiResolverMBS
	#tag Event
		Sub Failure(error as string, errorcode as integer)
		  Log "Resolver Failure: "+error
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Found(interfaceIndex as integer, Protocol as Integer, name as string, type as string, domain as string, hostname as string, port as integer, address as string, txt as string, flags as integer)
		  Log "Found Address "+address+":"+str(port)+" for "+name
		  
		End Sub
	#tag EndEvent


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
