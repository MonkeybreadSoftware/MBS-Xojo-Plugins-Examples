#tag Class
Protected Class MyNSSavePanelObserverMBS
Inherits NSSavePanelObserverMBS
	#tag Event
		Sub DidShowPanel(panel as NSSavePanelMBS, Result as Integer)
		  MainWindow.Log CurrentMethodName
		  
		  MainWindow.Log "Result: "+Str(result)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub WillShowPanel(panel as NSSavePanelMBS)
		  MainWindow.Log CurrentMethodName
		  
		  panel.Title = "Observer called"
		  panel.showsHiddenFiles = True
		  
		  // change suggested file name for save dialog
		  panel.nameFieldStringValue = "test file"
		  
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
