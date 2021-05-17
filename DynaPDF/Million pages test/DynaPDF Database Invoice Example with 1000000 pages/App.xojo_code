#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  ' Register DynaPDF
		  
		  InitCustomer
		  InitArticles
		  
		  CreateInvoices
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CreateInvoices()
		  const NUM_PAGES = 1000000
		  
		  // With one million pages, expect a 1.2 GB file
		  
		  dim r as new random
		  dim pdf as new DynaPDFMBS
		  dim ofile as FolderItem = SpecialFolder.Desktop.Child("PDF with "+str(NUM_PAGES)+" pages.pdf")
		  dim ifile as FolderItem = FindFile("test_leer.pdf")
		  
		  
		  
		  
		  call pdf.CreateNewPDF(ofile)
		  
		  
		  
		  call pdf.SetImportFlags( BitwiseOR(pdf.kifImportAll, pdf.kifImportAsPage))
		  
		  call pdf.OpenImportFile(ifile, pdf.kptOpen, "")
		  
		  dim tmpl as integer = pdf.ImportPage(1)
		  
		  call pdf.CloseImportFile
		  
		  for i as integer = 1 to NUM_PAGES
		    
		    call pdf.Append
		    // Place letter paper
		    call pdf.PlaceTemplateEx(tmpl, 0.0, 0.0, 0.0, 0.0)
		    
		    // fill invoice with data:
		    
		    dim idx as integer = r.InRange(0,UBound(Customers)) // random customer
		    
		    FillPage(PDF, Customers(idx))
		    
		    // write page number
		    call pdf.SetFont("Arial", pdf.kfsRegular, 8.0, true, pdf.kcp1252)
		    call pdf.WriteText(466.0, 681.5, str(i)+" of "+str(NUM_PAGES))
		    call pdf.EndPage
		    
		    if i mod 1000 = 0 then
		      // write PDF data to file regularly so you don't run out of memory!
		      call pdf.FlushPages(pdf.kfpfDefault)
		    end if
		  next
		  
		  call pdf.CloseFile
		  
		  ofile.Launch(true)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DrawPath(pdf as dynapdfmbs, x as double, y as double, clipmode as integer, drawdirection as integer, colorvalue as integer)
		  // some fancy art
		  
		  call pdf.SaveGraphicState
		  call pdf.SetFillColor(0)
		  call pdf.SetFillColor(ColorValue)
		  call pdf.Triangle(x+100, y+50, x+150, y+150, x+50, y+150, pdf.kfmFill)
		  call pdf.SetDrawDirection(drawdirection)
		  call pdf.Triangle(x+100, y+180, x+50, y+80, x+150, y+80, pdf.kfmFill)
		  call pdf.RestoreGraphicState
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillPage(pdf as DynaPDFMBS, record as Customer)
		  dim sum as Double = 0.0
		  dim tax as Double = 0.0
		  dim x as double = 56.0
		  dim y as double = 664.0
		  
		  
		  
		  call pdf.SetFont("Arial", pdf.kfsRegular, 10.0, true, pdf.kcp1252)
		  
		  // Company name, possibly with multiple lines
		  call pdf.WriteFTextEx(x, y, 200.0, -1.0, pdf.ktaLeft, Record.Company)
		  
		  // Below the recipient 
		  y = pdf.GetLastTextPosY - 10.0
		  call pdf.WriteText(x, y, Record.ContactPerson)
		  
		  // Street
		  call pdf.WriteFTextEx(x, y, 180.0, -1.0, pdf.ktaLeft, Record.Street)
		  y = pdf.GetLastTextPosY - 10.0
		  
		  // Zip code
		  call pdf.WriteText(x, y, Record.Zip)
		  
		  // City
		  call pdf.WriteText(pdf.GetLastTextPosX + pdf.GetTextWidth(" "), y, Record.City)
		  
		  dim d as new date
		  
		  // Header on top right
		  x = 466.0
		  y = 690.5
		  call pdf.ChangeFontSize(8.0)
		  
		  // Date
		  call pdf.WriteText(x, y, d.ShortDate)
		  
		  // Customer Number
		  call pdf.WriteText(x, y - 27.5, str(Record.CustomerNr))
		  
		  // Order number
		  call pdf.WriteText(x, y - 39.0, Record.OrderNr)
		  
		  // VAT ID
		  call pdf.WriteText(x, y - 50.0, Record.TaxID)
		  
		  x = 56.0
		  y = 500.0
		  
		  // Invoice Number
		  dim r as new random
		  call pdf.ChangeFontSize(14.0)
		  call pdf.WriteText(x + 90.0, y + 8.5, str(r.InRange(1,1000000)))
		  
		  // Two lines for table header
		  call pdf.SetLineWidth(0.25)
		  call pdf.MoveTo(x, y)
		  call pdf.LineTo(x + 483.0, y)
		  y = y - 16.0
		  call pdf.MoveTo(x, y)
		  call pdf.LineTo(x + 483.0, y)
		  call pdf.StrokePath
		  
		  // Print articles in 5 columns
		  dim num as integer = 1
		  
		  y = 482.0
		  call pdf.ChangeFontSize(10.0)
		  
		  dim count as integer = r.InRange(0,6)
		  for i as integer = 0 to count
		    dim a as Article = Articles(r.InRange(0, UBound(Articles)))
		    WriteArticle(pdf, x, y, num, a, r.InRange(1, 100), sum)
		    y = y - 12.0
		    num = num + 1
		  next
		  
		  y = y - 2.0
		  call pdf.MoveTo(x, y)
		  call pdf.LineTo(x + 483.0, y)
		  call pdf.StrokePath
		  
		  call pdf.WriteText(x + 5.0, y - 10.0, "Sum before VAT")
		  
		  call pdf.WriteFTextEx(x, y, 483.0, -1.0, pdf.ktaRight, Format(sum, "0.00")+" €")
		  
		  y = y - 14.0
		  call pdf.MoveTo(x, y)
		  call pdf.LineTo(x + 483.0, y)
		  call pdf.StrokePath
		  
		  call pdf.WriteText(x + 5.0, y - 10.0, "VAT 19%")
		  
		  tax = sum * 0.19
		  
		  call pdf.WriteFTextEx(x, y, 483.0, -1.0, pdf.ktaRight, Format(tax, "0.00")+" €")
		  
		  y = y - 14.0
		  call pdf.MoveTo(x, y)
		  call pdf.LineTo(x + 483.0, y)
		  call pdf.StrokePath
		  
		  call pdf.SetFont("Arial", pdf.kfsBold, 12.0, true, pdf.kcp1252)
		  call pdf.WriteText(x + 5.0, y - 13.0, "Total sum")
		  
		  call pdf.WriteFTextEx(x, y - 1.0, 483.0, -1.0, pdf.ktaRight, Format(tax+sum, "0.00"))
		  
		  y = y - 18.0
		  call pdf.MoveTo(x, y)
		  call pdf.LineTo(x + 483.0, y)
		  y = y - 2.0
		  call pdf.MoveTo(x, y)
		  call pdf.LineTo(x + 483.0, y)
		  call pdf.StrokePath
		  
		  DrawPath pdf,   400,500,pdf.kcmWinding, pdf.kddCounterClockwise, pdf.RGB(rnd*100+155, rnd*100+155, rnd*100+155)
		  
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

	#tag Method, Flags = &h0
		Sub InitArticles()
		  // some articles
		  
		  Articles.Append new Article(3224567, "Brathänchen (800g)", 12.49)
		  Articles.Append new Article(5678321, "200g Aufschnitt", 1.98)
		  Articles.Append new Article(4559021, "Bratwurst 10er Pack", 4.49)
		  Articles.Append new Article(5679803, "1 Kg Handwaschpaste Deluxe", 8.22)
		  Articles.Append new Article(5447891, "Zahnpasta Erdber Geschmack", 0.99)
		  Articles.Append new Article(2342389, "500g Ravioli", 1.78)
		  Articles.Append new Article(1227432, "Mülleimer klein", 21.22)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitCustomer()
		  // some customers
		  
		  customers.Append new Customer("Gesellschaft für Entwicklung und Ökologie des deutschen Nahrungsmittelwesens",_
		  "Frau Stefan",_ 
		  "Raketenstraße 2",_
		  "38462",_
		  "Ravensberg",_
		  100003457,_
		  "-",_
		  "-")
		  customers.Append new Customer("Rewe",_
		  "Herr Walter von Straußenberg",_
		  "Am kleinen Wäldchen 123",_
		  "56890",_
		  "Bad Berleburg",_
		  100003434,_
		  "-",_
		  "-")
		  customers.Append new Customer("Hit",_
		  "Frau Ingrid Wolter",_
		  "Lüdenscheider Straße 433",_
		  "58515",_
		  "Lüdenscheid",_
		  100002447,_
		  "-",_
		  "-")
		  customers.Append new Customer("Kaufpark",_
		  "Herr Gerald Ostheim",_
		  "Heedfelder Straße 33",_
		  "43312",_
		  "Wuppertal",_
		  100005632,_
		  "-",_
		  "-")
		  customers.Append new Customer("Aldi",_
		  "Frau Sabine Schnellstadt",_
		  "Bredde 36",_
		  "98834",_
		  "München",_
		  100003129,_
		  "-",_
		  "-")
		  customers.Append new Customer("Lidle",_
		  "Herr Manfred Klein",_
		  "Am Park 2",_
		  "67890",_
		  "Frankfurt am Main",_
		  100009001,_
		  "-",_
		  "-")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteArticle(pdf as DynaPDFMBS, x as Double, y as Double, pos as integer, art as Article, quantity as integer, byref sum as Double)
		  // write one article line
		  
		  dim price as Double
		  
		  call pdf.WriteFTextEx( x, y, 20.0, -1.0, pdf.ktaCenter, str(pos))
		  call pdf.WriteText(x + 33.0, y - 10.0, str(Art.ArtNr))
		  call pdf.WriteFTextEx(x + 92.0, y, 200.0, -1.0, pdf.ktaLeft, Art.Description)
		  call pdf.WriteFTextEx(x + 335.0, y, 40.0, -1.0, pdf.ktaCenter, str(Quantity))
		  
		  price = (Quantity * Art.SinglePrice)
		  Sum   = sum + price
		  
		  call pdf.WriteFTextEx(x + 423.0, y, 60.0, -1.0, pdf.ktaRight, Format(price, "0.00")+" €")
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Articles(-1) As Article
	#tag EndProperty

	#tag Property, Flags = &h0
		Customers(-1) As Customer
	#tag EndProperty


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
