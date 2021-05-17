#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub NewDocument()
		  dim f as FolderItem
		  
		  #if DebugBuild then
		    f = SpecialFolder.Desktop.Child("test.mov")
		  #endif
		  
		  if f = nil or not f.Exists then
		    
		    f = GetOpenFolderitem("")
		  end if
		  
		  
		  if f <> nil then
		    
		    OpenDocument f
		  end if
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub OpenDocument(item As FolderItem)
		  dim w as new PlayerWindow
		  dim m as new MyMFPMediaPlayerMBS(item.URLPath, true, w.output)
		  
		  w.MediaPlayer = m
		  
		  
		  
		  Exception re as MFPMediaPlayerExceptionMBS
		    
		    if w <> nil then
		      w.close
		    end if
		    
		    
		    
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  MsgBox Introspection.GetType(error).name+EndOfLine+EndOfLine+Hex(error.ErrorNumber)+" "+error.Message
		  
		  return true
		End Function
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
