#tag Class
Protected Class MyBonjourResolveMBS
Inherits DNSServiceResolveMBS
	#tag Event
		Sub ServiceResolve(flags as integer, InterfaceIndex as integer, ErrorCode as integer, Fullname as string, Hosttarget as string, Port as integer, TxtRecord as string)
		  window1.write "ServiceResolve event."
		  window1.write "   Port: "+str(port)
		  window1.write "   Host: "+Hosttarget
		  
		  dim a1 as new MyDNSServiceAddrInfoMBS
		  call a1.AddrInfo(InterfaceIndex, a1.kProtocolIPv4, Hosttarget)
		  queries.Append a1
		  
		  dim a2 as new MyDNSServiceAddrInfoMBS
		  call a2.AddrInfo(InterfaceIndex, a2.kProtocolIPv6, Hosttarget)
		  queries.Append a2
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		queries() As MyDNSServiceAddrInfoMBS
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
