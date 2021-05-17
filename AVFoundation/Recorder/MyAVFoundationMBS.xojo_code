#tag Class
Protected Class MyAVFoundationMBS
Inherits AVFoundationMBS
	#tag Event
		Sub captureOutputDidFinishRecordingToOutputFileAtURL(captureOutput as AVCaptureFileOutputMBS, outputFileURL as string, connections() as AVCaptureConnectionMBS, error as NSErrorMBS)
		  
		  if Error <> nil then
		    dim userinfo as Dictionary = error.userInfo
		    dim success as Boolean = userinfo.Lookup(AVFoundationMBS.AVErrorRecordingSuccessfullyFinishedKey, false)
		    
		    if success = false then
		      
		      dim file as FolderItem = GetFolderItem(outputFileURL, FolderItem.PathTypeURL)
		      file.Delete
		      
		      call NSApplicationMBS.sharedApplication.keyWindow.presentError error
		      Return
		    end if
		  end if
		  
		  
		  // open the video
		  dim file as FolderItem = GetFolderItem(outputFileURL, FolderItem.PathTypeURL)
		  
		  file.Launch
		  
		  
		  MainWindow.EnableButtons // check status
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub captureOutputDidPauseRecordingToOutputFileAtURL(captureOutput as AVCaptureFileOutputMBS, fileURL as string, connections() as AVCaptureConnectionMBS)
		  System.DebugLog "Did pause recording to "+fileURL
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub captureOutputDidResumeRecordingToOutputFileAtURL(captureOutput as AVCaptureFileOutputMBS, fileURL as string, connections() as AVCaptureConnectionMBS)
		  System.DebugLog "Did resume recording to "+fileURL
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub captureOutputDidStartRecordingToOutputFileAtURL(captureOutput as AVCaptureFileOutputMBS, fileURL as string, connections() as AVCaptureConnectionMBS)
		  System.DebugLog "Did start recording to "+fileURL
		  
		  MainWindow.EnableButtons // check status
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub captureOutputWillFinishRecordingToOutputFileAtURL(captureOutput as AVCaptureFileOutputMBS, fileURL as string, connections() as AVCaptureConnectionMBS, error as NSErrorMBS)
		  'if error<>Nil then
		  'call NSApplicationMBS.sharedApplication.keyWindow.presentError error
		  'end if
		  
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
