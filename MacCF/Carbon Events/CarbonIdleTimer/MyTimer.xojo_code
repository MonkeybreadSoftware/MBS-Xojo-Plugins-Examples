#tag Class
Protected Class MyTimer
Inherits CarbonEventsIdleTimerMBS
	#tag Event
		Sub Action(state as integer)
		  dim s as string
		  dim l as Listbox
		  
		  Select case state
		  case 1
		    s="Start"
		    count=0
		  case 2
		    count=count+1
		    s="Idle for "+str(count)+" seconds."
		  case 3
		    s="Stop"
		    count=0
		  end Select
		  
		  l=Window1.ListBox1
		  l.AddRow s
		  l.ScrollPosition=l.ListCount-1
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h1
		Protected count As integer
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
