#tag Class
Protected Class mySQLConnectionMBS
Inherits SQLConnectionMBS
	#tag Event
		Sub PostgresNotification(NotificationName as string, PID as Integer, Extras as String)
		  dim m as string = NotificationName
		  
		  if pid <> 0 then
		    m = m + " (ProcessID: "+str(pid)+")"
		  end if
		  
		  if Extras <> "" then
		    m = m + " "+Extras
		  end if
		  
		  window1.Listbox1.AddRow m
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Trace(traceInfo as integer, SQL as string, Command as SQLCommandMBS)
		  window1.Listbox1.AddRow "Trace: "+sql
		  
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
