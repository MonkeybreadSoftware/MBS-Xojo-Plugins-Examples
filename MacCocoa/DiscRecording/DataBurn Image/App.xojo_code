#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim track as DRTrackMBS
		  dim bsp as DRBurnSetupPanelMBS
		  dim bpp as DRBurnProgressPanelMBS
		  
		  // This file must be one that can be read by DiscRecording.
		  // The supported image types include: .dmg, .iso, .cue, and .toc.
		  // For .cue and .toc files the corresponding data files (.bin, .img, etc) must also be present and correctly referenced in the .cue/.toc file.
		  
		  dim file as folderitem=GetOpenFolderItem("")
		  if file=nil then Return
		  
		  bsp=new DRBurnSetupPanelMBS
		  
		  // set a few options
		  bsp.setCanSelectAppendableMedia true
		  bsp.setCanSelectTestBurn true
		  
		  if bsp.runSetupPanel=bsp.NSOKButton then
		    bpp=new DRBurnProgressPanelMBS
		    
		    // And start off the burn itself. This will put up the progress dialog
		    // and do all the nice pretty things that a happy app does.
		    if not bpp.beginProgressPanelForImageFile(bsp.burnObject, file) then
		      MsgBox "Failed to read image file."
		    end if
		    
		  else
		    MsgBox "You pressed cancel."
		  end if
		  
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
