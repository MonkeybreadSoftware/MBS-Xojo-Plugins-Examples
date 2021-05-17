#tag Class
Protected Class App
Inherits Application
	#tag Note, Name = Plugins
		
		for this example you need the following plugins:
		
		MBS Xojo Cocoa Plugin.xojo_plugin
		MBS Xojo CocoaBase Plugin.xojo_plugin
		MBS Xojo Lion Plugin.xojo_plugin
		MBS Xojo Mac64bit Plugin.xojo_plugin
		MBS Xojo Main Plugin.xojo_plugin
		MBS Xojo SnowLeopard Plugin.xojo_plugin
		
		
	#tag EndNote


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
