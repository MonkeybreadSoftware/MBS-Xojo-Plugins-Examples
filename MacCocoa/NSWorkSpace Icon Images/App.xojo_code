#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim f as FolderItem = SpecialFolder.Desktop
		  dim n as NSImageMBS = NSWorkspaceMBS.iconForFile(f)
		  
		  dim reps() as NSImageRepMBS = n.representations
		  for each r as NSImageRepMBS in reps
		    window1.Listbox1.AddRow str(r.width), str(R.height), str(r.pixelsWide), str(R.pixelsHigh), str(R.pixelsWide>r.width)
		    
		    n.removeRepresentation r
		    
		    dim nn as new NSImageMBS(r.pixelsWide, r.pixelsHigh)
		    nn.addRepresentation r
		    
		    dim w as new window2
		    w.Backdrop = nn.CopyPictureWithMask
		    w.Width = r.pixelswide
		    w.height = r.pixelshigh
		  next
		  
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
