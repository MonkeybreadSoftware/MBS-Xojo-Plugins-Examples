#tag Class
Protected Class MyBrowser
Inherits DNSServiceDiscoveryBrowseMBS
	#tag Event
		Sub ServiceBrowse(message as integer, name as string, type as string, domain as string, flags as integer)
		  if message=0 then
		    // added
		    
		    Window1.StartLookup name,type,domain,reason
		    
		  elseif message=1 then
		    // removed
		    
		    Window1.List.AddRow name
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
