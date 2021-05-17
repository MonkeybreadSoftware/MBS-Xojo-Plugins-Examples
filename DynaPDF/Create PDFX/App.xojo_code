#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim p as LCMS2ProfileMBS = LCMS2ProfileMBS.CreatesRGBProfile
		  dim profilefile as FolderItem = SpecialFolder.Desktop.Child("test.icc")
		  
		  
		  
		  pdf.SetLicenseKey "Lite" // For this example you can use a Lite, Pro or Enterprise License
		  call p.SaveProfileToFile(profilefile)
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDFX.pdf")
		  
		  call pdf.CreateNewPDF f
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "PDF/X Compatibility"
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  // Just set the trim box to the same value as the media box if no  
		  // better value is known. 
		  
		  dim r as DynapdfRectMBS=pdf.GetBBox(pdf.kpbMediaBox)
		  call pdf.SetBBox(pdf.kpbTrimBox, r.Left, r.Bottom, r.Right, r.Top)
		  
		  // The font must be embedded (this should always be the case) 
		  call pdf.SetFont("Times", pdf.kfsItalic, 20.0, true, pdf.kcp1252)
		  call pdf.SetColorSpace(pdf.kcsDeviceRGB)
		  
		  dim co as integer = 255
		  call pdf.SetFillColor(co)
		  call pdf.WriteFText(pdf.ktaCenter, "A very simple PDF/X compliant PDF file...")
		  call pdf.EndPage
		  
		  
		  // The PDF version should be set before the file is closed because  
		  // it can be changed when importing a PDF file. 
		  call pdf.SetPDFVersion(pdf.kpvPDFX1a_2001)
		  call pdf.AddOutputIntent(profilefile)
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
