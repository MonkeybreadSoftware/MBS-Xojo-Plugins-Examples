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
   Height          =   238
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   238
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   376957044
   MenuBarVisible  =   True
   MinHeight       =   238
   MinimizeButton  =   True
   MinWidth        =   594
   Placement       =   2
   Resizeable      =   True
   Title           =   "Mouse Click & Keyboard Events"
   Visible         =   True
   Width           =   594
   Begin MyNSEventMonitor AppEventMonitor
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
   Begin GroupBox GroupBoxs
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Mouse && Keyboard Events:"
      Enabled         =   True
      Height          =   68
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   160
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   554
      Begin Label laEvent
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   34
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBoxs$0"
         Italic          =   False
         Left            =   30
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Multiline       =   True
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Click mouse or press a key"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   181
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   534
      End
   End
   Begin GroupBox GroupBoxs
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Modifier Events:"
      Enabled         =   True
      Height          =   46
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   100
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   554
      Begin Label laModifierEvent
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBoxs$1"
         Italic          =   False
         Left            =   30
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Press one or more modifier key(s)"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   120
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   534
      End
   End
   Begin GroupBox GroupBoxs
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "All Events Info:"
      Enabled         =   True
      Height          =   84
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   6
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   554
      Begin Label laEventInfo
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   56
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBoxs$2"
         Italic          =   False
         Left            =   31
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Multiline       =   True
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Event Info"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   27
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   534
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Return true // just to prevent the system beep
		End Function
	#tag EndEvent


#tag EndWindowCode

#tag Events AppEventMonitor
	#tag Event
		Sub ModifierKeyHasChanged(e As NSEventMBS, Flags As Integer, KeyCode As Integer, mc As ModifierKeyClass)
		  
		  laModifierEvent.Text = "KeyCode: " + str( KeyCode) + "   " +mc.ModifierString
		  
		  // All Properties are read only
		  
		  'ModifierKeyClass.ShiftKey As Boolean
		  '// any shift key is pressed
		  '
		  'ModifierKeyClass.ShiftLeft As Boolean
		  '// left shift key is pressed
		  '
		  'ModifierKeyClass.ShiftRight As Boolean
		  '// right shift key is pressed
		  '
		  '
		  'ModifierKeyClass.AltKey As Boolean
		  '// any alt key is pressed
		  '
		  'ModifierKeyClass.AltLeft As Boolean
		  '// left alt key is pressed
		  '
		  'ModifierKeyClass.AltRight As Boolean
		  '// right alt key is pressed
		  '
		  '
		  'ModifierKeyClass.CmdKey As Boolean
		  '// any cmd key is pressed
		  '
		  'ModifierKeyClass.CmdLeft As Boolean
		  '// left cmd key is pressed
		  '
		  'ModifierKeyClass.CmdRight As Boolean
		  '// right cmd key is pressed
		  '
		  '
		  'ModifierKeyClass.CapsLockKey As Boolean
		  '// caps lock key is down
		  '
		  'ModifierKeyClass.CtrlKey As Boolean
		  '// ctrl key is pressed
		  '
		  'ModifierKeyClass.FnKey As Boolean
		  '// fn key is pressed
		  
		  'ModifierKeyClass.ModifierString As String
		  '// Returns a string with all pressed modifier keys
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseDown(RightClick As Boolean)
		  dim s As String
		  
		  If RightClick then
		    s = "RightClick Down"
		    
		  else
		    s = "LeftClick Down"
		    
		  end if
		  
		  laEvent.Text = s
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(RightClick As Boolean)
		  dim s As String
		  
		  If RightClick then
		    s = "RightClick Up"
		    
		  else
		    s = "LeftClick Up"
		    
		  end if
		  
		  laEvent.Text = s
		End Sub
	#tag EndEvent
	#tag Event
		Sub KeyDown(Key As String, KeyCode As Integer, Repeated As Boolean, Modifier As Integer, mc As ModifierKeyClass)
		  dim s As String
		  if Repeated then s = "   Repeated "
		  
		  laEvent.Text = "KeyDown: " + key + "   KeyCode: " + Str( KeyCode ) + s + "  " + mc.ModifierString
		  
		  
		  // All Properties are read only
		  
		  'ModifierKeyClass.ShiftKey As Boolean
		  '// any shift key is pressed
		  '
		  'ModifierKeyClass.ShiftLeft As Boolean
		  '// left shift key is pressed
		  '
		  'ModifierKeyClass.ShiftRight As Boolean
		  '// right shift key is pressed
		  '
		  '
		  'ModifierKeyClass.AltKey As Boolean
		  '// any alt key is pressed
		  '
		  'ModifierKeyClass.AltLeft As Boolean
		  '// left alt key is pressed
		  '
		  'ModifierKeyClass.AltRight As Boolean
		  '// right alt key is pressed
		  '
		  '
		  'ModifierKeyClass.CmdKey As Boolean
		  '// any cmd key is pressed
		  '
		  'ModifierKeyClass.CmdLeft As Boolean
		  '// left cmd key is pressed
		  '
		  'ModifierKeyClass.CmdRight As Boolean
		  '// right cmd key is pressed
		  '
		  '
		  'ModifierKeyClass.CapsLockKey As Boolean
		  '// caps lock key is down
		  '
		  'ModifierKeyClass.CtrlKey As Boolean
		  '// ctrl key is pressed
		  '
		  'ModifierKeyClass.FnKey As Boolean
		  '// fn key is pressed
		  
		  'ModifierKeyClass.ModifierString As String
		  '// Returns a string with all pressed modifier keys
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub KeyUp(Key As String, KeyCode As Integer, Modifier As Integer, mc As ModifierKeyClass)
		  laEvent.Text = "KeyUp: " + key + "   KeyCode: " + Str( KeyCode ) + "  " + mc.ModifierString
		  
		  
		  // All Properties are read only
		  
		  'ModifierKeyClass.ShiftKey As Boolean
		  '// any shift key is pressed
		  '
		  'ModifierKeyClass.ShiftLeft As Boolean
		  '// left shift key is pressed
		  '
		  'ModifierKeyClass.ShiftRight As Boolean
		  '// right shift key is pressed
		  '
		  '
		  'ModifierKeyClass.AltKey As Boolean
		  '// any alt key is pressed
		  '
		  'ModifierKeyClass.AltLeft As Boolean
		  '// left alt key is pressed
		  '
		  'ModifierKeyClass.AltRight As Boolean
		  '// right alt key is pressed
		  '
		  '
		  'ModifierKeyClass.CmdKey As Boolean
		  '// any cmd key is pressed
		  '
		  'ModifierKeyClass.CmdLeft As Boolean
		  '// left cmd key is pressed
		  '
		  'ModifierKeyClass.CmdRight As Boolean
		  '// right cmd key is pressed
		  '
		  '
		  'ModifierKeyClass.CapsLockKey As Boolean
		  '// caps lock key is down
		  '
		  'ModifierKeyClass.CtrlKey As Boolean
		  '// ctrl key is pressed
		  '
		  'ModifierKeyClass.FnKey As Boolean
		  '// fn key is pressed
		  
		  'ModifierKeyClass.ModifierString As String
		  '// Returns a string with all pressed modifier keys
		End Sub
	#tag EndEvent
	#tag Event
		Sub AnyLocalEvent(e As NSEventMBS)
		  laEventInfo.Text = e.description
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
