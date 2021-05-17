#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  'Register MBS plugins here.
		  
		  
		  #If XojoVersion >= 2020 Then
		    
		    // API 2.0
		    
		    'Code signing is required to use UNUserNotificationCenter, unlike with NSNotifications
		    'Add a signing build script to run in the debugger.  Otherwise just see the error messages :-)
		    
		    if SystemInformationMBS.isMojave then
		      myNotificationCenter = new theCenter
		      
		      if myNotificationCenter<>nil then
		        myNotificationCenter.requestAuthorization(7)
		        Window1.Show
		      else
		        MessageBox "Notification Center not found.  So this is an exercise in futility."
		        Quit
		      end if
		      
		    else
		      // in a real project you might continue to use NSNotifications if you get here.
		      //NSNotification was deprecated in Mojave.
		      MessageBox "This example will run on macOS 10.15.x 'Mojave' or greater."
		      Quit
		    end if
		    
		    Exception 
		      MessageBox "Something went wrong.  Who  knows?"
		      Quit
		      
		      
		      
		  #Else
		    
		    // API 1.0
		    
		    'Code signing is required to use UNUserNotificationCenter, unlike with NSNotifications
		    'Add a signing build script to run in the debugger.  Otherwise just see the error messages :-)
		    
		    If SystemInformationMBS.isMojave Then
		      myNotificationCenter = New theCenter
		      
		      If myNotificationCenter<>Nil Then
		        myNotificationCenter.requestAuthorization(7)
		        Window1.Show
		      Else
		        MsgBox "Notification Center not found.  So this is an exercise in futility."
		        Quit
		      End If
		      
		    Else
		      // in a real project you might continue to use NSNotifications if you get here.
		      //NSNotification was deprecated in Mojave.
		      msgbox "This example will run on macOS 10.15.x 'Mojave' or greater."
		      Quit
		    End If
		    
		    Exception 
		      MsgBox "Something went wrong.  Who  knows?"
		      Quit
		      
		      
		  #EndIf
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		myNotificationCenter As theCenter
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
