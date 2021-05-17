#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  
		  pdf.SetLicenseKey "Lite" // For this example you can use a Lite, Pro or Enterprise License
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with transparency.pdf")
		  call pdf.CreateNewPDF f
		  call pdf.SetViewerPreferences pdf.kvpDisplayDocTitle,pdf.kavNone
		  call pdf.SetDocInfo pdf.kdiAuthor, "Christian Schmitz"
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  dim AlphaGS,opaqueGS as integer
		  
		  dim e as new DynapdfExtGStateMBS
		  
		  e.FillAlpha=0.5 // FillAlpha is for filling paths and drawing images
		  e.StrokeAlpha=0.5 // StrokeAlpha is for drawing lines
		  
		  AlphaGS=pdf.CreateExtGState(e)
		  
		  e=new DynapdfExtGStateMBS
		  e.FillAlpha=1.0 // FillAlpha is for filling paths and drawing images
		  e.StrokeAlpha=1.0 // StrokeAlpha is for drawing lines
		  
		  opaqueGS=pdf.CreateExtGState(e)
		  
		  call pdf.SetExtGState AlphaGS
		  
		  DrawPath pdf,   0,0,pdf.kcmWinding, pdf.kddCounterClockwise, pdf.kPDF_SKYBLUE
		  DrawPath pdf, 110,0,pdf.kcmWinding, pdf.kddClockwise,        pdf.kPDF_SKYBLUE
		  
		  call pdf.SetExtGState opaqueGS
		  
		  DrawPath pdf, 220,0,pdf.kcmEvenOdd, pdf.kddCounterClockwise, pdf.kPDF_SKYBLUE
		  DrawPath pdf, 330,0,pdf.kcmEvenOdd, pdf.kddClockwise,        pdf.kPDF_SKYBLUE
		  
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
