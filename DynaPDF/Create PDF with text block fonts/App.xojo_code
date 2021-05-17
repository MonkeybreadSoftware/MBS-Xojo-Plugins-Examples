#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  dim text as string
		  dim height as double
		  dim TimesBoldHandle as integer
		  dim TimesHandle as integer
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with text block fonts.pdf")
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF f
		  call pdf.SetViewerPreferences pdf.kvpDisplayDocTitle,pdf.kavNone
		  call pdf.SetDocInfo pdf.kdiAuthor, "Christian Schmitz"
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  // load fonts
		  TimesBoldHandle=pdf.SetFont("Times", pdf.kfsBold, 20.0, true, pdf.kcp1252)
		  TimesHandle=pdf.SetFont("Times", pdf.kfsItalic, 20.0, true, pdf.kcp1252)
		  
		  text="In Italic font: Left aligned text, this is left aligned text, this is " + _
		  "left aligned text...\ju#\FC[255]This is justified text, this is " + _
		  "justified text, this is justified text, this is justified text, this " + _
		  "is justified text, this is justified text, this is justified text, " + _
		  "this is justified text...\re#\FC[165536]This is right aligned text, " + _
		  "this is right aligned text, this is right aligned text..." + _
		  "\le#\FC[233512]Back to left aligned text, we go back to left " + _
		  "aligned text... \FT["+str(TimesBoldHandle)+"]Now we use bold text."
		  
		  call pdf.SetTextRect(50, 50, 150, -1)
		  call pdf.WriteFText(pdf.ktaLeft, text)
		  height = pdf.GetPageHeight - pdf.GetLastTextPosY - 50
		  call pdf.Rectangle( 50, 50, 150, height, pdf.kfmStroke)
		  
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
