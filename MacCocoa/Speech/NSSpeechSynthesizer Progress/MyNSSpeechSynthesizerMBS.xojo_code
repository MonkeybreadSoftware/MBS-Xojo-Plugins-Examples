#tag Class
Protected Class MyNSSpeechSynthesizerMBS
Inherits NSSpeechSynthesizerMBS
	#tag Event
		Sub didFinishSpeaking(finishedSpeaking as boolean)
		  if finishedSpeaking then
		    MainWindow.StartButton.Enabled=true
		    MainWindow.StopButton.Enabled=False
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub willSpeakWord(Position as integer, Length as integer, Text as String)
		  MainWindow.EditField1.SelStart=Position
		  MainWindow.EditField1.SelLength=Length
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		LastText As string
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
			Name="LastText"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
