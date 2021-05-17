#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1095375702
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Ohne Titel"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  dim moviefile as FolderItem = SpecialFolder.Desktop.Child("test.mov")
		  if moviefile.Exists = false then
		    MsgBox "Please put test.mov on your desktop or change path in code."
		    Return
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
		    Return
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
		  
		  if v.Handle=0 then
		    msgbox "Failed to initialise."
		    Return
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
		  
		  // needs Util plugin
		  DelayMBS 1.0
		  
		  
		  dim ImageFile as FolderItem = SpecialFolder.Desktop.Child("test.jpg")
		  dim ImagePath as string
		  #if RBVersion < 2013 then
		    ImagePath = ImageFile.UnixpathMBS
		  #else
		    ImagePath = ImageFile.NativePath
		  #endif
		  call mp.VideoTakeSnapshot 0, ImagePath, 0, 0
		  System.DebugLog v.ErrorMessage
		  mp.Stop
		  
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Constant, Name = kLibrary, Type = String, Dynamic = False, Default = \"libvlc", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"@executable_path/lib/libvlc.5.dylib"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"libvlc.dll"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"libvlc.so"
	#tag EndConstant


#tag EndWindowCode

#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
