#tag Class
Protected Class MyBrowser
Inherits AvahiBrowserMBS
	#tag Event
		Sub Failure(error as string, errorcode as integer)
		  Log "Browser Failure: "+error
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub ServiceFound(InterfaceIndex as integer, protocol as Integer, name as string, type as string, domain as string, flags as integer)
		  Log "Found Service "+name+" at domain "+domain
		  
		  dim r as new MyResolver(Client)
		  
		  if r.Resolve(InterfaceIndex, protocol, name, type, domain, 0) then
		    app.Resolvers.Append r
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub ServiceRemoved(InterfaceIndex as integer, protocol as Integer, name as string, type as string, domain as string, flags as integer)
		  Log "Lost Service "+name+" of type "+type+" at domain "+domain
		  
		  // here you could stop resolvers started in the ServiceFound events
		  
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
	#tag EndViewBehavior
End Class
#tag EndClass
