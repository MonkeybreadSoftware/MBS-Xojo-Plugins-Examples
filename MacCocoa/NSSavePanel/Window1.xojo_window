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
   Height          =   618
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   -1014108220
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "NSSavePanel and NSOpenPanel"
   Visible         =   True
   Width           =   673
   Begin GroupBox GroupBox1
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Common options"
      Enabled         =   True
      Height          =   301
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
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   633
      Begin CheckBox CheckallowsOtherFileTypes
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "allow other file types"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   21
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   36
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   "0"
         State           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   44
         Transparent     =   True
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   240
      End
      Begin CheckBox CheckcanCreateDirectories
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "can Create Directories"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   36
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   "0"
         State           =   1
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   76
         Transparent     =   True
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   240
      End
      Begin CheckBox CheckcanSelectHiddenExtension
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "can Select Hidden Extension"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   36
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   "0"
         State           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   108
         Transparent     =   True
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   240
      End
      Begin CheckBox CheckBox1
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "is Extension Hidden"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   36
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   "0"
         State           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   140
         Transparent     =   True
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   240
      End
      Begin Label StaticText1
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   288
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Name field label:"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   44
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   124
      End
      Begin TextField iNameFieldLabel
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   424
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   "0"
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "My name:"
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   43
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   213
      End
      Begin Label StaticText2
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   288
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Prompt:"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   76
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   124
      End
      Begin TextField iPrompt
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   424
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   "0"
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "My prompt"
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   75
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   213
      End
      Begin Label StaticText3
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   288
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Title:"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   106
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   124
      End
      Begin TextField iTitle
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   424
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   "0"
         TabIndex        =   9
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "My title"
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   105
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   213
      End
      Begin CheckBox ChecktreatsFilePackagesAsDirectories
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "treats File Packages As Directories"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   36
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   "0"
         State           =   0
         TabIndex        =   10
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   172
         Transparent     =   True
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   240
      End
      Begin CheckBox CheckallowsMultipleSelection
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "allows Multiple Selection"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   36
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   "0"
         State           =   1
         TabIndex        =   11
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   204
         Transparent     =   True
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   240
      End
      Begin CheckBox CheckcanChooseDirectories
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "can Choose Directories"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   36
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   "0"
         State           =   0
         TabIndex        =   12
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   236
         Transparent     =   True
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   240
      End
      Begin CheckBox CheckcanChooseFiles
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "can Choose Files"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   36
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   "0"
         State           =   1
         TabIndex        =   13
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   268
         Transparent     =   True
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   240
      End
      Begin Label StaticText4
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   288
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   14
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Message:"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   140
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   124
      End
      Begin TextField iMessage
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   424
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   "0"
         TabIndex        =   15
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "My message"
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   139
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   213
      End
      Begin CheckBox CheckresolvesAliases
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "resolves Aliases"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   288
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   "0"
         State           =   1
         TabIndex        =   16
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   172
         Transparent     =   True
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   240
      End
      Begin CheckBox CheckCustomControl
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Add custom control"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   288
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   "0"
         State           =   1
         TabIndex        =   17
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   204
         Transparent     =   True
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   275
      End
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Open"
      Default         =   False
      Enabled         =   True
      Height          =   20
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
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   327
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin ListBox ListBox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   239
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   359
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   633
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Save"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   101
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   327
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin PushButton PushButton3
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Save (Sheet)"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   182
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   327
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   115
   End
   Begin PushButton PushButton4
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Open (Sheet)"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   309
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   327
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   110
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  mycustomview=new MyNSView(10,10,100,20)
		  
		  textview=new NSTextViewMBS(10,40,100,20)
		  textview.isSelectable=true
		  textview.isEditable=true
		  textview.text="Hello World"
		  
		  checkboxview=new MyNSButton(120,10,70,20)
		  checkboxview.setButtonType nsbuttonmbs.NSSwitchButton
		  checkboxview.intValue=1
		  
		  buttonview=new MyNSButton(120,40,70,20)
		  buttonview.setButtonType nsbuttonmbs.NSToggleButton
		  buttonview.bezelStyle=nsbuttonmbs.NSRoundedBezelStyle
		  
		  customview=new NSViewMBS(0,0,200,70)
		  customview.addSubview mycustomview
		  customview.addSubview textview
		  customview.addSubview buttonview
		  customview.addSubview checkboxview
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h1
		Protected buttonview As nsbuttonMBS
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected checkboxview As nsbuttonMBS
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected customview As NSViewMBS
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mycustomview As mynsview
	#tag EndProperty

	#tag Property, Flags = &h0
		panel As nssavePanelMBS
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected textview As nstextviewMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  dim p as MyNSOpenPanelMBS
		  dim f as FolderItem
		  dim types(-1) as string
		  dim i,c as integer
		  
		  ListBox1.DeleteAllRows
		  
		  p=new MyNSOpenPanelMBS
		  panel=p
		  
		  p.allowsMultipleSelection=CheckallowsMultipleSelection.Value
		  p.allowsOtherFileTypes=CheckallowsOtherFileTypes.Value
		  p.canChooseDirectories=CheckcanChooseDirectories.Value
		  p.canChooseFiles=checkcanChooseFiles.Value
		  p.canCreateDirectories=checkcanCreateDirectories.Value
		  p.canSelectHiddenExtension=CheckcanSelectHiddenExtension.Value
		  p.NameFieldLabel=iNameFieldLabel.text
		  p.Prompt=iPrompt.text
		  p.Title=iTitle.text
		  p.Message=iMessage.text
		  p.treatsFilePackagesAsDirectories=ChecktreatsFilePackagesAsDirectories.Value
		  p.resolvesAliases=checkresolvesAliases.value
		  
		  types.Append "txt"
		  types.Append "rtf"
		  types.Append "jpg"
		  
		  p.setAllowedFileTypes types
		  
		  if CheckCustomControl.value then
		    p.accessoryView=customview
		  end if
		  
		  dim n as integer = p.runModalForDirectory(SpecialFolder.Desktop, "test.mov", "mov")
		  
		  if n=p.NSOKButton then
		    ListBox1.AddRow "Result: OK"
		    
		    f=p.File 
		    if f<>nil then
		      ListBox1.AddRow "File: "+f.UnixpathMBS
		    else
		      ListBox1.AddRow "File: ?"
		    end if
		    
		    f=p.Directory 
		    if f<>nil then
		      ListBox1.AddRow "Directory: "+f.UnixpathMBS
		    else
		      ListBox1.AddRow "Directory: ?"
		    end if
		    
		    
		    c=p.FilesCount
		    window1.ListBox1.AddRow "File count: "+str(c)
		    
		    c=c-1
		    for i=0 to c
		      f=p.Files(i)
		      if f<>nil then
		        window1.ListBox1.AddRow "File("+str(i)+"): "+f.UnixpathMBS
		      else
		        window1.ListBox1.AddRow "File("+str(i)+"): ?"
		      end if
		    next
		    
		  elseif n=p.NSCancelButton then
		    ListBox1.AddRow "Result: Cancel"
		  else
		    ListBox1.AddRow "Result: "+str(n)
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  dim p as MyNSSavePanelMBS
		  dim f as FolderItem
		  dim types(-1) as string
		  
		  ListBox1.DeleteAllRows
		  
		  p=new MyNSSavePanelMBS
		  panel=p
		  
		  p.allowsOtherFileTypes=CheckallowsOtherFileTypes.Value
		  p.canCreateDirectories=checkcanCreateDirectories.Value
		  p.canSelectHiddenExtension=CheckcanSelectHiddenExtension.Value
		  p.NameFieldLabel=iNameFieldLabel.text
		  p.Prompt=iPrompt.text
		  p.Title=iTitle.text
		  p.Message=iMessage.text
		  p.treatsFilePackagesAsDirectories=ChecktreatsFilePackagesAsDirectories.Value
		  
		  types.Append "txt"
		  types.Append "rtf"
		  types.Append "jpg"
		  
		  p.setAllowedFileTypes types
		  
		  if CheckCustomControl.value then
		    p.accessoryView=customview
		  end if
		  
		  dim n as integer = p.runModalForDirectory(SpecialFolder.Desktop, "test.mov")
		  
		  if n=p.NSOKButton then
		    ListBox1.AddRow "Result: OK"
		    
		    f=p.File 
		    if f<>nil then
		      ListBox1.AddRow "File: "+f.UnixpathMBS
		    else
		      ListBox1.AddRow "File: ?"
		    end if
		    
		    f=p.Directory 
		    if f<>nil then
		      ListBox1.AddRow "Directory: "+f.UnixpathMBS
		    else
		      ListBox1.AddRow "Directory: ?"
		    end if
		    
		  elseif n=p.NSCancelButton then
		    ListBox1.AddRow "Result: Cancel"
		  else
		    ListBox1.AddRow "Result: "+str(n)
		  end if
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton3
	#tag Event
		Sub Action()
		  dim p as MyNSSavePanelMBS
		  dim types(-1) as string
		  
		  ListBox1.DeleteAllRows
		  
		  p=new MyNSSavePanelMBS
		  panel=p
		  
		  p.allowsOtherFileTypes=CheckallowsOtherFileTypes.Value
		  p.canCreateDirectories=checkcanCreateDirectories.Value
		  p.canSelectHiddenExtension=CheckcanSelectHiddenExtension.Value
		  p.NameFieldLabel=iNameFieldLabel.text
		  p.Prompt=iPrompt.text
		  p.Title=iTitle.text
		  p.Message=iMessage.text
		  p.treatsFilePackagesAsDirectories=ChecktreatsFilePackagesAsDirectories.Value
		  
		  types.Append "txt"
		  types.Append "rtf"
		  types.Append "jpg"
		  
		  p.setAllowedFileTypes types
		  
		  if CheckCustomControl.value then
		    p.accessoryView=customview
		  end if
		  
		  p.beginSheetForDirectory(SpecialFolder.Desktop, "test.mov",self)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton4
	#tag Event
		Sub Action()
		  dim types(-1) as string
		  
		  ListBox1.DeleteAllRows
		  
		  dim p as new MyNSOpenPanelMBS
		  panel = p
		  
		  p.allowsMultipleSelection=CheckallowsMultipleSelection.Value
		  p.allowsOtherFileTypes=CheckallowsOtherFileTypes.Value
		  p.canChooseDirectories=CheckcanChooseDirectories.Value
		  p.canChooseFiles=checkcanChooseFiles.Value
		  p.canCreateDirectories=checkcanCreateDirectories.Value
		  p.canSelectHiddenExtension=CheckcanSelectHiddenExtension.Value
		  p.NameFieldLabel=iNameFieldLabel.text
		  p.Prompt=iPrompt.text
		  p.Title=iTitle.text
		  p.Message=iMessage.text
		  p.treatsFilePackagesAsDirectories=ChecktreatsFilePackagesAsDirectories.Value
		  p.resolvesAliases=checkresolvesAliases.value
		  
		  types.Append "txt"
		  types.Append "rtf"
		  types.Append "jpg"
		  
		  p.setAllowedFileTypes types
		  
		  if CheckCustomControl.value then
		    p.accessoryView=customview
		  end if
		  
		  p.beginSheetForDirectory(SpecialFolder.Desktop, "test.mov", types, self)
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
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="300"
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
