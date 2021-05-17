#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim u as string = str(getuid)
		  dim e as string = str(geteuid)
		  dim p as string = str(getpid)
		  dim s as string = "Hello world! uid = "+u+", euid = "+e+", pid = "+p
		  
		  System.log System.LogLevelWarning,  s
		  
		  
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag ExternalMethod, Flags = &h0
		Declare Function geteuid Lib "libc.dylib" () As integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function getpid Lib "libc.dylib" () As integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function getuid Lib "libc.dylib" () As integer
	#tag EndExternalMethod


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
