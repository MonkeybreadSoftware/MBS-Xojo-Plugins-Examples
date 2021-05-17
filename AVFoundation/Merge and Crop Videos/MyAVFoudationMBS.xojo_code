#tag Class
Protected Class MyAVFoudationMBS
Inherits AVFoundationMBS
	#tag Event
		Sub exportAsynchronouslyCompleted(ExportSession as AVAssetExportSessionMBS, tag as variant)
		  ProgressWindow.close
		  
		  
		  Select case ExportSession.status
		  case ExportSession.AVAssetExportSessionStatusUnknown
		    break
		  case ExportSession.AVAssetExportSessionStatusWaiting
		    break // should never happen
		  case ExportSession.AVAssetExportSessionStatusExporting
		    break // should never happen
		  case ExportSession.AVAssetExportSessionStatusCompleted
		    MsgBox "Export done."
		  case ExportSession.AVAssetExportSessionStatusFailed
		    MsgBox "Export failed."
		  case ExportSession.AVAssetExportSessionStatusCancelled
		    MsgBox "Export cancelled."
		  end Select
		  
		  
		  if ExportSession.error <>Nil then
		    MsgBox "Error: "+ExportSession.error.localizedDescription
		  end if
		  
		  quit
		  
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
