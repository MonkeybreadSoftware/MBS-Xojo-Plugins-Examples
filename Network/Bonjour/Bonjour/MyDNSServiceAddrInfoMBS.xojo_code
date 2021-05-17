#tag Class
Protected Class MyDNSServiceAddrInfoMBS
Inherits DNSServiceAddrInfoMBS
	#tag Event
		Sub ServiceAddrInfo(Flags as integer, InterfaceIndex as integer, ErrorCode as integer, AddressFamily as Integer, IP as string, SockAddr as MemoryBlock, HostName as string, ttl as Integer)
		  window1.write "ServiceAddrInfo event."
		  window1.write "   IP: "+IP
		  window1.write "   AddressFamily: "+str(AddressFamily)
		  window1.write "   TTL: "+str(ttl)
		  
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
