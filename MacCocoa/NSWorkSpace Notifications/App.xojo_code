#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // get notification center
		  w = new NSWorkspaceMBS
		  c = w.notificationCenter
		  n = new NSWorkSpaceNotifications
		  
		  // register all events
		  c.addObserver n, NSWorkspaceMBS.NSWorkspaceActiveSpaceDidChangeNotification
		  c.addObserver n, NSWorkspaceMBS.NSWorkspaceDidActivateApplicationNotification
		  c.addObserver n, NSWorkspaceMBS.NSWorkspaceDidChangeFileLabelsNotification
		  c.addObserver n, NSWorkspaceMBS.NSWorkspaceDidDeactivateApplicationNotification
		  c.addObserver n, NSWorkspaceMBS.NSWorkspaceDidHideApplicationNotification
		  c.addObserver n, NSWorkspaceMBS.NSWorkspaceDidLaunchApplicationNotification
		  c.addObserver n, NSWorkspaceMBS.NSWorkspaceDidMountNotification
		  c.addObserver n, NSWorkspaceMBS.NSWorkspaceDidPerformFileOperationNotification
		  c.addObserver n, NSWorkspaceMBS.NSWorkspaceDidRenameVolumeNotification
		  c.addObserver n, NSWorkspaceMBS.NSWorkspaceDidTerminateApplicationNotification
		  c.addObserver n, NSWorkspaceMBS.NSWorkspaceDidUnhideApplicationNotification
		  c.addObserver n, NSWorkspaceMBS.NSWorkspaceDidUnmountNotification
		  c.addObserver n, NSWorkspaceMBS.NSWorkspaceDidWakeNotification
		  c.addObserver n, NSWorkspaceMBS.NSWorkspaceScreensDidSleepNotification
		  c.addObserver n, NSWorkspaceMBS.NSWorkspaceScreensDidWakeNotification
		  c.addObserver n, NSWorkspaceMBS.NSWorkspaceSessionDidBecomeActiveNotification
		  c.addObserver n, NSWorkspaceMBS.NSWorkspaceSessionDidResignActiveNotification
		  c.addObserver n, NSWorkspaceMBS.NSWorkspaceWillLaunchApplicationNotification
		  c.addObserver n, NSWorkspaceMBS.NSWorkspaceWillPowerOffNotification
		  c.addObserver n, NSWorkspaceMBS.NSWorkspaceWillSleepNotification
		  c.addObserver n, NSWorkspaceMBS.NSWorkspaceWillUnmountNotification
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		c As NSNotificationCenterMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		n As NSWorkSpaceNotifications
	#tag EndProperty

	#tag Property, Flags = &h0
		w As NSWorkspaceMBS
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
