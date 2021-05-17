#tag Class
Protected Class MyNSApplicationDelegateMBS
Inherits NSApplicationDelegateMBS
	#tag Event
		Sub applicationDidFailToRegisterForRemoteNotificationsWithError(error as NSErrorMBS)
		  MainWindow.List.AddRow "Failed to register for remote notifications: "+error.localizedDescription
		End Sub
	#tag EndEvent

	#tag Event
		Sub applicationDidFinishLaunching(Notification as NSNotificationMBS)
		  dim userinfo as Dictionary = Notification.userInfo
		  
		  'Notification.print
		  
		  dim d as Dictionary = userinfo.Lookup(NSApplicationMBS.NSApplicationLaunchRemoteNotificationKey ,nil)
		  
		  if d<>nil then
		    dim s as string
		    dim badge as string
		    
		    if d<>Nil then
		      s = d.Lookup("alert", "?")
		      badge = d.Lookup("badge", "?")
		    end if
		    
		    MainWindow.List.AddRow "Received Notification for Launch: """+s+""" and badge "+badge
		    
		  else
		    MainWindow.List.AddRow "Launched."
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub applicationDidReceiveRemoteNotification(userInfo as Dictionary)
		  dim d as Dictionary = userInfo.Lookup("aps", nil)
		  dim s as string
		  dim badge as string
		  
		  if d<>Nil then
		    s = d.Lookup("alert", "?")
		    badge = d.Lookup("badge", "?")
		  end if
		  
		  MainWindow.List.AddRow "Received Notification """+s+""" and badge "+badge
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub applicationDidRegisterForRemoteNotificationsWithDeviceToken(deviceToken as memoryblock)
		  MainWindow.List.AddRow "Registered for Remote Notifications: "+EncodeHex(deviceToken)
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
