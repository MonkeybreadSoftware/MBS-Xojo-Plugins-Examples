#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Close()
		  If myMutex <> Nil Then
		    // cleanup
		    myMutex.Leave
		  End If
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  'RegisterPlugins
		  
		  // somewhere at app launch
		  
		  // Please change name of mutex and name of notification!
		  
		  myMutex = New Mutex("MyGreatApp")
		  myNotification = new myWinNotificationMBS
		  
		  If myMutex.TryEnter Then
		    Window1.Listbox1.AddRow "First instance."
		    
		    // listen for notification
		    call myNotification.ListenForMessage "MyGreatAppNotification"
		    
		    
		  else
		    Window1.Listbox1.AddRow "Second instance."
		    
		    // send notification to first instance
		    call myNotification.SendMessage "MyGreatAppNotification"
		    
		    quit
		  End If
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		myMutex As Mutex
	#tag EndProperty

	#tag Property, Flags = &h0
		myNotification As myWinNotificationMBS
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&L\xC3\xB6schen", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&L\xC3\xB6schen"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&L\xC3\xB6schen"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"Beenden", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Beenden"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
