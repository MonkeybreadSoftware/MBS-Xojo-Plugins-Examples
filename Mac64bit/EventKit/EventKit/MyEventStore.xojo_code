#tag Class
Protected Class MyEventStore
Inherits EKEventStoreMBS
	#tag Event
		Sub Changed()
		  MainWindow.updateEvents
		End Sub
	#tag EndEvent

	#tag Event
		Sub fetchRemindersMatchingPredicateCompleted(reminders() as EKReminderMBS, predicate as NSPredicateMBS, tag as variant)
		  dim List as listbox = MainWindow.List
		  
		  List.DeleteAllRows
		  
		  for each r as EKReminderMBS in reminders
		    
		    dim startDateComponents as NSDateComponentsMBS = r.startDateComponents
		    dim dueDateComponents   as NSDateComponentsMBS = r.dueDateComponents
		    
		    dim startDateComponentsDescription as string = DateComponentsString(startDateComponents)
		    dim dueDateComponentsDescription   as string = DateComponentsString(dueDateComponents)
		    
		    List.addrow r.calendar.title, r.title, r.location, startDateComponentsDescription, dueDateComponentsDescription
		    
		    list.CellHelpTag(List.LastIndex, 3) = startDateComponentsDescription
		    list.CellHelpTag(List.LastIndex, 4) = dueDateComponentsDescription
		    
		  next
		End Sub
	#tag EndEvent

	#tag Event
		Sub requestAccessToEntityTypeCompleted(entityType as Integer, granted as Boolean, error as NSErrorMBS, tag as variant)
		  System.DebugLog CurrentMethodName
		  
		  if error <> nil then
		    System.DebugLog error.LocalizedDescription
		  end if
		  
		  MainWindow.GotPermissions entityType, granted
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function DateComponentsString(d as NSDateComponentsMBS) As String
		  dim s as string = d.description
		  
		  dim lines() as string = split(s, EndOfLine)
		  
		  lines.Remove 0
		  
		  dim u as integer = lines.Ubound
		  for i as integer = 0 to u
		    lines(i) = lines(i).Trim
		  next
		  
		  Return Join(lines, " ")
		  
		End Function
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
