#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Dim f As FolderItem = GetOpenFolderItem(MyFileTypes.Pdf)
		  
		  if f=nil then
		    quit
		  end if
		  
		  dim p as new MyDynapdfMBS
		  
		  p.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  call p.CreateNewPDF(nil)
		  
		  // Skip anything that is not required
		  call p.SetImportFlags p.kifContentOnly+p.kifImportAsPage
		  
		  // From which PDF file do you want to extract the images?
		  call p.OpenImportFile(f, p.kptOpen, "")
		  
		  // Comment this out if you want to extract the images from specific pages only
		  call p.ImportPDFFile(1, 1.0, 1.0)
		  
		  // Uncomment this section if you want to extract images from specific pages only
		  'dim pageCount as integer = p.GetInPageCount
		  'for i as integer = 1 to pageCount
		  '  call p.ImportPDFPage(i)
		  'next
		  
		  call p.CloseImportFile
		  
		  dim stack as new MyDynaPDFParseInterfaceMBS
		  stack.dest=SpecialFolder.desktop // destination folder
		  stack.pdf=p
		  
		  'If you want to create a multipage TIFF then create the output image here
		  'and call AddImage() only in the callback function. After the loop
		  'returns call CloseImage() to close the image file.
		  
		  //CreateImage(f, p.kifmTIFF);
		  
		  dim pageCount as integer = p.GetPageCount
		  
		  for i as integer=1 to pageCount
		    call p.EditPage i
		    
		    'If you want to convert the images into a specific color space then set
		    'one of the folowing flags (see also TParseFlags in dynapdf.h):
		    '
		    'p.kpfDitherImagesToBW // Floyd-Steinberg dithering.
		    'p.kpfConvImagesToGray
		    'p.kpfConvImagesToRGB
		    'p.kpfConvImagesToCMYK
		    '
		    'Only one color space conversion flag must be set at time.
		    
		    call p.ParseContent(stack, p.kpfDecomprAllImages)
		    call p.EndPage
		  next
		  // p.CloseImage // Call this function here if you create a multipage TIFF.
		  
		  
		End Sub
	#tag EndEvent


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
