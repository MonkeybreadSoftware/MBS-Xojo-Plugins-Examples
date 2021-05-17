#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim p as Picture = LogoMBS(500)
		  
		  show p, "original"
		  
		  show p.SobelChannelsMBS(true, false, false, 1,3,true), "only red, swap, west and north"
		  show p.SobelChannelsMBS(true, false, false, 2,4,true), "only red, swap, east and south"
		  
		  show p.SobelMBS(1,3,true,false), "color, swap, west and north"
		  show p.SobelMBS(2,4,true,false), "color, swap, east and south"
		  
		  show p.SobelMBS(5,6,false,false), "color, southeast and northwest"
		  show p.SobelMBS(7,8,false,false), "color, northeast and southwest"
		  
		  show p.SobelMBS(1,3,true,true), "gray, swap, west and north"
		  show p.SobelMBS(2,4,true,true), "gray, swap, east and south"
		  
		  show p.SobelMBS(5,6,false,true), "gray, southeast and northwest"
		  show p.SobelMBS(7,8,false,true), "gray, northeast and southwest"
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub show(pic as Picture, title as string)
		  dim w as new window1
		  
		  w.Backdrop = pic
		  w.Title = Title
		  w.show
		  
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
