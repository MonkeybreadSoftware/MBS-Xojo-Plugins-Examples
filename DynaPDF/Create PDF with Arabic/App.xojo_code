#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  
		  dim pdf as new MyDynapdfMBS
		  
		  dim d as new date
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with Arabic.pdf")
		  call pdf.CreateNewPDF f
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  dim text as string = "مرحبا العالم"
		  
		  // todo: convert from unicode text into right glyph
		  
		  dim glyphs() as integer
		  glyphs.Append &hFEE3
		  glyphs.Append &hFEAE
		  glyphs.Append &hFEA3
		  glyphs.Append &hFE92
		  glyphs.Append &hFE8E
		  glyphs.Append 32 // space
		  glyphs.Append &h0627
		  glyphs.Append &hFEDF
		  glyphs.Append &hFECC
		  glyphs.Append &hFE8E
		  glyphs.Append &hFEDF
		  glyphs.Append &hFEE2
		  
		  dim Text3 as string = ""
		  for each g as integer in glyphs
		    text3 = text3 + encodings.UTF16.Chr(g)
		  next
		  '
		  '// reverse it
		  '
		  'dim text2 as string
		  'for i as integer = len(text) downto 1
		  'text2 = text2 + mid(text, i, 1)
		  'next
		  
		  // and put ob page
		  call pdf.SetFont "Helvetica", pdf.kfsNone, 20.0, true, pdf.kcpUnicode
		  call pdf.WriteFTextex 100, 350, 300, 300, pdf.ktaCenter, "Original Text"
		  
		  call pdf.SetFont "Baghdad", pdf.kfsNone, 40.0, true, pdf.kcpUnicode
		  call pdf.WriteFTextex 100, 300, 300, 300, pdf.ktaCenter, text
		  
		  // this is convert method we tried
		  // not 100% perfect yet
		  
		  dim textCorrected as string = ArabicConverterModule.Convert(text)
		  
		  call pdf.SetFont "Helvetica", pdf.kfsNone, 20.0, true, pdf.kcpUnicode
		  call pdf.WriteFTextex 100, 250, 300, 300, pdf.ktaCenter, "Converted Text"
		  
		  call pdf.SetFont "Baghdad", pdf.kfsNone, 40.0, true, pdf.kcpUnicode
		  call pdf.WriteFTextEx 100, 200, 300, 300, pdf.ktaCenter, textCorrected
		  
		  // reverse it
		  
		  for i as integer = 1 to len(textCorrected) 
		    System.DebugLog str(asc(mid(textCorrected, i, 1)))
		  next
		  
		  dim text2 as string
		  for i as integer = len(textCorrected) downto 1
		    text2 = text2 + mid(textCorrected, i, 1)
		  next
		  
		  call pdf.SetFont "Helvetica", pdf.kfsNone, 20.0, true, pdf.kcpUnicode
		  call pdf.WriteFTextex 100, 150, 300, 300, pdf.ktaCenter, "Convert & Reverse Text"
		  
		  call pdf.SetFont "Baghdad", pdf.kfsNone, 40.0, true, pdf.kcpUnicode
		  call pdf.WriteFTextEx 100, 100, 300, 300, pdf.ktaCenter, text2
		  
		  call pdf.SetFont "Helvetica", pdf.kfsNone, 20.0, true, pdf.kcpUnicode
		  call pdf.WriteFTextex 100, 450, 300, 300, pdf.ktaCenter, "Text with Glypths"
		  
		  call pdf.SetFont "Baghdad", pdf.kfsNone, 40.0, true, pdf.kcpUnicode
		  call pdf.WriteFTextEx 100, 400, 300, 300, pdf.ktaCenter, text3
		  
		  call pdf.EndPage
		  
		  call pdf.CloseFile
		  
		  f.Launch
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
