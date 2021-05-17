#tag WebPage
Begin WebPage WebPage1
   AllowTabOrderWrap=   True
   Compatibility   =   ""
   ControlID       =   ""
   Enabled         =   True
   Height          =   614
   ImplicitInstance=   True
   Index           =   0
   Indicator       =   0
   IsImplicitInstance=   False
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   173
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   LockVertical    =   False
   MinimumHeight   =   400
   MinimumWidth    =   600
   TabIndex        =   0
   Title           =   "VLC Video"
   Top             =   220
   Visible         =   True
   Width           =   812
   _ImplicitInstance=   False
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mName          =   ""
   _mPanelIndex    =   -1
   Begin WebImageViewer ImageViewer
      ControlID       =   ""
      Enabled         =   True
      Height          =   480
      HorizontalAlignment=   0
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Picture         =   0
      Scope           =   0
      SVGData         =   ""
      TabIndex        =   0
      Tooltip         =   ""
      Top             =   48
      URL             =   ""
      VerticalAlignment=   0
      Visible         =   True
      Width           =   640
      _mPanelIndex    =   -1
      _ProtectImage   =   False
   End
   Begin WebLabel Info
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   22
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   0
      TabIndex        =   1
      Text            =   "Loading..."
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   14
      Underline       =   False
      Visible         =   True
      Width           =   232
      _mPanelIndex    =   -1
   End
   Begin WebLabel Label1
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   54
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      LockVertical    =   False
      Multiline       =   True
      Scope           =   0
      TabIndex        =   2
      Text            =   "This is more like a ""yes, we can do it!"" than a real sample. Sound will play on the server, not on the client. But it may be good to show previews of videos in web apps using VLC. Or for watching several security cameras an update image viewers with several images from different cameras."
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   540
      Underline       =   False
      Visible         =   True
      Width           =   772
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Event
		Sub Close()
		  if mp<>Nil then
		    mp.stop
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  OpenFile
		  CheckNewFrame
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CheckNewFrame()
		  
		  
		  // show frame counter
		  Counter = Counter + 1
		  info.text = Str(Counter)
		  
		  if mp<>nil then
		    // and draw picture to window
		    CurrentPicture = mp.CopyPicture
		    
		    if CurrentPicture<>nil then
		      ImageViewer.Picture = CurrentPicture
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OpenFile()
		  
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
		  
		  
		  
		  // startup vlc engine
		  dim margs(-1) as string
		  
		  margs.append "--no-video-title-show"            // nor the filename displayed */
		  margs.append "--verbose=0"                      // show only errors */
		  margs.append "--no-media-library"               // don't want that */
		  margs.append "--no-sub-autodetect"              // don't want subtitles */
		  margs.append "--ignore-config"
		  
		  // System.DebugLog "Init..."
		  dim v as new VLCInstanceMBS(margs)
		  // System.DebugLog "Inited."
		  
		  if v.Handle=0 then
		    msgbox "Failed to initialise."
		    Return
		  end if
		  
		  // and simply play a movie. Video goes to our buffer, so we can get it in the timer
		  #if RBVersion < 2013 then
		    m = VLCMediaMBS.MediaWithPath(v, Moviefile.UnixpathMBS)
		  #else
		    m = VLCMediaMBS.MediaWithPath(v, Moviefile.NativePath)
		  #endif
		  if m = nil then
		    MsgBox "Failed to get media."
		    Return
		  end if
		  
		  mp = new VLCMediaPlayerMBS(m)
		  if mp.Handle=0 then
		    msgbox "Failed to init media player."
		    Return
		  end if
		  
		  // figure out size of video
		  m.Parse
		  
		  dim info() as VLCMediaTrackInfoMBS = m.TrackInfos
		  
		  dim h as integer = 640
		  dim w as integer = 480
		  
		  for each i as VLCMediaTrackInfoMBS in info
		    if i.Type = i.TrackVideo then
		      System.DebugLog "Video track with: "+str(i.Width)+" x "+str(i.Height)
		      w = i.Width
		      h = i.Height
		    end if
		  next
		  
		  ImageViewer.Width = w
		  ImageViewer.Height = h
		  
		  mp.VideoSetCallback w, h
		  
		  call mp.Play
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Counter As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentPicture As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		m As VLCMediaMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		mp As VLCMediaPlayerMBS
	#tag EndProperty


	#tag Constant, Name = kLibrary, Type = String, Dynamic = False, Default = \"libvlc", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"@executable_path/lib/libvlc.5.dylib"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"libvlc.dll"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"libvlc.so"
	#tag EndConstant


#tag EndWindowCode

#tag Events ImageViewer
	#tag Event
		Sub PictureChanged()
		  CheckNewFrame
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="_mPanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue="-1"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutType"
		Visible=true
		Group="Behavior"
		InitialValue="LayoutTypes.Fixed"
		Type="LayoutTypes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Fixed"
			"1 - Flex"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignHeight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignWidth"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mName"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabOrderWrap"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Visual Controls"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Indicator"
		Visible=false
		Group="Visual Controls"
		InitialValue=""
		Type="WebUIControl.Indicators"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Primary"
			"2 - Secondary"
			"3 - Success"
			"4 - Danger"
			"5 - Warning"
			"6 - Info"
			"7 - Light"
			"8 - Dark"
			"9 - Link"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutDirection"
		Visible=true
		Group="WebView"
		InitialValue="LayoutDirections.LeftToRight"
		Type="LayoutDirections"
		EditorType="Enum"
		#tag EnumValues
			"0 - LeftToRight"
			"1 - RightToLeft"
			"2 - TopToBottom"
			"3 - BottomToTop"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Index"
		Visible=false
		Group="ID"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="IsImplicitInstance"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockHorizontal"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockVertical"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
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
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_ImplicitInstance"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="CurrentPicture"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Counter"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
