#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  const AllChannels = &h111
		  
		  dim p as new Picture(500, 500, 32)
		  
		  dim w as new window1
		  w.Title = "white"
		  w.Backdrop = p
		  
		  dim l as Picture = LogoMBS(500)
		  
		  w = new window1
		  w.Title = "Logo"
		  w.Backdrop = l
		  
		  // adds picture. You will normally not see the modification
		  dim x as Picture = p.AddSteganographyPictureMBS(AllChannels, l)
		  
		  w = new window1
		  w.Title = "Logo hidden in white picture"
		  w.Backdrop = x
		  
		  // as we store in lowest bit, this picture will look strange
		  dim y as Picture = x.SteganographyPictureMBS(AllChannels)
		  
		  w = new window1
		  w.Title = "Logo extracted"
		  w.Backdrop = y
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
