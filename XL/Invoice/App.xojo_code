#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  RegisterLibXL
		  
		  // create invoice
		  
		  dim book as new XLBookMBS(false)
		  
		  dim boldFont as XLFontMBS
		  dim titleFont as XLFontMBS
		  dim titleFormat as XLFormatMBS
		  dim headerFormat as XLFormatMBS
		  dim descriptionFormat as XLFormatMBS
		  dim amountFormat as XLFormatMBS
		  dim totalLabelFormat as XLFormatMBS
		  dim totalFormat as XLFormatMBS
		  dim signatureFormat as XLFormatMBS
		  dim sheet as XLSheetMBS
		  
		  boldFont = book.AddFont
		  boldFont.Bold = true
		  
		  titleFont = book.AddFont
		  titleFont.Name = "Arial Black"
		  titleFont.Size = 16
		  
		  titleFormat = book.AddFormat
		  titleFormat.font = titleFont
		  
		  headerFormat = book.AddFormat
		  headerFormat.AlignH = XLFormatMBS.AlignHCenter
		  headerFormat.SetBorder XLFormatMBS.BorderStyleThin
		  headerFormat.Font = boldFont
		  headerFormat.Fillpattern = XLFormatMBS.FillPatternSolid
		  headerFormat.PatternForegroundColor = XLFontMBS.ColorTan
		  
		  descriptionFormat = book.AddFormat
		  descriptionFormat.BorderLeft = XLFormatMBS.BorderStyleThin
		  
		  amountFormat = book.AddFormat
		  amountFormat.numFormat = XLFormatMBS.NumformatCurrencyNegbra
		  amountFormat.BorderLeft = XLFormatMBS.BorderStyleThin
		  amountFormat.BorderRight = XLFormatMBS.BorderStyleThin
		  
		  totalLabelFormat = book.AddFormat
		  totalLabelFormat.BorderTop = XLFormatMBS.BorderStyleThin
		  totalLabelFormat.AlignH = XLFormatMBS.AlignHRight
		  totalLabelFormat.font = boldFont
		  
		  totalFormat = book.AddFormat
		  totalFormat.numFormat = XLFormatMBS.NumformatCurrencyNegbra
		  totalFormat.SetBorder XLFormatMBS.BorderStyleThin
		  totalFormat.Font = boldFont
		  totalFormat.FillPattern = XLFormatMBS.FillPatternSolid
		  totalFormat.PatternForegroundColor = XLFontMBS.ColorYellow
		  
		  signatureFormat = book.AddFormat
		  signatureFormat.AlignH = XLFormatMBS.AlignHCenter
		  signatureFormat.BorderTop = XLFormatMBS.BorderStyleThin
		  
		  sheet = book.AddSheet("Invoice")
		  
		  call sheet.WriteString(2, 1, "Invoice No. 3568", titleFormat)
		  
		  call sheet.WriteString(4, 1, "Name: John Smith")
		  call sheet.WriteString(5, 1, "Address: San Ramon, CA 94583 USA")
		  
		  call sheet.WriteString(7, 1, "Description", headerFormat)
		  call sheet.WriteString(7, 2, "Amount", headerFormat)
		  
		  call sheet.WriteString(8, 1, "Ball-Point Pens", descriptionFormat)
		  call sheet.WriteNumber( 8, 2, 85, amountFormat)
		  call sheet.WriteString(9, 1, "T-Shirts", descriptionFormat)
		  call sheet.WriteNumber( 9, 2, 150, amountFormat)
		  call sheet.WriteString(10, 1, "Tea cups", descriptionFormat)
		  call sheet.WriteNumber( 10, 2, 45, amountFormat)
		  
		  call sheet.WriteString(11, 1, "Total:", totalLabelFormat)
		  call sheet.WriteNumber( 11, 2, 280, totalFormat)
		  
		  call sheet.WriteString(14, 2, "Signature", signatureFormat)
		  
		  call sheet.SetCol(1, 1, 40)
		  call sheet.SetCol(2, 2, 15)
		  
		  
		  
		  // write file
		  dim file as FolderItem = SpecialFolder.Desktop.Child("invoice.xls")
		  
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
