#tag Class
Protected Class MyABPeoplePickerViewMBS
Inherits ABPeoplePickerViewMBS
	#tag Event
		Sub DisplayedPropertyDidChange()
		  log CurrentMethodName
		  log me.displayedProperty
		End Sub
	#tag EndEvent

	#tag Event
		Sub GroupDoubleClick()
		  log CurrentMethodName
		  
		  dim groups() as ABGroupMBS = me.selectedGroups
		  
		  for each g as ABGroupMBS in groups
		    log "group: "+g.DisplayName
		  next
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub GroupSelectionDidChange()
		  log CurrentMethodName
		  
		  dim groups() as ABGroupMBS = me.selectedGroups
		  
		  for each g as ABGroupMBS in groups
		    log "group: "+g.DisplayName
		  next
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub NameDoubleClick()
		  log CurrentMethodName
		  
		  dim name as string
		  
		  dim records() as ABRecordMBS = me.selectedRecords
		  for each r as ABRecordMBS in records
		    log "Record: "+r.DisplayName
		  next
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub NameSelectionDidChange()
		  log CurrentMethodName
		  
		  dim records() as ABRecordMBS = me.selectedRecords
		  for each r as ABRecordMBS in records
		    log "Record: "+r.DisplayName
		  next
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub ValueSelectionDidChange()
		  log CurrentMethodName
		  
		  dim records() as ABRecordMBS = me.selectedRecords
		  for each r as ABRecordMBS in records
		    log "Record: "+r.DisplayName
		  next
		  
		  dim values() as variant = me.selectedValues
		  for each r as variant in values
		    log "Value: "+r
		  next
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub log(s as string)
		  l.AddRow s
		  l.ScrollPosition = l.ListCount
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		l As listbox
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
