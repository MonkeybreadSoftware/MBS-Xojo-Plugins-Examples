#tag Class
Protected Class SleepNotification
Inherits SleepNotificationMBS
	#tag Event
		Function Sleep(message as int64) As boolean
		  dim s as string
		  
		  Select case message
		  case kIOMessageCanSystemPowerOff
		    s="CanSystemPowerOff"
		  case kIOMessageCanSystemSleep
		    s="CanSystemSleep"
		  case kIOMessageSystemHasPoweredOn
		    s="SystemHasPoweredOn"
		  case kIOMessageSystemWillNotPowerOff
		    s="SystemWillNotPowerOff"
		  case kIOMessageSystemWillPowerOff
		    s="SystemWillPowerOff"
		  case kIOMessageSystemWillNotSleep
		    s="SystemWillNotSleep"
		  case kIOMessageSystemWillPowerOn
		    s="SystemWillPowerOn"
		  case kIOMessageSystemWillRestart
		    s="SystemWillRestart"
		  case kIOMessageSystemWillSleep
		    s="SystemWillSleep"
		  else
		    s=hex(message)
		  end Select
		  
		  window1.ListBox1.AddRow s
		  
		  Return true // deny request
		End Function
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
