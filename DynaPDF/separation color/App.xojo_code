#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim f as FolderItem = SpecialFolder.Desktop.Child("separation color.pdf")
		  
		  call pdf.CreateNewPDF f
		  call pdf.SetPageCoords pdf.kpcTopDown
		  call pdf.Append
		  
		  // Create new separation color
		  dim ColorSpaceHandle as integer = pdf.CreateSeparationCS("test",DynapdfMBS.kcsDeviceCMYK,-1,DynapdfMBS.CMYK(0,0,0,100))
		  call pdf.SetExtColorSpace(ColorSpaceHandle)
		  
		  // draw something
		  call pdf.SetfillColor(255) // 100% of the separation color test
		  call pdf.DrawCircle(193,389,66, pdf.kfmFill)
		  
		  call pdf.EndPage
		  call pdf.CloseFile
		  
		  f.Launch
		  quit
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
