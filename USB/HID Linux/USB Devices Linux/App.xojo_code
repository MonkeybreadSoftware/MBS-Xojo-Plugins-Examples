#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  if not TargetLinux then
		    MsgBox "This application requires Linux."
		    quit
		  end if
		  
		  // check platform
		  
		  dim s as new Shell
		  
		  s.Execute "uname -m"
		  
		  if s.Result = "x86_64" then
		    MsgBox "The HID class works only on 32 bit linux systems. It will work on 64 bit Linux once REAL Studio creates true 64 bit applications."
		    quit
		  end if
		  
		End Sub
	#tag EndEvent


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
