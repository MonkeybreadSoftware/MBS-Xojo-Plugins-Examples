#tag Class
Protected Class ServiceBrowser
Inherits NSNetServiceBrowserMBS
	#tag Event
		Sub DidFindService(service as NSNetServiceMBS, moreComing as Boolean)
		  
		  // make a new object so we have our events installed
		  dim m as new NetworkService(Service)
		  m.table = table
		  m.dataSource = dataSource
		  m.resolve
		  
		  // keep Xojo object alive for later
		  dataSource.services.Append m
		  table.ReloadData
		  
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
		  
		  dim myServices() as NetworkService = dataSource.Services
		  
		  dim u as integer = UBound(myServices)
		  for i as integer = u downto 0
		    if myServices(i).Handle = Service.Handle then
		      myServices.Remove i
		    end if
		  next
		  
		  table.ReloadData
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		dataSource As MyTableDataSource
	#tag EndProperty

	#tag Property, Flags = &h0
		table As iOSTable
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
