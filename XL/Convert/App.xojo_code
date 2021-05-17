#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // Converts from XLS to XLSX or back.
		  
		  
		  // demo version will not do conversion...
		  RegisterLibXL
		  
		  // open xls file
		  dim book1 as new XLBookMBS(false)
		  
		  // load existing
		  dim file as FolderItem = SpecialFolder.Desktop.Child("test.xls")
		  if file.Exists = false then
		    MsgBox "Missing test.xls file on desktop."
		    quit
		  end if
		  
		  if not book1.Load(file) then
		    MsgBox "Failed to read file: "+book1.ErrorMessage
		    quit
		  end if
		  
		  
		  
		  // reate xlsx file
		  dim book2 as new XLBookMBS(true)
		  
		  dim options as new XLCopyOptionsMBS
		  
		  options.CopyFormat = false
		  
		  book1.CopyContent book2, options
		  
		  
		  // write file
		  
		  dim destfile as FolderItem = SpecialFolder.Desktop.Child("output.xlsx")
		  if book2.Save(destfile) then
		    destfile.Launch
		  else
		    MsgBox "Failed to create file."+EndOfLine+EndOfLine+book2.ErrorMessage
		  end if
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub RegisterLibXL()
		  
		  // once you bought a LibXL license, you can put your license key here
		  
		  // see order links on our website
		  // http://www.monkeybreadsoftware.de/xojo/plugin-xls.shtml
		  
		  
		  #if TargetMacOS then
		    
		    XLBookMBS.SetKeyGlobal "your name", "your Mac LibXL license key"
		    
		  #elseif TargetWin32 then
		    
		    XLBookMBS.SetKeyGlobal "your name", "your Windows LibXL license key"
		    
		  #elseif TargetLinux then
		    
		    XLBookMBS.SetKeyGlobal "your name", "your Linux LibXL license key"
		    
		  #endif
		  
		End Sub
	#tag EndMethod


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
