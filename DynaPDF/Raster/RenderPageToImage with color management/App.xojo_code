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
		  
		  // load CharacterMaps if you want to correctly process asian fonts
		  'call pdf.SetCMapDir(SpecialFolder.Desktop.Child("CMap"), pdf.klcmRecursive)
		  
		  call pdf.SetImportFlags(pdf.kifImportAll + pdf.kifImportAsPage)
		  
		  
		  // init color management
		  
		  dim ScreenProfile as FolderItem
		  
		  
		  if TargetWin32 then
		    // win plugin
		    ScreenProfile = GetWindowsColorProfileMBS
		  else
		    // mac plugin
		    dim screen as NSScreenMBS = NSScreenMBS.mainScreen
		    dim colorspace as NSColorSpaceMBS = screen.colorSpace
		    
		    if colorspace <> nil then
		      ScreenProfile = colorspace.File
		    end if
		  end if
		  
		  dim profiles as new DynaPDFColorProfilesMBS
		  
		  Profiles.DefInCMYK = nil // default
		  Profiles.DefInGray = nil // default
		  Profiles.DefInRGB = nil // default
		  Profiles.DeviceProfile = ScreenProfile
		  Profiles.SoftProof = nil // default
		  
		  if pdf.InitColorManagement(profiles, pdf.kcsDeviceRGB, pdf.kicmBPCompensation) then
		    
		    
		    
		    
		    // open file
		    call pdf.OpenImportFile(item,0,"")
		    
		    // add page
		    call pdf.Append
		    
		    // import the first page
		    call pdf.ImportPageEx(1,1.0,1.0)
		    call pdf.EndPage
		    
		    dim p as DynaPDFPageMBS = pdf.GetPage(1)
		    
		    dim ra as DynaPDFRectMBS = p.BBox(p.kpbArtBox)
		    dim rb as DynaPDFRectMBS = p.BBox(p.kpbBleedBox)
		    dim rc as DynaPDFRectMBS = p.BBox(p.kpbCropBox)
		    dim rm as DynaPDFRectMBS = p.BBox(p.kpbMediaBox)
		    dim rt as DynaPDFRectMBS = p.BBox(p.kpbTrimBox)
		    
		    // render the page
		    call pdf.RenderPageToImage(1, nil, 72, 0, 0, DynaPDFRasterImageMBS.krfDefault, DynaPDFRasterizerMBS.kpxfRGB, DynaPDFMBS.kcfFlate, DynaPDFMBS.kifmPNG)
		    
		    dim buf as string = pdf.GetImageBuffer
		    
		    dim pic as Picture = PNGStringToPictureMBS(buf)
		    
		    dim w as new PicWindow
		    w.Backdrop = pic
		    
		    w.show
		  end if
		  
		  
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
