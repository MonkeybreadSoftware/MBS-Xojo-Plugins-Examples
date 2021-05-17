#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  RegisterLibXL
		  
		  
		  '#pragma DisableBackgroundTasks
		  
		  const maxRow = 20000 // max 65535
		  const maxCol = 255 // max 255
		  
		  
		  r = new random
		  
		  dim t as integer = ticks
		  
		  dim book as new XLBookMBS
		  dim sheet as XLSheetMBS = book.AddSheet("Strings")
		  
		  for row as integer = 1 to maxRow
		    for col as integer = 0 to maxcol 
		      call sheet.WriteString row, col, "Hello"
		    next
		  next
		  
		  sheet = book.AddSheet("Numbers")
		  
		  for row as integer = 1 to maxRow
		    for col as integer = 0 to maxcol
		      call sheet.WriteNumber row, col, row+col
		    next
		  next
		  
		  dim file as FolderItem = SpecialFolder.Desktop.Child("performance.xls")
		  call book.Save(file)
		  
		  t = ticks-t
		  
		  MsgBox "Finished after "+Format(t/60.0,"0.0")+" seconds."
		  
		  
		  file.Launch
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


	#tag Property, Flags = &h0
		r As random
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
