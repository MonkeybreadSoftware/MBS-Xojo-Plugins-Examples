#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  RegisterLibXL
		  
		  // new book in xml format
		  dim book as new XLBookMBS(true)
		  
		  // add sheet
		  dim sheet as XLSheetMBS = book.addSheet("my")
		  
		  call sheet.WriteString(2, 1, "Country")
		  call sheet.WriteString(2, 2, "Road injures")
		  call sheet.WriteString(2, 3, "Smoking")
		  call sheet.WriteString(2, 4, "Suicide")
		  
		  call sheet.WriteString(3, 1, "USA")     
		  call sheet.WriteString(4, 1, "UK")
		  call sheet.WriteNumber(3, 2, 64)         
		  call sheet.WriteNumber(4, 2, 94)
		  call sheet.WriteNumber(3, 3, 69)         
		  call sheet.WriteNumber(4, 3, 55)
		  call sheet.WriteNumber(3, 4, 49)         
		  call sheet.WriteNumber(4, 4, 64)
		  
		  call sheet.WriteString(5, 1, "Germany") 
		  call sheet.WriteString(6, 1, "Switzerland")
		  call sheet.WriteNumber(5, 2, 88)         
		  call sheet.WriteNumber(6, 2, 93)
		  call sheet.WriteNumber(5, 3, 46)         
		  call sheet.WriteNumber(6, 3, 54)
		  call sheet.WriteNumber(5, 4, 55)         
		  call sheet.WriteNumber(6, 4, 50)
		  
		  call sheet.WriteString(7, 1, "Spain")   
		  call sheet.WriteString(8, 1, "Italy")
		  call sheet.WriteNumber(7, 2, 86)         
		  call sheet.WriteNumber(8, 2, 75)
		  call sheet.WriteNumber(7, 3, 47)         
		  call sheet.WriteNumber(8, 3, 52)
		  call sheet.WriteNumber(7, 4, 69)         
		  call sheet.WriteNumber(8, 4, 71)
		  
		  call sheet.WriteString(9, 1, "Greece")  
		  call sheet.WriteString(10, 1, "Japan")
		  call sheet.WriteNumber(9, 2, 67)         
		  call sheet.WriteNumber(10, 2, 91)
		  call sheet.WriteNumber(9, 3, 23)         
		  call sheet.WriteNumber(10, 3, 57)
		  call sheet.WriteNumber(9, 4, 87)         
		  call sheet.WriteNumber(10, 4, 36)
		  
		  dim autoFilter as XLAutoFilterMBS = sheet.autoFilter()
		  autoFilter.setRef(2, 10, 1, 4)
		  
		  // shows 3 countries with the safest roads
		  
		  Dim column as XLFilterColumnMBS = autoFilter.Column(1)
		  column.setTop10(3)
		  
		  sheet.applyFilter()
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("autofilter.xlsx")
		  if book.save(f) then
		    f.Launch
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
