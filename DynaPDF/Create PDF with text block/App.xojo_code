#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  dim text as string
		  dim height as double
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with text block.pdf")
		  call pdf.CreateNewPDF f
		  call pdf.SetViewerPreferences pdf.kvpDisplayDocTitle,pdf.kavNone
		  call pdf.SetDocInfo pdf.kdiAuthor, "Christian Schmitz"
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  
		  
		  // set font
		  call pdf.SetFont "Helvetica", 0, 12.0, true, pdf.kcpUnicode
		  dim y as Double = 50
		  
		  // change font size and raise for foot note references
		  text = "\FS[12]Hello World\FS[6]\TR[6]123\TR[0]\FS[12] Just a test."
		  call pdf.WriteFTextEx(50, y, 200, -1, pdf.ktaLeft, text)
		  y = y + 20
		  
		  // change font to get bold
		  text = "\FT[Helvetica]Hello \FT[Helvetica-Bold]World \FT[Helvetica]everyone."
		  call pdf.WriteFTextEx(50, y, 200, -1, pdf.ktaLeft, text)
		  y = y + 20
		  
		  // change color in the text
		  text = _
		  "\FC[" + str(DynaPDFMBS.RGB(255, 0, 0)) + "]Red "+_
		  "\FC[" + str(DynaPDFMBS.RGB(0, 255, 0)) + "]Green "+_
		  "\FC[" + str(DynaPDFMBS.RGB(0, 0, 255)) + "]Blue "+_
		  "\FC[" + str(DynaPDFMBS.RGB(0, 0,   0)) + "]Black "
		  call pdf.WriteFTextEx(50, y, 200, -1, pdf.ktaLeft, text)
		  y = y + 20
		  
		  // make list
		  text = _
		  "\LI[0]First"+EndOfLine+"with two lines\EL#"+_
		  "\LI[0]Second\EL# "+_
		  "\LI[0]Third\EL#"
		  call pdf.WriteFTextEx(50, y, 200, -1, pdf.ktaLeft, text)
		  
		  
		  
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
