#tag Class
Protected Class MyMenuObserver
Inherits NSNotificationObserverMBS
	#tag Event
		Sub GotNotification(notification as NSNotificationMBS)
		  dim u as Dictionary = notification.userInfo
		  dim m as NSMenuMBS = notification.objectVariant
		  dim index as integer = u.Lookup("NSMenuItemIndex", -1)
		  
		  if index>=0 then
		    dim n as NSMenuItemMBS = m.Item(index)
		    
		    System.DebugLog n.title
		    
		    if n.title = "test" then
		      n.image = app.img
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
