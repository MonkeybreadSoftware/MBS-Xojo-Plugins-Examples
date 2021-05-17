#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   300
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   -1200468213
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Write some note"
   Visible         =   True
   Width           =   300
   Begin TextArea EditField1
      AcceptTabs      =   False
      Alignment       =   0
      AllowSpellChecking=   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      BalloonHelp     =   ""
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Format          =   ""
      Height          =   123
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Mask            =   ""
      MultiLine       =   True
      Password        =   "False"
      ReadOnly        =   False
      ScrollBar       =   "True"
      ScrollBarHorizontal=   False
      ScrollBarVertical=   True
      Styled          =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   260
   End
   Begin Label StaticText1
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   99
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MultiLine       =   True
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "This works on a german keyboard and may not work for you, because of the key layout ont the keyboard.\r(roundrectangle used as it does not get the focus)"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   181
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   260
   End
   Begin RoundRectangle RoundRectangle1
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      BorderColor     =   
      BorderWidth     =   1.0
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FillColor       =   
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      OvalHeight      =   16.0
      OvalWidth       =   16.0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   "True"
      Top             =   149
      Transparent     =   True
      Visible         =   True
      Width           =   260
      Begin Label StaticText2
         AutoDeactivate  =   True
         BalloonHelp     =   ""
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         DisabledBalloonHelp=   ""
         Enabled         =   True
         FontUnit        =   0
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "RoundRectangle1"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         MultiLine       =   False
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Click here to write a note"
         TextAlign       =   1
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   149
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   260
      End
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   0
      Period          =   10
      TabPanelIndex   =   "0"
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  editfield1.setfocus
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Function ScanCode(x as integer) As integer
		  
		  // just a function to keep lines shorter
		  return remoteControlMBS.WinVirtualKeyCodeToScanCode(virtualCode(x))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function VirtualCode(x as integer) As integer
		  dim shift,control,alt as boolean
		  dim vk as integer
		  
		  if remoteControlMBS.WinVirtualKeyForASCII(x,vk,shift,control,alt) then
		    return vk
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write()
		  // old code, deprecated
		  
		  dim p as PresskeyMBS
		  p=new PresskeyMBS
		  
		  p.shift=true
		  
		  p.Charcode=asc("H")
		  p.Keycode=4
		  p.virtualCode=-1
		  p.press
		  
		  p.shift=false
		  
		  p.Charcode=asc("e")
		  p.Keycode=14
		  p.virtualCode=-1
		  p.press
		  
		  p.Charcode=asc("l")
		  p.Keycode=&h25
		  p.virtualCode=-1
		  p.press
		  p.press
		  
		  p.Charcode=asc("o")
		  p.virtualCode=-1
		  p.Keycode=&h1F
		  p.press
		  
		  p.Charcode=asc(" ")
		  p.Keycode=&h31
		  p.virtualCode=-1
		  p.press
		  
		  p.shift=True
		  p.Charcode=asc("W")
		  p.virtualCode=-1
		  p.Keycode=&h0D
		  p.press
		  p.shift=false
		  
		  p.Charcode=asc("o")
		  p.virtualCode=-1
		  p.Keycode=&h1F
		  p.press
		  
		  p.Charcode=asc("r")
		  p.Keycode=&h0F
		  p.virtualCode=-1
		  p.press
		  
		  p.Charcode=asc("l")
		  p.virtualCode=-1
		  p.Keycode=&h25
		  p.press
		  
		  p.Charcode=asc("d")
		  p.virtualCode=-1
		  p.Keycode=&h02
		  p.press
		  
		  p.charcode=13
		  p.virtualCode=-1
		  p.keycode=&h24
		  p.press
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub WriteLinux()
		  // we need a timer 
		  // if the events come too fast, RB will get the keys in the wrong order
		  // gedit does not have this trouble receiving events
		  
		  counter=-200 // delay 2 seconds
		  timer1.mode=2
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub WriteMac()
		  
		  call RemoteControlMBS.MacPressShiftKey true
		  call RemoteControlMBS.MacPressKey asc("H"),4
		  call RemoteControlMBS.MacPressShiftKey false
		  
		  call RemoteControlMBS.MacPressKey asc("e"),14
		  call RemoteControlMBS.MacPressKey asc("l"),&h25
		  call RemoteControlMBS.MacPressKey asc("l"),&h25
		  call RemoteControlMBS.MacPressKey asc("o"),&h1F
		  call RemoteControlMBS.MacPressKey asc(" "),&h31
		  
		  call RemoteControlMBS.MacPressShiftKey true
		  call RemoteControlMBS.MacPressKey asc("W"),&h0D
		  call RemoteControlMBS.MacPressShiftKey false
		  
		  call RemoteControlMBS.MacPressKey asc("o"),&h1F
		  call RemoteControlMBS.MacPressKey asc("r"),&h0F
		  call RemoteControlMBS.MacPressKey asc("l"),&h25
		  call RemoteControlMBS.MacPressKey asc("d"),&h02
		  
		  call RemoteControlMBS.MacPressKey 13, &h24 // enter
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub WriteWin()
		  
		  call RemoteControlMBS.WinPressShiftKey true
		  call RemoteControlMBS.WinPressKey VirtualCode(asc("H")),ScanCode(asc("H"))
		  call RemoteControlMBS.WinPressShiftKey false
		  
		  call RemoteControlMBS.WinPressKey VirtualCode(asc("e")),ScanCode(asc("e"))
		  call RemoteControlMBS.WinPressKey VirtualCode(asc("l")),ScanCode(asc("l"))
		  call RemoteControlMBS.WinPressKey VirtualCode(asc("l")),ScanCode(asc("l"))
		  call RemoteControlMBS.WinPressKey VirtualCode(asc("o")),ScanCode(asc("o"))
		  call RemoteControlMBS.WinPressKey VirtualCode(asc(" ")),ScanCode(asc(" "))
		  
		  call RemoteControlMBS.WinPressShiftKey true
		  call RemoteControlMBS.WinPressKey VirtualCode(asc("W")),ScanCode(asc("W"))
		  call RemoteControlMBS.WinPressShiftKey false
		  
		  call RemoteControlMBS.WinPressKey VirtualCode(asc("o")),ScanCode(asc("o"))
		  call RemoteControlMBS.WinPressKey VirtualCode(asc("r")),ScanCode(asc("r"))
		  call RemoteControlMBS.WinPressKey VirtualCode(asc("l")),ScanCode(asc("l"))
		  call RemoteControlMBS.WinPressKey VirtualCode(asc("d")),ScanCode(asc("d"))
		  
		  call RemoteControlMBS.WinPressKey VirtualCode(13), ScanCode(13) // enter
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected counter As integer
	#tag EndProperty


