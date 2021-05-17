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
		Sub Run()
		  dim pdf as new MyDynaPDFMBS
		  
		  call pdf.SetPageCoords(pdf.kpcTopDown)
		  call pdf.CreateNewPDF
		  
		  call pdf.SetImportFlags2(pdf.kif2UseProxy) // Reduce the memory usage
		  
		  dim importFile as FolderItem = findFile("dynapdf_help.pdf")
		  dim outputFile as FolderItem = SpecialFolder.Desktop.Child("Table Templates.pdf")
		  
		  call pdf.OpenImportFile(importFile)
		  
		  dim pageCount as integer = pdf.GetInPageCount
		  dim rowNum as integer = 0
		  
		  dim tbl as DynaPDFTableMBS = pdf.CreateTable(pageCount / 4 + 1, 2, 512.12, 0.0)
		  call tbl.SetBorderWidth(-1, -1, 1.0, 1.0, 1.0, 1.0)
		  call tbl.SetCellPadding(-1, -1, 5.0, 5.0, 5.0, 5.0)
		  call tbl.SetGridWidth(1.0, 1.0)
		  call tbl.SetFlags(-1, -1, tbl.ktfScaleToRect)
		  
		  call pdf.SetPageFormat(pdf.kpfUS_Letter)
		  
		  for i as integer = 1 to pageCount
		    
		    dim tmpl as integer = pdf.ImportPage(i)
		    if BitwiseAnd(i,1) = 1 then
		      rowNum = tbl.AddRow(335.0)
		    end if
		    
		    call tbl.SetCellTemplate(rowNum, bitwiseAnd((i-1), 1), true, tbl.kcoCenter, tbl.kcoCenter, tmpl, 0.0, 0.0)
		  next
		  
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
		  
		  pageCount = pdf.GetErrLogMessageCount
		  for i as integer = 0 to pagecount-1
		    dim err as DynaPDFErrorMBS = pdf.GetErrLogMessage(i)
		    MsgBox err.Message
		  next
		  
		  // No fatal error occurred?
		  if pdf.HaveOpenDoc then
		    
		    
		    // OK, now we can open the output file.
		    if not pdf.OpenOutputFile(outputFile) then
		      MsgBox "Failed to create PDF file."
		      quit
		    end if
		  end if
		  
		  call pdf.CloseFile
		  OutputFile.launch
		  
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
