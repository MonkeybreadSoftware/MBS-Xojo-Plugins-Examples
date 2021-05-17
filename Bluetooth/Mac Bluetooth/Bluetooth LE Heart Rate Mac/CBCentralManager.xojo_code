#tag Class
Protected Class CBCentralManager
Inherits CBCentralManagerMBS
	#tag Event
		Sub DidConnectPeripheral(peripheral as CBPeripheralMBS)
		  list.Log CurrentMethodName+": "+peripheral.Name
		  
		  
		  // make new object, so we catch events
		  dim p as new CBPeripheral(peripheral)
		  p.list = list
		  
		  peripherals.append p
		  
		  dim serviceUUIDs() as CBUUIDMBS
		  serviceUUIDs.Append CBUUIDMBS.UUIDWithString("180D")
		  
		  // discoverServices with no array to get all services
		  p.discoverServices serviceUUIDs
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidDisconnectPeripheral(peripheral as CBPeripheralMBS, error as NSErrorMBS)
		  list.Log CurrentMethodName
		  if error <> nil then
		    list.Log "Error: "+error.LocalizedDescription
		  end if
		  
		  connectedPeripheral = nil
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidDiscoverPeripheral(peripheral as CBPeripheralMBS, advertisementData as Dictionary, RSSI as String)
		  Dim Name As String = peripheral.name
		  
		  list.Log CurrentMethodName+": "+RSSI+" "+Name
		  
		  if Name <> "iPhone" and connectedPeripheral = nil then
		    // make new object 
		    dim p as new CBPeripheral(peripheral)
		    p.list = list
		    
		    connectedPeripheral = p
		    
		    self.connectPeripheral p
		  end if
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidFailToConnectPeripheral(peripheral as CBPeripheralMBS, error as NSErrorMBS)
		  list.Log CurrentMethodName
		  if error <> nil then
		    list.Log "Error: "+error.LocalizedDescription
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidUpdateState()
		  Select case state
		  case me.kStatePoweredOff
		    list.Log CurrentMethodName+": PoweredOff"
		  case me.kStatePoweredOn
		    list.Log CurrentMethodName+": PoweredOn"
		  case me.kStateResetting
		    list.Log CurrentMethodName+": Resetting"
		  case me.kStateUnauthorized
		    list.Log CurrentMethodName+": Unauthorized"
		  case me.kStateUnknown
		    list.Log CurrentMethodName+": Unknown"
		  case me.kStateUnsupported
		    list.Log CurrentMethodName+": Unsupported"
		  else
		    list.Log CurrentMethodName+": ?"
		  end Select
		  
		  if me.State = me.CBCentralManagerStatePoweredOn then
		    list.Log "State changed to poweredOn"
		    
		    dim serviceUUIDs() as CBUUIDMBS
		    
		    serviceUUIDs.Append CBUUIDMBS.UUIDWithString("180D")
		    
		    // already found it?
		    dim lastPeripherals() as CBPeripheralMBS = me.retrieveConnectedPeripheralsWithServices(serviceUUIDs)
		    
		    if lastPeripherals.ubound >= 0 then
		      dim device as CBPeripheralMBS = lastPeripherals(lastPeripherals.ubound)
		      dim p as new CBPeripheral(device)
		      peripherals.Append p
		      
		      me.connectPeripheral p
		      
		    else 
		      // look for it
		      me.scanForPeripheralsWithServices serviceUUIDs
		    end if
		  end if
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		connectedPeripheral As CBPeripheral
	#tag EndProperty

	#tag Property, Flags = &h0
		list As listbox
	#tag EndProperty

	#tag Property, Flags = &h0
		peripherals() As CBPeripheral
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
