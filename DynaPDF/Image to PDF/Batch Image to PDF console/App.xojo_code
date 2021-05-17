#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  print "Start"
		  
		  // pick some folder with images
		  
		  ' GetFolderItem("C:\Bilder\JPG", FolderItem.PathTypeShell)
		  
		  dim folder as FolderItem = SpecialFolder.Pictures
		  
		  dim x as double = 50.0
		  dim y as double = 50.0
		  
		  dim p as new MyDynaPDFMBS
		  
		  dim destfile as FolderItem = SpecialFolder.Desktop.Child("Batch Image to PDF console.pdf")
		  
		  call p.CreateNewPDF(destfile)
		  call p.SetPageCoords(p.kpcTopDown)
		  call p.SetJPEGQuality(70)
		  call p.SetResolution(300)
		  
		  'call p.SetCompressionFilter(p.kcfFlate)
		  'call p.SetSaveNewImageFormat(false)
		  
		  dim t as integer = ticks
		  
		  print "Adding pictures..."
		  
		  picCount = 0
		  Process p, folder, x, y
		  
		  t = ticks -t
		  
		  print "Pictures added."
		  
		  if piccount > 0 then
		    call p.EndPage
		  else
		    print "No pictures found in your pictures folder."
		  end if
		  
		  call p.CloseFile
		  p = nil
		  
		  
		  print str(t/60)+" seconds for "+str(picCount)+" picture files."
		  
		  if DebugBuild and TargetWin32 then
		    print "Press return to quit."
		    call input 
		  end if
		  
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddPicture(p as DynaPDFMBS, file as FolderItem, byref x as double, byref y as double)
		  // get file extension
		  dim parts(-1) as string = split(file.name, ".")
		  dim extension as string = parts(UBound(parts))
		  
		  dim count as integer = 1
		  
		  if extension = "tif" or extension = "tiff" then
		    count = p.GetImageCount(file)
		    if count<0 then Return
		  end if
		  
		  for i as integer = 1 to count
		    dim w,h,bits as integer
		    dim zip as Boolean
		    
		    // check image format
		    if not p.ReadImageFormat2(file, 1, w, h, bits, zip) then Return
		    
		    if x = 50 and y = 50 then
		      call p.Append
		    end if
		    
		    PlaceImageCentered p, x, y, 100, 100, file, i
		    
		    x = x + 130
		    
		    if x > 450 then
		      x = 50
		      y = y + 130
		      
		      if y>700 then
		        call p.EndPage
		        y = 50
		      end if
		    end if
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PlaceImageCentered(p as DynaPDFMBS, PosX as double, PosY as Double, Width as double, Height as double, file as FolderItem, index as integer)
		  print file.NativePath
		  
		  dim x,y as Double
		  dim bits as integer
		  dim imgWidth, imgHeight as integer
		  dim useZip as Boolean
		  
		  if not p.ReadImageFormat2(file, Index, imgWidth, imgHeight, bits, useZip) then Return
		  
		  if bits = 1 then
		    call p.SetCompressionFilter(p.kcfCCITT4)
		  elseif useZip then
		    call p.SetCompressionFilter(p.kcfFlate)
		  else
		    call p.SetCompressionFilter(p.kcfJPEG)
		  end if
		  
		  dim w  as double = imgWidth
		  dim h  as double = imgHeight
		  dim sx as double = Width / w
		  
		  if (h * sx <= Height) then
		    
		    h = h * sx
		    x = PosX
		    y = PosY + (Height - h) * 0.5
		    call p.InsertImageEx(x, y, Width, 0.0, File, Index)
		  else
		    
		    sx = Height / h
		    w = w * sx
		    x = PosX + (Width - w) * 0.5
		    y = PosY
		    call p.InsertImageEx(x, y, 0.0, Height, File, Index)
		  end if
		  picCount = picCount + 1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Process(p as DynaPDFMBS, folder as FolderItem, byref x as double, byref y as double)
		  dim c as integer = folder.Count
		  
		  for i as integer = 1 to c
		    dim file as FolderItem = folder.TrueItem(i)
		    
		    if file = nil then
		      // ignore
		    elseif file.Directory then
		      Process p,file, x, y // recurively walk through all subfolders
		    else
		      
		      AddPicture p, file, x, y
		      
		    end if
		    
		  next
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		piccount As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="piccount"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
