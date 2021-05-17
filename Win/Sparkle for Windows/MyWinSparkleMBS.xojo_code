#tag Class
Protected Class MyWinSparkleMBS
Inherits WinSparkleMBS
	#tag Event
		Sub DidFindUpdate()
		  log "Did find update"
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidNotFindUpdate()
		  log "Did not find update"
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error()
		  log "Error event"
		End Sub
	#tag EndEvent

	#tag Event
		Sub ShutdownRequest()
		  log "Shutdown request"
		  
		  quit
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub UpdateCancelled()
		  log "Update cancelled"
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
