#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // for testing we just create RGB profile
		  dim p1 as LCMS2ProfileMBS = LCMS2ProfileMBS.CreatesRGBProfile
		  dim RGBProfileFile as FolderItem = SpecialFolder.Desktop.Child("test rgb.icc")
		  
		  call p1.SaveProfileToFile(RGBProfileFile)
		  
		  
		  // for testing we just create gray profile
		  dim p2 as LCMS2ProfileMBS = LCMS2ProfileMBS.CreateGrayProfile(nil, nil, nil)
		  dim GrayProfileFile as FolderItem = SpecialFolder.Desktop.Child("test gray.icc")
		  
		  call p2.SaveProfileToFile(GrayProfileFile)
		  
		  
		  
		  dim pdf as new MyDynapdfMBS
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF.pdf")
		  
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  
		  
		  // now create PDF
		  call pdf.CreateNewPDF f
		  
		  // PDF/A requires a language set
		  Call pdf.SetLanguage("en-US") 
		  // PDF/A requires a structure tree
		  Call pdf.CreateStructureTree
		  
		  // prepare for PDF/A
		  Dim flags As Integer 
		  flags = Bitwise.BitOr(flags, pdf.kifImportAll)
		  flags = Bitwise.BitOr(flags, pdf.kifImportAsPage)
		  flags = Bitwise.BitOr(flags, pdf.kifPrepareForPDFA)
		  
		  call pdf.SetImportFlags(flags)
		  
		  // import PDF file
		  Dim ImportFile As FolderItem = MyDynaPDFMBS.FindFile("invoice template.pdf")
		  call pdf.OpenImportFile(ImportFile)
		  call pdf.ImportPDFFile(1)
		  
		  // now add xml
		  Dim file As FolderItem = MyDynaPDFMBS.FindFile("ZUGFeRD-invoice.xml")
		  dim n as integer = pdf.AttachFile(file, "ZUGFeRD Rechnung", false)
		  
		  if not pdf.AssociateEmbFile(pdf.kadCatalog, -1, pdf.karAlternative, n) then
		    Break // error
		  end if
		  
		  // make sure we conform
		  // for perfect usage, you need PDF/A extension for DynaPDF (extra purchase)
		  // here we pass Basic level. Please make sure XML and level here match!
		  Dim retval As Integer = pdf.CheckConformance(pdf.kctZUGFeRD2_Basic, pdf.kcoDefault)
		  
		  Select case retval
		  case 1
		    'MsgBox "RGB"
		    call pdf.AddOutputIntent(RGBProfileFile) // RGB
		  case 2
		    'call pdf.AddOutputIntent(profilefile) // CMYK
		    break
		  case 3
		    call pdf.AddOutputIntent(GrayProfileFile) // Gray
		    'break
		  end Select
		  
		  call pdf.CloseFile
		  
		  f.Launch
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
