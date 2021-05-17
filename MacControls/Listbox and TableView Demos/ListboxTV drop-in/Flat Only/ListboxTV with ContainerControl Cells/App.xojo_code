#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  #if false // this is useful for debugging issues with incorrect cell placement:
		    
		    // Inject FScript into this App's menu
		    // (you need to place FScript.framework into /Library/Frameworks - and make sure it's one that supports 32 bit if you debug your Xojo app in that architecture)
		    dim f as FolderItem = SpecialFolder.Library.Child("Frameworks").Child("FScript.framework")
		    declare function NSClassFromString lib "Cocoa" (name as CFStringRef) as Ptr
		    declare function bundleWithPath lib "Cocoa" selector "bundleWithPath:" (cls as Ptr, path as CFStringRef) as Ptr
		    declare function load lib "Cocoa" selector "load" (obj as Ptr) as Boolean
		    dim path as String
		    #if RBVersion >= 2013 then
		      path = f.NativePath
		    #else
		      path = f.ShellPath
		    #endif
		    dim bndl as ptr = bundleWithPath (NSClassFromString ("NSBundle"), path)
		    if bndl = nil or not load(bndl) then
		      break
		    else
		      declare sub insertInMainMenu lib "Cocoa" selector "insertInMainMenu" (cls as Ptr)
		      insertInMainMenu (NSClassFromString ("FScriptMenuItem"))
		    end if
		    
		  #endif
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
