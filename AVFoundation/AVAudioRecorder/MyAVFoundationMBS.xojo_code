#tag Class
Protected Class MyAVFoundationMBS
Inherits AVFoundationMBS
	#tag Event
		Sub audioRecorderDidFinishRecording(recorder as AVAudioRecorderMBS, successful as boolean)
		  if successful then
		    CurrentFile.Launch
		    
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub audioRecorderEncodeErrorDidOccur(recorder as AVAudioRecorderMBS, error as NSErrorMBS)
		  MsgBox "Failed to encode recording: "+error.LocalizedDescription
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		CurrentFile As FolderItem
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
	#tag EndViewBehavior
End Class
#tag EndClass
