#tag Class
Protected Class MyNSNotificationObserverMBS
Inherits NSNotificationObserverMBS
	#tag Event
		Sub GotNotification(notification as NSNotificationMBS)
		  if Notification.name=NSFileHandleMBS.NSFileHandleReadToEndOfFileCompletionNotification then
		    dim userinfo as Dictionary = Notification.userInfo
		    dim s as string = userinfo.Value(NSFileHandleMBS.NSFileHandleNotificationDataItem)
		    
		    window1.gt=nil
		    
		    MsgBox str(lenb(s))+" bytes read."
		    
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
