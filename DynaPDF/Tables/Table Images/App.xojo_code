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
		  dim fileOpened as Boolean = false
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Table images.pdf")
		  
		  call pdf.CreateNewPDF
		  
		  call pdf.SetPageCoords(pdf.kpcTopDown)
		  call pdf.SetResolution(300)
		  
		  dim tbl as DynaPDFTableMBS = pdf.CreateTable(100, 4, 500.0, 125.0)
		  call tbl.SetBorderWidth(-1, -1, 1.0, 1.0, 1.0, 1.0)
		  call tbl.SetCellPadding(-1, -1, 5.0, 5.0, 5.0, 5.0)
		  call tbl.SetGridWidth(1.0, 1.0)
		  call tbl.SetFlags(-1, -1, tbl.ktfUseImageCS)
		  
		  dim imageFolder as FolderItem = SpecialFolder.Pictures
		  dim Images() as FolderItem
		  dim c as integer = imageFolder.Count
		  for i as integer = 1 to c
		    dim file as FolderItem = imageFolder.TrueItem(i)
		    
		    if file<>nil and not file.Directory then
		      dim n4 as string = Right(file.Name,4)
		      if n4 = ".jpg" or n4 = ".png" or n4 = ".gif" or n4 = ".tif" then
		        images.insert 0,file
		      end if
		    end if
		  next
		  
		  if UBound(images) < 0 then
		    MsgBox "Maybe you change code to load images from a folder where you have some images?"
		    quit
		  end if
		  
		  dim rowNum as integer
		  rowNum = tbl.AddRow(125.0)
		  
		  dim imageFile as FolderItem = images.pop
		  dim fullSize as int64 = imageFile.Length
		  dim i as integer = 0
		  call tbl.SetCellImage(rowNum, i, true, tbl.kcoCenter, tbl.kcoCenter, 0.0, 0.0, imageFile.UnixpathMBS, 1)
		  i = i + 1
		  
		  while UBound(images)>=0
		    
		    if i = 4 then
		      rowNum = tbl.AddRow(100.0)
		      i = 0
		    end if
		    
		    imageFile = images.pop
		    fullSize = fullsize + imageFile.Length
		    
		    // This check is not required here but if you add many or very large images then the maximum size should be restricted
		    if (fullSize > 3145728000) then
		      break // 3 GB (The maximum size of a PDF file is 4 GB)
		    end if
		    
		    call tbl.SetCellImage(rowNum, i, true, tbl.kcoCenter, tbl.kcoCenter, 0.0, 0.0, imageFile.UnixpathMBS, 1)
		    i = i + 1
		  wend
		  
		  // The test directory contains just a few images. This code is only meaningful if you use a directory with more than 100 MB images...
		  if (fullSize > 104857600) then // 100 MB
		    
		    if pdf.HaveOpenDoc then
		      
		      // OK, now we can open the output file.
		      if not pdf.OpenOutputFile(f) then
		        MsgBox "Can't open output PDF file."
		        quit
		      end if
		      fileOpened = true
		    end if
		  end if
		  
		  call pdf.Append
		  
		  call tbl.DrawTable(50.0, 50.0, 742.0)
		  while tbl.HaveMore 
		    
		    call pdf.EndPage
		    if (fullSize > 104857600)  then
		      call pdf.FlushPages(pdf.kfpfDefault)
		    end if
		    
		    call pdf.Append
		    call tbl.DrawTable(50.0, 50.0, 742.0)
		  wend
		  call pdf.EndPage
		  
		  // We draw the same table again but this time with the flag tfScaleToRect
		  call tbl.SetFlags(-1, -1, BitwiseOr(tbl.ktfScaleToRect, tbl.ktfUseImageCS))
		  call pdf.Append
		  
		  call pdf.SetFont("Arial", pdf.kfsRegular, 12.0, true, pdf.kcp1252)
		  call pdf.WriteText(50.0, 50.0, "The same table but the flag tfScaleToRect was set.")
		  
		  call tbl.DrawTable(50.0, 65.0, 742.0)
		  while tbl.HaveMore
		    call pdf.EndPage
		    if (fullSize > 104857600) then
		      call pdf.FlushPages(pdf.kfpfDefault)
		    end if
		    call pdf.Append
		    call tbl.DrawTable(50.0, 50.0, 742.0)
		  wend
		  
		  call pdf.EndPage
		  
		  
		  
		  // A table stores errors and warnings in the error log
		  dim err as DynaPDFErrorMBS
		  
		  dim count as integer = pdf.GetErrLogMessageCount-1
		  for i = 0 to count
		    
		    err = pdf.GetErrLogMessage(i)
		    MsgBox err.Message
		  next
		  
		  
		  // No fatal error occurred?
		  if pdf.HaveOpenDoc then
		    if not fileOpened then
		      
		      
		      // OK, now we can open the output file.
		      if not pdf.OpenOutputFile(f) then
		        MsgBox "Failed to create output pdf file."
		        quit
		      end if
		    end if
		  end if
		  
		  call pdf.CloseFile
		  
		  f.launch
		  
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
