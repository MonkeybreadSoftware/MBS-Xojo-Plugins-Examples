#tag Class
Protected Class MyContactStore
Inherits CNContactStoreMBS
	#tag Event
		Sub DidChange()
		  mainWindow.log "Contacts Changed"
		  mainwindow.ShowContacts
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub requestAccessForEntityType(granted as boolean, error as NSErrorMBS, tag as Variant)
		  #Pragma unused tag
		  
		  MainWindow.log "requestAccessForEntityType completed"
		  if granted then
		    MainWindow.Log "permissions granted"
		  else
		    MainWindow.log "Permissions denied"
		  End If
		  If error <> Nil Then
		    MainWindow.Log error.LocalizedDescription
		  end if
		  
		  MainWindow.ShowAuthorization
		  MainWindow.ShowContacts
		  
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
