#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with Round Rectangles.pdf")
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  // Create a new PDF
		  call pdf.CreateNewPDF f
		  
		  // We want to use top-down coordinates
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  // Add a page
		  call pdf.Append
		  
		  // black
		  call pdf.SetStrokeColor pdf.RGB(0,0,0)
		  call pdf.SetFillColor pdf.RGB(255,0,0)
		  call pdf.SetFont("Arial", 0, 12, false, pdf.kcp1252)
		  
		  
		  call pdf.Rectangle(100, 100, 100, 50, pdf.kfmFillStroke)
		  call pdf.Rectangle(100, 200, 100, 50, pdf.kfmStroke)
		  call pdf.Rectangle(100, 300, 100, 50, pdf.kfmFill)
		  
		  call pdf.RoundRect(300, 100, 100, 50, 5, pdf.kfmStroke)
		  call pdf.RoundRect(300, 200, 100, 50, 5, pdf.kfmFillStroke)
		  call pdf.RoundRect(300, 300, 100, 50, 5, pdf.kfmFill)
		  
		  // end page
		  call pdf.EndPage
		  
		  // Close page
		  call pdf.CloseFile
		  
		  // Open PDF
		  f.Launch
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
