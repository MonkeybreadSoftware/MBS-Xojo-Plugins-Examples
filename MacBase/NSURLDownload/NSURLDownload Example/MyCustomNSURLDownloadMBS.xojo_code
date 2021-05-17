#tag Class
Protected Class MyCustomNSURLDownloadMBS
Inherits CustomNSURLDownloadMBS
	#tag Event
		Sub DownloadCancelled()
		  MainWindow.StatusLabel.Text = "Status: cancelled"
		  
		  MainWindow.PausePushButton.Enabled = False
		  MainWindow.PausePushButton.Caption = "Pause"
		  
		  MainWindow.StartPushButton.Caption = "Start"
		End Sub
	#tag EndEvent

	#tag Event
		Sub DownloadComplete(File as FolderItem)
		  MainWindow.StatusLabel.Text = "Status: complete"
		  
		  MainWindow.PausePushButton.Enabled = False
		  MainWindow.PausePushButton.Caption = "Pause"
		  
		  MainWindow.StartPushButton.Caption = "Start"
		End Sub
	#tag EndEvent

	#tag Event
		Sub DownloadFailed(ErrorCode as Integer, ErrorMessage as String)
		  MainWindow.StatusLabel.Text = "Status: failed"
		  MainWindow.TotalSizeLabel.Text = "Error code: " + Str(ErrorCode)
		  MainWindow.DownloadedSizeLabel.Text = "Error message: " + ErrorMessage
		  
		  MainWindow.PausePushButton.Enabled = False
		  MainWindow.PausePushButton.Caption = "Pause"
		  
		  MainWindow.StartPushButton.Caption = "Start"
		End Sub
	#tag EndEvent

	#tag Event
		Sub DownloadPaused(ResumeData as MemoryBlock)
		  MainWindow.StatusLabel.Text = "Status: paused"
		End Sub
	#tag EndEvent

	#tag Event
		Sub DownloadProgress(ReceivedBytes as UInt64, TotalBytes as UInt64, PercentComplete as Integer)
		  MainWindow.DownloadedSizeLabel.Text = "Downloaded size (in Bytes): " + Str(ReceivedBytes)
		End Sub
	#tag EndEvent

	#tag Event
		Sub DownloadResumed()
		  MainWindow.StatusLabel.Text = "Status: resumed"
		End Sub
	#tag EndEvent

	#tag Event
		Sub DownloadStarted(TotalBytes as UInt64)
		  MainWindow.StatusLabel.Text = "Status: started"
		  if TotalBytes = 18446744073709551615 then
		    MainWindow.TotalSizeLabel.Text = "Total size (in Bytes): unknown"
		  else
		    MainWindow.TotalSizeLabel.Text = "Total size (in Bytes): " + Str(TotalBytes)
		  end if
		  MainWindow.DownloadedSizeLabel.Text = "Downloaded size (in Bytes): 0"
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
