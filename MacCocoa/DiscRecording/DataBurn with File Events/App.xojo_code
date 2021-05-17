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
		  dim t as DRTrackMBS
		  dim childfolder,folder as DRFolderMBS
		  dim file1,file2 as DRFileMBS
		  dim file as MyDRFileMBS
		  
		  // make root folder
		  folder=DRFolderMBS.virtualFolderWithName("Root") // this will name the disc
		  
		  childfolder=DRFolderMBS.virtualFolderWithName("Childfolder")
		  
		  folder.addChild childfolder
		  
		  file1=DRFileMBS.virtualFileWithName("Hello World", "Hello World Content")
		  file2=DRFileMBS.virtualFileWithName("Hello World", "Hello World Content")
		  
		  folder.addChild file1
		  childfolder.addChild file2
		  
		  file=new MyDRFileMBS("test.txt")
		  folder.addChild file
		  
		  t=DRTrackMBS.trackForRootFolder(folder)
		  
		  Return t
		  
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
