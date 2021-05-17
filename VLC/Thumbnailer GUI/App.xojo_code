#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  DebugCopyLibs
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DebugCopyLibs()
		  
		  
		  // copy vlc libs into app
		  
		  // you need 32 bit version of VLC to have this work for 32bit app!
		  // and 64-bit libs for 64-bit app
		  
		  #if TargetMacOS then
		    
		    #If Target32Bit Then
		      // we keep an old copy of version 2.0.9 for 32-bit
		      dim apppath as FolderItem = SpecialFolder.Applications.Child("VLC alt.app")
		    #else
		      Dim apppath As FolderItem = GetFolderItem("/Applications/VLC.app", folderitem.PathTypeNative)
		    #endif
		    
		    if apppath<>Nil and apppath.Visible then
		      dim ContentsFolder as FolderItem = apppath.Child("Contents")
		      if ContentsFolder<>Nil and ContentsFolder.Visible then
		        dim MacOSFolder as FolderItem = ContentsFolder.Child("MacOS")
		        if MacOSFolder<>Nil and MacOSFolder.Visible then
		          
		          dim TargetFolder as FolderItem = app.ExecutableFile.parent
		          
		          dim LibFolder as FolderItem = MacOSFolder.Child("lib")
		          LibFolder.CopyFileTo TargetFolder
		          
		          dim pluginsFolder as FolderItem = MacOSFolder.Child("plugins")
		          pluginsFolder.CopyFileTo TargetFolder
		          
		        end if
		      end if
		    end if
		  #endif
		  
		  #if TargetWin32 then
		    dim VideoLANFolder as FolderItem = SpecialFolder.Applications.Child("VideoLAN")
		    if VideoLANFolder<>Nil and VideoLANFolder.Visible then
		      System.DebugLog VideoLANFolder.NativePath
		      dim VLCFolder as FolderItem = VideoLANFolder.Child("VLC")
		      if VLCFolder<>Nil and VLCFolder.Exists then
		        
		        
		        dim ExecutableFolder as FolderItem = app.ExecutableFile.parent
		        
		        dim libvlc as FolderItem = VLCFolder.Child("libvlc.dll")
		        libvlc.CopyFileTo ExecutableFolder
		        
		        dim libvlccore as FolderItem = VLCFolder.Child("libvlccore.dll")
		        libvlccore.CopyFileTo ExecutableFolder
		        
		        dim pluginsFolder as FolderItem = VLCFolder.Child("plugins")
		        dim destPluginsFolder as FolderItem = ExecutableFolder.Child("plugins")
		        
		        // copy whole folder
		        dim w as new WindowsFileCopyMBS
		        call w.FileOperationCopy(pluginsFolder, destPluginsFolder, w.FileOperationNoErrorUI+w.FileOperationNoConfirmation)
		        
		      end if
		    end if
		  #endif
		  
		  #if TargetLinux
		    // please copy libs or put symlinks in the folder now
		    Break
		  #endif
		  
		End Sub
	#tag EndMethod


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
