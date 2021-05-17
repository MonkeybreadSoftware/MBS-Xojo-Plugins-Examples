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
		  call pdf.SetSaveNewImageFormat false
		  call pdf.SetCompressionFilter pdf.kcfFlate
		  
		  dim JPEGFile as FolderItem = FindFile("MBSLogo_cmyk.jpg")
		  dim TiffFile as FolderItem = FindFile("MBSLogo_cmyk.tif")
		  
		  call pdf.Append
		  
		  // cmyk
		  call pdf.SetFont "Helvetica", 0, 12, true, pdf.kcp1252
		  call pdf.WriteText 100,50, "Insert with CMYK color space"
		  
		  call pdf.SetColorSpace(pdf.kcsDeviceCMYK)
		  call pdf.InsertImage(100, 100, 100, 100, JPEGFile)
		  call pdf.InsertImage(300, 100, 100, 100, TiffFile)
		  
		  // rgb
		  call pdf.SetColorSpace(pdf.kcsDeviceRGB)
		  call pdf.SetFont "Helvetica", 0, 12, true, pdf.kcp1252
		  call pdf.WriteText 100,250, "Insert with RGB color space, so DynaPDF can convert to RGB"
		  
		  call pdf.InsertImage(100, 300, 100, 100, JPEGFile)
		  call pdf.InsertImage(300, 300, 100, 100, TiffFile)
		  
		  call pdf.EndPage
		  call pdf.Append
		  
		  // raw jpeg
		  
		  call pdf.SetColorSpace(pdf.kcsDeviceRGB)
		  call pdf.SetFont "Helvetica", 0, 12, true, pdf.kcp1252
		  call pdf.WriteText 100, 50, "Insert raw with CMYK color space"
		  call pdf.SetColorSpace(pdf.kcsDeviceCMYK)
		  
		  dim ji as new JPEGImporterMBS
		  
		  ji.file = JPEGFile
		  ji.mode = ji.ModeCMYK
		  ji.ImportCMYK
		  
		  dim m as MemoryBlock = ji.PictureData
		  dim RI as new DynaPDFRawImageMBS
		  
		  ri.BitsPerComponent = 8
		  ri.CS = pdf.kcsDeviceCMYK
		  ri.HasAlpha = false
		  ri.Height = ji.Height
		  ri.Width = ji.Width
		  ri.NumComponents = 4
		  ri.setBuffer m
		  ri.Stride = ji.Width*4
		  ri.CSHandle = -1
		  
		  dim r1 as Integer = pdf.InsertRawImageEx(100.0, 100.0, 100.0, 100.0, RI)
		  
		  // raw tiff cmyk
		  dim t as new TiffPictureMBS
		  
		  call t.Open(TiffFile)
		  
		  dim rowBytes as integer = t.BytesPerRow
		  dim data as new MemoryBlock(rowBytes*t.height)
		  
		  for i as integer = 0 to t.height-1
		    m = data.AddressPtrMBS(i*rowBytes)
		    call t.Scanline(m, i)
		  next
		  
		  RI = new DynaPDFRawImageMBS
		  
		  ri.BitsPerComponent = 8
		  ri.CS = pdf.kcsDeviceCMYK
		  ri.HasAlpha = false
		  ri.Height = t.Height
		  ri.Width = t.Width
		  ri.NumComponents = 4
		  ri.Stride = rowBytes
		  ri.setBuffer data
		  ri.CSHandle = -1
		  
		  dim r2 as Integer = pdf.InsertRawImageEx(300.0, 100.0, 100.0, 100.0, RI)
		  
		  
		  call pdf.EndPage
		  call pdf.CloseFile
		  
		  f.Launch
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
