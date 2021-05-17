#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  if not ABPersonViewMBS.available then
		    MsgBox "Please try with Mac OS X 10.7 Lion"
		  end if
		  
		  // get addressbook up and running
		  a = ABAddressBookMBS.addressBook
		  
		  // not using shared instance, but our own instance as requires for person viewer
		  
		  window1.show
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  MsgBox Introspection.GetType(error).fullname+": "+error.Message+EndOfLine+EndOfLine+Join(error.Stack, EndOfLine)
		  
		  Return true
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		a As ABAddressBookMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		n As NSExceptionMBS
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
