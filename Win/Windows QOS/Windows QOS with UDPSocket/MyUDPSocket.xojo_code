#tag Class
Protected Class MyUDPSocket
Inherits UDPSocket
	#tag Event
		Sub Error(err As RuntimeException)
		  log CurrentMethodName+": "+str(me.LastErrorCode)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Connect()
		  super.Connect
		  
		  self.Write(self.BroadcastAddress, "Test")
		  
		  log CurrentMethodName+" "+str(me.Handle)
		  
		  
		  #if TargetWin32 then
		    
		    dim r as Boolean
		    
		    FlowId = 0 // new flow
		    r = qos.AddSocketToFlow(me.Handle, "192.168.1.1", me.port, qos.QOSTrafficTypeExcellentEffort, qos.QOSNonAdaptiveFlow, FlowId)
		    
		    if not r then
		      log "Error: "+qos.LasterrorMessage
		    else
		      log "FlowID: "+str(FlowId)
		    end if
		    
		    dim Bandwidth as UInt64 = 1024 * 1024 // 1 MBit
		    dim ShapingBehavior as integer = qos.QOSUseNonConformantMarkings
		    dim Reason as integer = qos.QOSFlowRateUserCaused
		    r = qos.setOutgoingRate(FlowID, Bandwidth, ShapingBehavior, Reason)
		    
		    if not r then
		      log "Error: "+qos.LasterrorMessage
		    else
		      log "Outgoing Rate set."
		    end if
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From HTTPSocket
		  // Constructor() -- From TCPSocket
		  // Constructor() -- From SocketCore
		  Super.Constructor
		  
		  log CurrentMethodName
		  
		  qos = new WindowsQOSMBS
		  
		  if qos.Lasterror<>0 then
		    log "Error: "+qos.LasterrorMessage
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  log CurrentMethodName
		  
		  #if TargetWin32 then
		    
		    if qos<>Nil then
		      dim r as boolean = qos.RemoveAllSocketsFromFlow(flowid)
		      
		      if not r then
		        log "Error: "+qos.LasterrorMessage
		      end if
		      
		      qos = nil
		    end if
		    
		  #endif
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Log(s as string)
		  window1.List.AddRow s
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		FlowId As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		qos As WindowsQOSMBS
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
			Name="RouterHops"
			Visible=true
			Group="Behavior"
			InitialValue="32"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SendToSelf"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Port"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FlowId"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt32"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
