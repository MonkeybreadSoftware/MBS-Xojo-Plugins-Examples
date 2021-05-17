#tag Class
Protected Class MyAddrInfo
Inherits DNSServiceAddrInfoMBS
	#tag Event
		Sub ServiceAddrInfo(Flags as integer, InterfaceIndex as integer, ErrorCode as integer, AddressFamily as Integer, IP as string, SockAddr as MemoryBlock, HostName as string, ttl as Integer)
		  #If TargetMacOS
		    #pragma unused Flags
		    #pragma unused InterfaceIndex
		    #pragma unused ErrorCode
		    #pragma unused AddressFamily
		    #pragma unused IP
		    #pragma unused SockAddr
		    #pragma unused HostName
		    #pragma unused ttl
		  #EndIf
		  
		  // we may get several calls per domain...
		  Dim MainScreen As MainScreen = app.MainScreen
		  MainScreen.Report ServiceName, ServiceType, ServiceDomain, IP+":"+(port.toString), Hostname, FullName
		  
		  
		  done = (Bitwise.BitAnd(flags, me.kFlagsMoreComing) = 0)
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		Done As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		FullName As string
	#tag EndProperty

	#tag Property, Flags = &h0
		port As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ServiceDomain As string
	#tag EndProperty

	#tag Property, Flags = &h0
		ServiceName As string
	#tag EndProperty

	#tag Property, Flags = &h0
		ServiceType As string
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
		#tag ViewProperty
			Name="port"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ServiceName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ServiceType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ServiceDomain"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FullName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Done"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
