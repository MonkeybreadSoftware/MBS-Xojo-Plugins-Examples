#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim f as FolderItem = SpecialFolder.Desktop.Child("test.pdf")
		  
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  call pdf.CreateNewPDF f
		  
		  // We want to use top-down coordinates
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  // needs MBS Main Plugin
		  dim pic as Picture = LogoMBS(500)
		  dim out as new Picture(100, 100, 32)
		  dim r as RGBSurface = pic.RGBSurface
		  dim g as Graphics = out.Graphics
		  
		  for y as integer = 0 to 499
		    if y mod 5 = 0 then
		      System.DebugLog str(y)
		    end if
		    for x as integer = 0 to 499
		      
		      g.ForeColor = r.Pixel(x, y)
		      g.FillRect 0,0,g.Width,g.Height
		      
		      call pdf.InsertPicture(out, x, y, 1, 1)
		    next
		  next
		  
		  call pdf.EndPage
		  call pdf.CloseFile
		  
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
