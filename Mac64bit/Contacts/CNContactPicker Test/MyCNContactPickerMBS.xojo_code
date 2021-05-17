#tag Class
Protected Class MyCNContactPickerMBS
Inherits CNContactPickerMBS
	#tag Event
		Sub DidClose()
		  log CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidSelectContact(contact as CNContactMBS)
		  Log CurrentMethodName
		  
		  
		  // We requery it to get a full contact record
		  Dim e As NSErrorMBS
		  Dim c As CNContactMBS = app.ContactStore.unifiedContactWithIdentifier(contact.identifier, e)
		  
		  If c = Nil Then
		    If e <> Nil Then
		      Log e.LocalizedDescription
		    End If
		    
		    // failed?
		    c = contact
		  End If
		  
		  Log "Contact: "+c.givenName + c.familyName + c.nickname
		  
		  // keep for later?
		  Self.Current = c
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidSelectContactProperty(contactProperty as CNContactPropertyMBS)
		  log CurrentMethodName
		  
		  log "ID: "+contactProperty.Identifier
		  log "Key: "+contactProperty.Key
		  log "Label: "+contactProperty.Label
		  log "Value: "+contactProperty.Value.StringValue
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub WillClose()
		  log CurrentMethodName
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		Current As CNContactMBS
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
