#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  test "Comic Sans MS"
		  test "Zapfino"
		  test "Symbol"
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Test(name as string)
		  dim font as CTFontMBS = CTFontMBS.CreateWithName(name)
		  
		  if font = nil then
		    MsgBox "Failed to find font."
		  else
		    dim f as new FontWindow
		    f.run font
		  end if
		  
		End Sub
	#tag EndMethod


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
