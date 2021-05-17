#tag Class
Protected Class MyWindowsDiskChangeMBS
Inherits WindowsDiskChangeMBS
	#tag Event
		Sub DriveAdded(Path as string)
		  MainWindow.List.AddRow "Drive added: "+path
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DriveRemoved(Path as string)
		  MainWindow.List.AddRow "Drive removed: "+path
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MediaInserted(Path as string)
		  MainWindow.List.AddRow "Media inserted: "+path
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MediaRemoved(Path as string)
		  MainWindow.List.AddRow "Media removed: "+path
		  
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
