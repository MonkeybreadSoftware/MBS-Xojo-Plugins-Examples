#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub EnableMenuItems()
		  FileUnchecked.enable
		  
		  // normally checked
		  FileChecked.checked = true
		  FileChecked.enable
		  
		  FileDot.enable
		  FileDot.checked = true
		  
		  // with bullet via constructor
		  dim n1 as new NSMenuItemMBS(fileDot)
		  n1.onStateImage = NSImageMBS.imageNamed("NSMenuItemBullet")
		  
		  FileDiamond.enable
		  FileDiamond.checked = true
		  
		  // with diamond via function
		  dim n2 as NSMenuItemMBS = NSMenuItemMBS.MenuItem(FileDiamond)
		  n2.onStateImage = NSImageMBS.imageNamed("NSMenuItemDiamond")
		  
		  FileIcon.enable
		  FileIcon.checked = true
		  
		  // with icon as checkmark
		  dim n3 as NSMenuItemMBS = NSMenuItemMBS.MenuItem(FileIcon)
		  dim icon as NSImageMBS = NSWorkspaceMBS.iconForFileType("com.xojo.project.binary")
		  icon.setSize(16,16)
		  n3.onStateImage = icon
		  
		  FileCustomImage.enable
		  FileCustomImage.checked = true
		  
		  // with custom image as checkmark
		  dim p as new Picture(32,32)
		  dim g as Graphics = p.Graphics
		  g.ForeColor = &c0000FF
		  g.FillOval 0, 0, p.Width, p.Height
		  
		  dim n4 as NSMenuItemMBS = NSMenuItemMBS.MenuItem(FileCustomImage)
		  dim image as new NSImageMBS(p)
		  image.setSize(16,16)
		  n4.onStateImage = image
		  
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
