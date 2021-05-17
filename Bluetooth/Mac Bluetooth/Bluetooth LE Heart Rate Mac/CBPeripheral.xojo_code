#tag Class
Protected Class CBPeripheral
Inherits CBPeripheralMBS
	#tag Event
		Sub DidDiscoverCharacteristicsForService(service as CBServiceMBS, error as NSErrorMBS)
		  list.Log CurrentMethodName
		  
		  dim ServiceUUID as string = service.UUID.UUIDString
		  
		  if ServiceUUID = "180D" then
		    dim characteristics() as CBCharacteristicMBS = service.characteristics 
		    for each characteristic as CBCharacteristicMBS in characteristics
		      
		      select case characteristic.UUID.UUIDString
		      case "2A37"
		        // Set notification on heart rate measurement
		        list.Log "Found a Heart Rate Measurement Characteristic"
		        me.setNotifyValue(true, characteristic)
		        
		      case "2A38"
		        // Read body sensor location
		        list.Log "Found a Body Sensor Location Characteristic"
		        me.readValueForCharacteristic(characteristic)
		        
		      case "2A39"
		        // Write heart rate control point
		        list.Log "Found a Heart Rate Control Point Characteristic"
		        
		        dim data as new MemoryBlock(1)
		        data.UInt8Value(0) = 1
		        
		        me.writeValue(data, characteristic, CBCharacteristicMBS.kPropertyWriteWithoutResponse)
		        
		      end Select
		    next
		  end if
		  
		  if error <> nil then
		    list.Log "Error: "+error.LocalizedDescription
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidDiscoverDescriptorsForCharacteristic(characteristic as CBCharacteristicMBS, error as NSErrorMBS)
		  list.Log CurrentMethodName
		  if error <> nil then
		    list.Log "Error: "+error.LocalizedDescription
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidDiscoverIncludedServicesForService(service as CBServiceMBS, error as NSErrorMBS)
		  list.Log CurrentMethodName
		  if error <> nil then
		    list.Log "Error: "+error.LocalizedDescription
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidDiscoverServices(error as NSErrorMBS)
		  list.Log CurrentMethodName
		  if error <> nil then
		    list.Log "Error: "+error.LocalizedDescription
		  end if
		  
		  dim services() as CBServiceMBS = me.services
		  for each service as CBServiceMBS in Services
		    
		    list.Log "Service found: "+service.UUID.UUIDString
		    
		    me.discoverCharacteristics service
		    
		  next
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidUpdateName()
		  list.Log CurrentMethodName+": "+me.name
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidUpdateNotificationStateForCharacteristic(characteristic as CBCharacteristicMBS, error as NSErrorMBS)
		  list.Log CurrentMethodName
		  if error <> nil then
		    list.Log "Error: "+error.LocalizedDescription
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidUpdateRSSI(error as NSErrorMBS)
		  list.Log CurrentMethodName
		  if error <> nil then
		    list.Log "Error: "+error.LocalizedDescription
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidUpdateValueForCharacteristic(characteristic as CBCharacteristicMBS, error as NSErrorMBS)
		  list.Log CurrentMethodName
		  if error <> nil then
		    list.Log "Error: "+error.LocalizedDescription
		  end if
		  
		  select case characteristic.UUID.UUIDString
		  case "2A37"
		    update(characteristic.value)
		    
		  end Select
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidUpdateValueForDescriptor(descriptor as CBDescriptorMBS, error as NSErrorMBS)
		  list.Log CurrentMethodName
		  if error <> nil then
		    list.Log "Error: "+error.LocalizedDescription
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidWriteValueForCharacteristic(characteristic as CBCharacteristicMBS, error as NSErrorMBS)
		  list.Log CurrentMethodName
		  if error <> nil then
		    list.Log "Error: "+error.LocalizedDescription
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidWriteValueForDescriptor(descriptor as CBDescriptorMBS, error as NSErrorMBS)
		  list.Log CurrentMethodName
		  if error <> nil then
		    list.Log "Error: "+error.LocalizedDescription
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub update(data as MemoryBlock)
		  
		  
		  if data.size >= 2 then
		    dim bpm as integer
		    
		    if BitwiseAnd(data.UInt8Value(0), 1) = 0 then
		      
		      bpm = data.uint8Value(1)
		    else 
		      
		      bpm = data.uint8Value(1) * 256 + data.uint8Value(2)
		      
		    end if
		    
		    list.Log "BPM: "+str(bpm)
		  end if
		  
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
