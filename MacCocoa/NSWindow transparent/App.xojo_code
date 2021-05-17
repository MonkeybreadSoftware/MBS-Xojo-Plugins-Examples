#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // get a picture with mask
		  
		  dim p as Picture = LogoMBS(500)
		  dim g as Graphics = p.mask.Graphics
		  
		  g.ForeColor = &cFFFFFF
		  g.FillRect 0, 0, 500, 500
		  
		  g.ForeColor = &c000000
		  g.FillOval 0, 0, 500, 500
		  
		  // create window
		  
		  dim stylemask as integer = 0
		  
		  n = new NSWindowMBS(100, Screen(0).Height-600, 500, 500, stylemask)
		  n.hasShadow = true
		  n.isOpaque = false
		  
		  c = new MyView(0, 0, 500, 500)
		  c.pic = new NSImageMBS(p,p.mask)
		  n.contentView.addSubview c
		  
		  n.show
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		c As MyView
	#tag EndProperty

	#tag Property, Flags = &h0
		n As NSWindowMBS
	#tag EndProperty


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
