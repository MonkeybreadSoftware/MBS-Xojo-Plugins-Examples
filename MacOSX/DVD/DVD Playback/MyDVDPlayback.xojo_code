#tag Class
Protected Class MyDVDPlayback
Inherits DVDPlaybackMBS
	#tag Event
		Sub DVDEvent(eventcode as integer, value1 as integer, value2 as integer)
		  // you may do something here...
		  
		  'mainWindow.Title=str(eventcode)
		  MainWindow.UpdatePosition
		End Sub
	#tag EndEvent

	#tag Event
		Sub FatalError(errorcode as integer)
		  MsgBox "Fatal error "+str(errorcode)+" in the DVD Playback Framework!"
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
