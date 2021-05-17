#tag Class
Protected Class MyBrowser
Inherits DNSServiceBrowseMBS
	#tag Event
		Sub ServiceBrowse(Flags as integer, InterfaceIndex as integer, ErrorCode as integer, ServiceName as string, RegType as string, Domain as string)
		  const kDNSServiceFlagsAdd=2
		  
		  dim f as integer
		  
		  f=BitwiseAnd(Flags, kDNSServiceFlagsAdd)
		  
		  if f<>0 then
		    // added
		    
		    Window1.StartLookup ServiceName,RegType,domain,reason
		    
		  else
		    // removed
		    
		    Window1.List.AddRow ServiceName
		    Window1.List.Cell(Window1.List.LastIndex,1)="gone"
		    Window1.List.Cell(Window1.List.LastIndex,2)=""
		    Window1.List.Cell(Window1.List.LastIndex,3)=reason
		    
		  end if
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		reason As string
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
			Name="reason"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
