#tag Class
Protected Class ServiceBrowser
Inherits NSNetServiceBrowserMBS
	#tag Event
		Sub DidFindDomain(domainName as String, moreComing as Boolean)
		  #Pragma Unused moreComing
		  
		  System.DebugLog CurrentMethodName
		  
		  List.AddRow "Found Domain: "+domainName
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidFindService(service as NSNetServiceMBS, moreComing as Boolean)
		  #Pragma Unused moreComing
		  
		  System.DebugLog CurrentMethodName
		  
		  List.AddRow "Found Service: """+Service.name+""" of type: "+Service.type
		  
		  // make a new object so we have our events installed
		  Dim m As New NetworkService(Service)
		  m.list = list
		  m.resolve
		  
		  // keep Xojo object alive for later
		  services.Append m
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidNotSearch(error as Dictionary)
		  System.DebugLog CurrentMethodName
		  
		  Dim ErrorCode  As Integer = error.Lookup(NSNetServiceMBS.NSNetServicesErrorCode, "")
		  Dim errorDomain As String = error.Lookup(NSNetServiceMBS.NSNetServicesErrorDomain, "")
		  
		  List.AddRow "Did not search: "+Str(errorDomain)+": "+Str(ErrorCode)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidRemoveDomain(domainName as String, moreComing as Boolean)
		  #Pragma Unused moreComing
		  
		  System.DebugLog CurrentMethodName
		  
		  List.AddRow "Remove Domain: "+domainName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidRemoveService(service as NSNetServiceMBS, moreComing as Boolean)
		  #Pragma Unused moreComing
		  
		  System.DebugLog CurrentMethodName
		  
		  List.AddRow "Remove Service: "+Service.name
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidStopSearch()
		  System.DebugLog CurrentMethodName
		  
		  List.AddRow "Stop search."
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub WillSearch()
		  System.DebugLog CurrentMethodName
		  
		  List.AddRow "will search..."
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		list As listbox
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
