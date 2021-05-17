#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with Angle Text.pdf")
		  
		  // create new PDF
		  call pdf.CreateNewPDF f
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  // We want to use top-down coordinates 
		  'call pdf.SetPageCoords pdf.kpcTopDown
		  
		  // new page
		  call pdf.Append
		  
		  // black
		  call pdf.SetStrokeColor 0
		  
		  dim alpha as double = 0.0
		  
		  const FontSize = 20
		  
		  call pdf.SetFont( "Arial", pdf.kfsNone, FontSize, true, pdf.kcp1252)
		  dim pageCenter as double = pdf.GetPageWidth / 2.0
		  dim y as double = -(20.0 + pdf.GetDescent) / 2.0 // Font size + descent 
		  
		  for i as integer = 0 to 11
		    const text = "Circular Text"
		    
		    dim w as Double = pdf.GetTextWidth(text)
		    
		    call pdf.SetFillColor( BitwiseOr(&h000000C0, alpha * 128))
		    call pdf.AngleRectangle(alpha, pageCenter, 500, 24, y-fontsize*0.2, w, fontsize, pdf.kfmFill) 
		    
		    call pdf.SetFillColor( BitwiseOr(&h00C08080, alpha * 128))
		    call pdf.WriteAngleText(text, alpha, pageCenter, 500, 24, y) 
		    
		    
		    
		    
		    alpha = alpha + 30.0
		  next
		  
		  
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
