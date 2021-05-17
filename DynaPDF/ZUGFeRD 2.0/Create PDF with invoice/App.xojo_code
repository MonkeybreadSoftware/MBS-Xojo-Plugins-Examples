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
		  
		  call pdf.CreateNewPDF f
		  call pdf.CreateStructureTree
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  // create some dummy page
		  call pdf.Append
		  call pdf.SetFont "Times", pdf.kfsItalic, 40.0, true, pdf.kcp1252
		  call pdf.WriteFText pdf.ktaCenter, "Just a test PDF."
		  call pdf.EndPage
		  
		  
		  
		  // now add xml
		  dim file as FolderItem = FindFile("ZUGFeRD-invoice.xml")
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
