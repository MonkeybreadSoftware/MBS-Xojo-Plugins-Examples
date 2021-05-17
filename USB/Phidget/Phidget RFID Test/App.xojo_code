#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  if TargetMachO then
		    
		    dim f as FolderItem = FrameworksFolderMBS(-32765).Child("Phidget21.framework")
		    
		    if LoadPhidgetFrameworkMBS(f) then
		      MsgBox "Framework loaded"
		    else
		      MsgBox "Failed to load framework"
		    end if
		    
		  elseif TargetWin32 then
		    
		    if LoadPhidgetWindowsDLLMBS("phidget21.dll") then
		      MsgBox "Library loaded"
		    else
		      MsgBox "Failed to load library"
		    end if
		    
		  elseif TargetLinux then
		    
		    if LoadPhidgetLinuxLibraryMBS("phidget21.so") then
		      MsgBox "Library loaded"
		    else
		      MsgBox "Failed to load library"
		    end if
		    
		  end if
		  
		  
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
