#tag Class
Protected Class ServiceBrowser
Inherits NSNetServiceBrowserMBS
	#tag Event
		Sub DidFindService(service as NSNetServiceMBS, moreComing as Boolean)
		  
		  List.AddRow Service.name, Service.type, Service.hostName
		  
		  // make a new object so we have our events installed
		  dim m as new NetworkService(Service)
		  m.list = list
		  m.resolve
		  
		  // keep Xojo object alive for later
		  services.Append m
		  
		  list.RowTag(list.LastIndex) = m
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidNotSearch(error as Dictionary)
		  Break // error?
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidRemoveService(service as NSNetServiceMBS, moreComing as Boolean)
		  System.DebugLog CurrentMethodName
		  
		  
		  dim index as integer = FindIndex(list, service)
		  if index >= 0 then
		    list.RemoveRow index
		  end if
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		list As WebListBox
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Services() As NSNetServiceMBS
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
	#tag EndViewBehavior
End Class
#tag EndClass
