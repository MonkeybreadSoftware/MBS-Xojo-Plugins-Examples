#tag Class
Protected Class MyBase64
Inherits Base64MBS
	#tag Event
		Sub Finished(wascanceled as boolean)
		  ProcessWindow.Close
		End Sub
	#tag EndEvent

	#tag Event
		Sub Start()
		  ProcessWindow.show
		End Sub
	#tag EndEvent

	#tag Event
		Function Working(percent as double) As boolean
		  dim i as integer
		  dim b as ProgressBar
		  
		  i=percent*100
		  b=ProcessWindow.ProgressBar1
		  if b.Value<>i then // event may come too often.
		    ProcessWindow.ProgressBar1.Maximum=100
		    ProcessWindow.ProgressBar1.Value=percent*100
		  end if 
		End Function
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
