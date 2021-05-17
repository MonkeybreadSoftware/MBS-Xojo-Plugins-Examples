#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  RegisterLibXL
		  
		  // create new xls file
		  dim book as new XLBookMBS(false)
		  
		  // load template
		  call book.Load(FindFile("Template.xls"))
		  dim sheet as XLSheetMBS = book.Sheet(0)
		  
		  // create sheet
		  'dim sheet as XLSheetMBS = book.AddSheet("Sheet1")
		  
		  // Write Customer address
		  call sheet.WriteString 5, 1, "Smith & Co"
		  call sheet.WriteString 6, 1, "First Avenue 123"
		  call sheet.WriteString 7, 1, "12345 New York"
		  call sheet.WriteString 9, 1, "Bob Smith"
		  
		  // Write Header
		  call sheet.WriteString 13, 2, "123-456"
		  call sheet.WriteString 13, 3, "789-123"
		  call sheet.WriteString 13, 4, "UPS"
		  
		  // Write items
		  dim sum as Double = 0
		  
		  call sheet.WriteNumber 18, 0, 1
		  call sheet.WriteString 18, 1, "Box of Apples"
		  call sheet.WriteNumber 18, 5, 19.95
		  call sheet.WriteNumber 18, 6, 19.95*1
		  
		  sum = sum + 19.95
		  
		  call sheet.WriteNumber 19, 0, 5
		  call sheet.WriteString 19, 1, "Box of Peaches"
		  call sheet.WriteNumber 19, 5, 24.95
		  call sheet.WriteNumber 19, 6, 24.95*5
		  
		  sum = sum + 24.95*5
		  
		  // Write Sum
		  
		  call sheet.WriteNumber 29, 6, sum
		  call sheet.WriteNumber 30, 6, 9.99
		  sum = sum + 9.99
		  call sheet.WriteNumber 31, 6, sum
		  
		  // Write bank account
		  call sheet.WriteString 34, 2, "Smith & Co"
		  call sheet.WriteString 35, 2, "123456789"
		  
		  // Write Footer
		  call sheet.WriteString 42, 0, "Smith & Co"
		  call sheet.WriteString 43, 0, "First Avenue 12344, LA 12345 New York"
		  call sheet.WriteString 44, 0, "Phone 123-456-789-0, Fax 123-456-789-1, email@test.invalid, www.test.invalid"
		  
		  // write file
		  dim file as FolderItem = SpecialFolder.Desktop.Child("Invoice with Template.xls")
		  
		  if book.Save(file) then
		    file.Launch
		  else
		    MsgBox "Failed to create file."+EndOfLine+EndOfLine+book.ErrorMessage
		  end if
		  
		  quit
		  
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
