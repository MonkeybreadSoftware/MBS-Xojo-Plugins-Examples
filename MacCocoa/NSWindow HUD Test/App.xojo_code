#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim x as Double = 100
		  dim y as Double = screen(0).Height-100 // Cocoa has reversed y axis
		  dim w as Double = 250
		  dim h as Double = 300
		  
		  dim styleMask as integer
		  dim BackingStoreType as integer = 2 // NSBackingStoreBuffered
		  
		  styleMask = BitwiseOr(styleMask, NSWindowMBS.NSTitledWindowMask) // with title bar
		  styleMask = BitwiseOr(styleMask, NSWindowMBS.NSClosableWindowMask) // with close button
		  styleMask = BitwiseOr(styleMask, NSWindowMBS.NSMiniaturizableWindowMask) // with minimize button
		  'styleMask = BitwiseOr(styleMask, NSWindowMBS.NSResizableWindowMask) // with resize gadget
		  styleMask = BitwiseOr(styleMask, NSPanelMBS.NSHUDWindowMask) // make it HUD
		  styleMask = BitwiseOr(styleMask, NSPanelMBS.NSUtilityWindowMask) // and make it a palette
		  
		  win = new NSPanelMBS(x,y,w,h, styleMask, BackingStoreType, true)
		  
		  // add a few labels
		  dim label1 as new NSTextFieldMBS(120,270,100,20)
		  label1.Editable = false
		  label1.Bezeled = false
		  label1.Bordered = false
		  label1.drawsBackground = false
		  label1.textColor = NSColorMBS.whiteColor
		  labels.Append label1
		  win.contentView.addSubview label1
		  
		  dim label2 as new NSTextFieldMBS(120,240,100,20)
		  label2.Editable = false
		  labels.Append label2
		  win.contentView.addSubview label2
		  
		  // add a slider
		  slider = new MyNSSliderMBS(10, 270, 100, 20)
		  slider.maxValue = 100
		  slider.minValue = 0
		  slider.DoubleValue = 50
		  slider.label = label1
		  
		  win.contentView.addSubview slider
		  
		  // add popup
		  popup = new myNSPopupButtonMBS(10, 240, 100, 20)
		  popup.addItemWithTitle "Europe"
		  popup.addItemWithTitle "Asia"
		  popup.addItemWithTitle "America"
		  popup.addItemWithTitle "Africa"
		  popup.addItemWithTitle "Australia"
		  popup.label = label2
		  
		  win.contentView.addSubview popup
		  
		  
		  
		  // and show
		  win.show
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		labels(-1) As NSTextFieldMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		popup As myNSPopupButtonMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		slider As MyNSSliderMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		win As NSWindowMBS
	#tag EndProperty


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
