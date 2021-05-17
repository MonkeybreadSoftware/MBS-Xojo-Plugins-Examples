#tag Class
Protected Class App
Inherits Application
	#tag Event
		Function CancelClose() As Boolean
		  /////////////////////////////////////////////////////////////////////////////////////////////
		  // It's important that you force the application to terminate, otherwise RS winds things down
		  // and informs the OS that you don't want WindowRestoration to work!!!!
		  //
		  // However please note that this will BREAK your application as no Cancel Close or Close events
		  // will be sent to any windows!
		  //
		  // So if you wish to do anything before the application terminates, now is the time.
		  // Realisitically you should do some verification before you terminate the application to make
		  // sure that your app is behaving the way the user expects... But I'll leave that all up to you
		  // to figure out.
		  /////////////////////////////////////////////////////////////////////////////////////////////
		  
		  Dim nsa as NSApplicationMBS = app.NSApplicationMBS
		  nsa.terminate
		End Function
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub constructor()
		  /////////////////////////////////////////////////////////////////////////////////////////////
		  // It's important that the delegate is initiated here or else you don't get half the events.
		  /////////////////////////////////////////////////////////////////////////////////////////////
		  
		  system.DebugLog currentMEthodName+" ///////////////////////////////// INITATED"
		  
		  mag = new appDelegate
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mag As appDelegate
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
