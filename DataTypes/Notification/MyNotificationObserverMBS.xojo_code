#tag Class
Protected Class MyNotificationObserverMBS
Inherits NotificationObserverMBS
	#tag Event
		Sub ReceivedNotification(name as string, ref as variant, tag as variant, notification as NotificationMBS)
		  dim list as Listbox = window3.List
		  
		  List.AddRow "Notification received."
		  List.AddRow "   Name: "+name
		  List.AddRow "   tag: "+tag.StringValue
		  
		  Exception i as IllegalCastException
		    // ignore if stringvalue method fails
		    
		    
		    
		    
		    
		    
		    
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
