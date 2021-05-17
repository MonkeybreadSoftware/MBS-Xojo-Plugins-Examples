#tag Class
Protected Class MyCWWiFiClientMBS
Inherits CWWiFiClientMBS
	#tag Event
		Sub bssidDidChangeForWiFiInterfaceWithName(interfaceName as String)
		  log CurrentMethodName +" "+interfaceName
		  
		  dim i as CWInterfaceMBS = me.interfaceWithName(interfaceName)
		  log "BSSID: "+i.bssid
		End Sub
	#tag EndEvent

	#tag Event
		Sub clientConnectionInterrupted()
		  log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub clientConnectionInvalidated()
		  log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub countryCodeDidChangeForWiFiInterfaceWithName(interfaceName as String)
		  log CurrentMethodName +" "+interfaceName
		  
		  dim i as CWInterfaceMBS = me.interfaceWithName(interfaceName)
		  log "countryCode: "+i.countryCode
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub linkDidChangeForWiFiInterfaceWithName(interfaceName as String)
		  log CurrentMethodName +" "+interfaceName
		End Sub
	#tag EndEvent

	#tag Event
		Sub linkQualityDidChangeForWiFiInterfaceWithName(interfaceName as String, rssi as Integer, transmitRate as double)
		  log CurrentMethodName +" "+interfaceName+" rssi: "+str(rssi)+" transmitRate: "+str(transmitRate)
		End Sub
	#tag EndEvent

	#tag Event
		Sub modeDidChangeForWiFiInterfaceWithName(interfaceName as String)
		  log CurrentMethodName +" "+interfaceName
		  
		  dim i as CWInterfaceMBS = me.interfaceWithName(interfaceName)
		  log "interfaceMode: "+str(i.interfaceMode)
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub powerStateDidChangeForWiFiInterfaceWithName(interfaceName as String)
		  log CurrentMethodName +" "+interfaceName
		  
		  dim i as CWInterfaceMBS = me.interfaceWithName(interfaceName)
		  log "powerOn: "+str(i.powerOn)
		End Sub
	#tag EndEvent

	#tag Event
		Sub rangingReportEventForWiFiInterfaceWithName(interfaceName as String, rangingData() as Dictionary, error as NSErrorMBS)
		  log CurrentMethodName +" "+interfaceName
		  if error <> nil then
		    log "error: "+error.LocalizedDescription
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub scanCacheUpdatedForWiFiInterfaceWithName(interfaceName as String)
		  log CurrentMethodName +" "+interfaceName
		  
		  dim i as CWInterfaceMBS = me.interfaceWithName(interfaceName)
		  dim c() as CWNetworkMBS = i.cachedScanResults
		  for each n as CWNetworkMBS in c
		    log "network: "+n.ssid+" "+n.bssid
		  next
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub ssidDidChangeForWiFiInterfaceWithName(interfaceName as String)
		  log CurrentMethodName +" "+interfaceName
		  
		  dim i as CWInterfaceMBS = me.interfaceWithName(interfaceName)
		  log "SSID: "+i.ssid
		End Sub
	#tag EndEvent

	#tag Event
		Sub virtualInterfaceStateChangedForWiFiInterfaceWithName(interfaceName as String)
		  log CurrentMethodName +" "+interfaceName
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub log(s as string)
		  List.addrow s
		  list.ScrollPosition = list.LastIndex
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		list As listbox
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
	#tag EndViewBehavior
End Class
#tag EndClass
