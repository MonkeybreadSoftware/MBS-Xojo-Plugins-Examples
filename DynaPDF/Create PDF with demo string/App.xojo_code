#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with demo string.pdf")
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF f
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  // We want to use top-down coordinates 
		  'call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  // Just a test string...
		  dim demoString as string = "My Demo String"
		  
		  // Write the demo string on this page
		  
		  // Get the bounding boxes
		  dim mediaBox as DynaPDFRectMBS = pdf.GetBBox(PDF.kpbMediaBox)
		  dim cropBox  as DynaPDFRectMBS = pdf.GetBBox(PDF.kpbCropBox)
		  
		  // Compute the mid point and rotation angle
		  
		  dim ph, pw, rCenterX, rCenterY, alpha, c as Double
		  
		  if cropBox<>nil then
		    pw = cropBox.Right - cropBox.Left
		    ph = cropBox.Top - cropBox.Bottom
		    rCenterX = cropBox.Left   + pw * 0.5
		    rCenterY = cropBox.Bottom + ph * 0.5
		    c = sqrt(pw * pw + ph * ph)
		    alpha = asin(ph / c)
		  else
		    pw = mediaBox.Right - mediaBox.Left
		    ph = mediaBox.Top - mediaBox.Bottom
		    rCenterX = mediaBox.Left   + pw * 0.5
		    rCenterY = mediaBox.Bottom + ph * 0.5
		    c = sqrt(pw * pw + ph * ph)
		    alpha = asin(ph / c)
		  end if
		  
		  // The string width and Cap Height should be pre-computed if the string is static.
		  // The font size must be set to 1000.0!
		  call pdf.SetFont("Helvetica", pdf.kfsBold, 1000.0, true, pdf.kcp1252)
		  dim textWidth as double = pdf.GetTextWidth(demoString) / 1000.0
		  // We need the cap height to center the text verticaly.
		  dim capHeight as double = pdf.GetCapHeight / 1000.0
		  
		  
		  // Now we must compute the font size. The divisor (6.0 in this example) depends on the string width.
		  // The value 6.0 produces good results with this demo string. If the string is longer or shorter then
		  // you must adjust the divisor. Once a good value was found it works with every page format.
		  // If the string is not static then you need to compute the divisor from the text's bounding box and page
		  // format. However, this is usually not required. DynaPDF uses a static divisor...
		  dim fontsize as Double
		  
		  if pw > ph then
		    fontSize = ph / 6.0
		  else
		    fontSize = pw / 6.0
		  end if
		  
		  if fontSize < 1.0 then 
		    fontSize = 10.0
		  end if
		  
		  dim si as double = sin(alpha)
		  dim co as double = cos(alpha)
		  
		  // Center the text on the page
		  dim tCenterX as double = (textWidth * fontSize) * 0.5
		  dim tCenterY as double = (capHeight * fontSize) * 0.5
		  
		  dim x as double = rCenterX - co * tCenterX
		  dim y as double = rCenterY - si * tCenterX
		  
		  dim tx as double = co * tCenterY
		  dim ty as double = si * tCenterY
		  
		  tx = sqrt(tCenterY * tCenterY - tx * tx)
		  ty = sqrt(tCenterY * tCenterY - ty * ty)
		  
		  x = x + tx
		  y = y - ty
		  
		  // Create a transformation matrix
		  dim m as new DynapdfMatrixMBS
		  m.a = co
		  m.b = si
		  m.c = -si
		  m.d = co
		  m.x = x
		  m.y = y
		  
		  // Now we can output the text.
		  call pdf.ChangeFontSize(fontSize)
		  call pdf.SetLineWidth(1.0)
		  call pdf.SetColorSpace(pdf.kcsDeviceRGB)
		  call pdf.SetStrokeColor(&h1F52C8)
		  call pdf.SetTextDrawMode(pdf.kdmStroke)
		  
		  call pdf.WriteTextMatrix(m, demoString)
		  
		  
		  
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
