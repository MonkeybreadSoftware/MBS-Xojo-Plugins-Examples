#tag Class
Protected Class MyLookup
Inherits DNSServiceResolveMBS
	#tag Event
		Sub ServiceResolve(flags as integer, InterfaceIndex as integer, ErrorCode as integer, Fullname as string, Hosttarget as string, Port as integer, TxtRecord as string)
		  Dim MainScreen As MainScreen = app.MainScreen
		  
		  if DNSServiceAddrInfoMBS.Available then
		    MainScreen.Report name, type, domain, "", Hosttarget, fullname
		    MainScreen.StartAddrInfo name, type, domain, Hosttarget, Fullname, port
		  else
		    MainScreen.Report name, type, domain, DNSNameToAddressMBS(Hosttarget)+":"+(port.tostring), Hosttarget, fullname
		    
		  end if
		  
		  done = (Bitwise.BitAnd(flags, Me.kFlagsMoreComing) = 0)
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		domain As string
	#tag EndProperty

	#tag Property, Flags = &h0
		done As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		name As string
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
			Name="done"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
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
