#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Run
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Run()
		  dim pdf as new MyDynaPDFMBS
		  
		  call pdf.CreateNewPDF
		  call pdf.SetPageCoords(pdf.kpcTopDown)
		  
		  dim tbl as DynaPDFTableMBS = pdf.CreateTable(100, 5, 500.0, 10.0)
		  call tbl.SetBorderWidth(-1, -1, 1.0, 1.0, 1.0, 1.0)
		  call tbl.SetGridWidth( 0.1, 0.1)
		  
		  
		  
		  // get all fonts
		  dim fonts() as DynaPDFSysFontMBS = pdf.GetSysFontInfos
		  
		  'dim fonts() as DynaPDFSysFontMBS
		  'dim font as DynaPDFSysFontMBS = pdf.GetSysFontInfo
		  'while font <> nil
		  'fonts.Append font
		  'font = font.NextFont
		  'wend
		  
		  // make header row
		  dim rowNum as integer = tbl.AddRow(15.0)
		  
		  call tbl.SetCellText rowNum, 0, pdf.ktaLeft, tbl.kcoTop, "Family Name"
		  call tbl.SetCellText rowNum, 1, pdf.ktaLeft, tbl.kcoTop, "Full Name"
		  call tbl.SetCellText rowNum, 2, pdf.ktaLeft, tbl.kcoTop, "PostScript Name"
		  call tbl.SetCellText rowNum, 3, pdf.ktaLeft, tbl.kcoTop, "Style"
		  call tbl.SetCellText rowNum, 4, pdf.ktaLeft, tbl.kcoTop, "Sample Text"
		  
		  // add one row for each font
		  for each f as DynaPDFSysFontMBS in fonts
		    rowNum = tbl.AddRow(-1.0)
		    
		    dim styles() as string
		    if BitwiseAnd(f.Style, pdf.kfsItalic) <> 0 then
		      Styles.Append "Italic"
		    end if
		    if BitwiseAnd(f.Style, pdf.kfsUnderlined) <> 0 then
		      Styles.Append "Underlined"
		    end if
		    if BitwiseAnd(f.Style, pdf.kfsStriked) <> 0 then
		      Styles.Append "Striked"
		    end if
		    if BitwiseAnd(f.Style, pdf.kfsVerticalMode) <> 0 then
		      Styles.Append "VerticalMode"
		    end if
		    
		    // Width class
		    dim n as integer = BitwiseAnd(f.Style, &hFF00) 
		    Select case n
		    case pdf.kfsUltraCondensed
		      Styles.Append "UltraCondensed"
		    case pdf.kfsExtraCondensed
		      Styles.Append "ExtraCondensed"
		    case pdf.kfsCondensed
		      Styles.Append "Condensed"
		    case pdf.kfsSemiCondensed
		      Styles.Append "SemiCondensed"
		    case pdf.kfsNormal
		      Styles.Append "Normal"
		    case pdf.kfsUltraCondensed
		      Styles.Append "UltraCondensed"
		    case pdf.kfsSemiExpanded
		      Styles.Append "SemiExpanded"
		    case pdf.kfsExpanded
		      Styles.Append "Expanded"
		    case pdf.kfsExtraExpanded
		      Styles.Append "ExtraExpanded"
		    case pdf.kfsUltraExpanded
		      Styles.Append "UltraExpanded"
		    case 0
		      // nothing
		    else
		      break
		    end Select
		    
		    
		    // Weight class
		    n = BitwiseAnd(f.Style, &hFFF00000)
		    Select case n
		    case pdf.kfsThin
		      Styles.Append "Thin"
		    case pdf.kfsExtraLight
		      Styles.Append "ExtraLight"
		    case pdf.kfsLight
		      Styles.Append "Light"
		    case pdf.kfsRegular
		      Styles.Append "Regular"
		    case pdf.kfsMedium
		      Styles.Append "Medium"
		    case pdf.kfsDemiBold
		      Styles.Append "DemiBold"
		    case pdf.kfsBold
		      Styles.Append "Bold"
		    case pdf.kfsExtraBold
		      Styles.Append "ExtraBold"
		    case pdf.kfsBlack
		      Styles.Append "Black"
		    case pdf.kfsUltraBlack
		      Styles.Append "UltraBlack"
		    case 0
		      // nothing
		    else
		      break
		    end Select
		    
		    
		    dim familyName     as string = f.FamilyName
		    dim FullName       as string = f.FullName
		    dim PostScriptName as string = f.PostScriptName
		    dim Style          as string = join(styles, ", ")
		    
		    call tbl.SetCellText rowNum, 0, pdf.ktaLeft, tbl.kcoTop, FamilyName
		    call tbl.SetCellText rowNum, 1, pdf.ktaLeft, tbl.kcoTop, FullName
		    call tbl.SetCellText rowNum, 2, pdf.ktaLeft, tbl.kcoTop, PostScriptName
		    call tbl.SetCellText rowNum, 3, pdf.ktaLeft, tbl.kcoTop, Style
		    call tbl.SetCellText rowNum, 4, pdf.ktaLeft, tbl.kcoTop, "ABC abc 123 ß€ä"
		    
		    call tbl.SetFont(rowNum, 4, familyName, f.Style, true, pdf.kcpUnicode)
		    
		  next
		  
		  // set font size for all
		  call tbl.SetFontSize(-1, -1, 10) 
		  
		  // set flags for first row to make header row
		  call tbl.SetFlags(0, -1, tbl.ktfHeaderRow)
		  call tbl.SetFont(0, -1, "Helvetica", pdf.kfsBold, true, pdf.kcpUnicode)
		  
		  
		  // Draw the table now
		  call pdf.Append
		  call tbl.DrawTable(50.0, 50.0, 742.0)
		  while tbl.HaveMore
		    call pdf.EndPage
		    call pdf.Append
		    call tbl.DrawTable(50.0, 50.0, 742.0)
		  wend
		  call pdf.EndPage
		  
		  
		  
		  
		  // A table stores errors and warnings in the error log
		  
		  // write error file
		  dim ErrorCount as integer = pdf.GetErrLogMessageCount
		  if ErrorCount > 0 then
		    dim f as FolderItem = SpecialFolder.Desktop.Child("test.txt")
		    dim t as TextOutputStream = TextOutputStream.Create(f)
		    
		    for i as integer = 0 to ErrorCount-1
		      dim err as DynaPDFErrorMBS = pdf.GetErrLogMessage(i)
		      
		      t.WriteLine "Message: "+err.Message
		      t.WriteLine "ObjNum: "+str(err.ObjNum)
		      t.WriteLine "Offset: "+str(err.Offset)
		      t.WriteLine "SrcFile: "+err.SrcFile
		      t.WriteLine "SrcLine: "+str(err.SrcLine)
		      t.WriteLine ""
		    next
		  end if
		  
		  // No fatal error occurred?
		  if pdf.HaveOpenDoc then
		    // We write the output file into the current directory.
		    // OK, now we can open the output file.
		    dim f as FolderItem = SpecialFolder.Desktop.Child("Table with Fonts.pdf")
		    if not pdf.OpenOutputFile(f) then
		      MsgBox "Failed to open output file!"
		    end if
		    call pdf.CloseFile
		    
		    f.launch
		  end if
		  
		  
		  
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
