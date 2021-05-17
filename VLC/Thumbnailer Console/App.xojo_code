#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  
		  DebugCopyLibs
		  
		  dim moviefile as FolderItem = SpecialFolder.Desktop.Child("test.mov")
		  if moviefile.Exists = false then
		    MsgBox "Please put test.mov on your desktop or change path in code."
		    Return 1
		  end if
		  
		  dim LibName as string = kLibrary
		  dim ExecutableFolder as FolderItem = app.ExecutableFile.parent
		  
		  
		  #if TargetMacOS then
		    // preload library, so it's not complaining that file is not found later.
		    
		    dim LibFolder as FolderItem = ExecutableFolder.Child("lib")
		    
		    dim libvlccore9 as FolderItem = LibFolder.Child("libvlccore.9.dylib")
		    if libvlccore9 <> nil and libvlccore9.Exists then
		      dim s as new SoftDeclareMBS
		      if s.LoadDylib(libvlccore9.NativePath) then
		        'MsgBox "OK"
		        System.DebugLog libvlccore9.name+" loaded."
		      else
		        MsgBox s.Liberror
		      end if
		    end if
		    
		    dim libvlccore8 as FolderItem = LibFolder.Child("libvlccore.8.dylib")
		    if libvlccore8 <> nil and libvlccore8.Exists then
		      dim s as new SoftDeclareMBS
		      if s.LoadDylib(libvlccore8.NativePath) then
		        'MsgBox "OK"
		        System.DebugLog libvlccore8.name+" loaded."
		      else
		        MsgBox s.Liberror
		      end if
		    end if
		    
		    dim libvlc5 as FolderItem = LibFolder.Child("libvlc.5.dylib")
		    if libvlc5 <> nil and libvlc5.Exists then
		      dim s as new SoftDeclareMBS
		      if s.LoadDylib(libvlc5.NativePath) then
		        'MsgBox "OK"
		        LibName = libvlc5.NativePath
		        System.DebugLog libvlc5.name+" loaded."
		      else
		        MsgBox s.Liberror
		      end if
		    end if
		    
		    // we need to put path to plugins in environment variable to make it work
		    dim Plugins as FolderItem = ExecutableFolder.Child("plugins")
		    System.EnvironmentVariable("VLC_PLUGIN_PATH") = Plugins.NativePath
		    
		  #endif
		  
		  // load library
		  if VLCInstanceMBS.LoadLibrary(LibName) then
		    System.DebugLog "Library Loaded."
		  else
		    msgbox "Failed to load library"+EndOfLine+EndOfLine+VLCInstanceMBS.GetLoadError
		    Return 2
		  end if
		  
		  
		  dim margs(-1) as string
		  
		  margs.append "--intf"                           // no interface
		  margs.append "dummy"
		  margs.append "--vout=dummy"                     // we don't want video (output)
		  margs.append "dummy"
		  margs.append "--no-audio"                       // we don't want audio (decoding)
		  margs.append "--no-video-title-show"            // nor the filename displayed */
		  margs.append "--no-stats"                       // no stats
		  margs.append "--verbose=0"                      // show only errors
		  margs.append "--no-sub-autodetect-file"         // we don't want subtitles
		  'margs.append "--no-inhibit"                     // we don't want interfaces
		  margs.append "--no-disable-screensaver"         // we don't want interfaces
		  margs.append "--no-snapshot-preview"            // no blending in dummy vout
		  margs.append "--ignore-config"
		  
		  dim v as new VLCInstanceMBS(margs)
		  
		  if v.Handle = 0 then
		    print "Failed to initialise."
		    Return 1
		  end if
		  
		  dim m as VLCMediaMBS 
		  #if RBVersion < 2013 then
		    m = VLCMediaMBS.MediaWithPath(v, Moviefile.UnixpathMBS)
		  #else
		    m = VLCMediaMBS.MediaWithPath(v, Moviefile.NativePath)
		  #endif
		  dim mp as new VLCMediaPlayerMBS(m)
		  
		  call mp.Play
		  mp.Position = 0.3
		  
		  dim e as new MyVLCEventManagerMBS(mp)
		  
		  // needs Util plugin
		  DelayMBS 1.0
		  
		  e = nil
		  
		  dim ImageFile as FolderItem = SpecialFolder.Desktop.Child("test.jpg")
		  dim ImagePath as string 
		  #if RBVersion < 2013 then
		    ImagePath = ImageFile.UnixpathMBS
		  #else
		    ImagePath = ImageFile.NativePath
		  #endif
		  call mp.VideoTakeSnapshot 0, ImagePath, 0, 0
		  mp.Stop
		  
		  
		  
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DebugCopyLibs()
		  
		  
		  // copy vlc libs into app
		  
		  // you need 32 bit version of VLC to have this work for 32bit app!
		  // and 64-bit libs for 64-bit app
		  
		  #if TargetMacOS then
		    
		    #if Target32Bit then
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


	#tag Constant, Name = kLibrary, Type = String, Dynamic = False, Default = \"libvlc", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"@executable_path/lib/libvlc.5.dylib"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"libvlc.dll"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"libvlc.so"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
