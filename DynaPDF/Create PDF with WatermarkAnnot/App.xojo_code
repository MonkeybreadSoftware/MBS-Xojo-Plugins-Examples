#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Dim pdf As New MyDynapdfMBS
		  Dim f As FolderItem = SpecialFolder.Desktop.Child("Create PDF with WatermarkAnnot.pdf")
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  // Create a new PDF
		  call pdf.CreateNewPDF f
		  
		  // We want to use top-down coordinates
		  Call pdf.SetPageCoords pdf.kpcTopDown
		  
		  // Add a page
		  call pdf.Append
		  
		  
		  // create watermark annotation
		  Dim AnnotHandle As Integer = pdf.WatermarkAnnot(100, 100, 300, 200)
		  
		  // it's empty initially
		  
		  // so we create an annotation appearance stream
		  Dim x As Integer = pdf.CreateAnnotAP(AnnotHandle)
		  
		  // set a color and draw rectangle
		  Call pdf.SetFillColor(&cFF7777)
		  Call pdf.Rectangle 0, 0, 300, 200, pdf.kfmFill
		  
		  Call pdf.SetStrokeColor(&c000000)
		  Call pdf.SetFillColor(&c000000)
		  Call pdf.SetFont("Helvetica", pdf.kfsBold, 30)
		  Call pdf.WriteText(20, 20, "Hello World")
		  
		  // close template
		  Call pdf.EndTemplate
		  
		  // continue with normal drawing on page
		  
		  // end page
		  Call pdf.EndPage
		  
		  
		  // Add a second page
		  Call pdf.Append
		  
		  // let it show on second page, too
		  Call pdf.AddAnnotToPage(2, AnnotHandle)
		  
		  // end page
		  Call pdf.EndPage
		  
		  
		  
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
