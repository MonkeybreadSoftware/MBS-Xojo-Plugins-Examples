#tag Class
Protected Class mdxTapi
Inherits TAPIMBS
	#tag Event
		Sub CallStateChanged(CallInfo as ITCallInfoMBS)
		  
		  Select Case CallInfo.State
		    
		  Case CallInfo.StateIdle
		    
		    Log "StateIdle"
		    
		  Case CallInfo.StateInProgress
		    
		    Log "StateInProgress"
		    
		  Case CallInfo.StateConnected
		    
		    Log "StateConnected"
		    
		  Case CallInfo.StateDisconnected
		    
		    Log "StateDisconnected"
		    
		  Case CallInfo.StateOffering
		    
		    Log "StateOffering"
		    
		  Case CallInfo.StateHold
		    
		    Log "StateHold"
		    
		  Case CallInfo.StateQueued
		    
		    Log "StateQueued"
		    
		  End Select
		End Sub
	#tag EndEvent

	#tag Event
		Sub IncomingCall(CallInfo as ITCallInfoMBS, BasicCallControl as TAPICallControlMBS)
		  
		  Log CallInfo.CallerIDNumber
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
