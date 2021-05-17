#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  
		  pdf.SetLicenseKey "Lite" // For this example you can use a Lite, Pro or Enterprise License
		  
		  // you need DynaPDF Pro + PDF/A extension for fixing imported PDFs and convert to PDF/A.
		  
		  // now make PDF
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDFA.pdf")
		  
		  call pdf.CreateNewPDF f
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "PDF/A Compatibility"
		  call pdf.setPDFVersion(DynapdfMBS.kpvPDFA_2005)
		  
		  // set language
		  call pdf.SetLanguage "en-US"
		  
		  call pdf.CreateStructureTree
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  // Just set the trim box to the same value as the media box if no  
		  // better value is known. 
		  
		  dim r as DynaPDFRectMBS = pdf.GetBBox(pdf.kpbMediaBox)
		  call pdf.SetBBox(pdf.kpbTrimBox, r.Left, r.Bottom, r.Right, r.Top)
		  
		  
		  // fonts must be in the windows format
		  // so best copy them from a windows machine
		  // copy the Tahoma font from Windows to the fonts folder
		  // the font is embedded
		  'call pdf.AddFontSearchPath SpecialFolder.Desktop.Child("fonts"),true
		  'call pdf.SetFont "Tahoma", pdf.kfsItalic, 40.0, true, pdf.kcp1252
		  
		  call pdf.SetFont "Times", pdf.kfsItalic, 40.0, true, pdf.kcp1252
		  call pdf.SetColorSpace(pdf.kcsDeviceRGB)
		  
		  dim co as integer = 255
		  call pdf.SetFillColor(co)
		  call pdf.WriteFText(pdf.ktaCenter, "A very simple PDF/A compliant PDF file...")
		  call pdf.EndPage
		  
		  dim retval as integer = pdf.CheckConformance(pdf.kctPDFA_1b_2005, 0) // pdf.kcoDefault
		  
		  // add missing output intent
		  Select case retval
		  case 1
		    call pdf.AddOutputIntent(FindFile("Generic RGB Profile.icc")) // RGB
		  case 2
		    call pdf.AddOutputIntent(FindFile("Generic CMYK Profile.icc")) // CMYK
		  case 3
		    call pdf.AddOutputIntent(FindFile("Generic Gray Profile.icc")) // Gray
		  end Select
		  
		  
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
