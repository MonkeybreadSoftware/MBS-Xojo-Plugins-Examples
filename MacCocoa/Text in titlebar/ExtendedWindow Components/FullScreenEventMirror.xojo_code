#tag Class
Protected Class FullScreenEventMirror
Inherits NSWindowDelegateMBS
	#tag Event
		Sub windowDidFailToEnterFullScreen(win as NSWindowMBS)
		  //raise the DidFailToEnterFullScreen event and handle it inside the ExtendedWindow class
		  RaiseEvent DidFailToEnterFullScreen
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowDidFailToExitFullScreen(win as NSWindowMBS)
		  //raise the DidFailToExitFullScreen event and handle it inside the ExtendedWindow class
		  RaiseEvent DidFailToExitFullScreen
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowWillEnterFullScreen(notification as NSNotificationMBS)
		  //raise the WillEnterFullScreen event and handle it inside the ExtendedWindow class
		  RaiseEvent WillEnterFullScreen
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowWillExitFullScreen(notification as NSNotificationMBS)
		  //raise the WillExitFullScreen event and handle it inside the ExtendedWindow class
		  RaiseEvent WillExitFullScreen
		End Sub
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event DidFailToEnterFullScreen()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidFailToExitFullScreen()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event WillEnterFullScreen()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event WillExitFullScreen()
	#tag EndHook


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
