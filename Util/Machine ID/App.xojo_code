#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  pref.init
		  
		  
		  dim r as CheckMachineResult = Pref.CheckMachineID
		  Select case r
		  case CheckMachineResult.Accepted
		    // okay
		  case CheckMachineResult.NewMachine
		    MsgBox "This is a new computer. Please enter license key again."
		    
		    // when new computer, ask customer for license key or activation
		    // than reset table with pref.ResetMachineID
		    // and call pref.CheckMachineID again
		    
		  case CheckMachineResult.Error 
		    // "Database error?"
		  case CheckMachineResult.FirstLaunch
		    MsgBox "Welcome to my great app!"
		  end Select
		  
		  
		  dim n as integer = pref.value("LaunchCounter")
		  pref.Value("LaunchCounter") = n + 1
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent


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
