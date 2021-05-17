#tag Class
Protected Class MyTypeBrowser
Inherits AvahiTypeBrowserMBS
	#tag Event
		Sub Failure(error as string, errorcode as integer)
		  Log "Browser Failure: "+error
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub TypeFound(InterfaceIndex as integer, protocol as Integer, type as string, domain as string, flags as integer)
		  Log "Found Type "+type+" ("+description+") at domain "+domain
		  
		  app.domains.Value(domain) = domain
		  app.types.Value(type) = type
		  app.Browse
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub TypeRemoved(InterfaceIndex as integer, protocol as Integer, type as string, domain as string, flags as integer)
		  Log "Lost Type "+type+" ("+description+") at domain "+domain
		  
		  // here you could stop resolvers started in the ServiceFound events
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		description As string
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
			InitialValue="-2147483648"
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
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
