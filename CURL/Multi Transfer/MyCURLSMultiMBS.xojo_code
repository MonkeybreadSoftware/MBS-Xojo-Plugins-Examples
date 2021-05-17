#tag Class
Protected Class MyCURLSMultiMBS
Inherits CURLSMultiMBS
	#tag Event
		Sub TransferFinished(curl as CURLSMBS, result as Integer, RemainingFinishedTransfers as Integer)
		  // check this in debugger if you like
		  dim outputData as string = curl.OutputData
		  dim DebugData  as string = curl.DebugData
		  
		  'break
		  
		  MainWindow.log "Transfer done with error code "+str(result)+" for "+curl.OptionURL+", "+str(me.RunningTransfers)+" transfers running."
		  
		  MainWindow.DownloadOneURL
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub TransfersFinished()
		  MainWindow.log "All done"
		  MainWindow.Timer1.Mode = timer.ModeOff
		  
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
