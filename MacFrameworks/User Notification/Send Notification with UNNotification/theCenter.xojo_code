#tag Class
Protected Class theCenter
Inherits UNUserNotificationCenterMBS
	#tag Event
		Sub addNotificationRequestCompleted(request as UNNotificationRequestMBS, error as NSErrorMBS, tag as variant)
		  #Pragma Unused tag
		  
		  #If XojoVersion >= 2020 Then
		    // API 2.0
		    
		    Var s As String
		    
		    if error<>nil then
		      ' Will wind up here if not signed.
		      s =  error.Domain+" "+error.LocalizedDescription
		    else
		      s = "Message delivered!  Did it display?"
		    end if
		    
		    Window1.statusLabel.Text = s
		    
		    Window1.startTime = System.Ticks
		    Window1.Timer1.RunMode = Timer.RunModes.Multiple
		    
		  #Else
		    
		    // API 1.0
		    
		    Dim s As String
		    
		    If error<>Nil Then
		      ' Will wind up here if not signed.
		      s =  error.Domain+" "+error.LocalizedDescription
		    Else
		      s = "Message delivered!  Did it display?"
		    End If
		    
		    Window1.statusLabel.Text = s
		    
		    Window1.startTime = Ticks
		    Window1.Timer1.mode = Timer.ModeMultiple
		    
		  #EndIf
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub requestAuthorizationCompleted(granted as boolean, error as NSErrorMBS, tag as variant)
		  #Pragma Unused tag
		  
		  #If XojoVersion >= 2020 Then
		    // API 2.0
		    
		    Var s As String
		    
		    if error<>nil then
		      ' We're probably not code-signed
		      s = "Error code "+error.code.ToString+".  Authorization refused.  Are we code-signed?"
		    else
		      s = "Authorized by Notification Center!"
		    end if
		    
		    Window1.statusLabel.Text = s
		    
		  #Else
		    
		    // API 1.0
		    
		    Dim s As String
		    
		    If error<>Nil Then
		      ' We're probably not code-signed
		      s = "Error code " + str(error.code) + ".  Authorization refused.  Are we code-signed?"
		    Else
		      s = "Authorized by Notification Center!"
		    End If
		    
		    Window1.statusLabel.Text = s
		    
		  #EndIf
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub willPresentNotification(notification as UNNotificationMBS, byref options as Integer)
		  
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
