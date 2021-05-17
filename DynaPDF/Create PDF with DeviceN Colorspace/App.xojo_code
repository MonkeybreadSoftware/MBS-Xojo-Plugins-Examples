#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // In this example we create a DeviceN color space that contains the process colorants Cyan, Magenta, and Yellow. 
		  // The alternate color space is of course DeviceCMYK. The definition of the PostScript calculator function is 
		  // very simple in this example because we need to add the missing Black component only. The array cls includes
		  // also the Black component here because we need the colorant names later to add the definition of the process
		  // components to the DeviceN color space:
		  
		  
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with DeviceN Colorspace.pdf")
		  
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  call pdf.CreateNewPDF f
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  dim cls() as string = array("Cyan", "Magenta", "Yellow") // without "Black"
		  dim ps as string = "{0}" // Just add the missing Black component
		  
		  
		  // Note that the Black component is not part of the DeviceN color space
		  dim cs as integer = pdf.CreateDeviceNColorSpace(cls, ps, pdf.kesDeviceCMYK, -1)
		  // Optional but strongly recommended: Add the defintion of the process 
		  // colorants to the DeviceN color space. 
		  
		  cls = array("Cyan", "Magenta", "Yellow", "Black")
		  
		  call pdf.AddDeviceNProcessColorants(cs, cls, pdf.kesDeviceCMYK, -1)
		  // Draw a rectangle in the alternate DeviceCMYK color space
		  call pdf.SetFillColorSpace(pdf.kcsDeviceCMYK)
		  call pdf.SetFillColor(pdf.CMYK(135, 65, 160, 0))
		  call pdf.Rectangle(50.0, 50.0, 200.0, 100.0, pdf.kfmFill)
		  
		  // Now we use the DeviceN color space. The colors of both rectangles must 
		  // be identically. If you see a difference, then disable the output
		  // preview in Adobe's Acrobat, since the color is converted into the 
		  // simulation profile otherwise... 
		  
		  call pdf.SetExtColorSpace(cs) 
		  
		  call pdf.SetFillColorEx 135, 65, 160
		  call pdf.Rectangle(50.0, 150.0, 200.0, 100.0, pdf.kfmFill)
		  
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
