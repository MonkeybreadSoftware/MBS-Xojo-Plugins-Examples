#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  if MyClient.available = false then
		    MsgBox "Please run on Linux with avahi installed."
		    quit
		  end if
		  
		  client = new MyClient
		  Browser = new MyBrowser(client)
		  
		  call Browser.Browse(Browser.kInterfaceAny, Browser.kProtocolAny, "_http._tcp")
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		Browser As MyBrowser
	#tag EndProperty

	#tag Property, Flags = &h0
		Client As MyClient
	#tag EndProperty

	#tag Property, Flags = &h0
		Resolvers() As MyResolver
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
