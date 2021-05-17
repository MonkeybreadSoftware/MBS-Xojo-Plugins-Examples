#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Close()
		  #if TargetWin32 then
		    
		    if Sparkle <> nil then
		      dim Sparkle as MyWinSparkleMBS = app.Sparkle
		      Sparkle.Cleanup
		    end if
		    
		  #endif
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  InitWinSparkle
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitWinSparkle()
		  #if TargetWin32
		    
		    dim f as FolderItem
		    #if Target64Bit then
		      f = FindFile("WinSparkle64.dll")
		    #else
		      f = FindFile("WinSparkle32.dll")
		    #endif
		    
		    if WinSparkleMBS.LoadLibrary(f) then
		      
		      dim s as new MyWinSparkleMBS
		      
		      s.CompanyName = "Test Inc."
		      s.AppName     = "Test App"
		      s.AppVersion  = "1.2"
		      s.AppCastURL  = "https://www.monkeybreadsoftware.de/UpdaterTest/win.xml"
		      log "AppCastURL: "+s.AppCastURL
		      
		      // for details on feed format, check:
		      // https://github.com/vslavik/winsparkle/wiki/Appcast-Feeds
		      
		      s.Initialize
		      
		      self.Sparkle = s
		      
		      log "Initialized"
		      
		    else
		      MsgBox "Failed to load Sparkle DLL."
		    end if
		    
		  #else
		    
		    Return
		    
		  #endif
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Shared Sparkle As Variant
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
