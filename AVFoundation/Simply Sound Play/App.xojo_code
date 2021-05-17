#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  
		  // pick some movie
		  dim f as FolderItem = SpecialFolder.Desktop.Child("test.m4a")
		  
		  if f.Exists = false then
		    MsgBox "Please change code to point to a valid movie/audio file."
		    quit
		  end if
		  
		  dim e as NSErrorMBS
		  p = new AVAudioPlayerMBS(f, e)
		  
		  if e<>nil then
		    MsgBox e.LocalizedDescription
		    quit
		  end if
		  p.enableRate = True
		  
		  if p.play then
		    // ok
		  else
		    MsgBox "Failed to play!"
		  end if
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		p As AVAudioPlayerMBS
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
