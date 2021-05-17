#tag Class
Protected Class MyCalCalendarStoreMBS
Inherits CalCalendarStoreMBS
	#tag Event
		Sub CalendarsChanged(Externally as boolean, InsertedRecords() as string, UpdatedRecords() as string, DeletedRecords() as string)
		  window1.ListBox4.AddRow "Calendars"
		  
		  dim s() as string
		  
		  for each id as string in InsertedRecords
		    s.Append "insert "+id
		  next
		  
		  for each id as string in UpdatedRecords
		    s.Append "update "+id
		  next
		  
		  for each id as string in DeletedRecords
		    s.Append "delete "+id
		  next
		  
		  if UBound(s)=-1 then
		    window1.ListBox4.Cell(window1.ListBox4.LastIndex,1)="all changed"
		  else
		    window1.ListBox4.Cell(window1.ListBox4.LastIndex,1)=Join(s,", ")
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub EventsChanged(Externally as boolean, InsertedRecords() as string, UpdatedRecords() as string, DeletedRecords() as string)
		  window1.ListBox4.AddRow "Events"
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub TasksChanged(Externally as boolean, InsertedRecords() as string, UpdatedRecords() as string, DeletedRecords() as string)
		  window1.ListBox4.AddRow "Tasks"
		  
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
