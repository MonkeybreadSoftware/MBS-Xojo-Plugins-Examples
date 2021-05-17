#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  RegisterLibXL
		  
		  // create new xls file
		  dim book as new XLBookMBS(false)
		  
		  dim logofile as FolderItem = FindFile("logo.jpg")
		  dim logoId as integer = book.addPicture(logofile)
		  
		  // fonts
		  
		  dim textFont as XLFontMBS = book.addFont()
		  textFont.size = 8
		  textFont.name = "Century Gothic"
		  
		  dim titleFont as XLFontMBS = book.addFont(textFont)
		  titleFont.size = 38
		  titleFont.ColorValue = XLFontMBS.ColorGray25
		  
		  dim font12 as XLFontMBS = book.addFont(textFont)
		  font12.size = 12
		  
		  dim font10 as XLFontMBS = book.addFont(textFont)
		  font10.size = 10
		  
		  // formats
		  
		  dim textFormat as XLFormatMBS = book.addFormat
		  textFormat.font = textFont
		  textFormat.AlignH = XLFormatMBS.AlignHLeft
		  
		  dim titleFormat as XLFormatMBS = book.addFormat
		  titleFormat.font = titleFont
		  titleFormat.AlignH = XLFormatMBS.AlignHRight
		  
		  dim companyFormat as XLFormatMBS = book.addFormat
		  companyFormat.font = font12
		  
		  dim dateFormat as XLFormatMBS = book.addFormat(textFormat)
		  dateFormat.NumFormat = book.addCustomNumFormat("mmmm\ d\,\ yyyy")
		  
		  dim phoneFormat as XLFormatMBS = book.addFormat(textFormat)
		  phoneFormat.NumFormat = book.addCustomNumFormat("[<=9999999]###\-####;\(###\)\ ###\-####")
		  
		  dim borderFormat as XLFormatMBS = book.addFormat(textFormat)
		  borderFormat.setBorder()
		  borderFormat.setBorderColor(XLFontMBS.ColorGray25)
		  borderFormat.AlignV = XLFormatMBS.AlignVCenter
		  
		  dim percentFormat as XLFormatMBS = book.addFormat(borderFormat)
		  percentFormat.numFormat = book.addCustomNumFormat("#%_)")
		  percentFormat.AlignH = XLFormatMBS.AlignHRight
		  
		  dim textRightFormat as XLFormatMBS = book.addFormat(textFormat)
		  textRightFormat.AlignH = XLFormatMBS.AlignHRight
		  textRightFormat.AlignV = XLFormatMBS.AlignVCenter
		  
		  dim thankFormat as XLFormatMBS = book.addFormat
		  thankFormat.font = font10
		  thankFormat.AlignH = XLFormatMBS.AlignHCenter
		  
		  dim dollarFormat as XLFormatMBS = book.addFormat(borderFormat)
		  dollarFormat.NumFormat = book.addCustomNumFormat("_($* # ##0.00_);_($* (# ##0.00);_($* -??_);_(@_)")
		  dollarFormat.AlignH = XLFormatMBS.AlignHRight
		  
		  // actions
		  
		  dim sheet as XLSheetMBS = book.addSheet("Sales Receipt")
		  
		  sheet.DisplayGridlines = false
		  
		  r sheet.setCol(1, 1, 36)
		  r sheet.setCol(0, 0, 10)
		  r sheet.setCol(2, 4, 11)
		  
		  r sheet.setRow(2, 47.25)
		  r sheet.WriteString(2, 1, "Sales Receipt", titleFormat)
		  r sheet.setMerge(2, 2, 1, 4)
		  sheet.setPicture(2, 1, logoId, 0.2)
		  
		  r sheet.WriteString(4, 0, "Apricot Ltd.", companyFormat)
		  r sheet.WriteString(4, 3, "Date:", textFormat)
		  r sheet.writeFormula(4, 4, "TODAY()", dateFormat)
		  
		  r sheet.WriteString(5, 3, "Receipt #:", textFormat)
		  r sheet.WriteNumber(5, 4, 652, textFormat)
		  
		  r sheet.WriteString(8, 0, "Sold to:", textFormat)
		  r sheet.WriteString(8, 1, "John Smith", textFormat)
		  r sheet.WriteString(9, 1, "Pineapple Ltd.", textFormat)
		  r sheet.WriteString(10, 1, "123 Dreamland Street", textFormat)
		  r sheet.WriteString(11, 1, "Moema, 52674", textFormat)
		  r sheet.WriteNumber(12, 1, 2659872055, phoneFormat)
		  
		  r sheet.WriteString(14, 0, "Item #", textFormat)
		  r sheet.WriteString(14, 1, "Description", textFormat)
		  r sheet.WriteString(14, 2, "Qty", textFormat)
		  r sheet.WriteString(14, 3, "Unit Price", textFormat)
		  r sheet.WriteString(14, 4, "Line Total", textFormat)
		  
		  for row as integer = 15 to 37
		    
		    r sheet.setRow(row, 15)
		    
		    for col as integer = 0 to 2 
		      r sheet.writeBlank(row, col, borderFormat)
		    next
		    r sheet.writeBlank(row, 3, dollarFormat)
		    
		    dim rowString as string = str(row+1)
		    r sheet.writeFormula(row, 4, "IF(C"+rowString+">0;ABS(C"+rowString+ "*D" +rowString+");"""")", dollarFormat)
		  next
		  
		  r sheet.WriteString(38, 3, "Subtotal ", textRightFormat)
		  r sheet.WriteString(39, 3, "Sales Tax ", textRightFormat)
		  r sheet.WriteString(40, 3, "Total ", textRightFormat)
		  r sheet.writeFormula(38, 4, "SUM(E16:E38)", dollarFormat)
		  r sheet.WriteNumber(39, 4, 0.2, percentFormat)
		  r sheet.writeFormula(40, 4, "E39+E39*E40", dollarFormat)
		  r sheet.setRow(38, 15)
		  r sheet.setRow(39, 15)
		  r sheet.setRow(40, 15)
		  
		  r sheet.WriteString(42, 0, "Thank you for your business!", thankFormat)
		  r sheet.setMerge(42, 42, 0, 4)
		  
		  // items
		  
		  r sheet.WriteNumber(15, 0, 45, borderFormat)
		  r sheet.WriteString(15, 1, "Grapes", borderFormat)
		  r sheet.WriteNumber(15, 2, 250, borderFormat)
		  r sheet.WriteNumber(15, 3, 4.5, dollarFormat)
		  
		  r sheet.WriteNumber(16, 0, 12, borderFormat)
		  r sheet.WriteString(16, 1, "Bananas", borderFormat)
		  r sheet.WriteNumber(16, 2, 480, borderFormat)
		  r sheet.WriteNumber(16, 3, 1.4, dollarFormat)
		  
		  r sheet.WriteNumber(17, 0, 19, borderFormat)
		  r sheet.WriteString(17, 1, "Apples", borderFormat)
		  r sheet.WriteNumber(17, 2, 180, borderFormat)
		  r sheet.WriteNumber(17, 3, 2.8, dollarFormat)
		  
		  // write file
		  dim file as FolderItem = SpecialFolder.Desktop.Child("Writing data.xls")
		  
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
		Sub r(b as Boolean)
		  // break on error
		  if b = false then
		    break
		  end if
		  
		  
		End Sub
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
