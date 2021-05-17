#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Close()
		  if inited then
		    // you can have trouble if you don't cleanup properly
		    EDSModuleMBS.Terminate
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  DebugCopyFrameworks
		  
		  dim file as FolderItem
		  
		  // find DLL in application folder
		  if TargetWin32 then
		    file = FindFile("EDSDK.dll")
		  elseif TargetMacOS then
		    // find Framework in inside frameworks folder in app bundle
		    dim frameworks as FolderItem = app.ExecutableFile.Parent.parent.Child("Frameworks")
		    
		    file = frameworks.Child("EDSDK.framework")
		  else
		    MsgBox "not supported."
		  end if
		  
		  // pass true for version 2.x of SDK or false for 3.x
		  dim isVersion2 as Boolean = true 
		  
		  // load framework or DLL
		  if EDSModuleMBS.LoadLibrary(file, isVersion2) then
		    
		    EDSModuleMBS.Initialize
		    dim e as integer = EDSModuleMBS.Lasterror
		    if e = 0 then
		      Inited = true
		      
		      // okay, so wait for cameras
		      cah = new MyEdsCameraAddedHandlerMBS
		      
		      MainWindow.OpenDevice
		      
		    else
		      MsgBox "Failed to initialize: "+str(e)
		    end if
		    
		  else
		    MsgBox "Failed to load library."
		  end if
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DebugCopyFrameworks()
		  // for debug mode I used to copy the framework files into the app on startup
		  // makes debugging much easier!
		  
		  if DebugBuild and TargetMachO then
		    dim frameworks as FolderItem = app.ExecutableFile.Parent.parent.Child("Frameworks")
		    
		    dim f as FolderItem = FindFile("EDSDK.framework")
		    
		    f.CopyFileTo frameworks
		    
		    f = FindFile("DPP.framework")
		    f.CopyFileTo frameworks
		    
		  end if
		  
		End Sub
	#tag EndMethod

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


	#tag Property, Flags = &h0
		cah As MyEdsCameraAddedHandlerMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		Inited As Boolean
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
		#tag ViewProperty
			Name="Inited"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
