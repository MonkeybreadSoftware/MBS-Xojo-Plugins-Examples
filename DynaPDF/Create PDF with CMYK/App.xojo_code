#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with CMYK.pdf")
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF f
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  call pdf.SetColorSpace(pdf.kcsDeviceCMYK)
		  
		  // integer
		  for i as integer = 0 to 255
		    call pdf.SetFillColor(pdf.CMYK(i,0,0,0))
		    call pdf.Rectangle(10+i*2, 30, 3, 10, pdf.kfmFill)
		    call pdf.SetFillColor(pdf.CMYK(0,i,0,0))
		    call pdf.Rectangle(10+i*2, 40, 3, 10, pdf.kfmFill)
		    call pdf.SetFillColor(pdf.CMYK(0,0,i,0))
		    call pdf.Rectangle(10+i*2, 50, 3, 10, pdf.kfmFill)
		    call pdf.SetFillColor(pdf.CMYK(0,0,0,i))
		    call pdf.Rectangle(10+i*2, 60, 3, 10, pdf.kfmFill)
		  next
		  
		  // double
		  for i as integer = 0 to 100
		    dim d as Double = i/100.0
		    call pdf.SetFillColor(array(d,0.0,0.0,0.0))
		    call pdf.Rectangle(10+i*5, 130, 6, 10, pdf.kfmFill)
		    call pdf.SetFillColor(array(0.0,d,0.0,0.0))
		    call pdf.Rectangle(10+i*5, 140, 6, 10, pdf.kfmFill)
		    call pdf.SetFillColor(array(0.0,0.0,d,0.0))
		    call pdf.Rectangle(10+i*5, 150, 6, 10, pdf.kfmFill)
		    call pdf.SetFillColor(array(0.0,0.0,0.0,d))
		    call pdf.Rectangle(10+i*5, 160, 6, 10, pdf.kfmFill)
		  next
		  
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
