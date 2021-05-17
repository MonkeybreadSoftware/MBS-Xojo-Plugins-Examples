#tag Class
Protected Class MyLookup
Inherits DNSServiceResolveMBS
	#tag Event
		Sub ServiceResolve(flags as integer, InterfaceIndex as integer, ErrorCode as integer, Fullname as string, Hosttarget as string, Port as integer, TxtRecord as string)
		  
		  
		  if DNSServiceAddrInfoMBS.Available then
		    Window1.Report name, type, domain, "", Hosttarget, fullname
		    window1.StartAddrInfo name, type, domain, Hosttarget, Fullname, port
		  else
		    Window1.Report name, type, domain, DNSNameToAddressMBS(Hosttarget)+":"+str(port), Hosttarget, fullname
		    
		  end if
		  
		  done = (BitwiseAnd(flags, me.kFlagsMoreComing) = 0)
		  
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
