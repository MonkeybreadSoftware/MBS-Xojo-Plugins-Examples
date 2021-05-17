#tag Window
Begin Window MyWindow
   BackColor       =   &cCCCCCC00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   300
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   2
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Display Modes"
   Visible         =   True
   Width           =   307
   Begin ListBox ModeList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      BalloonHelp     =   ""
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DisabledBalloonHelp=   ""
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   287
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   -1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      ScrollBarHorizontal=   False
      ScrollBarVertical=   True
      ScrollPosition  =   "0"
      ScrollPositionX =   "0"
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   -1
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   309
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin BevelButton Fade50Red
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      BalloonHelp     =   ""
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "Fade 50% Red"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      DisabledBalloonHelp=   ""
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   16
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   213
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MenuValue       =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "Geneva"
      TextSize        =   9.0
      TextUnit        =   0
      Top             =   285
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   80
   End
   Begin BevelButton FadeQuickBlue
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      BalloonHelp     =   ""
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "Fade Quick Blue"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      DisabledBalloonHelp=   ""
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   16
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   134
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MenuValue       =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "Geneva"
      TextSize        =   9.0
      TextUnit        =   0
      Top             =   285
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label ModeText
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      DisabledBalloonHelp=   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MultiLine       =   False
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Display Modes:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "Geneva"
      TextSize        =   9.0
      TextUnit        =   0
      Top             =   285
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   73
   End
   Begin Label ModeCount
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      DisabledBalloonHelp=   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   88
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MultiLine       =   False
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "Geneva"
      TextSize        =   9.0
      TextUnit        =   0
      Top             =   285
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   60
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  Quit      'Tell to quit
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Dim resNum,c As Integer
		  Dim res As ResolutionMBS
		  Dim resStr As String
		  dim b as Boolean
		  
		  if not ResolutionLibraryPresentMBS then
		    msgBox "The library RezLib was not found. Please place this library into the Realbasic or after compiling into your application folder."
		  end if
		  
		  'Get the display on which to operate
		  dis = GetDisplayMBS(0)
		  
		  if dis<>Nil then
		    c=dis.ResolutionCount(false)
		    ModeCount.Text = Str(c)    'Write number of resolutions
		    c=c-1
		    For resNum = 0 To c      'For every resolution:
		      res = dis.GetResolution(resNum)                 'Get it and add it to the list
		      
		      if res<>nil then
		        resStr = Str(res.Width) + "x" + Str(res.Height) + "x" + Str(res.Depth) + ", " + Str(res.Hz) + "Hz"
		        If res.IsSafe Then
		          resStr = resStr + " (*)"
		        End If
		      else
		        resstr="?"
		      end if
		      ModeList.AddRow resStr
		    Next
		  end if
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		dis As DisplayMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events ModeList
	#tag Event
		Sub DoubleClick()
		  If dis.GetResolution(Me.ListIndex).Switch = False Then
		    Beep                                                        'Switch was unsuccessful
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Fade50Red
	#tag Event
		Sub Action()
		  dis.FadeGammaTo(500, RGB(255, 0, 0), 500)   'Fade 50% to red in 500 ticks (1/2 sec)
		  dis.FadeGammaTo(1000, RGB(255, 0, 0), 500) 'Fade back in 500 ticks (1/2 sec)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FadeQuickBlue
	#tag Event
		Sub Action()
		  dis.FadeGammaTo(0, RGB(0, 0, 255), 200)       'Fade 100% to blue in 200 ticks (1/5 sec)
		  dis.FadeGammaTo(1000, RGB(0, 0, 255), 200) 'Fade back in 200 ticks (1/5 sec)
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
#tag EndViewBehavior