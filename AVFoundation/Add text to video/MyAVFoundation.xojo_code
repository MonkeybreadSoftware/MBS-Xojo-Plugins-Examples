#tag Class
Protected Class MyAVFoundation
Inherits AVFoundationMBS
	#tag Event
		Sub exportAsynchronouslyCompleted(ExportSession as AVAssetExportSessionMBS, tag as variant)
		  dim e as NSErrorMBS = ExportSession.error
		  
		  if e <> nil then
		    MsgBox e.LocalizedDescription+EndOfLine+e.LocalizedFailureReason+EndOfLine+e.LocalizedRecoverySuggestion
		  else
		    MsgBox "export done."
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
