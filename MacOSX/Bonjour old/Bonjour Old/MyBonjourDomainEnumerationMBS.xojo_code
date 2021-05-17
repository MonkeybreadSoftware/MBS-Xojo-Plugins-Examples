#tag Class
Protected Class MyBonjourDomainEnumerationMBS
Inherits DNSServiceDiscoveryDomainEnumerationMBS
	#tag Event
		Sub ServiceDomainEnumeration(message as integer, domain as string, flags as integer)
		  Window1.write "ServiceDomainEnumeration event."
		  Window1.write "   Domain:         "+domain
		  Window1.write "   Flags:          "+str(flags)
		  Window1.write "   Message:        "+str(message)
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
			InitialValue=""
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
