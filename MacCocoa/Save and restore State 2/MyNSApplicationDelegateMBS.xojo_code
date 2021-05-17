#tag Class
Protected Class MyNSApplicationDelegateMBS
Inherits NSApplicationDelegateMBS
	#tag Event
		Sub applicationDidBecomeActive(Notification as NSNotificationMBS)
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub applicationDidDecodeRestorableState(coder as NSCoderMBS)
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub applicationDidFinishLaunching(Notification as NSNotificationMBS)
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub applicationDidHide(Notification as NSNotificationMBS)
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub applicationDidUnhide(Notification as NSNotificationMBS)
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub applicationWillBecomeActive(Notification as NSNotificationMBS)
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub applicationWillEncodeRestorableState(coder as NSCoderMBS)
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub applicationWillTerminate(Notification as NSNotificationMBS)
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub applicationWillUnhide(Notification as NSNotificationMBS)
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function restoreWindowWithIdentifier(identifier as string, state as NSCoderMBS, byref resultWindow as variant, byref error as NSErrorMBS) As boolean
		  System.DebugLog CurrentMethodName
		  System.DebugLog identifier
		  
		  Return false
		  
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
