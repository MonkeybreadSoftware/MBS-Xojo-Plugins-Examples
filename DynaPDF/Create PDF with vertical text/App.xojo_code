#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF.pdf")
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF f
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  call pdf.Append
		  
		  call pdf.SaveGraphicState
		  // move to place where top left point is
		  call pdf.TranslateCoords(100, pdf.GetPageHeight-400)
		  
		  // rotate in place by 90°
		  call pdf.RotateCoords(90, 0,0)
		  
		  // draw a rectangle so we see where we are
		  call pdf.SetFillColor(pdf.RGB(255, 200, 200)) // light red
		  call pdf.Rectangle(0, 0, 100, -100, pdf.kfmFill)
		  
		  // and a little black dot
		  call pdf.SetFillColor(0) // black
		  call pdf.Rectangle(0, 0, 2, -2, pdf.kfmFill)
		  
		  // and finally some text
		  call pdf.SetTextRect 0, 0, 300, 200
		  call pdf.SetFont "Times", pdf.kfsItalic, 40.0, true, pdf.kcp1252
		  call pdf.WriteFText pdf.ktaCenter, "My first Xojo output!"
		  call pdf.RestoreGraphicState // don't forget to restore
		  
		  call pdf.SetFont "Times", pdf.kfsItalic, 20.0, true, pdf.kcp1252
		  call pdf.WriteText 50.0, 180.0, "File created: " + d.LongDate
		  
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
