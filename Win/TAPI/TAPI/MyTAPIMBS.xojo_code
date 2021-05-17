#tag Class
Protected Class MyTAPIMBS
Inherits TAPIMBS
	#tag Event
		Sub CallStateChanged(CallInfo as ITCallInfoMBS)
		  log CurrentMethodName
		  Select case CallInfo.State
		  case CallInfo.StateConnected
		    log "state: connected"
		  case CallInfo.StateDisconnected
		    log "state: disconnected"
		  case CallInfo.StateHold
		    log "state: hold"
		  case CallInfo.StateIdle
		    log "state: idle"
		  case CallInfo.StateInProgress
		    log "state: in progress"
		  case CallInfo.StateOffering
		    log "state: offering"
		  case CallInfo.StateQueued
		    log "state: queued"
		  end Select
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub IncomingCall(CallInfo as ITCallInfoMBS, BasicCallControl as TAPICallControlMBS)
		  log CurrentMethodName
		  log "CallerIDName: "+CallInfo.CallerIDName
		  log "CallerIDNumber: "+CallInfo.CallerIDNumber
		  
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
