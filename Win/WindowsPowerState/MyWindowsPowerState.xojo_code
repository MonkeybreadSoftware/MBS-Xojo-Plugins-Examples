#tag Class
Protected Class MyWindowsPowerState
Inherits WindowsPowerStateMBS
	#tag Event
		Sub BatteryLow()
		  w "BatteryLow"
		End Sub
	#tag EndEvent

	#tag Event
		Sub OEMEvent(eventcode as integer)
		  w "OEMEvent "+hex(eventcode)
		End Sub
	#tag EndEvent

	#tag Event
		Sub PowerStatusChange()
		  w "PowerStatusChange"
		End Sub
	#tag EndEvent

	#tag Event
		Function QueryStandby(PromptUser as boolean) As boolean
		  w "QueryStandby"
		End Function
	#tag EndEvent

	#tag Event
		Sub QueryStandbyFailed()
		  w "QueryStandbyFailed"
		End Sub
	#tag EndEvent

	#tag Event
		Function QuerySuspend(PromptUser as boolean) As boolean
		  w "QuerySuspend"
		End Function
	#tag EndEvent

	#tag Event
		Sub QuerySuspendFailed()
		  w "QuerySuspendFailed"
		End Sub
	#tag EndEvent

	#tag Event
		Sub ResumeAutomatic()
		  w "ResumeAutomatic"
		End Sub
	#tag EndEvent

	#tag Event
		Sub ResumeCritical()
		  w "ResumeCritical"
		End Sub
	#tag EndEvent

	#tag Event
		Sub ResumeStandby()
		  w "ResumeStandby"
		End Sub
	#tag EndEvent

	#tag Event
		Sub ResumeSuspend()
		  w "ResumeSuspend"
		End Sub
	#tag EndEvent

	#tag Event
		Sub Standby()
		  w "Standby"
		End Sub
	#tag EndEvent

	#tag Event
		Sub Suspend()
		  w "Suspend"
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub w(w as string)
		  dim s as string
		  dim d as date
		  
		  d=new date
		  s=d.LongTime+": "+w
		  
		  Window1.ListBox1.AddRow s
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
