#tag Window
Begin Window mainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   False
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   232
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   2
   MenuBarVisible  =   True
   MinHeight       =   200
   MinimizeButton  =   True
   MinWidth        =   542
   Placement       =   0
   Resizeable      =   True
   Title           =   "CatSearch-Demo"
   Visible         =   True
   Width           =   570
   Begin ListBox theList
      AllowAutoHideScrollbars=   True
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      ColumnCount     =   1
      ColumnsResizable=   True
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DisabledBalloonHelp=   ""
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      FontUnit        =   0
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasBorder       =   True
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   144
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   13
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      Top             =   42
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   544
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton StartButton
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      Cancel          =   False
      Caption         =   "Start"
      Default         =   True
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   478
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      Top             =   199
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   79
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
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MultiLine       =   False
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Demo for CatSearch-Plugin. By Thomas Tempelmann, 25 Nov 1999"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "Geneva"
      TextSize        =   9.0
      Top             =   6
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   302
   End
   Begin Label StaticText2
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MultiLine       =   False
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Visit my REALbasic related Web Site:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "Geneva"
      TextSize        =   9.0
      Top             =   19
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   170
   End
   Begin Label url
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   186
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MultiLine       =   False
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "http://www.tempel.org/rb/"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "Geneva"
      TextSize        =   9.0
      Top             =   19
      Transparent     =   True
      Underline       =   True
      Visible         =   True
      Width           =   132
   End
   Begin PopupMenu volumePopup
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   70
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      Top             =   199
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   129
   End
   Begin Label StaticText3
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
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
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Volume:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   12.0
      Top             =   201
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   52
   End
   Begin ProgressWheel busyArrows
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      DisabledBalloonHelp=   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   452
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   201
      Transparent     =   True
      Visible         =   False
      Width           =   16
   End
   Begin PushButton StopButton
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      Cancel          =   False
      Caption         =   "Stop"
      Default         =   False
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   468
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      Top             =   188
      Transparent     =   True
      Underline       =   False
      Visible         =   False
      Width           =   79
   End
   Begin Label StaticText4
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   283
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MultiLine       =   False
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Search:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   12.0
      Top             =   201
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   50
   End
   Begin PopupMenu WhatMenu
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "INIT files\rInvisible\r“Apple”"
      Italic          =   False
      Left            =   338
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      Top             =   199
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   106
   End
   Begin Label FastTxt
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   203
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MultiLine       =   False
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "(fast)"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   12.0
      Top             =   201
      Transparent     =   True
      Underline       =   False
      Visible         =   False
      Width           =   36
   End
   Begin Label SlowTxt
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   199
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MultiLine       =   False
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "(slow)"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   12.0
      Top             =   190
      Transparent     =   True
      Underline       =   False
      Visible         =   False
      Width           =   40
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  if x>url.left and x<url.left+url.width and y>url.top and y<url.top+url.height then
		    url.textcolor = RGB(255,0,0)
		    return true
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  if x>url.left and x<url.left+url.width and y>url.top and y<url.top+url.height then
		    url.textcolor = RGB(255,0,0)
		  else
		    url.textcolor = RGB(0,0,255)
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  url.textcolor = RGB(0,0,255)
		  if x>url.left and x<url.left+url.width and y>url.top and y<url.top+url.height then
		    ShowURL url.text
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub RebuildVolMenu()
		  // This routines rebuilds the volume popup menu
		  // It is not a good solution, however, because
		  // it does not properly update the list whenever
		  // the user mounts or unmounts another volume.
		  // To do that better, one should use a timer to
		  // regularly check the list of available volumes,
		  // and only if that changes, rebuild the popup menu.
		  
		  dim i as Integer, v as FolderItem
		  
		  volumePopup.DeleteAllRows()
		  Redim volumeList(-1)
		  for i = 0 to VolumeCount-1
		    v = Volume(i)
		    if v <> nil then
		      volumePopup.AddRow(v.name)
		      volumeList.Append v
		    end
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SearchFinished()
		  busyArrows.visible = false
		  StopButton.visible = false
		  StartButton.visible = true
		  WhatMenu.enabled = true
		  volumePopup.enabled = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartTheSearch(what as Integer)
		  theSearchTask = new SearchTask
		  theSearchTask.searchMode = what
		  theSearchTask.outputList = self.theList
		  theSearchTask.searchVolume = me.theSelectedVolume
		  theSearchTask.Run()
		  
		  busyArrows.visible = true
		  StopButton.Top = StartButton.Top
		  StopButton.Left = StartButton.Left
		  StopButton.visible = true
		  StartButton.visible = false
		  WhatMenu.enabled = false
		  volumePopup.enabled = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub VolSelectionUpdate()
		  theSelectedVolume = volumeList(volumePopup.ListIndex)
		  if theSelectedVolume.VolSupportsCatSearchMBS then
		    SlowTxt.visible = false
		    FastTxt.visible = true
		  else
		    SlowTxt.Top = FastTxt.Top
		    SlowTxt.Left = FastTxt.Left
		    SlowTxt.visible = true
		    FastTxt.visible = false
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected theSearchTask As SearchTask
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected theSelectedVolume As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected volumeList(0) As FolderItem
	#tag EndProperty


#tag EndWindowCode

#tag Events StartButton
	#tag Event
		Sub Action()
		  StartTheSearch(WhatMenu.ListIndex+1)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events volumePopup
	#tag Event
		Sub Open()
		  RebuildVolMenu()
		  volumePopup.ListIndex = 0
		  VolSelectionUpdate() // makes the "slow" or "fast" text visible
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  VolSelectionUpdate() // makes the "slow" or "fast" text visible
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StopButton
	#tag Event
		Sub Action()
		  theSearchTask.Stop()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events WhatMenu
	#tag Event
		Sub Open()
		  me.ListIndex = 0
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
