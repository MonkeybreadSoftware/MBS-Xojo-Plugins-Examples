#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with Dashed Line.pdf")
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  // Create a new PDF
		  call pdf.CreateNewPDF f
		  pdf.TraceFile = SpecialFolder.Desktop.Child("trace.txt")
		  
		  // We want to use top-down coordinates
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  // Add a page
		  call pdf.Append
		  
		  // black
		  call pdf.SetStrokeColor 0
		  call pdf.SetLineWidth 2
		  
		  call pdf.setLineDashPattern "", 0
		  call pdf.MoveTo(100,100)
		  call pdf.LineTo(300,100)
		  call pdf.StrokePath
		  
		  call pdf.setLineDashPattern "3", 0
		  call pdf.MoveTo(100,150)
		  call pdf.LineTo(300,150)
		  call pdf.StrokePath
		  
		  call pdf.setLineDashPattern "2", 1
		  call pdf.MoveTo(100,200)
		  call pdf.LineTo(300,200)
		  call pdf.StrokePath
		  
		  call pdf.setLineDashPattern "2 1", 0
		  call pdf.MoveTo(100,250)
		  call pdf.LineTo(300,250)
		  call pdf.StrokePath
		  
		  call pdf.setLineDashPattern "3 5", 6
		  call pdf.MoveTo(100,300)
		  call pdf.LineTo(300,300)
		  call pdf.StrokePath
		  
		  call pdf.setLineDashPattern "2 1", 0
		  call pdf.MoveTo(100,350)
		  call pdf.LineTo(300,350)
		  call pdf.StrokePath
		  
		  call pdf.setLineDashPattern "2 3", 11
		  call pdf.MoveTo(100,400)
		  call pdf.LineTo(300,400)
		  call pdf.StrokePath
		  
		  
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
