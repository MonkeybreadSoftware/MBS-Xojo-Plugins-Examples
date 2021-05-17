#tag Class
Protected Class MyNSApplicationDelegateMBS
Inherits NSApplicationDelegateMBS
	#tag Event
		Sub applicationDidFinishLaunching(Notification as NSNotificationMBS)
		  System.DebugLog CurrentMethodName
		  Notification.Print
		  
		  dim userInfo as Dictionary = Notification.userInfo
		  dim key as string = NSApplicationMBS.NSApplicationLaunchUserNotificationKey
		  
		  if userInfo.HasKey(key) then
		    
		    dim UserNotification as NSUserNotificationMBS = userInfo.Lookup(key, nil)
		    
		    if UserNotification <> nil then
		      MsgBox "Notification clicked with title: "+UserNotification.title+" and text: "+UserNotification.informativeText
		    else
		      MsgBox "no notification?"
		    end if
		  end if
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
