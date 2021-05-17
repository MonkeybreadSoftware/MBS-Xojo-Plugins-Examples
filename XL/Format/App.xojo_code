#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  RegisterLibXL
		  
		  // create new xls file
		  dim book as new XLBookMBS(false)
		  
		  dim font as XLFontMBS = book.AddFont
		  
		  font.name = "Impact"
		  font.size = 36
		  
		  dim format as XLFormatMBS = book.AddFormat
		  
		  format.AlignH = format.AlignHCenter
		  format.setborder format.BorderStyleMediumdashdot
		  format.setBorderColor font.ColorRed // format.ColorRed
		  format.font = font
		  
		  
		  // create sheet
		  dim sheet as XLSheetMBS = book.AddSheet("Custom")
		  
		  // write some values
		  call sheet.WriteString 2, 1, "Hello World", format
		  
		  // set column 1 to width 12
		  call sheet.SetCol 1, 1, 25
		  
		  call sheet.WriteNumber 5,5,11, nil
		  
		  // write file
		  dim file as FolderItem = SpecialFolder.Desktop.Child("Format.xls")
		  
		  if book.Save(file) then
		    file.Launch
		  else
		    MsgBox "Failed to create file."+EndOfLine+EndOfLine+book.ErrorMessage
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
