#tag Class
Protected Class CURLMulti
Inherits CURLSMultiMBS
	#tag Event
		Sub TransferFinished(curl as CURLSMBS, result as Integer, RemainingFinishedTransfers as Integer)
		  dim DebugMessage as string = Curl.DebugData
		  // view in debugger
		  
		  dim u as UploadCURL = UploadCURL(Curl)
		  dim m as string
		  
		  Select case result
		  case CURLSMBS.kError_LOGIN_DENIED
		    m = "Wrong password."
		  case CURLSMBS.kError_UNSUPPORTED_PROTOCOL
		    m = "Protocol not implemented."
		  case CURLSMBS.kError_COULDNT_CONNECT
		    m = "Failed to connect."
		  case CURLSMBS.kError_FAILED_INIT
		    m = "Failed to initialize."
		  case CURLSMBS.kError_OK
		    m = "No error."
		  else
		    m = "Error "+str(result)
		  end select
		  
		  List.addrow "Finished "+u.ID+": "+m
		  
		  if result <> 0 then
		    Break
		  end if
		  
		  TransfersDone = TransfersDone + 1
		  ProgressLabel.Text = str(TransfersDone)+" of "+str(TransfersTotal)
		  bar.Value = TransfersDone*100 / TransfersTotal
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub TransfersFinished()
		  if TransfersDone = TransfersTotal then
		    TransfersTotal = -1
		    
		    list.AddRow "All uploads done."
		    
		    ProgressLabel.Text = "done"
		    bar.Visible = false
		    
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		bar As ProgressBar
	#tag EndProperty

	#tag Property, Flags = &h0
		list As Listbox
	#tag EndProperty

	#tag Property, Flags = &h0
		ProgressLabel As label
	#tag EndProperty

	#tag Property, Flags = &h0
		TransfersDone As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		TransfersTotal As Integer = -1
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
		#tag ViewProperty
			Name="TransfersDone"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TransfersTotal"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
