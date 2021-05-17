#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  dim BlackPoint, gamma, whitepoint, matrix as memoryBlock
		  dim handle as integer
		  
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with LAB color.pdf")
		  call pdf.CreateNewPDF f
		  call pdf.SetViewerPreferences pdf.kvpDisplayDocTitle,pdf.kavNone
		  call pdf.SetDocInfo pdf.kdiAuthor, "Christian Schmitz"
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  whitepoint=newmemoryBlock(12)
		  // 0.5 is here an example for a possible X and Z value.
		  whitepoint.singleValue(0)=0.5 // X: 
		  whitepoint.singleValue(4)=1.0 // Y: must be 1.0
		  whitepoint.singleValue(8)=0.5 // Z: 
		  
		  // create LAB colorspace
		  handle=pdf.CreateCIEColorSpace(pdf.kesLab, whitepoint, blackPoint, gamma, matrix)
		  
		  // set colorspace
		  call pdf.setextColorSpace handle
		  
		  // draw with LAB colors
		  DrawPath pdf,   0,0,pdf.kcmWinding, pdf.kddCounterClockwise, dynapdfMBS.LAB(66,-51, 67)
		  DrawPath pdf, 110,0,pdf.kcmWinding, pdf.kddClockwise,        dynapdfMBS.LAB(81,  9, 87)
		  DrawPath pdf, 220,0,pdf.kcmEvenOdd, pdf.kddCounterClockwise, dynapdfMBS.LAB(46, 69, 53)
		  DrawPath pdf, 330,0,pdf.kcmEvenOdd, pdf.kddClockwise,        dynapdfMBS.LAB(32,  0,-45)
		  
		  call pdf.EndPage
		  
		  call pdf.CloseFile
		  
		  f.Launch
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub DrawPath(pdf as dynapdfmbs, x as double, y as double, clipmode as integer, drawdirection as integer, colorvalue as integer)
		  call pdf.SaveGraphicState
		  call pdf.SetFillColor(ColorValue)
		  call pdf.Triangle(x+100, y+50, x+150, y+150, x+50, y+150, pdf.kfmNoFill)
		  call pdf.SetDrawDirection(drawdirection)
		  call pdf.Triangle(x+100, y+180, x+50, y+80, x+150, y+80, pdf.kfmNoFill)
		  call pdf.ClipPath(clipMode, pdf.kfmFillStroke)
		  call pdf.SetFont("Times", pdf.kfsBold + pdf.kfsItalic, 40, true, pdf.kcp1252)
		  call pdf.SetFillColor(0)
		  call pdf.WriteText(x+50, y+90, "CLIPPING")
		  call pdf.RestoreGraphicState
		  
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
