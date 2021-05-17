#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with over 2 GB size.pdf")
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF f
		  
		  // We want to use top-down coordinates 
		  'call pdf.SetPageCoords pdf.kpcTopDown
		  
		  dim pic as new Picture(1000, 1000, 32)
		  
		  System.DebugLog "Fill picture with random pixels..."
		  
		  dim r as RGBSurface = pic.RGBSurface
		  for y as integer = 0 to 999
		    for x as integer = 0 to 999
		      r.Pixel(x,y)=rgb(BitwiseAnd(x, 255), BitwiseAnd(x, 255), BitwiseAnd(x+y, 255))
		    next
		  next
		  
		  dim rr as new random
		  System.DebugLog "Create pages..."
		  for i as integer = 1 to 3000
		    // make sure all pictures are different, so they are not compressed too much
		    
		    if i mod 100 = 0 then
		      System.DebugLog str(i)+" pages done."
		    end if
		    
		    for j as integer = 0 to 999
		      r.Pixel(j,j)=rgb(rr.InRange(0,255), rr.InRange(0,255), rr.InRange(0,255))
		    next
		    
		    call pdf.Append
		    call pdf.SetResolution(300)
		    call pdf.SetSaveNewImageFormat(true)
		    call pdf.SetCompressionFilter(pdf.kcfFlate)
		    call pdf.InsertPicture(pic, 50, 50, 500, 500)
		    call pdf.EndPage
		    
		    // write away data to disc after 10 pages
		    if i mod 10 = 0 then
		      call pdf.FlushPages(pdf.kfpfDefault)
		    end if
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
