#tag Class
Protected Class MyBrowser
Inherits DNSServiceBrowseMBS
	#tag Event
		Sub ServiceBrowse(Flags as integer, InterfaceIndex as integer, ErrorCode as integer, ServiceName as string, RegType as string, Domain as string)
		  const kDNSServiceFlagsAdd=2
		  
		  dim f as integer
		  
		  f = Bitwise.BitAnd(Flags, kDNSServiceFlagsAdd)
		  
		  Dim MainScreen As MainScreen = app.MainScreen
		  
		  If f<>0 Then
		    // added
		    
		    MainScreen.Report ServiceName, RegType, domain, "found"
		    MainScreen.StartLookup ServiceName, RegType, domain
		    
		  else
		    // removed
		    
		    MainScreen.Report ServiceName, RegType, domain, "gone"
		  end if
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		domain As string
	#tag EndProperty

	#tag Property, Flags = &h0
		type As string
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
			Name="type"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="domain"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
