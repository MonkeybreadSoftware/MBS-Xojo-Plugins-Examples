#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim track as DRTrackMBS
		  dim bsp as DRBurnSetupPanelMBS
		  dim bpp as DRBurnProgressPanelMBS
		  
		  // Let's build a folder with a few files
		  
		  dim rootfolder as DRFolderMBS = DRFolderMBS.virtualFolderWithName("My Test CD")
		  rootfolder.explicitFilesystemMask = BitwiseOr(BitwiseOr(DRFolderMBS.DRFilesystemInclusionMaskHFSPlus, DRFolderMBS.DRFilesystemInclusionMaskJoliet), DRFolderMBS.DRFilesystemInclusionMaskISO9660)
		  
		  // a file with some text using Constructor
		  dim testfile1 as new DRFileMBS("test.txt", "Hello World!")
		  rootfolder.addChild testfile1
		  
		  // a file with a picture
		  dim pic as Picture = LogoMBS(500)
		  dim jpegdata as string = PictureToJPEGStringMBS(pic, 75)
		  dim testfile2 as DRFileMBS = DRFileMBS.virtualFileWithName("MBS Logo.jpg", jpegdata)
		  if testfile2 = nil then
		    MsgBox "testfile2 is nil!?"
		  else
		    rootfolder.addChild testfile2
		  end if
		  
		  // now add the folder with our project
		  dim folder as DRFolderMBS = DRFolderMBS.folderWithPath(findFile("DiscRecording"))
		  if folder = nil then
		    MsgBox "folder is nil!?"
		  else
		    rootfolder.addChild Folder
		  end if
		  
		  // now add some folder for links
		  dim LinkFolder as new DRFolderMBS("Links")
		  if LinkFolder = nil then
		    MsgBox "LinkFolder is nil!?"
		  else
		    rootfolder.addChild LinkFolder
		  end if
		  
		  // create a pic file on disc
		  dim file as FolderItem = SpecialFolder.Desktop.Child("testfile.jpg")
		  dim b as BinaryStream = file.CreateBinaryFile("") // needs to be BinaryStream.Create in newer REAL Studio versions
		  
		  b.Write jpegdata
		  b.Close
		  
		  // a file with a picture
		  dim testfile3 as new DRFileMBS(file)
		  if testfile3 = nil then
		    MsgBox "testfile3 is nil!?"
		  else
		    rootfolder.addChild testfile3
		  end if
		  
		  
		  '// add a sym link, does not work currently and no idea why.
		  dim SymLink as DRFileMBS = DRFileMBS.symLinkPointingTo(testfile3, DRFileMBS.DRHFSPlus)
		  if SymLink = nil then
		    MsgBox "SymLink is nil!?"
		  else
		    LinkFolder.addChild SymLink
		  end if
		  
		  // Currently with 10.6.4 creating an alias does create only an empty file and creating a hard link crashes, so go with symbol links.
		  
		  track = DRTrackMBS.trackForRootFolder(rootfolder)
		  
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
		  
		  Exception n as NSExceptionMBS
		    MsgBox n.message
		    
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
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
