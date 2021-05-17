#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  app.AutoQuit = true
		  
		  // pick some movie
		  dim f as FolderItem = SpecialFolder.Desktop.Child("test.mov")
		  
		  if not f.Exists then
		    Break
		    MsgBox "pLease check movie path in code."
		    Return
		  end if
		  
		  dim a as AVAssetMBS = AVAssetMBS.assetWithFile(f)
		  
		  if a = nil then
		    MsgBox "Failed to open asset."
		    Return
		  end if
		  
		  dim g as new AVAssetImageGeneratorMBS(a)
		  dim timeRequested as CMTimeMBS = CMTimeMBS.MakeWithSeconds(5, 30)
		  dim actualTime as CMTimeMBS
		  dim error as NSErrorMBS
		  dim c as CGImageMBS = g.CGImageAtTime(timeRequested, actualTime, error)
		  dim p as Picture = c.Picture
		  
		  window1.backdrop = p
		  
		  
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
