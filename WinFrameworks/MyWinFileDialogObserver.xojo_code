#tag Class
Protected Class MyWinFileDialogObserver
Inherits WinFileDialogObserverMBS
	#tag Event
		Sub DidShowDialog(dialog as WinFileDialogMBS, Result as Integer)
		  MainWindow.Log CurrentMethodName
		  
		  MainWindow.Log "Result: "+Str(result)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub WillShowDialog(dialog as WinFileDialogMBS)
		  MainWindow.Log CurrentMethodName
		  
		  dialog.Title = "Observer called"
		  dialog.OptionForceShowHidden = True
		  
		  If dialog IsA WinFileSaveDialogMBS Then
		    Dim d As WinFileSaveDialogMBS = WinFileSaveDialogMBS(dialog)
		    
		    // change suggested file name for save dialog
		    d.FileName = "HelloWorld.txt"
		  End If
		  
		  
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
