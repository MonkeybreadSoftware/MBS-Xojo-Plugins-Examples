#tag Class
Protected Class MyGrowlApplicationBridgeMBS
Inherits GrowlApplicationBridgeMBS
	#tag Event
		Function applicationNameForGrowl() As string
		  MainWindow.List.AddRow CurrentMethodName
		  
		  Return "TestApp"
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub growlIsReady()
		  MainWindow.List.AddRow CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub growlNotificationTimedOut(clickContext as variant)
		  MainWindow.List.AddRow CurrentMethodName+": "+clickContext.StringValue 
		End Sub
	#tag EndEvent

	#tag Event
		Sub growlNotificationWasClicked(clickContext as variant)
		  MainWindow.List.AddRow CurrentMethodName+": "+clickContext.StringValue 
		End Sub
	#tag EndEvent

	#tag Event
		Function hasNetworkClientEntitlement() As boolean
		  MainWindow.List.AddRow CurrentMethodName
		  Return false
		  
		End Function
	#tag EndEvent

	#tag Event
		Function registrationDictionaryForGrowl() As dictionary
		  MainWindow.List.AddRow CurrentMethodName
		  
		  dim regDic as new Dictionary
		  
		  regdic.Value(GrowlApplicationBridgeMBS.kApplicationName) = "TestApp"
		  
		  dim notifications() as string = array("Test Notification", "Test Notification Sticky")
		  
		  regdic.Value(GrowlApplicationBridgeMBS.kNotificationsAll) = Notifications
		  regdic.Value(GrowlApplicationBridgeMBS.kNotificationsDefault) = Notifications
		  
		  Return regdic
		  
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
