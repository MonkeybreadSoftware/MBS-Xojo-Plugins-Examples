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
		  
		  dim i as integer = 0
		  dim pageCount as integer = 0
		  dim rowNum as integer = 0
		  
		  call pdf.CreateNewPDF
		  call pdf.SetPageCoords(pdf.kpcTopDown)
		  
		  dim tbl as DynaPDFTableMBS = pdf.CreateTable(3, 3, 500.0, 100.0)
		  call tbl.SetBorderWidth(-1, -1, 1.0, 1.0, 1.0, 1.0)
		  call tbl.SetGridWidth( 1.0, 1.0)
		  
		  // -1.0 means use the default row height as specified in the CreateTable() call.
		  rowNum = tbl.AddRow(-1.0)
		  
		  dim text as string = "The cell alignment can be set for text, images, and templates..."
		  
		  call tbl.SetCellText rowNum, 0, pdf.ktaLeft,   tbl.kcoTop, text
		  call tbl.SetCellText rowNum, 1, pdf.ktaCenter, tbl.kcoTop, text
		  call tbl.SetCellText rowNum, 2, pdf.ktaRight,  tbl.kcoTop, text
		  
		  rowNum = tbl.AddRow(-1.0)
		  call tbl.SetCellText rowNum, 0, pdf.ktaLeft,   tbl.kcoCenter, text
		  call tbl.SetCellText rowNum, 1, pdf.ktaCenter, tbl.kcoCenter, text
		  call tbl.SetCellText rowNum, 2, pdf.ktaRight,  tbl.kcoCenter, text
		  
		  rowNum = tbl.AddRow(-1.0)
		  call tbl.SetCellText rowNum, 0, pdf.ktaLeft,   tbl.kcoBottom, text
		  call tbl.SetCellText rowNum, 1, pdf.ktaCenter, tbl.kcoBottom, text
		  call tbl.SetCellText rowNum, 2, pdf.ktaRight,  tbl.kcoBottom, text
		  
		  // Draw the table now
		  call pdf.Append
		  call tbl.DrawTable(50.0, 50.0, 742.0)
		  while tbl.HaveMore
		    call pdf.EndPage
		    call pdf.Append
		    call tbl.DrawTable(50.0, 50.0, 742.0)
		  wend
		  call pdf.EndPage
		  
		  
		  // Let's change the cell orientation to see what happens...
		  call tbl.SetCellOrientation(-1, -1, 90)
		  call pdf.Append
		  call pdf.SetFont("Arial", pdf.kfsRegular, 12.0, true, pdf.kcp1252)
		  call pdf.WriteText(50.0, 50.0, "The same table but the cell orientation was changed to 90 degrees.")
		  
		  call tbl.DrawTable(50.0, 65.0, 742.0)
		  while tbl.HaveMore
		    call pdf.EndPage
		    call pdf.Append
		    call tbl.DrawTable(50.0, 50.0, 737.0)
		  wend
		  call pdf.EndPage
		  
		  
		  // A table stores errors and warnings in the error log
		  dim err as DynaPDFErrorMBS
		  
		  pageCount = pdf.GetErrLogMessageCount
		  for i = 0 to pageCount-1
		    err = pdf.GetErrLogMessage(i)
		    MsgBox err.Message
		  next
		  
		  // No fatal error occurred?
		  if pdf.HaveOpenDoc then
		    // We write the output file into the current directory.
		    // OK, now we can open the output file.
		    dim f as FolderItem = SpecialFolder.Desktop.Child("Table Text.pdf")
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
