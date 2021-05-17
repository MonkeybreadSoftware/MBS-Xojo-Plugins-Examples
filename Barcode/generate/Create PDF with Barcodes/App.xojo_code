#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  pdf = new MyDynapdfMBS
		  dim d as new date
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with Barcodes.pdf")
		  
		  'pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF f
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  Tests 
		  
		  call pdf.CloseFile
		  
		  f.Launch
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub Test(typeLabel as string, type as integer, text as string)
		  'TestRender typeLabel, type, Text
		  TestVector typeLabel, type, Text
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestRender(typeLabel as string, type as integer, text as string)
		  // render is deprecated in favor
		  
		  Call pdf.Append
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  dim z as new BarcodeGeneratorMBS
		  
		  z.Symbology = type
		  z.Encode text
		  
		  dim r as ZintRenderMBS = z.Render
		  
		  call pdf.SetFont("Helvetica", 0, 20)
		  call pdf.WriteText 50, 100, typeLabel+" with Render: "+text
		  
		  // bitmap
		  dim pic as Picture = z.picture
		  call pdf.InsertPicture(pic, 100, 150, pic.Width, pic.Height)
		  
		  // vector, 
		  // here you could scale coordinates by a factor to adjust barcode to a size
		  
		  Const factor = 1.0
		  
		  dim px as Double = 100
		  dim py as Double = pic.Height + 150 + 50
		  
		  // 0 is black in RGB, Gray and CMYK colorspaces :-)
		  call pdf.SetFillColor 0
		  call pdf.SetStrokeColor 0
		  
		  dim lines()    as ZintRenderLineMBS = r.lines
		  dim hexagons() as ZintRenderHexagonMBS = r.hexagons
		  dim rings()    as ZintRenderRingMBS = r.rings
		  dim strings()  as ZintRenderStringMBS = r.strings
		  
		  if UBound(strings)>=0 then
		    for each s as ZintRenderStringMBS in strings
		      dim x as Double = s.x*factor + px
		      dim y as Double = s.y*factor + py
		      dim f as Double = s.FontSize * factor * 0.7
		      
		      Call pdf.SetFont("Helvetica", pdf.kfsCondensed, f)
		      dim textLen as Double = pdf.GetTextWidth(s.Text)
		      
		      x = x - textLen/2.0
		      y = y - f * 0.4
		      
		      call pdf.WriteText(x,y,s.Text)
		    next
		  end if
		  
		  if UBound(rings)>=0 then
		    break // todo
		  end if
		  
		  if UBound(lines)>=0 then
		    for each line as ZintRenderLineMBS in lines
		      dim x as Double = line.x*factor + px
		      dim y as Double = line.y*factor + py
		      dim w as Double = line.Width *factor + 0.1 // plus a little bit to avoid gaps between rectangles
		      dim h as Double = line.Length*factor + 0.1
		      call pdf.Rectangle(x, y, w, h, pdf.kfmFill)
		    next
		  end if
		  
		  if UBound(hexagons)>=0 then
		    break // todo
		  end if
		  
		  call pdf.EndPage
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Tests()
		  // UPC Version A
		  // UPC-A is used in the United States for retail applications. The
		  // symbol requires an 11 digit article number. The check digit is
		  // calculated by Zint. In addition EAN-2 and EAN-5 add-on symbols can
		  // be added using the + character.
		  
		  test "UPCA", BarcodeGeneratorMBS.BarcodeUpca, "72527270270+12345"
		  test "UPCA", BarcodeGeneratorMBS.BarcodeUpca, "72527270270"
		  
		  // UPC Version E
		  // UPC-E is a zero-compressed version of UPC-A developed for smaller
		  // packages. The code requires a 6 digit article number (digits 0-9).
		  // The check digit is calculated by Zint. EAN-2 and EAN-5 add- on
		  // symbols can be added using the + character as with UPC-A. In
		  // addition Zint also supports Number System 1 encoding by entering a
		  // 7-digit article number stating with the digit 1.
		  
		  test "UPCE", BarcodeGeneratorMBS.BarcodeUpcE, "1123456"
		  
		  // European Article Number (EN 797) 6.1.4.1 EAN-2, EAN-5, EAN-8 and EAN-13
		  // The EAN system is used in retail across Europe and includes
		  // standards for EAN-2 and EAN-5 add-on codes, EAN-8 and EAN-13 which
		  // encode 2, 5, 7 or 12 digit numbers respectively. Zint will decide
		  // which symbology to use depending on the length of the input data.
		  // In addition EAN-2 and EAN-5 add-on symbols can be added using the +
		  // symbol as with UPC symbols.
		  
		  test "EAN", BarcodeGeneratorMBS.BarcodeEanx, "54321"
		  test "EAN", BarcodeGeneratorMBS.BarcodeEanx, "7432365+54321"
		  
		  // Standard Code 39 was developed in 1974 by Intermec.
		  // Input data can be of any length and supports the characters 0-9, A-
		  // Z, dash (-), full stop (.), space, asterisk (*), dollar ($), slash
		  // (/), plus (+) and percent (%). The standard does not require a
		  // check digit but a modulo-43 check digit can be added if required by
		  // setting Option2 = 1.
		  
		  test "Code39", BarcodeGeneratorMBS.BarcodeCode39, "CODE39"
		  
		  // PDF417 (ISO 15438)
		  // Heavily used in the parcel industry, the PDF417 symbology can
		  // encode a vast amount of data into a small space. Zint supports
		  // encoding up to the ISO standard maximum symbol size of 925
		  // codewords which (at error correction level 0) allows a maximum data
		  // size of 1850 text characters, or 2710 digits. The width of the
		  // generated PDF417 symbol can be specified at the command line using
		  // the Option2 with a number between 1 and 30, and the amount of check
		  // digit information can be specified by using the Option1 property
		  // with a number between 0 and 8 where the number of codewords used
		  // for check information is determined by 2(value + 1). The default
		  // level of check information is determined by the amount of data
		  // being encoded. International text support is provided using the
		  // Latin-1 character set as described in Appendix A. A separate
		  // symbology ID can be used to encode Health Industry Barcode (HIBC)
		  // data which adds a leading '+' character and a modulo-49 check digit
		  // to the encoded data.
		  
		  test "PDF417", BarcodeGeneratorMBS.BarcodePdf417, "Hello World, Just a test. 123"
		  
		  // 6.6.1 Data Matrix (ISO 16022) Also known as Semacode this symbology
		  // was developed in 1989 by Acuity CiMatrix in partnership with the US
		  // DoD and NASA. The symbol can encode a large amount of data in a
		  // small area. Data Matrix can encode any characters in the Latin-1
		  // set and can also encode GS1 data. The size of the generated symbol
		  // can also be adjusted using Option2. A separate symbology ID can be
		  // used to encode Health Industry Barcode (HIBC) data which adds a
		  // leading '+' character and a modulo-49 check digit to the encoded
		  // data. Note that only ECC200 encoding is supported, the older
		  // standards have now been removed from Zint. An extra feature is
		  // available for Data Matrix symbols which allows Zint to
		  // automatically resize the symbol as required but also prevents Zint
		  // from using rectangular symbols. To set this mode at the command
		  // line use Option3 = OptionSquare.
		  
		  test "DataMatrix", BarcodeGeneratorMBS.BarcodeDatamatrix, "Hello World"
		  
		  // QR Code
		  // Also known as Quick Response Code this symbology was developed by
		  // Denso. Four levels of error correction are available using the
		  // Option1 property.
		  
		  // Input ECC LevelError Correction Capacity    Recovery Capacity
		  // 1    L (default)    Approx 20% of symbol    Approx 7%
		  // 2    M    Approx 37% of symbol    Approx 15%
		  // 3    Q    Approx 55% of symbol    Approx 25%
		  // 4    H    Approx 65% of symbol    Approx 30%
		  
		  // The size of the symbol can be set by using the Option2 to the QR Code version required (1-40).
		  
		  test "QR Code", BarcodeGeneratorMBS.BarcodeQrcode, "Hello World"
		  
		  
		  
		  // While Zint app is GPL, the ZINT shared library is licensed under BSD 3!
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestVector(typeLabel as string, type as integer, text as string)
		  Call pdf.Append
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  dim z as new BarcodeGeneratorMBS
		  
		  z.Symbology = type
		  z.Encode text
		  
		  Dim r As ZintVectorMBS = z.Vector
		  
		  call pdf.SetFont("Helvetica", 0, 20)
		  Call pdf.WriteText 50, 100, typeLabel+" with Vector: "+Text
		  
		  // bitmap
		  dim pic as Picture = z.picture
		  call pdf.InsertPicture(pic, 100, 150, pic.Width, pic.Height)
		  
		  // vector, 
		  // here you could scale coordinates by a factor to adjust barcode to a size
		  
		  const factor = 1.0
		  
		  dim px as Double = 100
		  dim py as Double = pic.Height + 150 + 50
		  
		  // 0 is black in RGB, Gray and CMYK colorspaces :-)
		  call pdf.SetFillColor 0
		  call pdf.SetStrokeColor 0
		  
		  Dim rects()    As ZintVectorRectMBS = r.Rectangles
		  Dim hexagons() As ZintVectorHexagonMBS = r.hexagons
		  Dim circles()  As ZintVectorCircleMBS = r.Circles
		  dim strings()  as ZintVectorStringMBS = r.strings
		  
		  If UBound(strings) >= 0 Then
		    for each s as ZintVectorStringMBS in strings
		      dim x as Double = s.x*factor + px
		      dim y as Double = s.y*factor + py
		      dim f as Double = s.FontSize * factor * 0.7
		      Call pdf.SetFillColor(&c000000) // black
		      
		      call pdf.SetFont("Helvetica", pdf.kfsCondensed, f)
		      dim textLen as Double = pdf.GetTextWidth(s.Text)
		      
		      x = x - textLen/2.0
		      y = y - f * 0.4
		      
		      call pdf.WriteText(x,y,s.Text)
		    next
		  end if
		  
		  If UBound(circles) >= 0 Then
		    Break // todo
		  end if
		  
		  If UBound(rects) >= 0 Then
		    For Each rect As ZintVectorRectMBS In rects
		      Dim x As Double = rect.x*factor + px
		      Dim y As Double = rect.y*factor + py
		      Dim w As Double = rect.Width *factor + 0.1 // plus a little bit to avoid gaps between rectangles
		      Dim h As Double = rect.Height*factor + 0.1
		      'Call pdf.SetFillColor(rect.ColorValue)
		      call pdf.Rectangle(x, y, w, h, pdf.kfmFill)
		    Next
		  end if
		  
		  If UBound(hexagons) >= 0 Then
		    Break // todo
		  end if
		  
		  call pdf.EndPage
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		pdf As MyDynapdfMBS
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
