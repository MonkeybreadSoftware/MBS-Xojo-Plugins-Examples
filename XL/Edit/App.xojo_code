#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  RegisterLibXL
		  
		  // create new xls file
		  dim book as new XLBookMBS(false)
		  
		  // load existing
		  dim file as FolderItem = SpecialFolder.Desktop.Child("Format.xls")
		  if file.Exists = false then
		    MsgBox "Please run Format project first."
		    quit
		  end if
		  
		  if not book.Load(file) then
		    MsgBox "Failed to read file: "+book.ErrorMessage
		    quit
		  end if
		  
		  MsgBox str(book.SheetCount)+" sheets"
		  
		  // do some changes
		  dim sheet as XLSheetMBS = book.Sheet(0)
		  if sheet<>Nil then
		    
		    // read number
		    dim d as Double = sheet.ReadNumber(5,5)
		    
		    // write modified number
		    call sheet.WriteNumber 5, 5, d*2
		    
		    // and some text
		    call sheet.WriteString 6, 6, "new string"
		    
		    
		  end if
		  
		  // write file
		  
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
