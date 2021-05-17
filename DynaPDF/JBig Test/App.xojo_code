#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  MakeTiff
		  
		  dim TiffFile as FolderItem = SpecialFolder.Desktop.Child("license.tif")
		  
		  CreatePDF TiffFile,  SpecialFolder.Desktop.Child("pdf with flate.pdf"  ), DynaPDFMBS.kcfFlate
		  CreatePDF TiffFile,  SpecialFolder.Desktop.Child("pdf with JPEG.pdf"   ), DynaPDFMBS.kcfJPEG
		  CreatePDF TiffFile,  SpecialFolder.Desktop.Child("pdf with CCITT3.pdf" ), DynaPDFMBS.kcfCCITT3
		  CreatePDF TiffFile,  SpecialFolder.Desktop.Child("pdf with CCITT4.pdf" ), DynaPDFMBS.kcfCCITT4
		  CreatePDF TiffFile,  SpecialFolder.Desktop.Child("pdf with LZW.pdf"    ), DynaPDFMBS.kcfLZW
		  CreatePDF TiffFile,  SpecialFolder.Desktop.Child("pdf with LZWBW.pdf"  ), DynaPDFMBS.kcfLZWBW
		  CreatePDF TiffFile,  SpecialFolder.Desktop.Child("pdf with FlateBW.pdf"), DynaPDFMBS.kcfFlateBW
		  CreatePDF TiffFile,  SpecialFolder.Desktop.Child("pdf with JP2K.pdf"   ), DynaPDFMBS.kcfJP2K
		  CreatePDF TiffFile,  SpecialFolder.Desktop.Child("pdf with JBIG2.pdf"  ), DynaPDFMBS.kcfJBIG2
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CreatePDF(ImageFile as FolderItem, PDFFile as FolderItem, format as integer)
		  
		  dim d as new MyDynapdfMBS
		  dim file as FolderItem
		  
		  d.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  
		  call d.CreateNewPDF PDFFile
		  call d.Append
		  
		  // set a paper size
		  call d.SetPageFormat(d.kpfDIN_A4)
		  
		  call d.SetSaveNewImageFormat(false) // if possible pass through
		  call d.SetUseTransparency(false) // no transparent color
		  call d.SetCompressionFilter(format) // no compression
		  call d.SetResolution(999) // max resolution
		  
		  dim PicWidth, PicHeight, BitsPerPixel as integer
		  dim Zip as Boolean
		  
		  if not d.ReadImageFormat(ImageFile, PicWidth, PicHeight, BitsPerPixel, Zip) then
		    MsgBox "Can't read image size."
		    Return
		  end if
		  
		  dim PageWidth  as integer = d.GetPageWidth
		  dim PageHeight as integer = d.GetPageHeight
		  
		  // scale to fit the page size
		  dim f as double = min(PageWidth/PicWidth, PageHeight/PicHeight)
		  
		  dim w as integer = f * PicWidth
		  dim h as integer = f * PicHeight
		  
		  dim x as integer = (PageWidth-w)/2
		  dim y as integer = (PageHeight-h)/2
		  
		  // add image to pdf
		  if d.InsertImageEx(x, y, w, h, ImageFile) < 0 then
		    MsgBox "Failed to import image."
		    Return
		  end if
		  
		  call d.EndPage
		  call d.CloseFile
		  
		  
		End Sub
	#tag EndMethod

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
		Sub MakeTiff()
		  dim PDFFile as FolderItem = FindFile("license.pdf")
		  dim TiffFile as FolderItem = SpecialFolder.Desktop.Child("license.tif")
		  
		  if not TiffFile.Exists  then
		    dim pdf as new MyDynapdfMBS // your DynaPDF subclass with Error event filled
		    
		    pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		    
		    call pdf.CreateNewPDF nil
		    call pdf.SetImportFlags(pdf.kifImportAll + pdf.kifImportAsPage)
		    
		    // load CharacterMaps if you want to correctly process asian fonts
		    'call pdf.SetCMapDir(SpecialFolder.Desktop.Child("CMap"), pdf.klcmRecursive)
		    
		    
		    // open file
		    call pdf.OpenImportFile(PDFFile,0,"")
		    
		    // import the first page
		    call pdf.ImportPDFPage(1)
		    
		    
		    // render the page
		    call pdf.RenderPageToImage(1, TiffFile, 600, 0, 0, DynaPDFRasterImageMBS.krfDefault, DynaPDFRasterizerMBS.kpxf1Bit, DynaPDFMBS.kcfFlate, DynaPDFMBS.kifmTIFF)
		    
		    
		    
		  end if
		  
		End Sub
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
