#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("SetFillColor Test.pdf")
		  call pdf.CreateNewPDF f
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Realbasic output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Realbasic test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Realbasic output"
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  
		  call pdf.SetFont "Times", pdf.kfsItalic, 20.0, true, pdf.kcp1252
		  call pdf.WriteText 50.0, 100.0, "Do you see difference in color?"
		  
		  call pdf.SetFont "Times", pdf.kfsItalic, 20.0, true, pdf.kcp1252
		  call pdf.WriteText 50.0, 200.0, "Left is 50% gray exactly, but right is 127/255 which is 49.8%"
		  
		  // use float
		  call pdf.SetFillColor array(0.5, 0.0, 0.0)
		  call pdf.Rectangle(50.0, 300, 200, 200.0, pdf.kfmFill)
		  
		  // use integer
		  call pdf.SetFillColor pdf.RGB(127, 0, 0)
		  call pdf.Rectangle(300.0, 300, 200.0, 200.0, pdf.kfmFill)
		  call pdf.EndPage
		  
		  
		  call pdf.Append
		  
		  dim h as Double = pdf.GetPageHeight
		  
		  call pdf.SetFont("Times", 0, 1, true, pdf.kcp1252)
		  
		  dim x as Double
		  for i as integer = 0 to 1000
		    dim v as Double = i/1000.0
		    dim y as Double = v*h
		    
		    v = 0.5+v/10.0
		    
		    // use float
		    call pdf.SetFillColor array(v, 0.0, 0.0)
		    
		    call pdf.Rectangle(250.0, y, 50, 1, pdf.kfmFill)
		    
		    call pdf.WriteText(220.0, y, str(v))
		    
		    // use integer
		    dim r as integer = v * 255.0
		    call pdf.SetFillColor pdf.RGB(r, 0, 0)
		    
		    call pdf.Rectangle(300.0, y, 50.0, 1.0, pdf.kfmFill)
		    
		    call pdf.WriteText(355, y, str(r/255.0))
		    
		    
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
