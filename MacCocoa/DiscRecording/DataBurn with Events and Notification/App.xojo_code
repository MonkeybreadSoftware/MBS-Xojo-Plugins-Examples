#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  nc = new DRNotificationCenterMBS
		  m  = new MyNSNotificationObserverMBS
		  
		  dim track as DRTrackMBS
		  
		  logwindow.Show
		  
		  // we need a track
		  track=CreateTrack
		  
		  if track<>nil then 
		    bsp=new MyDRBurnSetupPanelMBS
		    
		    // set a few options
		    bsp.setCanSelectAppendableMedia true
		    bsp.setCanSelectTestBurn true
		    
		    if bsp.runSetupPanel=bsp.NSOKButton then
		      
		      burn = bsp.burnObject
		      
		      // And start off the burn itself. This will put up the progress dialog
		      // and do all the nice pretty things that a happy app does.
		      
		      nc.addObserver(m, DRBurnMBS.DRBurnStatusChangedNotification, burn)
		      
		      burn.writeLayout(track)
		      
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


	#tag Property, Flags = &h0
		bpp As MyDRBurnProgressPanelMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		bsp As MyDRBurnSetupPanelMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		burn As DRBurnMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		m As MyNSNotificationObserverMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		nc As DRNotificationCenterMBS
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
