#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub NewDocument()
		  dim f as FolderItem = GetOpenFolderItem(FileTypes1.Pdf)
		  
		  if f<>Nil then
		    OpenDocument f
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub OpenDocument(item As FolderItem)
		  run item
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub run(item as FolderItem)
		  dim pdf as new MyDynapdfMBS // your DynaPDF subclass with Error event filled
		  
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  call pdf.CreateNewPDF nil
		  call pdf.SetImportFlags(pdf.kifImportAll + pdf.kifImportAsPage)
		  
		  // load CharacterMaps if you want to correctly process asian fonts
		  'call pdf.SetCMapDir(SpecialFolder.Desktop.Child("CMap"), pdf.klcmRecursive)
		  
		  
		  // init color management
		  
		  
		  
		  // open file
		  call pdf.OpenImportFile(item,0,"")
		  
		  // add page
		  call pdf.Append
		  
		  // import the first page
		  call pdf.ImportPageEx(1,1.0,1.0)
		  call pdf.EndPage
		  
		  'dim p as DynaPDFPageMBS = pdf.GetPage(1)
		  
		  
		  // try various pixel formats:
		  
		  test pdf, DynaPDFRasterizerMBS.kpxf1Bit,  DynaPDFRasterImageMBS.krfDefault, "default-1bit"
		  test pdf, DynaPDFRasterizerMBS.kpxfGray,  DynaPDFRasterImageMBS.krfDefault, "default-gray"
		  test pdf, DynaPDFRasterizerMBS.kpxfRGB,   DynaPDFRasterImageMBS.krfDefault, "default-rgb"
		  test pdf, DynaPDFRasterizerMBS.kpxfBGR,   DynaPDFRasterImageMBS.krfDefault, "default-bgr"
		  test pdf, DynaPDFRasterizerMBS.kpxfRGBA,  DynaPDFRasterImageMBS.krfDefault, "default-rgba"
		  test pdf, DynaPDFRasterizerMBS.kpxfBGRA,  DynaPDFRasterImageMBS.krfDefault, "default-bgra"
		  test pdf, DynaPDFRasterizerMBS.kpxfABGR,  DynaPDFRasterImageMBS.krfDefault, "default-abgr"
		  test pdf, DynaPDFRasterizerMBS.kpxfARGB,  DynaPDFRasterImageMBS.krfDefault, "default-argb"
		  test pdf, DynaPDFRasterizerMBS.kpxfGrayA, DynaPDFRasterImageMBS.krfDefault, "default-graya"
		  test pdf, DynaPDFRasterizerMBS.kpxfCMYK,  DynaPDFRasterImageMBS.krfDefault, "default-cmyk"
		  test pdf, DynaPDFRasterizerMBS.kpxfCMYKA, DynaPDFRasterImageMBS.krfDefault, "default-cmyka"
		  
		  
		  // try various flags:
		  
		  test pdf, DynaPDFRasterizerMBS.kpxf1Bit,  DynaPDFRasterImageMBS.krfRotate180, "rotate180-1bit"
		  test pdf, DynaPDFRasterizerMBS.kpxfGray,  DynaPDFRasterImageMBS.krfRotate180, "rotate180-gray"
		  test pdf, DynaPDFRasterizerMBS.kpxfRGB,   DynaPDFRasterImageMBS.krfRotate180, "rotate180-rgb"
		  test pdf, DynaPDFRasterizerMBS.kpxfBGR,   DynaPDFRasterImageMBS.krfRotate180, "rotate180-bgr"
		  test pdf, DynaPDFRasterizerMBS.kpxfRGBA,  DynaPDFRasterImageMBS.krfRotate180, "rotate180-rgba"
		  test pdf, DynaPDFRasterizerMBS.kpxfBGRA,  DynaPDFRasterImageMBS.krfRotate180, "rotate180-bgra"
		  test pdf, DynaPDFRasterizerMBS.kpxfABGR,  DynaPDFRasterImageMBS.krfRotate180, "rotate180-abgr"
		  test pdf, DynaPDFRasterizerMBS.kpxfARGB,  DynaPDFRasterImageMBS.krfRotate180, "rotate180-argb"
		  test pdf, DynaPDFRasterizerMBS.kpxfGrayA, DynaPDFRasterImageMBS.krfRotate180, "rotate180-graya"
		  test pdf, DynaPDFRasterizerMBS.kpxfCMYK,  DynaPDFRasterImageMBS.krfRotate180, "rotate180-cmyk"
		  test pdf, DynaPDFRasterizerMBS.kpxfCMYKA, DynaPDFRasterImageMBS.krfRotate180, "rotate180-cmyka"
		  
		  // try various flags:
		  
		  test pdf, DynaPDFRasterizerMBS.kpxf1Bit,  DynaPDFRasterImageMBS.krfDisableAntiAliasing, "noAntiAlias-1bit"
		  test pdf, DynaPDFRasterizerMBS.kpxfGray,  DynaPDFRasterImageMBS.krfDisableAntiAliasing, "noAntiAlias-gray"
		  test pdf, DynaPDFRasterizerMBS.kpxfRGB,   DynaPDFRasterImageMBS.krfDisableAntiAliasing, "noAntiAlias-rgb"
		  test pdf, DynaPDFRasterizerMBS.kpxfBGR,   DynaPDFRasterImageMBS.krfDisableAntiAliasing, "noAntiAlias-bgr"
		  test pdf, DynaPDFRasterizerMBS.kpxfRGBA,  DynaPDFRasterImageMBS.krfDisableAntiAliasing, "noAntiAlias-rgba"
		  test pdf, DynaPDFRasterizerMBS.kpxfBGRA,  DynaPDFRasterImageMBS.krfDisableAntiAliasing, "noAntiAlias-bgra"
		  test pdf, DynaPDFRasterizerMBS.kpxfABGR,  DynaPDFRasterImageMBS.krfDisableAntiAliasing, "noAntiAlias-abgr"
		  test pdf, DynaPDFRasterizerMBS.kpxfARGB,  DynaPDFRasterImageMBS.krfDisableAntiAliasing, "noAntiAlias-argb"
		  test pdf, DynaPDFRasterizerMBS.kpxfGrayA, DynaPDFRasterImageMBS.krfDisableAntiAliasing, "noAntiAlias-graya"
		  test pdf, DynaPDFRasterizerMBS.kpxfCMYK,  DynaPDFRasterImageMBS.krfDisableAntiAliasing, "noAntiAlias-cmyk"
		  test pdf, DynaPDFRasterizerMBS.kpxfCMYKA, DynaPDFRasterImageMBS.krfDisableAntiAliasing, "noAntiAlias-cmyka"
		  
		  
		  
		  
		  MsgBox "Done"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub test(pdf as MyDynaPDFMBS, PixelFormat as integer, Flags as integer, name as string)
		  
		  dim file as FolderItem = SpecialFolder.Desktop.Child("test-"+name+".tif")
		  
		  call pdf.RenderPageToImage(1, file, 72, 0, 0, Flags, PixelFormat, DynaPDFMBS.kcfFlate, DynaPDFMBS.kifmTIFF)
		  
		  
		End Sub
	#tag EndMethod


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
	#tag EndViewBehavior
End Class
#tag EndClass
