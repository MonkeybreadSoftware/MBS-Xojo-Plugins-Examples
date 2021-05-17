#tag Class
Protected Class MyBonjourBrowseMBS
Inherits DNSServiceDiscoveryBrowseMBS
	#tag Event
		Sub ServiceBrowse(message as integer, name as string, type as string, domain as string, flags as integer)
		  window1.write "ServiceBrowse event."
		  Window1.write "   Name:    "+name
		  Window1.write "   Type:    "+type
		  Window1.write "   Domain:  "+domain
		  Window1.write "   Flags:   "+str(flags)
		  Window1.write "   Message: "+str(message)
		  
		  
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
