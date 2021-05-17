#tag Class
Protected Class MyAVFoundation
Inherits AVFoundationMBS
	#tag Event
		Sub requestMediaDataWhenReadyOnQueueFinished(assetWriterInput as AVAssetWriterInputMBS, assetReaderOutput as AVAssetReaderOutputMBS, tag as variant)
		  window1.List.AddRow "Finished"
		  window1.Cleanup
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub requestMediaDataWhenReadyOnQueueProgress(assetWriterInput as AVAssetWriterInputMBS, assetReaderOutput as AVAssetReaderOutputMBS, convertedByteCount as Int64, LastBuffer as CMSampleBufferMBS, tag as variant)
		  window1.List.AddRow str(convertedByteCount)+" bytes done."
		  
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
			InitialValue="-2147483648"
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
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
