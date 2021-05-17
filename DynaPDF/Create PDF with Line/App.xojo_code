#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with Line.pdf")
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  // Create a new PDF
		  call pdf.CreateNewPDF f
		  
		  // We want to use top-down coordinates
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  // Add a page
		  call pdf.Append
		  
		  // black
		  call pdf.SetStrokeColor 0
		  
		  // line down
		  call pdf.MoveTo(100,100)
		  call pdf.LineTo(200,200)
		  call pdf.StrokePath
		  
		  // line up
		  call pdf.MoveTo(200,200)
		  call pdf.LineTo(300,100)
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
