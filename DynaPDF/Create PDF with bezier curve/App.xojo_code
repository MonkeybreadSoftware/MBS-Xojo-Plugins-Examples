#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF.pdf")
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF f
		  call pdf.Append
		  
		  
		  dim x0 as Double = 100
		  dim y0 as Double = 100
		  dim x1 as Double = 100
		  dim y1 as Double = 300
		  dim x2 as Double = 300
		  dim y2 as Double = 300
		  dim x3 as Double = 300
		  dim y3 as Double = 100
		  
		  call pdf.SetLineWidth 2
		  call pdf.SetStrokeColor(pdf.RGB(100,100,100))
		  call pdf.Rectangle x0, y0, 200, 200, pdf.kfmStroke
		  
		  call pdf.SetLineWidth 5
		  call pdf.SetStrokeColor(pdf.RGB(255,0,0))
		  call pdf.MoveTo x0, y0
		  call pdf.Bezier_1_2_3(x1, y1, x2, y2, x3, y3)
		  call pdf.StrokePath
		  
		  
		  
		  x0 = 100
		  y0 = 320
		  x1 = 100
		  y1 = 520
		  x2 = 300
		  y2 = 520
		  x3 = 300
		  y3 = 320
		  
		  call pdf.SetLineWidth 2
		  call pdf.SetStrokeColor(pdf.RGB(100,100,100))
		  call pdf.Rectangle x0, y0, 200, 200, pdf.kfmStroke
		  
		  call pdf.SetLineWidth 5
		  call pdf.SetStrokeColor(pdf.RGB(0,0,255))
		  call pdf.MoveTo x0, y0
		  call pdf.Bezier_1_3(x1, y1, x3, y3)
		  call pdf.StrokePath
		  call pdf.SetStrokeColor(pdf.RGB(0,255,0))
		  call pdf.MoveTo x0, y0
		  call pdf.Bezier_2_3(x2, y2, x3, y3)
		  call pdf.StrokePath
		  
		  
		  
		  
		  
		  x0 = 100
		  y0 = 540
		  x1 = 100
		  y1 = 740
		  x2 = 300
		  y2 = 540
		  x3 = 300
		  y3 = 740
		  
		  call pdf.SetLineWidth 2
		  call pdf.SetStrokeColor(pdf.RGB(100,100,100))
		  call pdf.Rectangle x0, y0, 200, 200, pdf.kfmStroke
		  
		  call pdf.SetLineWidth 5
		  call pdf.SetStrokeColor(pdf.RGB(255,0,0))
		  call pdf.MoveTo x0, y0
		  call pdf.Bezier_1_2_3(x1, y1, x2, y2, x3, y3)
		  call pdf.StrokePath
		  
		  
		  
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