#tag EndWindowCode

#tag Events RoundRectangle1
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  if targetwin32 then
		    Writewin
		  elseif targetmacho then
		    writemac
		  elseif targetlinux then
		    writelinux
		  else
		    msgBox "not supported"
		  end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Return true
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  select case counter
		  case 0
		    call RemoteControlMBS.LinuxPressShiftKey true
		    call RemoteControlMBS.LinuxPressKey 43
		    call RemoteControlMBS.LinuxPressShiftKey false
		    
		  case 1
		    call RemoteControlMBS.LinuxPressKey 26 // e
		  case 2
		    call RemoteControlMBS.LinuxPressKey 46 // l
		  case 3
		    call RemoteControlMBS.LinuxPressKey 46 // l
		  case 4
		    call RemoteControlMBS.LinuxPressKey 32 // o
		  case 5
		    call RemoteControlMBS.LinuxPressKey 65 // space
		    
		  case 6
		    call RemoteControlMBS.LinuxPressShiftKey true
		    call RemoteControlMBS.LinuxPressKey 25 // w
		    call RemoteControlMBS.LinuxPressShiftKey false
		    
		  case 7
		    call RemoteControlMBS.LinuxPressKey 32 // o
		  case 8
		    call RemoteControlMBS.LinuxPressKey 27 // r
		  case 9
		    call RemoteControlMBS.LinuxPressKey 46 // l
		  case 10
		    call RemoteControlMBS.LinuxPressKey 40 // d
		    
		  case 11
		    call RemoteControlMBS.LinuxPressKey 36 // enter
		    
		  case 20
		    me.mode=0
		  end select
		  
		  counter=counter+1
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
		InitialValue="False"
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
