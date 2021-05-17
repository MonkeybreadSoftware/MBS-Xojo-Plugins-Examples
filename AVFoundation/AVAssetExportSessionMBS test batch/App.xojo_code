#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  if AVAssetExportSessionMBS.available = false then
		    MsgBox "Please run on Mac OS X 10.7."
		    quit
		  end if
		  
		  AVFoudation = new MyAVFoudationMBS
		  
		  // select videos
		  dim folder as FolderItem = SpecialFolder.desktop.Child("test")
		  
		  if folder.Exists = false then
		    MsgBox "Please put test folder on desktop with videos for batch export."
		    Return
		  end if
		  
		  dim c as integer = folder.Count
		  for i as integer = 1 to c
		    dim file as FolderItem = folder.Item(i)
		    
		    Export file
		  next
		  
		  AutoQuit = true
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Export(file as FolderItem)
		  
		  dim a as AVAssetMBS = AVAssetMBS.assetWithFile(file)
		  
		  if a = nil then
		    MsgBox "This is not a video/audio file."+EndOfLine+file.UnixpathMBS
		    quit
		  end if
		  
		  dim e as new AVAssetExportSessionMBS(a, AVAssetExportSessionMBS.AVAssetExportPreset640x480)
		  e.timeRange = CMTimeRangeMBS.AllTimeRange
		  e.shouldOptimizeForNetworkUse = true
		  
		  
		  dim extension as string = e.outputFileType
		  dim filetypes() as string = e.supportedFileTypes
		  e.outputFileType = FileTypes(0)
		  
		  dim outputfile as FolderItem = SpecialFolder.Desktop.Child(file.NameWithoutExtensionMBS+"."+e.outputFileExtension)
		  
		  if OutputFile.Exists then
		    MoveFileToTrash OutputFile
		    OutputFile = SpecialFolder.Desktop.Child(file.NameWithoutExtensionMBS+"."+e.outputFileExtension)
		  end if
		  
		  e.OutputFile = OutputFile
		  
		  System.DebugLog outputfile.UnixpathMBS
		  
		  dim pw as new ProgressWindow
		  pw.e = e
		  pw.a = a
		  pw.outputfile = outputfile
		  pw.show
		  
		  e.exportAsynchronously(pw)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MoveFileToTrash(f as FolderItem)
		  
		  dim r as FolderItem
		  call MacFileOperationMBS.MoveObjectToTrashSync(f, r, MacFileOperationMBS.kFSFileOperationDefaultOptions)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AVFoudation As MyAVFoudationMBS
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
