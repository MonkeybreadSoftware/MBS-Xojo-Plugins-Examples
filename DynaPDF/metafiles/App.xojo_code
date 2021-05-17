#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim outFile as FolderItem=SpecialFolder.Desktop.Child("metafiles.pdf")
		  
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  call pdf.CreateNewPDF(nil) // The output file is created later
		  call pdf.Append
		  call pdf.SetPageCoords(pdf.kpcTopDown)
		  // We use a landscape format
		  dim w as double = 842.0
		  dim h as double = 595.0
		  call pdf.SetBBox(pdf.kpbMediaBox, 0.0, 0.0, w, h)
		  // This file transforms the coordinate system very often and uses clipping regions. The metafile
		  // is scaled to the page width without changing its aspect ratio.
		  call PlaceEMFCentered(pdf, FindFile("coords.emf"), w, h)
		  call pdf.EndPage
		  
		  call pdf.Append
		  // Simple test of line and standard patterns
		  call PlaceEMFCentered(pdf, FindFile("fulltest.emf"), w, h)
		  call pdf.EndPage
		  
		  call pdf.Append
		  // Outlined text, dash patterns with text. This file requires the font Bookman Old Style. If not available,
		  // the result will be wrong!
		  call PlaceEMFCentered(pdf, FindFile("gdi.emf"), w, h)
		  call pdf.EndPage
		  
		  // No fatal error occurred?
		  if pdf.HaveOpenDoc then
		    // OK, now we can open the output file.
		    if not pdf.OpenOutputFile(outFile) then
		      MsgBox "Make sure that you have write access to the project folder."
		      quit
		    end if
		  end if
		  call pdf.CloseFile
		  
		  outFile.Launch
		  
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

	#tag Method, Flags = &h0
		Function PlaceEMFCentered(pdf as dynapdfmbs, filename as folderitem, width as double, height as double) As boolean
		  dim r as DynapdfRectMBS
		  dim x,y as Double
		  
		  ' We place the EMF file horizontal and vertically centered in this example.
		  
		  // We need the picture size of the EMF file
		  r=pdf.GetLogMetafileSize(filename)
		  if r=nil then
		    return false
		  end if
		  
		  dim w as double = r.Right - r.Left
		  dim h as double = r.Bottom - r.Top
		  
		  'We place the EMF file into a border of 2 units around the page so that we can better see
		  'the bounding box of the EMF file.
		  
		  Width  = Width- 4.0
		  Height = Height- 4.0
		  dim sx as double = Width / w
		  
		  'An important note about the bounding rectangle: DynaPDF calculates the zero point
		  'of the EMF picture automatically so that we don't need to consider the coordinate origin.
		  'The coordinate origin for our calculation here is always 0.0, 0.0 independent of the real
		  'origin of the EMF picture.
		  
		  if (h * sx <= Height) then
		    h = h* sx
		    x = 2.0
		    // If the file should not be centered vertically then set y to 2.0.
		    y = (Height - h) / 2.0
		    call pdf.InsertMetafile(filename, x, y, Width, 0.0)
		    // The rectangle represents the real bounding box of the EMF picture.
		    call pdf.SetStrokeColor(PDF.kPDF_RED)
		    return pdf.Rectangle(x, y, Width, h, pdf.kfmStroke)
		  else
		    
		    sx = Height / h
		    w = w * sx
		    x = (Width - w) / 2.0
		    y = 2.0
		    call pdf.InsertMetafile(filename, x, y, 0.0, Height)
		    // The rectangle represents the real bounding box of the EMF picture.
		    call pdf.SetStrokeColor(PDF.kPDF_RED)
		    return pdf.Rectangle(x, y, w, Height, pdf.kfmStroke)
		  end if
		End Function
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
