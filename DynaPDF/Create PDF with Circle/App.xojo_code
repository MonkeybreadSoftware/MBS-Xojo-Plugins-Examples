#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with Circle.pdf")
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  // Create a new PDF
		  call pdf.CreateNewPDF f
		  
		  // We want to use top-down coordinates
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  // Add a page
		  call pdf.Append
		  
		  // a circle, filled
		  call pdf.SetFillColor pdf.RGB(0,255,0) // green
		  call pdf.DrawCircle(100, 100, 100, pdf.kfmFill)
		  
		  // a circle, stoked
		  call pdf.SetStrokeColor pdf.RGB(255,0,0) // red
		  call pdf.DrawCircle(200, 200, 100, pdf.kfmStroke)
		  
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
