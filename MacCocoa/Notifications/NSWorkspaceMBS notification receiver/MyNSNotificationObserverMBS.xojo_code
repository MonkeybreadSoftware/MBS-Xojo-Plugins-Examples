#tag Class
Protected Class MyNSNotificationObserverMBS
Inherits NSNotificationObserverMBS
	#tag Event
		Sub GotNotification(notification as NSNotificationMBS)
		  dim l as listbox = window1.List
		  
		  dim d as Dictionary = Notification.userInfo
		  dim n as string = Notification.name
		  
		  if d<>Nil then
		    l.InsertFolder 0, n
		    l.CellTag(l.LastIndex,0)=d
		  else
		    l.InsertRow 0, n
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
