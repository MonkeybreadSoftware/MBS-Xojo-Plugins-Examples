#tag Class
Protected Class MyAVFoudationMBS
Inherits AVFoundationMBS
	#tag Event
		Sub exportAsynchronouslyCompleted(ExportSession as AVAssetExportSessionMBS, tag as variant)
		  dim pw as ProgressWindow = tag
		  
		  pw.e = nil
		  pw.a = nil
		  
		  if pw.Status = nil then Return // window already closed
		  
		  Select case ExportSession.status
		  case ExportSession.AVAssetExportSessionStatusUnknown
		    break
		  case ExportSession.AVAssetExportSessionStatusWaiting
		    break // should never happen
		  case ExportSession.AVAssetExportSessionStatusExporting
		    break // should never happen
		  case ExportSession.AVAssetExportSessionStatusCompleted
		    pw.Status.text = "Export done."
		  case ExportSession.AVAssetExportSessionStatusFailed
		    pw.Status.text = "Export failed."
		  case ExportSession.AVAssetExportSessionStatusCancelled
		    pw.Status.text = "Export cancelled."
		  end Select
		  
		  
		  if ExportSession.error <> Nil then
		    pw.Status.text = "Error: "+ExportSession.error.localizedDescription
		  end if
		  
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
