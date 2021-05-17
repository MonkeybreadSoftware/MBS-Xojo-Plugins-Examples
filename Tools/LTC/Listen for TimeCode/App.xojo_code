#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  
		  
		  // we keep library here:
		  
		  // https://www.monkeybreadsoftware.de/xojo/download/plugin/Libs/
		  
		  
		  Dim f As FolderItem
		  
		  #If TargetMacOS Then
		    // MacOS
		    f = GetFolderItem("libltc.mac.dylib")
		  #ElseIf TargetWin32 Then
		    
		    // Windows
		    #If Target64Bit Then
		      f = GetFolderItem("libltcWin64.dll")
		    #Else
		      f = GetFolderItem("libltcWin32.dll")
		    #EndIf
		    
		  #Else
		    // Linux
		    f = GetFolderItem("libltc.so")
		  #EndIf
		  
		  If LTCMBS.LoadLibrary(f) Then
		    // okay
		  Else
		    MsgBox LTCMBS.LibraryLoadErrorMessage
		    
		    Quit
		  End If
		  
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
