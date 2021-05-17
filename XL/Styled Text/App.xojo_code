#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  RegisterLibXL
		  
		  // create new xls file
		  dim book as new XLBookMBS(false)
		  
		  // create sheet
		  Dim sheet As XLSheetMBS = book.AddSheet("StyledText")
		  
		  // write some values
		  // first build some styled text and pass it to WriteStyledText function
		  // but you probably pass directly from textarea
		  
		  Dim st As New StyledText
		  Dim row As Integer = 2
		  Dim col As Integer = 0
		  
		  st.Text = "Red Text blue"
		  st.TextColor(0, 8) = &cFF0000
		  st.TextColor(9, 4) = &c0000FF
		  st.Size(0,4) = 15
		  
		  Call sheet.WriteStyledText row, col, st
		  
		  row = 3
		  st = New StyledText
		  st.Text = "Hello World from Xojo"
		  st.Italic(0,11) = True
		  st.Bold(0,11) = True
		  st.Underline(0,11) = True
		  st.Font(0,11) = "Calibri"
		  st.Bold(12,10) = True
		  
		  Call sheet.WriteStyledText  row, col, st
		  
		  // write file
		  Dim file As FolderItem = SpecialFolder.Desktop.Child("StyledText.xls")
		  
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
