#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // pick some folder with images
		  
		  ' GetFolderItem("C:\Bilder\JPG", FolderItem.PathTypeShell)
		  
		  dim folder as FolderItem = SpecialFolder.Pictures 
		  
		  dim x as double = 50.0
		  dim y as double = 50.0
		  
		  dim p as new MyDynaPDFMBS
		  
		  dim destfile as FolderItem = SpecialFolder.Desktop.Child("Batch Image to PDF.pdf")
		  
		  call p.CreateNewPDF(destfile)
		  call p.SetPageCoords(p.kpcTopDown)
		  call p.SetJPEGQuality(70)
		  call p.SetResolution(300)
		  
		  'call p.SetCompressionFilter(p.kcfFlate)
		  'call p.SetSaveNewImageFormat(false)
		  
		  dim t as integer = ticks
		  
		  picCount = 0
		  Process p, folder, x, y
		  
		  t = ticks -t 
		  
		  
		  if piccount > 0 then
		    call p.EndPage
		  else
		    MsgBox "No pictures found in your pictures folder."
		  end if
		  
		  call p.CloseFile
		  p = nil
		  
		  destfile.Launch(true)
		  
		  MsgBox str(t/60)+" seconds for "+str(picCount)+" picture files."
		  
		  quit
		  
		End Sub
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
		picCount As Integer
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&L\xC3\xB6schen", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&L\xC3\xB6schen"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&L\xC3\xB6schen"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"Beenden", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Beenden"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="picCount"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
