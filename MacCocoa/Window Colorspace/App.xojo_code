#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim w1 as new window1(NSColorSpaceMBS.adobeRGB1998ColorSpace)
		  dim w2 as new window1(NSColorSpaceMBS.genericRGBColorSpace)
		  dim w3 as new window1(NSColorSpaceMBS.deviceRGBColorSpace)
		  dim w4 as new window1(NSColorSpaceMBS.sRGBColorSpace)
		  
		  dim s as NSScreenMBS = NSScreenMBS.mainScreen
		  dim c as NSColorSpaceMBS = s.colorSpace
		  dim w5 as new window1(c)
		  
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
