#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // please build this app
		  
		  
		  // make sure the Info.plist is adjusted for your feed URL
		  // make sure Sparkle.framework is found and included
		  
		  
		  Dim AppFile As FolderItem = app.ExecutableFile
		  Dim MacOSFolder As FolderItem = AppFile.parent
		  Dim ContentsFolder As FolderItem = MacOSFolder.parent
		  Dim FrameworksFolder As FolderItem = ContentsFolder.Child("Frameworks")
		  Dim f As FolderItem = FrameworksFolder.Child("Sparkle.framework")
		  
		  If Not SUUpdaterMBS.LoadFramework(f) Then
		    break
		    MsgBox "Failed to load Sparkle framework"
		    quit
		  end if
		  
		  u=new MySUUpdater
		  
		  dim d as date
		  dim lines(-1) as string
		  
		  lines.Append "Sparkle Status:"
		  lines.Append ""
		  
		  dim b as NSBundleMBS = u.hostBundle
		  if b = nil then
		    lines.Append "HostBundle: ?"
		  else
		    lines.Append "HostBundle: "+b.bundlePath
		  end if
		  
		  try
		    lines.Append "FeedURL: "+u.feedURL
		  catch n as NSExceptionMBS
		    lines.Append "FeedURL: ?"
		  end try
		  
		  d=u.lastUpdateCheckDate
		  if d=nil then
		    lines.Append "lastUpdateCheckDate: ?"
		  else
		    lines.Append "lastUpdateCheckDate: "+d.LongDate+" "+d.LongTime
		  end if
		  
		  // shows information
		  MsgBox Join(lines,EndOfLine)
		  
		  u.checkForUpdates
		  
		  exception e as NSExceptionMBS
		    MsgBox e.message
		    
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


	#tag Property, Flags = &h21
		Private u As mysuUpdater
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
