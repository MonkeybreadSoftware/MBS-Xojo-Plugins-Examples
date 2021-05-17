#tag Class
Protected Class MyBonjourBrowseMBS
Inherits DNSServiceBrowseMBS
	#tag Event
		Sub ServiceBrowse(Flags as integer, InterfaceIndex as integer, ErrorCode as integer, ServiceName as string, RegType as string, Domain as string)
		  print "ServiceBrowse event."
		  print "   Service name:      "+ServiceName
		  print "   Interface index:   "+str(InterfaceIndex)
		  print "   Registration Type: "+RegType
		  print "   Domain:            "+domain
		  print "   Flags:             "+str(flags)
		  
		  app.lookup ServiceName, domain
		  
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
