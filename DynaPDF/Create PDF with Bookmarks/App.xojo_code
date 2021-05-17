#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with Bookmarks.pdf")
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF f
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  
		  // for all this bookmarks.
		  // Apple Preview does not zoom as requested
		  // But Adobe Reader does zoom as requested.
		  
		  dim x, y as Double
		  dim font, lnk, act, bmk, root as integer
		  
		  call pdf.SetPageHeight(500.0)
		  call pdf.SetPageWidth(800.0)
		  
		  call pdf.Append
		  font = pdf.SetFont("Helvetica", pdf.kfsRegular, 20, false, pdf.kcp1252)
		  call pdf.WriteText(50, 50, "Bookmark destination type dtFit")
		  root = pdf.AddBookmark("DestType dtFit", -1, 1, true)
		  call pdf.SetBookmarkDest(root, pdf.kdtFit, 0, 0, 0, 0)
		  call pdf.SetBookmarkStyle(root, pdf.kfsItalic, pdf.kPDF_RED)
		  call pdf.EndPage
		  
		  call pdf.Append
		  call pdf.ChangeFont(font)
		  call pdf.WriteText(50, 50, "Bookmark destination type dtXY_Zoom")
		  call pdf.WriteText(50, 70, "Zoom factor 3, Top position 50 (TopDown coordinates)")
		  bmk = pdf.AddBookmark("DestType: dtXY_Zoom, zoom factor 3", root, 2, false)
		  call pdf.SetBookmarkDest(bmk, pdf.kdtXY_Zoom, 50, 50, 3, 0)
		  call pdf.SetBookmarkStyle(bmk, pdf.kfsBold, pdf.kPDF_MAROON)
		  call pdf.EndPage
		  
		  call pdf.Append
		  call pdf.ChangeFont(font)
		  call pdf.WriteText(50, 50, "Bookmark destination type dtXY_Zoom")
		  call pdf.WriteText(50, 70, "Zoom factor 0.5, Top position 50 (TopDown coordinates)")
		  bmk = pdf.AddBookmark("DestType: dtXY_Zoom, zoom factor 0.5", root, 3, false)
		  call pdf.SetBookmarkDest(bmk, pdf.kdtXY_Zoom, 50, 50, 0.5, 0)
		  call pdf.SetBookmarkStyle(bmk, BitwiseOr(pdf.kfsBold, pdf.kfsItalic), pdf.kPDF_GREEN)
		  call pdf.EndPage
		  
		  call pdf.Append
		  call pdf.ChangeFont(font)
		  call pdf.WriteText(50, 50, "Bookmark destination type dtXY_Zoom")
		  call pdf.WriteText(50, 70, "Zoom factor not defined (unchanged), Top position 50 (TopDown coordinates)")
		  bmk = pdf.AddBookmark("DestType: dtXY_Zoom, zoom factor unchanged", root, 4, false)
		  call pdf.SetBookmarkDest(bmk, pdf.kdtXY_Zoom, 50, 50, 0, 0)
		  call pdf.SetBookmarkStyle(bmk, pdf.kfsRegular, pdf.kPDF_BLUE)
		  call pdf.EndPage
		  
		  call pdf.Append
		  call pdf.ChangeFont(font)
		  call pdf.WriteText(50, 50, "Bookmark destination type dtFitH_Top")
		  call pdf.WriteText(50, 70, "Top position 50 (TopDown coordinates)")
		  bmk = pdf.AddBookmark("DestType: dtFitH_Top (50)", root, 5, false)
		  call pdf.SetBookmarkDest(bmk, pdf.kdtFitH_Top, 50, 0, 0, 0)
		  call pdf.SetBookmarkStyle(bmk, pdf.kfsRegular, &h00FF8080)
		  call pdf.WriteText(50, 200, "Bookmark destination type dtFitH_Top")
		  call pdf.WriteText(50, 220, "Top position 200 (TopDown coordinates)")
		  bmk = pdf.AddBookmark("DestType dtFitH_Top (200)", root, 5, false)
		  call pdf.SetBookmarkDest(bmk, pdf.kdtFitH_Top, 200, 0, 0, 0)
		  call pdf.SetBookmarkStyle(bmk, pdf.kfsRegular, &h00C08080)
		  call pdf.EndPage
		  
		  call pdf.Append
		  call pdf.ChangeFont(font)
		  call pdf.WriteText(200, 50, "Bookmark destination type dtFitV_Left")
		  call pdf.WriteText(200, 70, "Left position 200. FitV has no effect if the width of the page")
		  call pdf.WriteText(200, 90, "is not greater as the height.")
		  bmk = pdf.AddBookmark("DestType: dtFitV_Left (200)", root, 6, false)
		  call pdf.SetBookmarkDest(bmk, pdf.kdtFitV_Left, 200, 0, 0, 0)
		  call pdf.SetBookmarkStyle(bmk, pdf.kfsRegular, &h00808FFF)
		  call pdf.EndPage
		  
		  call pdf.Append
		  call pdf.ChangeFont(font)
		  call pdf.WriteText(50, 50, "Bookmark destination type dtFit_Rect")
		  x = (pdf.GetPageWidth  -90.0) / 2.0
		  y = (pdf.GetPageHeight -65.0) / 2.0
		  
		  call pdf.WriteFTextEx(x, y, 90.0, -1, pdf.ktaCenter, "We zoom into the rectangle")
		  call pdf.Rectangle(x, y, 90.0, 65.0, pdf.kfmStroke)
		  
		  // We place a page link with a GoTo action on this position. The link zooms into the rectangle in the same way as the bookmark.
		  call pdf.SetLinkHighlightMode(pdf.khmInvert)
		  lnk = pdf.PageLink(x, y, 90, 65, 7)
		  act = pdf.CreateGoToAction(pdf.kdtFit_Rect, 7, x - 5.0, y - 5.0, x + 100.0, y + 70.0)
		  call pdf.AddActionToObj(pdf.kotPageLink, pdf.koeOnMouseUp, act, lnk)
		  
		  bmk = pdf.AddBookmark("DestType: dtFit_Rect", -1, 7, false)
		  // The page link uses the same destination as the bookmark should use. So we add the action to the bookmark instead
		  // of a bookmark destination. This saves just a little bit disk space.
		  call pdf.AddActionToObj(pdf.kotBookmark, pdf.koeOnMouseUp, act, bmk)
		  call pdf.SetBookmarkStyle(bmk, pdf.kfsRegular, &h000080FF)
		  call pdf.EndPage
		  
		  call pdf.SetPageFormat(pdf.kpfDIN_A4)
		  call pdf.Append
		  call pdf.ChangeFont(font)
		  call pdf.WriteFTextEx(50.0, 50.0, pdf.GetPageWidth - 100.0, -1.0, pdf.ktaLeft, "Destination type dtFit. This variant scales the page so that both sides fit into the viewer window.")
		  call pdf.EndPage
		  
		  root = pdf.AddBookmark("DestType dtFit", -1, 8, false)
		  call pdf.SetBookmarkDest(root, pdf.kdtFit, 0, 0, 0, 0)
		  
		  bmk  = pdf.AddBookmark("DestType: dtXY_Zoom, zoom factor 3", root, 2, false)
		  call pdf.SetBookmarkDest(bmk, pdf.kdtXY_Zoom, 50, 50, 3, 0)
		  call pdf.SetBookmarkStyle(bmk, pdf.kfsBold, pdf.kPDF_MAROON)
		  
		  
		  call pdf.SetPageLayout(pdf.kplOneColumn)
		  
		  
		  call pdf.CloseFile
		  
		  f.Launch
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddHighlightAnnot(pdf as DynaPDFMBS, Type as Integer, ColorValue as UInt32, x as Double, y as Double, Text as string, subject as string, comment as string)
		  dim w as Double = pdf.GetTextWidth(text)
		  
		  call pdf.WriteText x, y, text
		  call pdf.HighlightAnnot(type, x, y + pdf.GetDescent, w, 20.0, ColorValue, "Test app", Subject, Comment)
		  
		  
		End Sub
	#tag EndMethod

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


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
