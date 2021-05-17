#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // make sure we don't end up with Internet Explorer in version 7, which is default.
		  Dim v As Integer = IEWebBrowserMBS.GetInternetExplorerVersion
		  
		  If v < 11000 Then // below version 11.0
		    
		    Dim b As Boolean = IEWebBrowserMBS.SetInternetExplorerVersion(11000) 
		    If b Then
		      MsgBox "Requested Internet Explorer version 11.0."
		    Else
		      MsgBox "Failed to set IE version?"
		    End If
		  End If
		  
		  
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
