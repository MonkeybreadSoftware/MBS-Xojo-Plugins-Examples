#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // if a PDF has a non 0° rotation, we can rotate it to have a 0° by rotating content.
		  
		  dim inputfile as FolderItem = GetOpenFolderItem("")
		  
		  if inputfile = nil then 
		    quit
		    Return
		  end if
		  
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  
		  
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  dim r as integer = pdf.openimportFile(inputfile)
		  if r < 0 then
		    // error
		    break
		    return
		  end if
		  
		  // create original jpeg
		  call pdf.CreateNewPDF nil
		  call pdf.ImportPDFPage(1)
		  dim fo as FolderItem = SpecialFolder.Desktop.Child("Rotated original.jpg")
		  call pdf.RenderPageToImage(1, fo, 150, 0, 0, 0, pdf.kpxfRGB, pdf.kcfJPEG, pdf.kifmJPEG)
		  call pdf.FreePDF
		  
		  // now check orientation
		  
		  call pdf.openimportFile(inputfile)
		  dim orientation as integer = pdf.GetInOrientation(0)
		  
		  // normalize
		  while orientation >= 360
		    orientation = orientation - 360
		  wend
		  while orientation < 0
		    orientation = orientation + 360
		  wend
		  
		  Select case orientation
		  case 0
		    MsgBox "nothing to do as this PDF has no orientation"
		  case 90
		    // rotate 90° content by 270° to correct
		    orientation = 270
		  case 180
		    orientation = 180
		  case 270
		    orientation = 90
		  else
		    MsgBox "Invalid orientation: "+str(orientation)
		    quit
		    Return
		  end Select
		  
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Rotated correctly.pdf")
		  call pdf.CreateNewPDF f
		  
		  call pdf.SetImportFlags(pdf.kifImportAll)
		  dim OldTemplate as integer = pdf.ImportPage(1)
		  dim NewTemplate as integer = pdf.RotateTemplate(OldTemplate, orientation)
		  
		  
		  call pdf.CloseImportFile
		  
		  
		  call pdf.Append
		  
		  dim width as integer = pdf.GetTemplWidth(NewTemplate)
		  dim height as integer = pdf.GetTemplHeight(NewTemplate)
		  
		  call pdf.SetPageWidth(width)
		  call pdf.SetPageHeight(height)
		  call pdf.PlaceTemplateEx(NewTemplate, 0, 0, width, height)
		  
		  call pdf.EndPage
		  
		  fo = SpecialFolder.Desktop.Child("Rotated correctly.jpg")
		  call pdf.RenderPageToImage(1, fo, 150, 0, 0, 0, pdf.kpxfRGB, pdf.kcfJPEG, pdf.kifmJPEG)
		  
		  call pdf.CloseFile
		  f.Launch
		  
		  // also create a simple one where we just set orientation
		  f = SpecialFolder.Desktop.Child("Rotated not correctly.pdf")
		  call pdf.CreateNewPDF f
		  
		  call pdf.openimportFile(inputfile)
		  call pdf.ImportPDFPage(1)
		  
		  call pdf.EditPage(1)
		  call pdf.SetOrientationEx(0)
		  call pdf.EndPage
		  
		  fo = SpecialFolder.Desktop.Child("Rotated not correctly.jpg")
		  call pdf.RenderPageToImage(1, fo, 150, 0, 0, 0, pdf.kpxfRGB, pdf.kcfJPEG, pdf.kifmJPEG)
		  
		  call pdf.CloseFile
		  
		  
		  f.Launch
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
