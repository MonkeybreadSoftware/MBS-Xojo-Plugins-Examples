#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  dim text as string
		  dim height as double
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with rotated text.pdf")
		  call pdf.CreateNewPDF f
		  
		  // We want to use top-down coordinates 
		  
		  call pdf.Append
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  
		  
		  // set font
		  call pdf.SetFont "Helvetica", 0, 12.0, true, pdf.kcpUnicode
		  
		  // draw some text
		  text = "Hello World. 0°"
		  call pdf.WriteFTextEx(50, 50, 200, -1, pdf.ktaLeft, text)
		  
		  call pdf.SetOrientationEx(90)
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  // draw some text
		  text = "Hello World. 90°"
		  call pdf.WriteFTextEx(50, 50, 200, -1, pdf.ktaLeft, text)
		  
		  call pdf.SetOrientationEx(90)
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  // draw some text
		  text = "Hello World. 180°"
		  call pdf.WriteFTextEx(50, 50, 200, -1, pdf.ktaLeft, text)
		  
		  call pdf.SetOrientationEx(90)
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  // draw some text
		  text = "Hello World. 270°"
		  call pdf.WriteFTextEx(50, 50, 200, -1, pdf.ktaLeft, text)
		  
		  call pdf.SetOrientationEx(90)
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  // draw some text
		  text = "Hello World. 0° again"
		  call pdf.WriteFTextEx(50, 70, 200, -1, pdf.ktaLeft, text)
		  
		  
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
