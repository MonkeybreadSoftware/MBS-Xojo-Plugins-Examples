#tag Class
Protected Class MyHTTPSocket
Inherits HTTPSocket
	#tag Event
		Function AuthenticationRequired(Realm As String, Headers As InternetHeaders, ByRef Name As String, ByRef Password As String) As Boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Connected()
		  log CurrentMethodName
		  
		  #if TargetWin32 then
		    
		    dim r as Boolean 
		    
		    FlowId = 0 // new flow
		    r = qos.AddSocketToFlow(me.Handle, qos.QOSTrafficTypeExcellentEffort, qos.QOSNonAdaptiveFlow, FlowId)
		    
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
		      
		      
		    end if
		    
		  #endif
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DownloadComplete(url as string, httpStatus as integer, headers as internetHeaders, file as folderItem)
		  log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error(code as integer)
		  log CurrentMethodName+": "+str(code)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub HeadersReceived(headers as internetHeaders, httpStatus as integer)
		  log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub PageReceived(url as string, httpStatus as integer, headers as internetHeaders, content as string)
		  log CurrentMethodName
		  
		  log "httpstatus: "+str(httpStatus)
		  log "length: "+str(lenb(content))
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function ProxyAuthenticationRequired(Realm As String, Headers As InternetHeaders, ByRef Name As String, ByRef Password As String) As Boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent


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
			Name="BytesAvailable"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BytesLeftToSend"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Handle"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsConnected"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LocalAddress"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RemoteAddress"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Address"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="httpProxyAddress"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="httpProxyPort"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="yield"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
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
