#tag Class
Protected Class MyABPeoplePickerViewMBS
Inherits ABPeoplePickerViewMBS
	#tag Event
		Sub GroupDoubleClick()
		  dim groups() as ABGroupMBS = me.selectedGroups
		  
		  for each r as ABGroupMBS in groups
		    MsgBox r.DisplayName
		  next
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub NameDoubleClick()
		  dim records() as ABRecordMBS = me.selectedRecords
		  
		  for each r as ABRecordMBS in records
		    MsgBox r.DisplayName
		  next
		  
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
