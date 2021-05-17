#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim f,d As FolderItem
		  
		  f = GetOpenFolderItem(FileTypes.Tiff)
		  
		  if f=NIL then
		    Return
		  end if
		  
		  d=SpecialFolder.Desktop.Child(f.name+".pdf")
		  
		  CreatePDFwithImage f,d
		  
		  // Open
		  d.Launch
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub CreatePDFwithImage(source as folderitem, dest as folderitem)
		  dim pdf As new DynapdfMBS
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  // whether you want image to be recompressed
		  call pdf.SetSaveNewImageFormat(False)
		  
		  // we want transparent background
		  call pdf.SetUseTransparency(False)
		  
		  // create new pdf
		  call pdf.CreateNewPDF(dest)
		  
		  
		  dim ImageCount as integer = pdf.GetImageCount(source)
		  for ImageIndex as integer = 1 to ImageCount 
		    // Create a new page
		    call pdf.Append
		    
		    dim iColorSpace As Integer=  GetColorSpace(source)
		    
		    // get resolution
		    dim iResX, iResY as integer
		    call pdf.ReadImageResolution(source, 1, iResX, iResY)
		    
		    // we limit it to 72 for this example
		    iResX = Max(iResX, 72)
		    iResY = Max(iResY, 72)
		    
		    // read image format
		    dim iUseZip as Boolean
		    dim iWidth, iHeight, iBitsPerPixel As Integer
		    call pdf.ReadImageFormat2(source, ImageIndex, iWidth, iHeight, iBitsPerPixel, iUseZip)
		    
		    // calculate destination size
		    dim dWidth As Double = iWidth/iResX*72
		    dim dHeight As Double = iHeight/iResY*72
		    
		    // ask to create a pdf in version 1.3
		    call pdf.SetPDFVersion(pdf.kpvPDF_1_3)
		    
		    // Define some pdf properties:
		    call pdf.SetDocInfo(pdf.kdiAuthor, SystemInformationMBS.Username)
		    call pdf.SetDocInfo(pdf.kdiCreator, "SysProgName"+" - "+"MetSysProgVer")
		    call pdf.SetDocInfo(pdf.kdiKeywords, "")
		    call pdf.SetDocInfo(pdf.kdiProducer, "SysProgName"+" - "+"MetSysProgVer")
		    call pdf.SetDocInfo(pdf.kdiSubject, "")
		    call pdf.SetDocInfo(pdf.kdiTitle, source.name)
		    
		    // define page view
		    'plSinglePage = 0, // Show one page at time
		    'plOneColumn = 1, // Show the pages continous
		    'plTwoColumnLeft = 2, // Two columns, start with left column
		    'plTwoColumnRight = 3 // Two columns, start with right column
		    call pdf.SetPageLayout(0)
		    
		    // define page mode
		    'pmUseNone = 0, // Default
		    'pmUseOutlines = 1, // Show the outline tree
		    'pmUseThumbs = 2, // Show the thumb nails
		    'pmFullScreen = 3 // Open the document in full-screen mode
		    call pdf.SetPageMode(0)
		    
		    
		    // define page size
		    call pdf.SetPageWidth(dWidth)
		    call pdf.SetPageHeight(dHeight)
		    
		    
		    // define color space
		    call pdf.SetColorSpace(iColorSpace)
		    
		    // load the image
		    // PosX,PosY,ScaleWidth,ScaleHeight,folderitem, ImageIndex
		    dim tmpl as integer = pdf.InsertImageEx(0, 0, dWidth, dHeight, source, ImageIndex)
		    if tmpl<0 then
		      MsgBox "Failed to insert the image into the pdf."
		      Return
		    end if
		    
		    // define page size
		    call pdf.SetPageWidth(dWidth)
		    call pdf.SetPageHeight(dHeight)
		    
		    // close image file
		    call pdf.CloseImportFile
		    
		    // close page
		    call pdf.EndPage
		  next
		  
		  // close pdf
		  call pdf.CloseFile
		  
		  pdf=NIL // let Realbasic release memory
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetColorSpace(source as folderitem) As integer
		  // get the colorspace of the image file
		  
		  dim jpeg As JPEGImporterMBS
		  dim tiff As TiffPictureMBS
		  dim iColorSpace,iSamplesPerPixel As Integer
		  
		  iColorSpace = DynaPDFMBS.kcsDeviceRGB // in case it is unknown
		  
		  // try tiff
		  
		  //JPEG
		  if Right(source.Name, 4)=".jpg" or Right(source.Name, 5)=".jpeg" then
		    jpeg=New JPEGImporterMBS
		    jpeg.AllowDamaged=True
		    jpeg.File=source
		    if jpeg.ReadHeader then
		      iSamplesPerPixel=jpeg.ColorComponentCount
		      //
		      Select Case iSamplesPerPixel
		      Case 1
		        iColorSpace = DynaPDFMBS.kcsDeviceGray
		      Case 3
		        iColorSpace = DynaPDFMBS.kcsDeviceRGB
		      Case 4
		        iColorSpace = DynaPDFMBS.kcsDeviceCMYK
		      Else
		        iColorSpace=4
		      End Select
		      
		      jpeg=NIL
		    end if
		  end if
		  
		  //TIFF
		  if Right(source.Name, 4)=".tif" or Right(source.Name, 5)=".tiff" then
		    tiff=source.OpenAsTiffMBS(True)
		    if tiff<>NIL then
		      iSamplesPerPixel=tiff.SamplesPerPixel
		      
		      Select Case iSamplesPerPixel
		      Case 1
		        iColorSpace = DynaPDFMBS.kcsDeviceGray
		      Case 3
		        iColorSpace = DynaPDFMBS.kcsDeviceRGB
		      Case 4
		        iColorSpace = DynaPDFMBS.kcsDeviceCMYK
		      Else
		        iColorSpace=4
		      End Select
		      
		      tiff.Close
		      tiff=NIL
		    end if
		  end if
		  
		  Return iColorSpace
		End Function
	#tag EndMethod


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
