#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with centimeters.pdf")
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  // Create a new PDF
		  call pdf.CreateNewPDF f
		  
		  // Add a page
		  call pdf.Append
		  
		  call pdf.SaveGraphicState
		  
		  // black
		  call pdf.SetStrokeColor 0
		  
		  dim factor as Double = 72.0/2.54
		  
		  dim PageWidthCM as Double = pdf.GetPageWidth / factor
		  dim PageHeightCM as Double = pdf.GetPageHeight / factor
		  
		  call pdf.ScaleCoords factor, factor
		  
		  // now we can specify coordinates in centimeters!
		  
		  // font size: 0.8 cm
		  call pdf.SetFont("Arial", 0, 0.8, true, pdf.kcp1252)
		  
		  // draw at 1.0/1.0 cm
		  call pdf.WriteText(1.0, 1.0, "Hello World")
		  
		  
		  // line up
		  call pdf.SetLineWidth(0.1) // 1 millimeter
		  call pdf.MoveTo(2.0, 2.0)
		  call pdf.LineTo(PageWidthCM-2.0, PageHeightCM-2.0)
		  call pdf.StrokePath
		  
		  call pdf.RestoreGraphicState
		  
		  // end page
		  call pdf.EndPage
		  
		  // Close page
		  call pdf.CloseFile
		  
		  // Open PDF
		  f.Launch
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
