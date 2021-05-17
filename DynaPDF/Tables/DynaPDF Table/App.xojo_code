#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  InitCustomer
		  InitArticles
		  
		  CreateInvoices
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CreateInvoices()
		  const NUM_PAGES = 1000
		  
		  dim r as new random
		  dim pdf as new MyDynaPDFMBS
		  dim ofile as FolderItem = SpecialFolder.Desktop.Child("DynaPDF Table Invoice Example.pdf")
		  dim ifile as FolderItem = FindFile("invoice template.pdf")
		  
		  call pdf.CreateNewPDF(ofile)
		  
		  call pdf.SetImportFlags( Bitwiseor(pdf.kifImportAll, pdf.kifImportAsPage))
		  
		  call pdf.OpenImportFile(ifile, pdf.kptOpen, "")
		  
		  dim tmpl as integer = pdf.ImportPage(1)
		  
		  call pdf.CloseImportFile
		  call pdf.SetPageCoords(pdf.kpcTopDown)
		  for i as integer = 1 to NUM_PAGES
		    
		    call pdf.Append
		    call pdf.SetFont("Arial", pdf.kfsRegular, 8.0, true, pdf.kcp1252)
		    // Statischer Hintergrund
		    call pdf.PlaceTemplateEx(tmpl, 0.0, 0.0, 0.0, 0.0)
		    // Rechnung mit Daten füllen
		    
		    dim idx as integer = r.InRange(0,UBound(Customers))
		    
		    FillPage(PDF, Customers(idx), i, NUM_PAGES)
		    
		    call pdf.EndPage
		  next
		  
		  // Add page numbers
		  'dim pageCount as integer = pdf.GetPageCount
		  'for i as integer = 1 to NUM_PAGES
		  '
		  'call pdf.EditPage(i)
		  '
		  'call pdf.SetFont("Arial", pdf.kfsRegular, 8.0, true, pdf.kcp1252)
		  'call pdf.WriteText(466.0, 681.5, str(i)+" of "+str(pageCount))
		  '
		  'call pdf.EndPage
		  'next
		  
		  call pdf.CloseFile
		  
		  ofile.Launch(true)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillPage(pdf as DynaPDFMBS, record as Customer, pageNum as integer, pageCount as integer)
		  dim sum as Double
		  dim price as Double
		  dim tax as double
		  dim table as DynaPDFTableMBS
		  dim rowNum as integer = 0
		  
		  const AllRows = -1
		  const AllColumns = -1
		  
		  dim d as new date
		  
		  // Address field top left
		  table = pdf.CreateTable(4, 1, 200.0, 8.0)
		  // The default font size is 10.0
		  call table.SetFont(AllRows, AllColumns, "Arial", pdf.kfsRegular, true, pdf.kcp1252)
		  
		  'call table.SetGridVerticalColor(255, 0, 0)
		  'call table.SetGridHorizontalColor(0, 255, 0)
		  'call table.SetBorderColor(-1, -1, 0, 0, 255)
		  'call table.SetBorderWidth(-1, -1, 1.0, 1.0, 1.0, 1.0)
		  'call table.SetGridWidth(1,1)
		  rowNum = table.AddRow
		  call table.SetFontSize(rowNum, 0, 8.0)
		  call table.SetCellText(rowNum, 0, pdf.ktaLeft, table.kcoCenter, "Der Supermarkt.de")
		  'call table.SetBackColor(rowNum, 0, 255, 0, 0)
		  
		  rowNum = table.AddRow
		  call table.SetCellSpacing(rowNum, AllColumns, 0.0, 0.0, -1.5, 0.0)
		  call table.SetFontSize(AllRows, AllColumns, 8.0)
		  call table.SetCellText(rowNum, 0, pdf.ktaLeft, table.kcoCenter, "Flaßkamp 8, 58579 Schalksmühle")
		  'call table.SetTextColor(rowNum, 0, 0, 255, 255)
		  
		  rowNum = table.AddRow
		  call table.SetCellSpacing(rowNum, AllColumns, 0.0, 0.0, 3.0, 0.0)
		  call table.SetCellText(rowNum, 0, pdf.ktaLeft, table.kcoCenter, Record.Company)
		  'call table.SetTextColor(rowNum, 0, 0, 0, 255)
		  
		  rowNum = table.AddRow
		  call table.SetCellText(rowNum, 0, pdf.ktaLeft, table.kcoCenter, Record.ContactPerson)
		  'call table.SetTextColor(rowNum, 0, 0, 0, 255)
		  
		  rowNum = table.AddRow
		  call table.SetCellText(rowNum, 0, pdf.ktaLeft, table.kcoCenter, Record.Street)
		  
		  rowNum = table.AddRow
		  
		  call table.SetCellText(rowNum, 0, pdf.ktaLeft, table.kcoCenter, Record.Zip + " "+record.City)
		  
		  // Draw the table and delete it
		  call table.DrawTable(55.0, 150.0)
		  table = nil
		  
		  // Top right header
		  rowNum = 0
		  table = pdf.CreateTable(13, 2, 200.0, 8.0)
		  call table.SetColWidth(1, 90.0, false)
		  call table.SetFont(AllRows, AllColumns, "Arial", pdf.kfsRegular, true, pdf.kcp1252)
		  call table.SetFontSize(AllRows, AllColumns, 8.0)
		  call table.SetCellSpacing(AllRows, AllColumns, 8.0, 0.0, 0.0, 0.0)
		  
		  rowNum = table.AddRow
		  call table.SetFont(rowNum, AllColumns, "Arial", pdf.kfsBold, true, pdf.kcp1252)
		  call table.SetCellText(rowNum, 0, pdf.ktaRight, table.kcoCenter, "Datum")
		  call table.SetCellText(rowNum, 1, pdf.ktaLeft, table.kcoCenter, d.AbbreviatedDate)
		  
		  rowNum = table.AddRow
		  call table.SetFont(rowNum, AllColumns, "Arial", pdf.kfsBold, true, pdf.kcp1252)
		  call table.SetCellText(rowNum, 0, pdf.ktaRight, table.kcoCenter, "Seite")
		  call table.SetCellText(rowNum, 1, pdf.ktaLeft, table.kcoCenter, str(pageNum)+" of "+str(pagecount))
		  
		  rowNum = table.AddRow
		  call table.SetCellSpacing(rowNum, AllColumns, 8.0, 0.0, 5.0, 0.0)
		  call table.SetFont(rowNum, AllColumns, "Arial", pdf.kfsBold, true, pdf.kcp1252)
		  call table.SetCellText(rowNum, 0, pdf.ktaRight, table.kcoCenter, "Kundennummer")
		  call table.SetCellText(rowNum, 1, pdf.ktaLeft, table.kcoCenter, str(Record.CustomerNr))
		  
		  rowNum = table.AddRow
		  call table.SetFont(rowNum, AllColumns, "Arial", pdf.kfsBold, true, pdf.kcp1252)
		  call table.SetCellText(rowNum, 0, pdf.ktaRight, table.kcoCenter, "Auftragsnummer")
		  call table.SetCellText(rowNum, 1, pdf.ktaLeft, table.kcoCenter, str(Record.OrderNr))
		  
		  rowNum = table.AddRow
		  call table.SetFont(rowNum, AllColumns, "Arial", pdf.kfsBold, true, pdf.kcp1252)
		  call table.SetCellText(rowNum, 0, pdf.ktaRight, table.kcoCenter, "Ihre USt-ID")
		  call table.SetCellText(rowNum, 1, pdf.ktaLeft, table.kcoCenter, Record.TaxID)
		  
		  rowNum = table.AddRow
		  call table.SetCellSpacing(rowNum, AllColumns, 8.0, 0.0, 5.0, 0.0)
		  call table.SetFont(rowNum, AllColumns, "Arial", pdf.kfsBold, true, pdf.kcp1252)
		  call table.SetCellText(rowNum, 0, pdf.ktaRight, table.kcoCenter, "Sie haben noch Fragen zu Ihrer Rechnung?")
		  call table.SetCellText(rowNum, 1, pdf.ktaLeft, table.kcoCenter, "Sie erreichen uns unter:")
		  
		  rowNum = table.AddRow
		  call table.SetCellSpacing(rowNum, AllColumns, 8.0, 0.0, 5.0, 0.0)
		  
		  call table.SetFont(rowNum, AllColumns, "Arial", pdf.kfsBold, true, pdf.kcp1252)
		  call table.SetCellText(rowNum, 0, pdf.ktaRight, table.kcoCenter, "Telefon")
		  call table.SetCellText(rowNum, 1, pdf.ktaLeft, table.kcoCenter, "++49 2355 50 97 25")
		  
		  rowNum = table.AddRow
		  call table.SetFont(rowNum, AllColumns, "Arial", pdf.kfsBold, true, pdf.kcp1252)
		  call table.SetCellText(rowNum, 0, pdf.ktaRight, table.kcoCenter, "Telefax")
		  call table.SetCellText(rowNum, 1, pdf.ktaLeft, table.kcoCenter, "++49 2355 50 97 26")
		  
		  rowNum = table.AddRow
		  call table.SetFont(rowNum, AllColumns, "Arial", pdf.kfsBold, true, pdf.kcp1252)
		  call table.SetCellText(rowNum, 0, pdf.ktaRight, table.kcoCenter, "Email")
		  call table.SetCellText(rowNum, 1, pdf.ktaLeft, table.kcoCenter, "info@dynaforms.de")
		  
		  // Draw the table and delete it
		  call table.DrawTable(340.0, 145.0)
		  table = nil
		  
		  
		  // Rechnungsnummer
		  call pdf.ChangeFontSize(14.0)
		  call pdf.WriteText(55.0, 320.0, "Rechnung Nr. "+Format(Rnd*1000000,"0"))
		  
		  
		  rowNum = 0
		  table = pdf.CreateTable(20, 5, 485.0, 10.0)
		  call table.SetColWidth(0, 28.0, false)
		  call table.SetColWidth(1, 60.0, false)
		  call table.SetColWidth(2, 250.0, false)
		  call table.SetColWidth(3, 40.0, false)
		  // The default font size is 10 units...
		  call table.SetFont(AllRows, AllColumns, "Arial", pdf.kfsRegular, true, pdf.kcp1252)
		  
		  
		  // Header row
		  rowNum = table.AddRow
		  call table.SetFont(rowNum, AllColumns, "Arial", pdf.kfsBold, true, pdf.kcp1252)
		  call table.SetBorderWidth(rowNum, AllColumns, 0.0, 0.0, 0.5, 0.5)
		  call table.SetCellPadding(rowNum, AllColumns, 0.0, 0.0, 2.0, 2.0)
		  call table.SetCellSpacing(rowNum, AllColumns, 0.0, 0.0, 0.0, 2.0)
		  
		  call table.SetCellText(rowNum, 0, pdf.ktaLeft, table.kcoCenter, "Pos.")
		  call table.SetCellText(rowNum, 1, pdf.ktaLeft, table.kcoCenter, "Art-Nr.")
		  call table.SetCellText(rowNum, 2, pdf.ktaLeft, table.kcoCenter, "Bezeichnung")
		  call table.SetCellText(rowNum, 3, pdf.ktaCenter, table.kcoCenter, "Menge")
		  call table.SetCellText(rowNum, 4, pdf.ktaRight, table.kcoCenter, "Betrag")
		  
		  // Add purchased articles
		  dim num as integer = 1
		  dim count as integer = rnd*10
		  dim quantity as integer = 0
		  for i as integer = 0 to count
		    
		    dim art as Article = Articles(rnd*(UBound(Articles)+1))
		    
		    rowNum = table.AddRow
		    call table.SetCellText(rowNum, 0, pdf.ktaLeft, table.kcoCenter, str(num))
		    call table.SetCellText(rowNum, 1, pdf.ktaLeft, table.kcoCenter, str(art.ArtNr))
		    call table.SetCellText(rowNum, 2, pdf.ktaLeft, table.kcoCenter, art.Description)
		    
		    quantity = rnd*99
		    call table.SetCellText(rowNum, 3, pdf.ktaCenter, table.kcoCenter, str(quantity))
		    
		    price = (quantity * art.SinglePrice)
		    sum  = sum + price
		    call table.SetCellText(rowNum, 4, pdf.ktaRight, table.kcoCenter, Format(price, "0.00")+"€")
		    num = num + 1
		  next
		  
		  // Draw the table and delete it
		  dim y as double = table.DrawTable( 55.0, 350.0) + 352.0
		  table = nil
		  
		  rowNum = 0
		  table = pdf.CreateTable(2, 2, 485.0, 10.0)
		  call table.SetColWidth(0, 200.0, false)
		  call table.SetCellPadding(AllRows, AllColumns, 0.0, 0.0, 2.0, 2.0)
		  call table.SetCellSpacing(AllRows, AllColumns, 0.0, 0.0, 0.0, 2.0)
		  call table.SetFont(AllRows, AllColumns, "Arial", pdf.kfsRegular, true, pdf.kcp1252)
		  
		  rowNum = table.AddRow
		  
		  call table.SetCellText(rowNum, 0, pdf.ktaLeft, table.kcoCenter, "Nettobetrag")
		  call table.SetCellText(rowNum, 1, pdf.ktaRight, table.kcoCenter, Format(sum, "0.00")+"€")
		  
		  rowNum = table.AddRow
		  
		  tax = sum * 0.19
		  call table.SetCellText(rowNum, 0, pdf.ktaLeft, table.kcoCenter, "Umsatzsteuer 19%")
		  call table.SetCellText(rowNum, 1, pdf.ktaRight, table.kcoCenter, Format( tax, "0.00")+"€")
		  
		  rowNum = table.AddRow
		  call table.SetFont(rowNum, AllColumns, "Arial", pdf.kfsBold, true, pdf.kcp1252)
		  call table.SetBorderWidth(rowNum, AllColumns, 0.0, 2.0, 0.0, 0.0)
		  
		  call table.SetCellText(rowNum, 0, pdf.ktaLeft, table.kcoCenter, "Gesamtbetrag")
		  call table.SetCellText(rowNum, 1, pdf.ktaRight, table.kcoCenter, Format(sum + tax, "0.00")+"€")
		  
		  call table.DrawTable( 55.0, y)
		  
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
		  Articles.Append new Article(3224567, "Brathänchen (800g)", 12.49)
		  Articles.Append new Article(5678321, "200g Aufschnitt", 1.98)
		  Articles.Append new Article(4559021, "Bratwurst 10er Pack", 4.49)
		  Articles.Append new Article(5679803, "1 Kg Handwaschpaste Deluxe", 8.22)
		  Articles.Append new Article(5447891, "Zahnpasta Erdber Geschmack - this is a cell with lots of text to wrap", 0.99)
		  Articles.Append new Article(2342389, "500g Ravioli", 1.78)
		  Articles.Append new Article(1227432, "Mülleimer klein", 21.22)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitCustomer()
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
