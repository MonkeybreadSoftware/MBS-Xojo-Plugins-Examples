#tag Class
Protected Class MyNSUserNotificationCenterDelegateMBS
Inherits NSUserNotificationCenterDelegateMBS
	#tag Event
		Sub didActivateNotification(center as NSUserNotificationCenterMBS, notification as NSUserNotificationMBS)
		  dim a as integer = notification.activationType
		  dim m as string
		  
		  Select case a
		  case notification.NSUserNotificationActivationTypeNone
		  case notification.NSUserNotificationActivationTypeContentsClicked
		    m = " with click on contents"
		  case notification.NSUserNotificationActivationTypeActionButtonClicked
		    m = " with click on action button"
		    
		  end Select
		  
		  MainWindow.listbox1.AddRow "Activate: "+notification.Title+m
		End Sub
	#tag EndEvent

	#tag Event
		Sub didDeliverNotification(center as NSUserNotificationCenterMBS, notification as NSUserNotificationMBS)
		  MainWindow.listbox1.AddRow "Deliver: "+notification.Title
		End Sub
	#tag EndEvent

	#tag Event
		Function shouldPresentNotification(center as NSUserNotificationCenterMBS, notification as NSUserNotificationMBS) As boolean
		  MainWindow.listbox1.AddRow "Should present: "+notification.Title
		  
		  Return true
		  
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
