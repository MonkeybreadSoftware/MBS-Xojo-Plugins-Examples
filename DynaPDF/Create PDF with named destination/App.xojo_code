#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with named destination.pdf")
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  const PageCount = 40
		  
		  call pdf.CreateNewPDF f
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  call pdf.Append
		  call pdf.EndPage
		  
		  // Create test pages
		  for i as integer = 1 to PageCount
		    call pdf.Append
		    call pdf.SetFont "Times", pdf.kfsItalic, 40.0, true, pdf.kcp1252
		    call pdf.WriteFText pdf.ktaCenter, "Page "+str(i)
		    call pdf.EndPage
		  next
		  
		  // Create name destinations for each page
		  dim DestinationHandles(0) as integer
		  
		  // destination for table of content page
		  DestinationHandles(0) = pdf.CreateNamedDest("toc", 1, pdf.kdtFit, 0, 0, 0, 0)
		  
		  for i as integer = 1 to PageCount
		    // destination for this page
		    dim dh as integer = pdf.CreateNamedDest("page"+str(i), i+1, pdf.kdtFit, 0, 0, 0, 0)
		    
		    DestinationHandles.Append dh
		  next
		  
		  // Create Bookmarks
		  for i as integer = 1 to PageCount
		    call pdf.AddBookmarkEx("Go to page "+str(i), -1, DestinationHandles(i), false)
		  next
		  
		  // Create table of contents on first page
		  call pdf.EditPage(1)
		  call pdf.SetFont "Times", pdf.kfsItalic, 40.0, true, pdf.kcp1252
		  call pdf.WriteFText pdf.ktaCenter, "Table of Contents"
		  call pdf.SetFont "Times", pdf.kfsItalic, 12.0, true, pdf.kcp1252
		  
		  dim y as Double = pdf.GetLastTextPosY 
		  call pdf.BeginContinueText 30, y
		  call pdf.AddContinueText "" // leave blank space
		  
		  dim ly as Double
		  for i as integer = 1 to PageCount
		    call pdf.AddContinueText "Go to Page "+str(i)
		    
		    ly = y
		    y = pdf.GetLastTextPosY
		    
		    call pdf.SetLineWidth(0) // no border around link
		    call pdf.PageLink2(30, ly, 100, y-ly, DestinationHandles(i))
		    
		  next
		  call pdf.EndPage
		  
		  // create back to TOC links on each page
		  for i as integer = 1 to PageCount
		    call pdf.EditPage(i+1)
		    call pdf.SetFont "Times", pdf.kfsItalic, 12.0, true, pdf.kcp1252
		    call pdf.WriteText 30,30, "Back to top"
		    call pdf.SetLineWidth(0)
		    call pdf.PageLink2(30, 25, 100, 20, DestinationHandles(0))
		    call pdf.EndPage
		  next
		  
		  call pdf.CloseFile
		  
		  f.Launch
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
