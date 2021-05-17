#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim f as FolderItem = GetOpenFolderItem(MyFileTypes.Pdf)
		  
		  if f=nil then
		    quit
		  end if
		  
		  dim p as new MyDynapdfMBS
		  
		  p.SetLicenseKey "Lite" // For this example you can use a Lite, Pro or Enterprise License
		  
		  call p.CreateNewPDF(nil)
		  
		  // Skip anything that is not required
		  call p.SetImportFlags p.kifImportAll + p.kifImportAsPage
		  
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
		  
		  dim dest as FolderItem = SpecialFolder.Desktop
		  dim b as BinaryStream
		  dim counter as integer = 0
		  
		  dim n as integer = p.GetImageObjCount-1
		  for i as integer = 0 to n
		    dim Image as DynaPDFImageMBS = p.GetImageObj(i, p.kpfNone)
		    counter=counter+1
		    
		    Select case Image.filter
		    case DynapdfMBS.kdfDCTDecode // JPEG
		      f=dest.Child(str(Counter)+".jpg")
		      b=f.CreateBinaryFile("")
		      if b<>Nil then
		        b.Write image.Buffer
		        b.Close
		      end if
		      
		    case DynapdfMBS.kdfJPXDecode // JPEG 2000
		      f=dest.Child(str(Counter)+".jp2")
		      b=f.CreateBinaryFile("")
		      if b<>Nil then
		        b.Write image.Buffer
		        b.Close
		      end if
		      
		    else // anything else
		      
		      f=dest.Child(str(Counter)+".tif")
		      
		      if p.CreateImage(f, p.kifmTIFF) then
		        call p.addimage(p.kcfLZW, p.kicNone, image)
		        call p.CloseImage
		      end if
		      
		    end Select
		  next
		  
		  
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
