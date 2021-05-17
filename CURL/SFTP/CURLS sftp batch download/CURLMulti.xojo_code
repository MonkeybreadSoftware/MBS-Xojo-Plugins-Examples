#tag Class
Protected Class CURLMulti
Inherits CURLSMultiMBS
	#tag Event
		Sub TransferFinished(curl as CURLSMBS, result as Integer, RemainingFinishedTransfers as Integer)
		  dim DebugMessage as string = Curl.DebugData
		  TransfersDone = TransfersDone + 1
		  
		  // view in debugger
		  
		  dim u as CURLSMBS = curl
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
		  
		  List.addrow "Finished "+curl.OptionURL
		  
		  if result <> 0 then
		    Break
		  end if
		  
		  if curl.OptionDirListOnly then
		    
		    // got list of files
		    dim list as string = curl.OutputData
		    list = ReplaceLineEndings(list, EndOfLine)
		    dim files() as string = split(list, EndOfLine)
		    
		    // download all
		    for each filename as string in files
		      if filename = "" then continue
		      if filename.left(1) = "." then continue // skip folders or invisible files
		      
		      // start a download
		      MainWindow.DownloadFile filename, curl.OptionURL
		    next
		    
		    
		  else
		    
		    // file loaded
		    ProgressLabel.Text = str(TransfersDone)+" of "+str(TransfersTotal)
		    bar.Value = TransfersDone * 100 / TransfersTotal
		    
		  end if
		  
		  'list.addrow str(self.TransfersDone)+" of "+str(self.TransfersTotal)
		  
		  
		  if TransfersDone = TransfersTotal then
		    TransfersTotal = -1
		    
		    list.AddRow "All downloads done."
		    
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
