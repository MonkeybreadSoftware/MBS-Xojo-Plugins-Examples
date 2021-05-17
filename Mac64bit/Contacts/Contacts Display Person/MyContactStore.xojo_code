#tag Class
Protected Class MyContactStore
Inherits CNContactStoreMBS
	#tag Event
		Sub DidChange()
		  mainWindow.log "Contacts Changed"
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub requestAccessForEntityType(granted as boolean, error as NSErrorMBS, tag as Variant)
		  MainWindow.log "requestAccessForEntityType completed"
		  if granted then
		    MainWindow.log "permissions granted"
		  else
		    MainWindow.log "Permissions denied"
		  end if
		  
		  MainWindow.ShowAuthorization
		  
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
