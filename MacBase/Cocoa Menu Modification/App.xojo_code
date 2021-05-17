#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub EnableMenuItems()
		  Ablagetest.Enable
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  o = new MyMenuObserver
		  dim c as NSNotificationCenterMBS = NSNotificationCenterMBS.defaultCenter
		  
		  c.addObserver o, NSMenuMBS.NSMenuDidAddItemNotification
		  
		  // make big image
		  dim p as Picture = LogoMBS(32)
		  dim n as new NSImageMBS(p)
		  
		  // make it smaller than pixels allow. Maybe helps for retina?
		  n.setSize 16,16
		  
		  img = n
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		img As NSImageMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		o As MyMenuObserver
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
