#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim winkel,i,tmpl as integer
		  dim d as new date
		  dim mediaBox, cropBox as DynaPDFRectMBS
		  dim x,y,w,h as Double
		  dim f as FolderItem=SpecialFolder.Desktop.Child("place centered and rotate.pdf")
		  
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  
		  call pdf.CreateNewPDF f
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Realbasic output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Realbasic test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Realbasic output"
		  
		  
		  // Open an existing PDF file
		  dim file as FolderItem = FindFile("taxform.pdf")
		  
		  call pdf.OpenImportFile(file, pdf.kptOpen, "")
		  // Import the fist page as template
		  tmpl = pdf.ImportPage(1)
		  // Get the bounding boxes of the imported page
		  mediaBox=pdf.GetInBBox( 1, pdf.kpbMediaBox)
		  cropBox=pdf.GetInBBox( 1, pdf.kpbCropBox)
		  
		  // PlaceCentered() requires Bottom-Up coordinates.
		  call pdf.SetPageCoords(pdf.kpcBottomUp)
		  
		  x = 0.0
		  y = 0
		  
		  for i = 0 to 3
		    winkel=i*90
		    
		    call pdf.Append
		    call pdf.SetOrientationEx winkel
		    
		    w = pdf.GetPageWidth
		    h = pdf.CalcHeight(mediaBox, cropBox, w)
		    
		    call pdf.SetStrokeColor(255)
		    
		    call pdf.PlaceRotatedCentered(tmpl, mediaBox, cropBox, x, y, w, h, winkel) 
		    
		    
		    call pdf.EndPage
		  next
		  
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
