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
		  
		  pdf.SetLicenseKey "Lite" // For this example you can use a Lite, Pro or Enterprise License
		  
		  
		  
		  // now create PDF
		  call pdf.CreateNewPDF f
		  call pdf.CreateStructureTree
		  
		  // prepare for PDF/A
		  
		  dim flags as integer 
		  flags = Bitwise.BitOr(flags, pdf.kifImportAll)
		  flags = Bitwise.BitOr(flags, pdf.kifImportAsPage)
		  flags = Bitwise.BitOr(flags, pdf.kifPrepareForPDFA)
		  
		  call pdf.SetImportFlags(flags)
		  
		  // import PDF file
		  dim ImportFile as FolderItem = FindFile("invoice template.pdf")
		  call pdf.OpenImportFile(ImportFile)
		  call pdf.ImportPDFFile(1)
		  
		  // now add xml
		  Dim file As FolderItem = FindFile("factur-x.xml")
		  // file name for XML in PDF must be factur-x.xml
		  Dim n As Integer = pdf.AttachFile(file, "Factur-X Invoice", False)
		  
		  if not pdf.AssociateEmbFile(pdf.kadCatalog, -1, pdf.karAlternative, n) then
		    Break // error
		  End If
		  
		  // make sure we conform
		  // for perfect usage, you need PDF/A extension for DynaPDF (extra purchase)
		  // pass kctFacturX_Basic for Basic level. Change constant for other levels if needed!
		  Dim retval As Integer = pdf.CheckConformance(pdf.kctFacturX_Basic, pdf.kcoDefault)
		  
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
