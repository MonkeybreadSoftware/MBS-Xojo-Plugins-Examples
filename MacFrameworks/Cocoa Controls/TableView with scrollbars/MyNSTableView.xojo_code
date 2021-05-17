#tag Class
Protected Class MyNSTableView
Inherits NSTableViewMBS
	#tag Event
		Sub ColumnDidMove(notification as NSNotificationMBS, oldColumn as Integer, newColumn as Integer)
		  log "ColumnDidMove"
		  log "  OldColumn: "+str(oldColumn)
		  log "  NewColumn: "+str(newColumn)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub ColumnDidResize(notification as NSNotificationMBS, column as NSTableColumnMBS, index as Integer)
		  log "ColumnDidResize"
		  log "  index: "+str(index)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub SelectionDidChange(notification as NSNotificationMBS)
		  log "SelectionDidChange"
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub SelectionIsChanging(notification as NSNotificationMBS)
		  log "SelectionIsChanging"
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub log(s as string)
		  System.DebugLog s
		  window1.Listbox1.AddRow s
		  
		End Sub
	#tag EndMethod


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
