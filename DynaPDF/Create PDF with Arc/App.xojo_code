#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with Arc.pdf")
		  
		  // create new PDF
		  call pdf.CreateNewPDF f
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  // new page
		  call pdf.Append
		  
		  // black
		  call pdf.SetStrokeColor 0
		  
		  // draw an arc
		  call pdf.DrawArcEx 100,100,100,100, 90,180
		  call pdf.StrokePath
		  
		  // and a second one
		  call pdf.DrawArcEx 200,200,100,100, 0,90
		  call pdf.StrokePath
		  
		  // and a third one. 0 to 0 gives a full circle
		  call pdf.DrawArcEx 300,300,100,100, 0,0
		  call pdf.StrokePath
		  
		  // finish page
		  call pdf.EndPage
		  
		  // Close file
		  call pdf.CloseFile
		  
		  // open PDF
		  f.Launch
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
