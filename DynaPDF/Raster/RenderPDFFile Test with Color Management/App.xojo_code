#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  dim file as FolderItem = SpecialFolder.Desktop.Child("test.pdf")
		  
		  if file.Exists = false then
		    MsgBox "No test.pdf found on desktop."
		    Return
		  end if
		  
		  dim pdf as new MyDynapdfMBS
		  
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  call pdf.CreateNewPDF nil
		  
		  // load CharacterMaps if you want to correctly process asian fonts
		  'call pdf.SetCMapDir(SpecialFolder.Desktop.Child("CMap"), pdf.klcmRecursive)
		  
		  
		  call pdf.OpenImportFile(file, 0, "")
		  call pdf.ImportPDFFile(1, 1.0, 1.0)
		  
		  
		  // create a TIFF file without color managament
		  
		  dim outfile as FolderItem = SpecialFolder.Desktop.Child("test without color managament.tif")
		  
		  dim Flags  as integer = DynaPDFRasterImageMBS.krfDefault
		  dim PixFmt as integer = DynaPDFRasterizerMBS.kpxfRGB
		  dim Format as integer = DynaPDFMBS.kifmTIFF // use kifm* constants
		  dim Filter as integer = DynaPDFMBS.kcfLZW // pick a compression scheme for the file format
		  
		  call pdf.RenderPDFFile(outfile, 72, Flags, PixFmt, Filter, Format)
		  outfile.Launch
		  
		  // init color management
		  
		  dim ScreenProfile as FolderItem
		  
		  
		  if TargetWin32 then
		    // Needs Win plugin
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
		    
		    // create a TIFF file with color managament
		    
		    outfile = SpecialFolder.Desktop.Child("test with color managament.tif")
		    
		    call pdf.RenderPDFFile(outfile, 72, Flags, PixFmt, Filter, Format)
		    
		    outfile.Launch
		  end if
		  
		  quit
		  
		  
		End Sub
	#tag EndEvent


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
