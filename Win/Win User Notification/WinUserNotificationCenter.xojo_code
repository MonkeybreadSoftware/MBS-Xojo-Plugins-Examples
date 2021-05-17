#tag Class
Protected Class WinUserNotificationCenter
Inherits WinUserNotificationCenterMBS
	#tag Event
		Sub Activated(Notification as WinUserNotificationMBS)
		  list.AddRow "Activated."
		End Sub
	#tag EndEvent

	#tag Event
		Sub Dismissed(Notification as WinUserNotificationMBS, Reason as Integer)
		  dim r as string
		  Select case reason
		  case me.DismissalReasonApplicationHidden
		    r = "Application Hidden"
		  case me.DismissalReasonTimedOut
		    r = "Time Out"
		  case me.DismissalReasonUserCanceled
		    r = "User Cancelled"
		  else
		    r = str(reason)
		  end Select
		  
		  list.AddRow "Dismissed: "+r
		End Sub
	#tag EndEvent

	#tag Event
		Sub Failed(Notification as WinUserNotificationMBS, ErrorCode as Integer)
		  list.AddRow "Failed: "+str(ErrorCode)
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		list As listbox
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
