#tag Class
Protected Class myWinNotificationMBS
Inherits WinNotificationMBS
	#tag Event
		Sub GotNotification(Message as Integer, Name as string, Value1 as Integer, Value2 as Integer, byref Result as Integer, byref Handled as boolean)
		  window1.Listbox1.AddRow "got notification"
		  
		  // try things twice
		  window1.show
		  call RemoteControlMBS.WinBringWindowToTop window1.Handle
		  window1.show
		  call RemoteControlMBS.WinBringWindowToTop window1.Handle
		  
		  
		  
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
