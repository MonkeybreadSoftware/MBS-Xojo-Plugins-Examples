#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  if not m.Available then
		    MsgBox "This functionality needs Mac OS X 10.6."
		    quit
		  end if
		  
		  m = new MyNSEventMonitor
		  
		  call m.addLocalMonitorForEventsMatchingMask(NSEventMBS.NSAnyEventMask)
		  
		  call m.addGlobalMonitorForEventsMatchingMask(NSEventMBS.NSAnyEventMask)
		  
		  window1.List.AddRow "Trusted: "+str(AccessibilityMBS.IsProcessTrusted)
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		m As MyNSEventMonitor
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
