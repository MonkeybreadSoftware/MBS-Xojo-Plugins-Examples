#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  pdf = new MyDynapdfMBS  // pdf is a property of the module in this example
		  
		  'dim d as new date
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with Arabic and Ligatures.pdf")
		  call pdf.CreateNewPDF f
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  dim text as string = "مرحبا العالم"  // Some strings to try
		  'dim text as string = "الله اكبر"
		  'dim text as string = "الحمد الله"
		  'dim text as string = "الاولي"
		  'dim text as string = "المحظوظ"
		  'dim text as string = "٠٫٧٥ - ١٫٢٥ متر"
		  'msgBox text
		  
		  call pdf.SetFont "Helvetica", pdf.kfsNone, 18.0, true, pdf.kcpUnicode
		  call pdf.WriteFTextex 100, 160, 300, 300, pdf.ktaCenter, "Original Text"
		  
		  hFont = pdf.SetFont (kFont, pdf.kfsNone, 40.0, true, pdf.kcpUnicode)  // Set the font handle we use for validating the converted glyphs
		  call pdf.WriteFTextex 100, 100, 300, 300, pdf.ktaCenter, text
		  
		  'dim Pos as integer = pdf.TestGlyphs( hFont, text )
		  'if Pos <> -1 Then
		  'MsgBox "Error: Glyph at position "+str(Pos)+" was missing!"
		  'end if
		  '
		  // this is convert method we tried
		  // not quite 100% perfect yet
		  // gives acceptable results with: Arial, Courier New, Arial Unicode MS, Traditional Arabic, Al Nile, Al Tarikh, Damascus, DecoType Naskh, 
		  // Farah, Geeza Pro, Muna, Thuluth - also Baghdad and Nadeem but with small visual glitches
		  
		  dim textCorrected() as integer = ArabicConverterModule.Convert(text)
		  
		  call pdf.SetFont "Helvetica", pdf.kfsNone, 18.0, true, pdf.kcpUnicode
		  call pdf.WriteFTextex 100, 260, 300, 300, pdf.ktaCenter, "Converted Text"
		  
		  call pdf.SetFont kFont, pdf.kfsNone, 40.0, true, pdf.kcpUnicode
		  call pdf.WriteFTextEx 100, 200, 300, 300, pdf.ktaCenter, textCorrected
		  
		  call pdf.EndPage
		  
		  call pdf.CloseFile
		  
		  f.Launch
		  
		  quit
		End Sub
	#tag EndEvent


	#tag Constant, Name = kFont, Type = String, Dynamic = False, Default = \"Al Tarikh", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
