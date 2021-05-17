#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  RegisterLibXL
		  
		  // create new xls file
		  dim book as new XLBookMBS(false)
		  
		  // create formats
		  dim F(6) as integer
		  dim Formats(6) as XLFormatMBS
		  
		  f(0) = book.AddCustomNumFormat( "0.0")
		  f(1) = book.AddCustomNumFormat( "0.00")
		  f(2) = book.AddCustomNumFormat( "0.000")
		  f(3) = book.AddCustomNumFormat( "0.0000")
		  f(4) = book.AddCustomNumFormat( "#,###.00 $")
		  f(5) = book.AddCustomNumFormat( "#,###.00 $[Black][<1000];#,###.00 $[Red][>=1000]")
		  
		  for i as integer = 0 to 5
		    formats(i) = Book.AddFormat
		    Formats(i).NumFormat = f(i)
		  next
		  
		  // create sheet
		  dim sheet as XLSheetMBS = book.AddSheet("Custom Number Formats")
		  
		  // write some values
		  call sheet.SetCol(0, 0, 20)
		  
		  call sheet.WriteNumber( 2, 0, 25.718, formats(0))
		  call sheet.WriteNumber( 3, 0, 25.718, formats(1))
		  call sheet.WriteNumber( 4, 0, 25.718, formats(2))
		  call sheet.WriteNumber( 5, 0, 25.718, formats(3))
		  
		  call sheet.WriteNumber( 7, 0, 1800.5, formats(4))
		  
		  call sheet.WriteNumber( 9, 0,  500.0, formats(5))
		  call sheet.WriteNumber(10, 0, 1600.0, formats(5))
		  
		  
		  // write file
		  dim file as FolderItem = SpecialFolder.Desktop.Child("Custom Number Formats.xls")
		  
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
