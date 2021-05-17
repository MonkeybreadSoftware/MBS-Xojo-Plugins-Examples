#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  if not TargetCocoa then
		    MsgBox "This example requires Cocoa target."
		    quit
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"Effacer", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"Effacer"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Effacer"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"Quitter", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Quitter"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
