#tag Class
Protected Class MyNSMetadataQueryMBS
Inherits NSMetadataQueryMBS
	#tag Event
		Sub DidFinishGathering(n as NSNotificationMBS)
		  window1.info.text = "Did finish gathering."
		  window1.RefreshList
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidStartGathering(n as NSNotificationMBS)
		  window1.info.text = "Did start gathering."
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidUpdate(n as NSNotificationMBS)
		  window1.info.text = "Got update."
		  window1.RefreshList
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub GatheringProgress(n as NSNotificationMBS)
		  window1.info.text = "Gathering..."
		  window1.RefreshList
		  
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
