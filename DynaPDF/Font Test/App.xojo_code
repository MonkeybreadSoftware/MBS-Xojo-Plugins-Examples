#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim filename as FolderItem
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  ListFonts pdf
		  
		  // Standard font test
		  fileName=SpecialFolder.Desktop.Child("Standard Fonts.pdf")
		  CreateTestPDF(pdf, fileName, false)
		  TestStandardFonts(pdf, pdf.kcp1252)
		  EndTest(pdf, fileName)
		  
		  // Test font methods (standard fonts only)
		  filename=SpecialFolder.Desktop.Child("Font Methods Standard Fonts.pdf")
		  CreateTestPDF(pdf, fileName, false)
		  TestFontMethods(pdf, pdf.kcp1252, false)
		  EndTest(pdf, fileName)
		  
		  // Test font methods (all fonts)
		  filename=SpecialFolder.Desktop.Child("Font Methods All Fonts.pdf")
		  CreateTestPDF(pdf, fileName, true)
		  TestFontMethods(pdf, pdf.kcp1252, true)
		  EndTest(pdf, fileName)
		  
		  // Test vector graphics
		  filename=SpecialFolder.Desktop.Child("Vecotr Graphics.pdf")
		  CreateTestPDF(pdf, fileName, true)
		  TestVectorGraphicMethods(pdf)
		  EndTest(pdf, fileName)
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CreateTestPDF(PDF as DynapdfMBS, Filename as folderitem, UseFontList as boolean)
		  
		  TimeStart = ticks
		  
		  call pdf.SetDocInfo(pdf.kdiSubject, "DynaPDF function test")
		  call pdf.SetDocInfo(pdf.kdiTitle, "DynaPDF function test")
		  call pdf.SetViewerPreferences(pdf.kvpDisplayDocTitle, pdf.kavNone)
		  
		  call pdf.SetPageCoords(pdf.kpcTopDown)
		  call pdf.SetCompressionLevel(pdf.kclDefault)
		  call pdf.CreateNewPDF(FileName)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawShapes(PDF as DynapdfMBS, Direction as integer, Coords as integer, Text as string)
		  dim title as string = "Vector graphics test"
		  dim posY as double = 50.0
		  dim posX as double = 130.0
		  
		  call pdf.Append
		  if (Coords = pdf.kpcBottomUp) then
		    posY = pdf.GetPageHeight -70
		  end if
		  
		  call pdf.SetDrawDirection(Direction)
		  call pdf.SetPageCoords(Coords)
		  call pdf.SetLineWidth(0.5)
		  call pdf.SetFillColor(pdf.kPDF_NAVY)
		  call pdf.SetFont("Helvetica", pdf.kfsItalic + pdf.kfsUnderlined, 20.0, false, pdf.kcp1252)
		  call pdf.WriteText(50.0, posY, title)
		  if (Coords = pdf.kpcBottomUp)  then
		    posY = posY- 50.0 
		  else 
		    posY = posY+ 50.0
		  end if
		  
		  call pdf.SetFillColor(pdf.kPDF_BLACK)
		  call pdf.SetFont("Helvetica", pdf.kfsNone, 12.0, false, pdf.kcp1252)
		  call pdf.WriteText(posX, posY, Text)
		  
		  if (Coords = pdf.kpcBottomUp)  then
		    posY = posY- 60.0 
		  else 
		    posY = posY+ 20.0
		  end if
		  
		  call pdf.SetFillColor(pdf.kPDF_MOGREEN)
		  call pdf.SetStrokeColor(pdf.kPDF_BLUE)
		  call pdf.Rectangle(posX, posY, 100.0, 50.0, pdf.kfmStroke)
		  call pdf.Rectangle(posX + 110.0, posY, 100.0, 50.0, pdf.kfmFill)
		  call pdf.Rectangle(posX + 220.0, posY, 100.0, 50.0, pdf.kfmFillStroke)
		  
		  if (Coords = pdf.kpcBottomUp)   then
		    posY = posY- 60.0 
		  else 
		    posY = posY+ 60.0
		  end if
		  
		  call pdf.RoundRect(posX, posY, 100.0, 50.0, 20.0, pdf.kfmStroke)
		  call pdf.RoundRect(posX + 110.0, posY, 100.0, 50.0, 20.0, pdf.kfmFill)
		  call pdf.RoundRect(posX + 220.0, posY, 100.0, 50.0, 20.0, pdf.kfmFillStroke)
		  
		  if (Coords = pdf.kpcBottomUp)   then
		    posY = posY- 60.0 
		  else 
		    posY = posY+ 60.0
		  end if
		  
		  call pdf.RoundRectEx(posX, posY, 100.0, 50.0, 40.0, 20.0, pdf.kfmStroke)
		  call pdf.RoundRectEx(posX + 110.0, posY, 100.0, 50.0, 40.0, 20.0,pdf.kfmFill)
		  call pdf.RoundRectEx(posX + 220.0, posY, 100.0, 50.0, 40.0, 20.0,pdf.kfmFillStroke)
		  
		  if (Coords = pdf.kpcBottomUp)   then
		    posY = posY- 60.0 
		  else 
		    posY = posY+ 60.0
		  end if
		  
		  call pdf.Ellipse(posX, posY, 100.0, 50.0, pdf.kfmStroke)
		  call pdf.Ellipse(posX + 110.0, posY, 100.0, 50.0, pdf.kfmFill)
		  call pdf.Ellipse(posX + 220.0, posY, 100.0, 50.0, pdf.kfmFillStroke)
		  
		  if (Coords = pdf.kpcBottomUp)   then
		    posY = posY- 35.0 
		  else 
		    posY = posY+ 85.0
		  end if
		  
		  call pdf.DrawCircle(posX + 160, posY, 25.0, pdf.kfmFill)
		  call pdf.DrawCircle(posX + 270, posY, 25.0, pdf.kfmFillStroke)
		  
		  if (Coords = pdf.kpcBottomUp)   then
		    posY = posY- 60.0 
		  else 
		    posY = posY+ 60.0
		  end if
		  
		  call pdf.DrawChord(posX + 50.0, posY, 100.0, 50.0, 150.0, 30.0, pdf.kfmStroke)
		  call pdf.DrawChord(posX + 160.0, posY, 100.0, 50.0, 150.0, 30.0, pdf.kfmFill)
		  call pdf.DrawChord(posX + 270.0, posY, 100.0, 50.0, 150.0, 30.0, pdf.kfmFillStroke)
		  
		  if (Coords = pdf.kpcBottomUp) then
		    posY = posY- 60.0 
		  else 
		    posY = posY+ 60.0
		  end if
		  
		  call pdf.DrawPie(posX + 50.0, posY, 100.0, 50.0, 150.0, 30.0, pdf.kfmStroke)
		  call pdf.DrawPie(posX + 160.0, posY, 100.0, 50.0, 150.0, 30.0, pdf.kfmFill)
		  call pdf.DrawPie(posX + 270.0, posY, 100.0, 50.0, 150.0, 30.0, pdf.kfmFillStroke)
		  
		  if (Coords = pdf.kpcBottomUp) then
		    posY = posY- 60.0 
		  else 
		    posY = posY+ 60.0
		  end if
		  
		  call pdf.DrawArc(posX + 50.0, posY, 25.0, 150.0, 30.0)
		  call pdf.StrokePath
		  call pdf.DrawArcEx(posX + 160.0, posY, 50.0, 50.0, 150.0, 30.0)
		  call pdf.StrokePath
		  call pdf.DrawArcEx(posX + 270.0, posY, 100.0, 50.0, 150.0, 30.0)
		  call pdf.StrokePath
		  
		  if (Coords = pdf.kpcBottomUp) then
		    posY = posY- 85.0 
		  else 
		    posY = posY+ 35.0
		  end if
		  
		  call pdf.Triangle(posX, posY, posX +100.0, posY, posX +50.0, posY +50.0, pdf.kfmStroke)
		  posX = posx+ 110.0
		  call pdf.Triangle(posX, posY, posX +100.0, posY, posX +50.0, posY +50.0, pdf.kfmFill)
		  posX = posx+ 110.0
		  call pdf.Triangle(posX, posY, posX +100.0, posY, posX +50.0, posY +50.0, pdf.kfmFillStroke)
		  call pdf.EndPage
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EndTest(PDF as DynapdfMBS, filename as folderitem)
		  call pdf.CloseFile
		  pdf=nil
		  
		  TimeStart = ticks - TimeStart
		  
		  System.DebugLog "Processing time: "+str(TimeStart)
		  System.DebugLog "PDF file: "+filename.Name
		  
		  filename.Launch
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCodepageAsStr(cp as integer) As string
		  Select case cp
		  case DynaPDFMBS.kcp1250  
		      return "1250"
		  case DynaPDFMBS.kcp1251  
		      return "1251"
		  case DynaPDFMBS.kcp1252  
		      return "1252"
		  case DynaPDFMBS.kcp1253  
		      return "1253"
		  case DynaPDFMBS.kcp1254  
		      return "1254"
		  case DynaPDFMBS.kcp1255  
		      return "1255"
		  case DynaPDFMBS.kcp1256  
		      return "1256"
		  case DynaPDFMBS.kcp1257  
		      return "1257"
		  case DynaPDFMBS.kcp1258  
		      return "1258"
		  case DynaPDFMBS.kcp8859_2  
		      return "8859_2"
		  case DynaPDFMBS.kcp8859_3  
		      return "8859_3"
		  case DynaPDFMBS.kcp8859_4  
		      return "8859_4"
		  case DynaPDFMBS.kcp8859_5  
		      return "8859_5"
		  case DynaPDFMBS.kcp8859_6  
		      return "8859_6"
		  case DynaPDFMBS.kcp8859_7  
		      return "8859_7"
		  case DynaPDFMBS.kcp8859_8  
		      return "8859_8"
		  case DynaPDFMBS.kcp8859_9  
		      return "8859_9"
		  case DynaPDFMBS.kcp8859_10  
		      return "8859_10"
		  case DynaPDFMBS.kcp8859_13  
		      return "8859_13"
		  case DynaPDFMBS.kcp8859_14  
		      return "8859_14"
		  case DynaPDFMBS.kcp8859_15  
		      return "8859_15"
		  case DynaPDFMBS.kcp8859_16  
		      return "8859_16"
		  case DynaPDFMBS.kcpSymbol  
		      return "Symbol"
		  case DynaPDFMBS.kcp437  
		      return "437"
		  case DynaPDFMBS.kcp737  
		      return "737"
		  case DynaPDFMBS.kcp775  
		      return "775"
		  case DynaPDFMBS.kcp850  
		      return "850"
		  case DynaPDFMBS.kcp852  
		      return "852"
		  case DynaPDFMBS.kcp855  
		      return "855"
		  case DynaPDFMBS.kcp857  
		      return "857"
		  case DynaPDFMBS.kcp860  
		      return "860"
		  case DynaPDFMBS.kcp861  
		      return "861"
		  case DynaPDFMBS.kcp862  
		      return "862"
		  case DynaPDFMBS.kcp863  
		      return "863"
		  case DynaPDFMBS.kcp864  
		      return "864"
		  case DynaPDFMBS.kcp865  
		      return "865"
		  case DynaPDFMBS.kcp866  
		      return "866"
		  case DynaPDFMBS.kcp869  
		      return "869"
		  case DynaPDFMBS.kcp874  
		      return "874"
		  case DynaPDFMBS.kcpUnicode  
		      return "Unicode"
		  else
		    return "CJK code pages are not supported in this test"
		  end Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ListFonts(pdf as MyDynapdfMBS)
		  
		  FontCount = pdf.EnumHostFonts
		  
		  if (FontCount <= 0) then
		    
		    MsgBox "No fonts found!"
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestFontMethods(PDF as DynapdfMBS, CP as integer, AllFonts as boolean)
		  dim title as string = "Test font methods (code page "
		  dim headText as string
		  dim font as pdfFont
		  dim i as integer
		  dim posY as double = 50.0
		  
		  title=Title+GetCodepageAsStr(CP)+ ")"
		  
		  call pdf.Append
		  call pdf.SetStrokeColor(pdf.kPDF_BLACK)
		  call pdf.SetLineWidth(0.5)
		  call pdf.SetFillColor(pdf.kPDF_NAVY)
		  
		  if (m_SelMode = pdf.ksmFamilyName) then
		    call pdf.SetFont("Helvetica", pdf.kfsItalic + pdf.kfsUnderlined, 20.0, true, pdf.kcp1252)
		  else
		    call pdf.SetFont("Helvetica-Oblique", pdf.kfsUnderlined, 20.0, true, pdf.kcp1252)
		  end if
		  
		  call pdf.WriteText(50.0, posY, title)
		  posY = posY+ 30.0
		  call pdf.SetFont("Helvetica", pdf.kfsNone, 12.0, false, pdf.kcp1252)
		  call pdf.SetFillColor(pdf.kPDF_BLACK)
		  call pdf.WriteText(50.0, posY, "The rectanlge over the following output strings is always calculated with GetTextWidth().")
		  posY = posY+ 20
		  
		  posY = WritePropertyLine(pdf, 50.0, posY, "Helvetica", "Helvetica", pdf.kfsNone, CP)
		  posY = WritePropertyLine(pdf, 50.0, posY, "Helvetica", "Helvetica-Bold", pdf.kfsBold, CP)
		  posY = WritePropertyLine(pdf, 50.0, posY, "Helvetica", "Helvetica-Oblique", pdf.kfsItalic, CP)
		  posY = WritePropertyLine(pdf, 50.0, posY, "Helvetica", "Helvetica-BoldOblique", pdf.kfsItalic + pdf.kfsBold, CP)
		  posY = WritePropertyLine(pdf, 50.0, posY, "Courier", "Courier", pdf.kfsNone, CP)
		  posY = WritePropertyLine(pdf, 50.0, posY, "Courier", "Courier-Bold", pdf.kfsBold, CP)
		  posY = WritePropertyLine(pdf, 50.0, posY, "Courier", "Courier-Oblique", pdf.kfsItalic, CP)
		  call WritePropertyLine(pdf, 50.0, posY, "Courier", "Courier-BoldOblique", pdf.kfsBold + pdf.kfsItalic, CP)
		  call pdf.EndPage
		  
		  call pdf.Append
		  posY = 50.0
		  call pdf.SetLineWidth(0.5)
		  call pdf.SetFillColor(pdf.kPDF_NAVY)
		  
		  if (m_SelMode = pdf.ksmFamilyName) then
		    call pdf.SetFont("Helvetica", pdf.kfsItalic + pdf.kfsUnderlined, 20.0, true, pdf.kcp1252)
		  else
		    call pdf.SetFont("Helvetica-Oblique", pdf.kfsUnderlined, 20.0, true, pdf.kcp1252)
		  end if
		  
		  call pdf.WriteText(50.0, posY, title)
		  call pdf.SetFillColor(pdf.kPDF_BLACK)
		  posY = posY+ 30
		  posY = WritePropertyLine(pdf, 50.0, posY, ("Times"), "Times-Roman", pdf.kfsNone, CP)
		  posY = WritePropertyLine(pdf, 50.0, posY, ("Times"), "Times-Bold", pdf.kfsBold, CP)
		  posY = WritePropertyLine(pdf, 50.0, posY, ("Times"), "Times-Italic", pdf.kfsItalic, CP)
		  posY = WritePropertyLine(pdf, 50.0, posY, ("Times"), "Times-BoldItalic", pdf.kfsBold + pdf.kfsItalic, CP)
		  
		  // We cannot emulate a font style when trying to select the font with the postscript name.
		  m_SelMode = pdf.ksmFamilyName
		  call pdf.SetFontSelMode(m_SelMode)
		  posY = WritePropertyLine(pdf, 50.0, posY, ("ZapfDingbats"), "ZapfDingbats", pdf.kfsNone, CP)
		  posY = WritePropertyLine(pdf, 50.0, posY, ("ZapfDingbats"), "ZapfDingbats-Bold (emulated)", pdf.kfsBold, CP)
		  posY = WritePropertyLine(pdf, 50.0, posY, ("ZapfDingbats"), "ZapfDingbats-Italic (emulated)", pdf.kfsItalic, CP)
		  call WritePropertyLine(pdf, 50.0, posY, ("ZapfDingbats"), "ZapfDingbats-BoldItalic (emulated)", pdf.kfsBold + pdf.kfsItalic, CP)
		  call pdf.EndPage
		  
		  call pdf.Append
		  posY = 50.0
		  call pdf.SetLineWidth(0.5)
		  call pdf.SetFillColor(pdf.kPDF_NAVY)
		  
		  if (m_SelMode = pdf.ksmFamilyName) then
		    call pdf.SetFont("Helvetica", pdf.kfsItalic + pdf.kfsUnderlined, 20.0, true, pdf.kcp1252)
		  else
		    call pdf.SetFont("Helvetica-Oblique", pdf.kfsUnderlined, 20.0, true, pdf.kcp1252)
		  end if
		  
		  call pdf.WriteText(50.0, posY, title)
		  call pdf.SetFillColor(pdf.kPDF_BLACK)
		  posY = posY+ 30
		  posY = WritePropertyLine(pdf, 50.0, posY, ("Symbol"), "Symbol", pdf.kfsNone, CP)
		  posY = WritePropertyLine(pdf, 50.0, posY, ("Symbol"), "Symbol-Bold (emulated)", pdf.kfsBold, CP)
		  posY = WritePropertyLine(pdf, 50.0, posY, ("Symbol"), "Symbol-Italic (emulated)", pdf.kfsItalic, CP)
		  call WritePropertyLine(pdf, 50.0, posY, ("Symbol"), "Symbol-BoldItalic (emulated)", pdf.kfsBold + pdf.kfsItalic, CP)
		  call pdf.EndPage
		  
		  if (AllFonts = false) then
		    return
		  end if
		  
		  m_SelMode = pdf.ksmPostScriptName
		  call pdf.SetFontSelMode(m_SelMode)
		  
		  i = 0
		  while (i < FontCount)
		    call pdf.Append
		    posY = 50.0
		    call pdf.SetLineWidth(0.5)
		    call pdf.SetFillColor(pdf.kPDF_NAVY)
		    
		    if (m_SelMode = pdf.ksmFamilyName) then
		      call pdf.SetFont("Helvetica", pdf.kfsItalic + pdf.kfsUnderlined, 20.0, true, pdf.kcp1252)
		    else
		      call pdf.SetFont("Helvetica-Oblique", pdf.kfsUnderlined, 20.0, true, pdf.kcp1252)
		    end if
		    
		    headText = title+" Index: "+str(i)
		    call pdf.WriteText(50.0, posY, headText)
		    call pdf.SetFillColor(pdf.kPDF_BLACK)
		    posY = posY+ 30
		    while (i < FontCount and posY < 780.0)
		      
		      font = Fonts(i)
		      posY = WritePropertyLine(pdf, 50.0, posY, font.FamilyName, font.PostScriptName, font.Style, CP) + 10.0
		      i=i+1
		    wend
		    call pdf.EndPage
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestStandardFonts(PDF as DynaPDFMBS, CP as integer)
		  dim title as string = "Standard Type1 Fonts (code page "
		  dim posY as double = 50.0
		  
		  call pdf.Append
		  call pdf.SetLineWidth(0.5)
		  call pdf.SetStrokeColor(pdf.kPDF_BLACK)
		  call pdf.SetFillColor(pdf.kPDF_NAVY)
		  
		  if (m_SelMode = pdf.ksmFamilyName) then
		    call pdf.SetFont("Helvetica", pdf.kfsItalic + pdf.kfsUnderlined, 20.0, true, pdf.kcp1252)
		  else
		    call pdf.SetFont("Helvetica-Oblique", pdf.kfsUnderlined, 20.0, true, pdf.kcp1252)
		  end if
		  
		  title=title+ GetCodepageAsStr(CP)+")"
		  
		  call pdf.WriteText(50.0, posY, title)
		  call pdf.SetFillColor(pdf.kPDF_BLACK)
		  posY = posY+ 30
		  posY = WriteTextLine(pdf, 50.0, posY, "Helvetica", "Helvetica", pdf.kfsNone, CP) + 20.0
		  posY = WriteTextLine(pdf, 50.0, posY, "Helvetica", "Helvetica-Bold", pdf.kfsBold, CP) + 20.0
		  posY = WriteTextLine(pdf, 50.0, posY, "Helvetica", "Helvetica-Oblique", pdf.kfsItalic, CP) + 20.0
		  posY = WriteTextLine(pdf, 50.0, posY, "Helvetica", "Helvetica-BoldOblique", pdf.kfsItalic + pdf.kfsBold, CP) + 20.0
		  
		  posY = WriteTextLine(pdf, 50.0, posY, "Courier", "Courier", pdf.kfsNone, CP) + 20.0
		  posY = WriteTextLine(pdf, 50.0, posY, "Courier", "Courier-Bold", pdf.kfsBold, CP) + 20.0
		  posY = WriteTextLine(pdf, 50.0, posY, "Courier", "Courier-Oblique", pdf.kfsItalic, CP) + 20.0
		  posY = WriteTextLine(pdf, 50.0, posY, "Courier", "Courier-BoldOblique", pdf.kfsBold + pdf.kfsItalic, CP) + 20.0
		  posY = WriteTextLine(pdf, 50.0, posY, "Times", "Times-Roman", pdf.kfsNone, CP) + 20.0
		  call WriteTextLine(pdf, 50.0, posY, "Times", "Times-Bold", pdf.kfsBold, CP)
		  call pdf.EndPage
		  
		  call pdf.Append
		  posY = 50.0
		  call pdf.SetLineWidth(0.5)
		  call pdf.SetStrokeColor(pdf.kPDF_BLACK)
		  call pdf.SetFillColor(pdf.kPDF_NAVY)
		  
		  if (m_SelMode = pdf.ksmFamilyName) then
		    call pdf.SetFont("Helvetica", pdf.kfsItalic + pdf.kfsUnderlined, 20.0, true, pdf.kcp1252)
		  else
		    call pdf.SetFont("Helvetica-Oblique", pdf.kfsUnderlined, 20.0, true, pdf.kcp1252)
		  end if
		  
		  call pdf.WriteText(50.0, posY, title)
		  call pdf.SetFillColor(pdf.kPDF_BLACK)
		  posY = posY+ 30
		  posY = WriteTextLine(pdf, 50.0, posY, "Times", "Times-Italic", pdf.kfsItalic, CP) + 20.0
		  posY = WriteTextLine(pdf, 50.0, posY, "Times", "Times-BoldItalic", pdf.kfsBold + pdf.kfsItalic, CP) + 20.0
		  
		  // We cannot emulate a font style when trying to select the font with the postscript name.
		  m_SelMode = pdf.ksmFamilyName
		  call pdf.SetFontSelMode(m_SelMode)
		  
		  posY = WriteTextLine(pdf, 50.0, posY, "ZapfDingbats", "ZapfDingbats", pdf.kfsNone, CP) + 20.0
		  posY = WriteTextLine(pdf, 50.0, posY, "ZapfDingbats", "ZapfDingbats-Bold (emulated)", pdf.kfsBold, CP) + 20.0
		  posY = WriteTextLine(pdf, 50.0, posY, "ZapfDingbats", "ZapfDingbats-Italic (emulated)", pdf.kfsItalic, CP) + 20.0
		  posY = WriteTextLine(pdf, 50.0, posY, "ZapfDingbats", "ZapfDingbats-BoldItalic (emulated)", pdf.kfsBold + pdf.kfsItalic, CP) + 20.0
		  posY = WriteTextLine(pdf, 50.0, posY, "Symbol", "Symbol", pdf.kfsNone, CP) + 20.0
		  posY = WriteTextLine(pdf, 50.0, posY, "Symbol", "Symbol-Bold (emulated)", pdf.kfsBold, CP) + 20.0
		  posY = WriteTextLine(pdf, 50.0, posY, "Symbol", "Symbol-Italic (emulated)", pdf.kfsItalic, CP) + 20.0
		  call WriteTextLine(pdf, 50.0, posY, "Symbol", "Symbol-BoldItalic (emulated)", pdf.kfsBold + pdf.kfsItalic, CP)
		  call pdf.EndPage
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestVectorGraphicMethods(PDF as DynapdfMBS)
		  call DrawShapes(pdf, pdf.kddCounterClockwise, pdf.kpcTopDown, "Top Down Coordinates (draw direction counterclockwise)")
		  call DrawShapes(pdf, pdf.kddClockwise, pdf.kpcTopDown, "Top Down Coordinates (draw direction clockwise)")
		  
		  call DrawShapes(pdf, pdf.kddCounterClockwise, pdf.kpcBottomUp, "Bottom Up Coordinates (draw direction counterclockwise)")
		  call DrawShapes(pdf, pdf.kddClockwise, pdf.kpcBottomUp, "Bottom Up Coordinates (draw direction clockwise)")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WritePropertyLine(pdf as dynapdfMBS, PosX as double, PosY as double, fontname as string, displayname as string, Style as integer, CP as integer) As double
		  dim retval as integer
		  dim strRect as double = 300
		  dim orgWidth, w, desc as double
		  dim errText as string
		  
		  if (m_SelMode = pdf.ksmFamilyName) then
		    call pdf.SetFont("Helvetica", pdf.kfsItalic + pdf.kfsUnderlined, 14.0, true, pdf.kcp1252)
		  else
		    call pdf.SetFont("Helvetica-Oblique", pdf.kfsUnderlined, 14.0, true, pdf.kcp1252)
		  end if
		  
		  call pdf.WriteText(PosX, PosY, DisplayName)
		  PosY = posY+ 20.0
		  call pdf.SetFont("Helvetica", pdf.kfsNone, 10.0, false, pdf.kcp1252)
		  call pdf.WriteText(PosX, PosY, "Regular:")
		  call pdf.WriteText(PosX, PosY +10, "Character spacing:")
		  call pdf.WriteText(PosX, PosY +20, "Word spacing:")
		  call pdf.WriteText(PosX, PosY +30, "Text scaling:")
		  call pdf.WriteText(PosX, PosY +40, "Character + word spacing:")
		  call pdf.WriteText(PosX, PosY +50, "Character + word spacing + text scaling:")
		  PosX = PosX+ 200
		  
		  if (m_SelMode = pdf.ksmFamilyName) then
		    retval = pdf.SetFont(FontName, Style, 10.0, true, CP)
		  else
		    retval = pdf.SetFont(DisplayName, Style, 10.0, true, CP)
		  end if
		  
		  if (retval < 0) then
		    errText= pdf.GetErrorMessage
		    call pdf.WriteText(PosX, PosY, errText)
		    call pdf.WriteText(PosX, PosY +10, errText)
		    call pdf.WriteText(PosX, PosY +20, errText)
		    call pdf.WriteText(PosX, PosY +30, errText)
		    call pdf.WriteText(PosX, PosY +40, errText)
		    call pdf.WriteText(PosX, PosY +50, errText)
		    return (PosY + 70.0)
		  end if
		  
		  orgWidth = pdf.GetTextWidth(TEST_TEXT2)
		  if (orgWidth = 0.0) then
		    errText= "unsupported code page"
		    call pdf.WriteText(PosX, PosY, errText)
		    call pdf.WriteText(PosX, PosY +10, errText)
		    call pdf.WriteText(PosX, PosY +20, errText)
		    call pdf.WriteText(PosX, PosY +30, errText)
		    call pdf.WriteText(PosX, PosY +40, errText)
		    call pdf.WriteText(PosX, PosY +50, errText)
		    return (PosY + 70.0)
		  end if
		  
		  desc = pdf.GetDescent
		  
		  call pdf.WriteText(PosX, PosY, TEST_TEXT)
		  PosY = PosY+ 10.0
		  call pdf.SetCharacterSpacing((strRect - orgWidth) / (CHAR_COUNT -1))
		  call pdf.WriteText(PosX, PosY, TEST_TEXT2)
		  w = pdf.GetTextWidth(TEST_TEXT2)
		  call pdf.Rectangle(PosX, PosY + desc / 2, w, 10.0, pdf.kfmStroke)
		  call pdf.SetCharacterSpacing(0.0)
		  
		  call pdf.SetWordSpacing((strRect - orgWidth) / SPACE_COUNT)
		  call pdf.WriteText(PosX, PosY + 10, TEST_TEXT2)
		  w = pdf.GetTextWidth(TEST_TEXT2)
		  call pdf.Rectangle(PosX, PosY + 10 + desc / 2, w, 10.0, pdf.kfmStroke)
		  call pdf.SetWordSpacing(0.0)
		  
		  call pdf.SetTextScaling((strRect / orgWidth) * 100)
		  call pdf.WriteText(PosX, PosY + 20, TEST_TEXT2)
		  w = pdf.GetTextWidth(TEST_TEXT2)
		  call pdf.Rectangle(PosX, PosY + 20 + desc / 2, w, 10.0, pdf.kfmStroke)
		  call pdf.SetTextScaling(100.0)
		  
		  call pdf.SetCharacterSpacing(5.0)
		  w = pdf.GetTextWidth(TEST_TEXT2)
		  call pdf.SetWordSpacing((strRect - w) / SPACE_COUNT)
		  call pdf.WriteText(PosX, PosY + 30, TEST_TEXT2)
		  w = pdf.GetTextWidth(TEST_TEXT2)
		  call pdf.Rectangle(PosX, PosY + 30 + desc / 2, w, 10.0,pdf.kfmStroke)
		  call pdf.SetCharacterSpacing(0.0)
		  call pdf.SetWordSpacing(0.0)
		  
		  call pdf.SetCharacterSpacing(3.0)
		  call pdf.SetWordSpacing(5.0)
		  w = pdf.GetTextWidth(TEST_TEXT2)
		  call pdf.SetTextScaling((strRect / w) * 100)
		  call pdf.WriteText(PosX, PosY + 40, TEST_TEXT2)
		  w = pdf.GetTextWidth(TEST_TEXT2)
		  call pdf.Rectangle(PosX, PosY + 40 + desc / 2, w, 10.0, pdf.kfmStroke)
		  call pdf.SetCharacterSpacing(0.0)
		  call pdf.SetWordSpacing(0.0)
		  call pdf.SetTextScaling(100.0)
		  
		  return (PosY + 60.0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WriteTextLine(pdf as DynapdfMBS, PosX as double, PosY as double, FontName as string, DisplayName as string, Style as integer, CP as integer) As double
		  dim retval as integer
		  dim errText as string = "unsupported Codepage!"
		  
		  call pdf.SetFont("Helvetica", pdf.kfsUnderlined, 14.0, true, pdf.kcp1252)
		  call pdf.WriteText(PosX, PosY, DisplayName)
		  call pdf.SetFont("Helvetica", pdf.kfsNone, 10.0, true, pdf.kcp1252)
		  PosY = PosY+ 20
		  call pdf.WriteText(PosX, PosY, "Font style pdf.kfsNone:")
		  call pdf.WriteText(PosX, PosY + 10.0, "Font style pdf.kfsUnderlined:")
		  call pdf.WriteText(PosX, PosY + 20.0, "Font style pdf.kfsStriked")
		  call pdf.WriteText(PosX, PosY + 30.0, "Font style pdf.kfsUnderlined + pdf.kfsStriked:")
		  
		  if (m_SelMode = pdf.ksmFamilyName) then
		    retval = pdf.SetFont(FontName, Style, 10.0, true, CP)
		  else
		    retval = pdf.SetFont(DisplayName, Style, 10.0, true, CP)
		  end if
		  
		  if (retval >= 0) then
		    PosX = PosX+ 170
		    call pdf.WriteText(PosX, PosY, TEST_TEXT)
		    call pdf.ChangeFontStyle(BitwiseOr(Style, pdf.kfsUnderlined))
		    call pdf.WriteText(PosX, PosY + 10.0, TEST_TEXT)
		    call pdf.ChangeFontStyle BitwiseOr(Style, pdf.kfsStriked)
		    call pdf.WriteText(PosX, PosY + 20.0, TEST_TEXT)
		    call pdf.ChangeFontStyle bitwiseor(Style , pdf.kfsUnderlined + pdf.kfsStriked)
		    call pdf.WriteText(PosX, PosY + 30.0, TEST_TEXT)
		    call pdf.ChangeFontStyle(Style)
		  else
		    PosX = PosX+ 170
		    call pdf.WriteText(PosX, PosY, errText)
		    call pdf.ChangeFontStyle BitwiseOr(Style , pdf.kfsUnderlined)
		    call pdf.WriteText(PosX, PosY + 10.0, errText)
		    call pdf.ChangeFontStyle BitwiseOr(Style , pdf.kfsStriked)
		    call pdf.WriteText(PosX, PosY + 20.0, errText)
		    call pdf.ChangeFontStyle BitwiseOr(Style , pdf.kfsUnderlined + pdf.kfsStriked)
		    call pdf.WriteText(PosX, PosY + 30.0, errText)
		    call pdf.ChangeFontStyle(Style)
		  end if
		  return (PosY + 30.0)
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		FontCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		fonts(-1) As pdffont
	#tag EndProperty

	#tag Property, Flags = &h0
		m_SelMode As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		TimeStart As Integer
	#tag EndProperty


	#tag Constant, Name = CHAR_COUNT, Type = Double, Dynamic = False, Default = \"20", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SPACE_COUNT, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TEST_TEXT, Type = String, Dynamic = False, Default = \"The quick brown fox and the lazy mouse. \xC3\xA4\xC3\xB6\xC3\xBC \xC3\x84\xC3\x96\xC3\x9C @", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TEST_TEXT2, Type = String, Dynamic = False, Default = \"The quick brown fox.", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="m_SelMode"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TimeStart"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontCount"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
