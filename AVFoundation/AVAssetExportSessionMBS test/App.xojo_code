#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  if AVAssetExportSessionMBS.available = false then
		    MsgBox "Please run on Mac OS X 10.7 or newer."
		    quit
		  end if
		  
		  // select a video
		  dim file as FolderItem = GetOpenFolderItem("")
		  if file = nil then quit
		  
		  f = new MyAVFoudationMBS
		  
		  dim a as AVAssetMBS = AVAssetMBS.assetWithFile(file)
		  
		  if a = nil then
		    MsgBox "This is not a video/audio file."
		    quit
		  end if
		  
		  SettingsWindow.a = a
		  SettingsWindow.show
		  
		  AutoQuit = true
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		f As MyAVFoudationMBS
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
