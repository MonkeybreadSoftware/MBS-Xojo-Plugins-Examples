#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim track as DRTrackMBS
		  dim bsp as DRBurnSetupPanelMBS
		  dim bpp as DRBurnProgressPanelMBS
		  
		  // we need a track
		  track=CreateTrack
		  
		  if track<>nil then 
		    bsp=new DRBurnSetupPanelMBS
		    
		    // set a few options
		    bsp.setCanSelectAppendableMedia true
		    bsp.setCanSelectTestBurn true
		    
		    if bsp.runSetupPanel=bsp.NSOKButton then
		      bpp=new DRBurnProgressPanelMBS
		      
		      // And start off the burn itself. This will put up the progress dialog
		      // and do all the nice pretty things that a happy app does.
		      bpp.beginProgressPanelForBurn bsp.burnObject, track
		      
		    else
		      MsgBox "You pressed cancel."
		    end if
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function CreateTrack() As DRTrackMBS
		  dim f as FolderItem
		  dim fo as DRFolderMBS
		  
		  f=SelectFolder
		  
		  if f<>nil then
		    fo=DRFolderMBS.folderWithPath(f)
		    if fo<>Nil then
		      Return DRTrackMBS.trackForRootFolder(fo)
		    end if
		  end if
		End Function
	#tag EndMethod


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
