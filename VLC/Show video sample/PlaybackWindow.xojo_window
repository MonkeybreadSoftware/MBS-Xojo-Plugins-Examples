#tag Window
Begin Window PlaybackWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   480
   ImplicitInstance=   True
   LiveResize      =   False
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
   Resizeable      =   False
   Title           =   "VLC"
   Visible         =   True
   Width           =   640
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   10
      Scope           =   0
      TabPanelIndex   =   "0"
   End
   Begin Canvas OutputCanvas
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   428
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   640
   End
   Begin PushButton PlayButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Play"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   440
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton PauseButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Pause"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   112
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   440
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  if mp<>Nil then
		    mp.stop
		  end if
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  'System.DebugLog CurrentMethodName
		  
		  Dim moviefile As FolderItem = SpecialFolder.Desktop.Child("test.mp4")
		  if moviefile.Exists = false then
		    MsgBox "Please put test.mp4 on your desktop or change path in code."
		    Return
		  end if
		  
		  dim LibName as string = kLibrary
		  InitForMacOS LibName
		  
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
		  margs.append "--no-media-library"               // don't want that */
		  margs.append "--no-sub-autodetect"              // don't want subtitles */
		  margs.append "--ignore-config"
		  'margs.Append "--no-plugins-cache" // maybe no cache?
		  'margs.append "--verbose=2"                      // show only errors */
		  
		  System.DebugLog "Init..."
		  for each arg as string in margs
		    System.DebugLog arg
		  next 
		  
		  dim v as new VLCInstanceMBS(margs)
		  System.DebugLog "Inited."
		  
		  if v.Handle=0 then
		    msgbox "Failed to initialise."
		    Return
		  end if
		  
		  // and simply play a movie. Video goes to our buffer, so we can get it in the timer
		  m = VLCMediaMBS.MediaWithFile(v, Moviefile)
		  if m = nil then
		    MsgBox "Failed to get media."
		    Return
		  end if
		  
		  System.DebugLog "Init MediaPlayer..."
		  mp = new VLCMediaPlayerMBS(m)
		  if mp.Handle=0 then
		    msgbox "Failed to init media player."
		    Return
		  end if
		  
		  // figure out size of video
		  System.DebugLog "Parse..."
		  m.Parse
		  
		  System.DebugLog "TrackInfos..."
		  dim info() as VLCMediaTrackInfoMBS = m.TrackInfos
		  
		  // scale window ?
		  dim h as integer = 640
		  dim w as integer = 480
		  
		  for each i as VLCMediaTrackInfoMBS in info
		    if i.Type = i.TrackVideo then
		      System.DebugLog "Video track with: "+str(i.Width)+" x "+str(i.Height)
		      w = i.Width
		      h = i.Height
		    end if
		  next
		  
		  Width = w
		  Height = h + 52
		  
		  // alternative way without views, but getting pictures
		  'System.DebugLog "VideoSetCallback..."
		  'timer1.Mode = timer.ModeMultiple
		  'mp.VideoSetCallback w, h
		  
		  // directly to the NSView
		  #if TargetMacOS then
		    mp.NSObject = Ptr(OutputCanvas.Handle)
		  #elseif TargetWin32 then
		    mp.HWND = OutputCanvas.Handle
		  #elseif TargetLinux then
		    mp.XWindow = OutputCanvas.Handle
		  #endif
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  if CurrentPicture <> nil then
		    g.DrawPicture CurrentPicture, 0, 0, g.Width, g.Height, 0, 0, CurrentPicture.Width, CurrentPicture.Height
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  // only for timer mode with pictures...
		  
		  'dim p as Double = mp.Position
		  'mp.stop
		  '
		  'System.DebugLog "VideoSetCallback..."
		  '#if TargetMacOS then
		  '// install callbacks to draw video into CGContextMBS object.
		  'mp.VideoSetCallback(width, height)
		  '#else
		  'timer1.Mode = timer.ModeMultiple
		  'mp.VideoSetCallback width, height
		  '#endif
		  '
		  'call mp.Play
		  'mp.Position = p
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub InitForMacOS(byref LibName as string)
		  dim ExecutableFolder as FolderItem = app.ExecutableFile.parent
		  
		  #if TargetMacOS then
		    // preload library, so it's not complaining that file is not found later.
		    
		    dim LibFolder as FolderItem = ExecutableFolder.Child("lib")
		    
		    dim libvlccore9 as FolderItem = LibFolder.Child("libvlccore.9.dylib")
		    if libvlccore9 <> nil and libvlccore9.Exists then
		      dim s as new SoftDeclareMBS
		      dim p as string
		      #if RBVersion < 2013 then
		        p = libvlccore9.UnixpathMBS 
		      #else
		        p = libvlccore9.NativePath 
		      #endif
		      if s.LoadDylib(p) then
		        'MsgBox "OK"
		        System.DebugLog libvlccore9.name+" loaded."
		      else
		        MsgBox s.Liberror
		      end if
		    end if
		    
		    dim libvlccore8 as FolderItem = LibFolder.Child("libvlccore.8.dylib")
		    if libvlccore8 <> nil and libvlccore8.Exists then
		      dim s as new SoftDeclareMBS
		      dim p as string
		      #if RBVersion < 2013 then
		        p = libvlccore8.UnixpathMBS
		      #else
		        p = libvlccore8.NativePath
		      #endif
		      if s.LoadDylib(p) then
		        'MsgBox "OK"
		        System.DebugLog libvlccore8.name+" loaded."
		      else
		        MsgBox s.Liberror
		      end if
		    end if
		    
		    dim libvlc5 as FolderItem = LibFolder.Child("libvlc.5.dylib")
		    if libvlc5 <> nil and libvlc5.Exists then
		      dim s as new SoftDeclareMBS
		      dim p as string
		      #if RBVersion < 2013 then
		        p = libvlc5.UnixpathMBS
		      #else
		        p = libvlc5.NativePath
		      #endif
		      if s.LoadDylib(p) then
		        'MsgBox "OK"
		        LibName = p
		        System.DebugLog libvlc5.name+" loaded."
		      else
		        MsgBox s.Liberror
		      end if
		    end if
		    
		    // we need to put path to plugins in environment variable to make it work
		    dim Plugins as FolderItem = ExecutableFolder.Child("plugins")
		    dim p as string
		    #if RBVersion < 2013 then
		      p = Plugins.UnixpathMBS
		    #else
		      p = Plugins.NativePath
		    #endif
		    System.EnvironmentVariable("VLC_PLUGIN_PATH") = p
		    
		  #endif
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CGContext As Variant
	#tag EndProperty

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
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"libvlc.dylib"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"libvlc.dll"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"libvlc.so"
	#tag EndConstant


#tag EndWindowCode

#tag Events Timer1
	#tag Event
		Sub Action()
		  if mp<>Nil then
		    if mp.HasNewFrame then
		      
		      // show frame counter
		      Counter = Counter + 1
		      Title = Str(Counter)
		      
		      // and draw picture to window
		      CurrentPicture = mp.CopyPicture
		      'Graphics.DrawPicture CurrentPicture,0,0
		      
		      #if RBVersion < 2013 then
		        self.Refresh(False)
		      #else
		        self.invalidate
		      #endif
		    end if
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PlayButton
	#tag Event
		Sub Action()
		  call mp.Play
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PauseButton
	#tag Event
		Sub Action()
		  call mp.Pause
		  
		End Sub
	#tag EndEvent
#tag EndEvents
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
