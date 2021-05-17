#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   573
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1043259702
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Windows ICM Convert Colors"
   Visible         =   True
   Width           =   652
   Begin GroupBox InputProfileGroup
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Input Profile"
      Enabled         =   True
      Height          =   160
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
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
      Width           =   300
      Begin PushButton SelectInputProfileButton
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Select"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "InputProfileGroup"
         Italic          =   False
         Left            =   230
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   "0"
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   42
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin Label InputProfileName
         Active          =   ""
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "InputProfileGroup"
         Italic          =   False
         Left            =   35
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   74
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   275
         Window          =   "0"
         _mWindow        =   "0"
      End
      Begin Label InputProfileClass
         Active          =   ""
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "InputProfileGroup"
         Italic          =   False
         Left            =   35
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   106
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   275
         Window          =   "0"
         _mWindow        =   "0"
      End
      Begin Label InputProfileColorspace
         Active          =   ""
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "InputProfileGroup"
         Italic          =   False
         Left            =   35
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   138
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   275
         Window          =   "0"
         _mWindow        =   "0"
      End
   End
   Begin GroupBox OutputProfileGroup
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Output Profile"
      Enabled         =   True
      Height          =   160
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   332
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   300
      Begin PushButton SelectOutputProfileButton
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Select"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OutputProfileGroup"
         Italic          =   False
         Left            =   542
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   "0"
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   42
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin Label OutputProfileName
         Active          =   ""
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OutputProfileGroup"
         Italic          =   False
         Left            =   347
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   74
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   275
         Window          =   "0"
         _mWindow        =   "0"
      End
      Begin Label OutputProfileClass
         Active          =   ""
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OutputProfileGroup"
         Italic          =   False
         Left            =   347
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   106
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   275
         Window          =   "0"
         _mWindow        =   "0"
      End
      Begin Label OutputProfileColorspace
         Active          =   ""
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OutputProfileGroup"
         Italic          =   False
         Left            =   347
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   138
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   275
         Window          =   "0"
         _mWindow        =   "0"
      End
   End
   Begin GroupBox InputColorGroup
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Input Color"
      Enabled         =   True
      Height          =   335
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   186
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   300
      Begin Label ilColor
         Active          =   ""
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "InputColorGroup"
         Italic          =   False
         Left            =   35
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Gray"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   251
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   183
         Window          =   "0"
         _mWindow        =   "0"
      End
      Begin PopupMenu InputPopupMenu
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "InputColorGroup"
         InitialValue    =   "Gray\rRGB\rCMYK\rNamed Index\rLab\rXYZ\rYxy\r3 Channels\r4 Channels\r5 Channels\r6 Channels\r7 Channels\r8 Channels"
         Italic          =   False
         Left            =   35
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   "0"
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   218
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   275
      End
      Begin TextField ieColor
         AcceptTabs      =   False
         Alignment       =   0
         AllowSpellChecking=   False
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Hint            =   ""
         Index           =   0
         InitialParent   =   "InputColorGroup"
         Italic          =   False
         Left            =   230
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Mask            =   ""
         Multiline       =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   "0"
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   "True"
         Styled          =   ""
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   250
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   80
      End
      Begin Label ilColor
         Active          =   ""
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "InputColorGroup"
         Italic          =   False
         Left            =   35
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "1"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   285
         Transparent     =   False
         Underline       =   False
         Visible         =   False
         Width           =   183
         Window          =   "0"
         _mWindow        =   "0"
      End
      Begin TextField ieColor
         AcceptTabs      =   False
         Alignment       =   0
         AllowSpellChecking=   False
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Hint            =   ""
         Index           =   1
         InitialParent   =   "InputColorGroup"
         Italic          =   False
         Left            =   230
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Mask            =   ""
         Multiline       =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   "0"
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   "True"
         Styled          =   ""
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   284
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   False
         Width           =   80
      End
      Begin Label ilColor
         Active          =   ""
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   2
         InitialParent   =   "InputColorGroup"
         Italic          =   False
         Left            =   35
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "1"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   319
         Transparent     =   False
         Underline       =   False
         Visible         =   False
         Width           =   183
         Window          =   "0"
         _mWindow        =   "0"
      End
      Begin TextField ieColor
         AcceptTabs      =   False
         Alignment       =   0
         AllowSpellChecking=   False
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Hint            =   ""
         Index           =   2
         InitialParent   =   "InputColorGroup"
         Italic          =   False
         Left            =   230
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Mask            =   ""
         Multiline       =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   "0"
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   "True"
         Styled          =   ""
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   318
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   False
         Width           =   80
      End
      Begin Label ilColor
         Active          =   ""
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   3
         InitialParent   =   "InputColorGroup"
         Italic          =   False
         Left            =   35
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "1"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   353
         Transparent     =   False
         Underline       =   False
         Visible         =   False
         Width           =   183
         Window          =   "0"
         _mWindow        =   "0"
      End
      Begin TextField ieColor
         AcceptTabs      =   False
         Alignment       =   0
         AllowSpellChecking=   False
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Hint            =   ""
         Index           =   3
         InitialParent   =   "InputColorGroup"
         Italic          =   False
         Left            =   230
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Mask            =   ""
         Multiline       =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   "0"
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   "True"
         Styled          =   ""
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   352
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   False
         Width           =   80
      End
      Begin Label ilColor
         Active          =   ""
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   4
         InitialParent   =   "InputColorGroup"
         Italic          =   False
         Left            =   35
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   9
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "1"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   387
         Transparent     =   False
         Underline       =   False
         Visible         =   False
         Width           =   183
         Window          =   "0"
         _mWindow        =   "0"
      End
      Begin TextField ieColor
         AcceptTabs      =   False
         Alignment       =   0
         AllowSpellChecking=   False
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Hint            =   ""
         Index           =   4
         InitialParent   =   "InputColorGroup"
         Italic          =   False
         Left            =   230
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Mask            =   ""
         Multiline       =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   "0"
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   "True"
         Styled          =   ""
         TabIndex        =   10
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   386
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   False
         Width           =   80
      End
      Begin Label ilColor
         Active          =   ""
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   5
         InitialParent   =   "InputColorGroup"
         Italic          =   False
         Left            =   35
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   11
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "1"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   421
         Transparent     =   False
         Underline       =   False
         Visible         =   False
         Width           =   183
         Window          =   "0"
         _mWindow        =   "0"
      End
      Begin TextField ieColor
         AcceptTabs      =   False
         Alignment       =   0
         AllowSpellChecking=   False
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Hint            =   ""
         Index           =   5
         InitialParent   =   "InputColorGroup"
         Italic          =   False
         Left            =   230
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Mask            =   ""
         Multiline       =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   "0"
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   "True"
         Styled          =   ""
         TabIndex        =   12
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   420
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   False
         Width           =   80
      End
      Begin Label ilColor
         Active          =   ""
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   6
         InitialParent   =   "InputColorGroup"
         Italic          =   False
         Left            =   35
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   13
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "1"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   455
         Transparent     =   False
         Underline       =   False
         Visible         =   False
         Width           =   183
         Window          =   "0"
         _mWindow        =   "0"
      End
      Begin TextField ieColor
         AcceptTabs      =   False
         Alignment       =   0
         AllowSpellChecking=   False
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Hint            =   ""
         Index           =   6
         InitialParent   =   "InputColorGroup"
         Italic          =   False
         Left            =   230
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Mask            =   ""
         Multiline       =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   "0"
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   "True"
         Styled          =   ""
         TabIndex        =   14
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   454
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   False
         Width           =   80
      End
      Begin Label ilColor
         Active          =   ""
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   7
         InitialParent   =   "InputColorGroup"
         Italic          =   False
         Left            =   35
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   15
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "1"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   489
         Transparent     =   False
         Underline       =   False
         Visible         =   False
         Width           =   183
         Window          =   "0"
         _mWindow        =   "0"
      End
      Begin TextField ieColor
         AcceptTabs      =   False
         Alignment       =   0
         AllowSpellChecking=   False
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Hint            =   ""
         Index           =   7
         InitialParent   =   "InputColorGroup"
         Italic          =   False
         Left            =   230
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Mask            =   ""
         Multiline       =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   "0"
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   "True"
         Styled          =   ""
         TabIndex        =   16
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   488
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   False
         Width           =   80
      End
   End
   Begin PushButton ConvertToRight
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Convert →"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   274
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
      Top             =   533
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   105
   End
   Begin GroupBox OutputColorGroup
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Output Color"
      Enabled         =   True
      Height          =   335
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   332
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   186
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   300
      Begin Label olColor
         Active          =   ""
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "OutputColorGroup"
         Italic          =   False
         Left            =   347
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Gray"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   251
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   183
         Window          =   "0"
         _mWindow        =   "0"
      End
      Begin PopupMenu OutputPopupMenu
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OutputColorGroup"
         InitialValue    =   "Gray\rRGB\rCMYK\rNamed Index\rLab\rXYZ\rYxy\r3 Channels\r4 Channels\r5 Channels\r6 Channels\r7 Channels\r8 Channels"
         Italic          =   False
         Left            =   347
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   "0"
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   218
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   275
      End
      Begin TextField oeColor
         AcceptTabs      =   False
         Alignment       =   0
         AllowSpellChecking=   False
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Hint            =   ""
         Index           =   0
         InitialParent   =   "OutputColorGroup"
         Italic          =   False
         Left            =   542
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Mask            =   ""
         Multiline       =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   "0"
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   "True"
         Styled          =   ""
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   250
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   80
      End
      Begin Label olColor
         Active          =   ""
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "OutputColorGroup"
         Italic          =   False
         Left            =   347
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "1"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   285
         Transparent     =   False
         Underline       =   False
         Visible         =   False
         Width           =   183
         Window          =   "0"
         _mWindow        =   "0"
      End
      Begin TextField oeColor
         AcceptTabs      =   False
         Alignment       =   0
         AllowSpellChecking=   False
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Hint            =   ""
         Index           =   1
         InitialParent   =   "OutputColorGroup"
         Italic          =   False
         Left            =   542
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Mask            =   ""
         Multiline       =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   "0"
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   "True"
         Styled          =   ""
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   284
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   False
         Width           =   80
      End
      Begin Label olColor
         Active          =   ""
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   2
         InitialParent   =   "OutputColorGroup"
         Italic          =   False
         Left            =   347
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "1"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   319
         Transparent     =   False
         Underline       =   False
         Visible         =   False
         Width           =   183
         Window          =   "0"
         _mWindow        =   "0"
      End
      Begin TextField oeColor
         AcceptTabs      =   False
         Alignment       =   0
         AllowSpellChecking=   False
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Hint            =   ""
         Index           =   2
         InitialParent   =   "OutputColorGroup"
         Italic          =   False
         Left            =   542
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Mask            =   ""
         Multiline       =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   "0"
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   "True"
         Styled          =   ""
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   318
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   False
         Width           =   80
      End
      Begin Label olColor
         Active          =   ""
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   3
         InitialParent   =   "OutputColorGroup"
         Italic          =   False
         Left            =   347
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "1"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   353
         Transparent     =   False
         Underline       =   False
         Visible         =   False
         Width           =   183
         Window          =   "0"
         _mWindow        =   "0"
      End
      Begin TextField oeColor
         AcceptTabs      =   False
         Alignment       =   0
         AllowSpellChecking=   False
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Hint            =   ""
         Index           =   3
         InitialParent   =   "OutputColorGroup"
         Italic          =   False
         Left            =   542
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Mask            =   ""
         Multiline       =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   "0"
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   "True"
         Styled          =   ""
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   352
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   False
         Width           =   80
      End
      Begin Label olColor
         Active          =   ""
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   4
         InitialParent   =   "OutputColorGroup"
         Italic          =   False
         Left            =   347
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   9
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "1"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   387
         Transparent     =   False
         Underline       =   False
         Visible         =   False
         Width           =   183
         Window          =   "0"
         _mWindow        =   "0"
      End
      Begin TextField oeColor
         AcceptTabs      =   False
         Alignment       =   0
         AllowSpellChecking=   False
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Hint            =   ""
         Index           =   4
         InitialParent   =   "OutputColorGroup"
         Italic          =   False
         Left            =   542
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Mask            =   ""
         Multiline       =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   "0"
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   "True"
         Styled          =   ""
         TabIndex        =   10
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   386
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   False
         Width           =   80
      End
      Begin Label olColor
         Active          =   ""
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   5
         InitialParent   =   "OutputColorGroup"
         Italic          =   False
         Left            =   347
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   11
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "1"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   421
         Transparent     =   False
         Underline       =   False
         Visible         =   False
         Width           =   183
         Window          =   "0"
         _mWindow        =   "0"
      End
      Begin TextField oeColor
         AcceptTabs      =   False
         Alignment       =   0
         AllowSpellChecking=   False
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Hint            =   ""
         Index           =   5
         InitialParent   =   "OutputColorGroup"
         Italic          =   False
         Left            =   542
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Mask            =   ""
         Multiline       =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   "0"
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   "True"
         Styled          =   ""
         TabIndex        =   12
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   420
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   False
         Width           =   80
      End
      Begin Label olColor
         Active          =   ""
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   6
         InitialParent   =   "OutputColorGroup"
         Italic          =   False
         Left            =   347
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   13
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "1"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   455
         Transparent     =   False
         Underline       =   False
         Visible         =   False
         Width           =   183
         Window          =   "0"
         _mWindow        =   "0"
      End
      Begin TextField oeColor
         AcceptTabs      =   False
         Alignment       =   0
         AllowSpellChecking=   False
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Hint            =   ""
         Index           =   6
         InitialParent   =   "OutputColorGroup"
         Italic          =   False
         Left            =   542
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Mask            =   ""
         Multiline       =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   "0"
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   "True"
         Styled          =   ""
         TabIndex        =   14
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   454
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   False
         Width           =   80
      End
      Begin Label olColor
         Active          =   ""
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontUnit        =   0
         Height          =   20
         HelpTag         =   ""
         Index           =   7
         InitialParent   =   "OutputColorGroup"
         Italic          =   False
         Left            =   347
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   15
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "1"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         Top             =   489
         Transparent     =   False
         Underline       =   False
         Visible         =   False
         Width           =   183
         Window          =   "0"
         _mWindow        =   "0"
      End
      Begin TextField oeColor
         AcceptTabs      =   False
         Alignment       =   0
         AllowSpellChecking=   False
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Hint            =   ""
         Index           =   7
         InitialParent   =   "OutputColorGroup"
         Italic          =   False
         Left            =   542
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Mask            =   ""
         Multiline       =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   "0"
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   "True"
         Styled          =   ""
         TabIndex        =   16
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   488
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   False
         Width           =   80
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub ConvertColorToRight()
		  dim InputColor as new WindowsICMColorMBS
		  dim InputColorType as integer
		  
		  Select case InputPopupMenu.ListIndex
		  case 0 // Gray
		    
		    InputColor.gray = cdbl(ieColor(0).text)
		    InputColorType = WindowsICMColorMBS.COLOR_GRAY
		    
		  case 1 // RGB
		    
		    InputColor.red   = cdbl(ieColor(0).text)
		    InputColor.green = cdbl(ieColor(1).text)
		    InputColor.blue  = cdbl(ieColor(2).text)
		    InputColorType = WindowsICMColorMBS.COLOR_RGB
		    
		  case 2 // CMYK
		    
		    InputColor.cyan    = cdbl(ieColor(0).text)
		    InputColor.magenta = cdbl(ieColor(1).text)
		    InputColor.yellow  = cdbl(ieColor(2).text)
		    InputColor.black   = cdbl(ieColor(3).text)
		    InputColorType = WindowsICMColorMBS.COLOR_CMYK
		    
		  case 3 // Named Index
		    InputColor.Index = cdbl(ieColor(0).text)
		    InputColorType = WindowsICMColorMBS.COLOR_NAMED
		    
		  case 4 // Lab
		    
		    InputColor.L = cdbl(ieColor(0).text)
		    InputColor.a = cdbl(ieColor(1).text)
		    InputColor.b = cdbl(ieColor(2).text)
		    InputColorType = WindowsICMColorMBS.COLOR_Lab
		    
		  case 5 // XYZ
		    
		    InputColor.XYZ_X = cdbl(ieColor(0).text)
		    InputColor.XYZ_Y = cdbl(ieColor(1).text)
		    InputColor.XYZ_Z = cdbl(ieColor(2).text)
		    InputColorType = WindowsICMColorMBS.COLOR_XYZ
		    
		  case 6 // Yxy
		    
		    InputColor.Yxy_YY = cdbl(ieColor(0).text)
		    InputColor.Yxy_x  = cdbl(ieColor(1).text)
		    InputColor.Yxy_y  = cdbl(ieColor(2).text)
		    InputColorType = WindowsICMColorMBS.COLOR_Yxy
		    
		  case 7 // 3 Channels
		    for i as integer = 0 to 2
		      InputColor.Channel(i) = cdbl(ieColor(i).text)
		    next
		    InputColorType = WindowsICMColorMBS.COLOR_3_CHANNEL
		    
		  case 8 // 4 Channels
		    for i as integer = 0 to 3
		      InputColor.Channel(i) = cdbl(ieColor(i).text)
		    next
		    InputColorType = WindowsICMColorMBS.COLOR_CMYK
		    
		  case 9 // 5 Channels
		    for i as integer = 0 to 4
		      InputColor.Channel(i) = cdbl(ieColor(i).text)
		    next
		    InputColorType = WindowsICMColorMBS.COLOR_5_CHANNEL
		    
		  case 10 // 6 Channels
		    for i as integer = 0 to 5
		      InputColor.Channel(i) = cdbl(ieColor(i).text)
		    next
		    InputColorType = WindowsICMColorMBS.COLOR_6_CHANNEL
		    
		  case 11 // 7 Channels
		    for i as integer = 0 to 6
		      InputColor.Channel(i) = cdbl(ieColor(i).text)
		    next
		    InputColorType = WindowsICMColorMBS.COLOR_7_CHANNEL
		    
		  case 12 // 8 Channels
		    for i as integer = 0 to 7
		      InputColor.Channel(i) = cdbl(ieColor(i).text)
		    next
		    InputColorType = WindowsICMColorMBS.COLOR_8_CHANNEL
		    
		  else
		    Return
		  end Select
		  
		  dim OutputColorType as integer
		  
		  Select case OutputPopupMenu.ListIndex
		  case 0 // Gray
		    
		    OutputColorType = WindowsICMColorMBS.COLOR_GRAY
		    
		  case 1 // RGB
		    
		    OutputColorType = WindowsICMColorMBS.COLOR_RGB
		    
		  case 2 // CMYK
		    
		    OutputColorType = WindowsICMColorMBS.COLOR_CMYK
		    
		  case 3 // Named Index
		    OutputColorType = WindowsICMColorMBS.COLOR_NAMED
		    
		  case 4 // Lab
		    
		    OutputColorType = WindowsICMColorMBS.COLOR_Lab
		    
		  case 5 // XYZ
		    
		    OutputColorType = WindowsICMColorMBS.COLOR_XYZ
		    
		  case 6 // Yxy
		    
		    OutputColorType = WindowsICMColorMBS.COLOR_Yxy
		    
		  case 7 // 3 Channels
		    OutputColorType = WindowsICMColorMBS.COLOR_3_CHANNEL
		    
		  case 8 // 4 Channels
		    OutputColorType = WindowsICMColorMBS.COLOR_CMYK
		    
		  case 9 // 5 Channels
		    OutputColorType = WindowsICMColorMBS.COLOR_5_CHANNEL
		    
		  case 10 // 6 Channels
		    OutputColorType = WindowsICMColorMBS.COLOR_6_CHANNEL
		    
		  case 11 // 7 Channels
		    OutputColorType = WindowsICMColorMBS.COLOR_7_CHANNEL
		    
		  case 12 // 8 Channels
		    OutputColorType = WindowsICMColorMBS.COLOR_8_CHANNEL
		    
		  else
		    Return
		  end Select
		  
		  dim profiles(1) as WindowsICMProfileMBS
		  profiles(0)=InputProfile
		  profiles(1)=OutputProfile
		  
		  dim intents(1) as integer
		  intents(0)=0
		  intents(1)=0
		  
		  dim t as new WindowsICMTransformMBS(profiles, intents, 3, WindowsICMTransformMBS.INDEX_DONT_CARE)
		  
		  if t.Handle = 0 then
		    MsgBox "Failed to create transform."
		  end if
		  
		  dim InputColors(0) as WindowsICMColorMBS
		  dim OutputColors(0) as WindowsICMColorMBS
		  
		  InputColors(0) = InputColor
		  
		  if t.TranslateColors(InputColors, InputColorType, OutputColors, OutputColorType) then
		    
		    dim OutputColor as WindowsICMColorMBS = OutputColors(0)
		    
		    Select case OutputPopupMenu.ListIndex
		    case 0 // Gray
		      
		      oeColor(0).text = cstr(OutputColor.gray)
		      
		    case 1 // RGB
		      
		      oeColor(0).text = cstr(OutputColor.red)
		      oeColor(1).text = cstr(OutputColor.green)
		      oeColor(2).text = cstr(OutputColor.blue)
		      
		    case 2 // CMYK
		      
		      oeColor(0).text = cstr(OutputColor.cyan)
		      oeColor(1).text = cstr(OutputColor.magenta)
		      oeColor(2).text = cstr(OutputColor.yellow)
		      oeColor(3).text = cstr(OutputColor.black)
		      
		    case 3 // Named Index
		      InputColor.Index = cdbl(ieColor(0).text)
		      InputColorType = WindowsICMColorMBS.COLOR_NAMED
		      
		    case 4 // Lab
		      
		      InputColor.L = cdbl(ieColor(0).text)
		      InputColor.a = cdbl(ieColor(1).text)
		      InputColor.b = cdbl(ieColor(2).text)
		      InputColorType = WindowsICMColorMBS.COLOR_Lab
		      
		    case 5 // XYZ
		      
		      oeColor(0).text = cstr(OutputColor.XYZ_X)
		      oeColor(1).text = cstr(OutputColor.XYZ_Y)
		      oeColor(2).text = cstr(OutputColor.XYZ_Z)
		      
		    case 6 // Yxy
		      
		      oeColor(0).text = cstr(OutputColor.Yxy_YY)
		      oeColor(1).text = cstr(OutputColor.Yxy_x)
		      oeColor(2).text = cstr(OutputColor.Yxy_y)
		      
		    case 7 // 3 Channels
		      
		      for i as integer = 0 to 2
		        oeColor(i).text = cstr(OutputColor.Channel(i))
		      next
		      
		    case 8 // 4 Channels
		      for i as integer = 0 to 3
		        oeColor(i).text = cstr(OutputColor.Channel(i))
		      next
		      
		    case 9 // 5 Channels
		      for i as integer = 0 to 4
		        oeColor(i).text = cstr(OutputColor.Channel(i))
		      next
		      
		    case 10 // 6 Channels
		      for i as integer = 0 to 5
		        oeColor(i).text = cstr(OutputColor.Channel(i))
		      next
		      
		    case 11 // 7 Channels
		      for i as integer = 0 to 6
		        oeColor(i).text = cstr(OutputColor.Channel(i))
		      next
		      
		    case 12 // 8 Channels
		      for i as integer = 0 to 7
		        oeColor(i).text = cstr(OutputColor.Channel(i))
		      next
		      
		    else
		      Return
		    end Select
		    
		    
		  end if
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetInputColors(n as integer, paramarray names as string)
		  for i as integer = 0 to n-1
		    ilColor(i).text = names(i)
		    ilColor(i).Visible = true
		    ieColor(i).Visible = true
		  next
		  
		  for i as integer = n to 7
		    ilColor(i).Visible = false
		    ieColor(i).Visible = false
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetOutputColors(n as integer, paramarray names as string)
		  for i as integer = 0 to n-1
		    olColor(i).text = names(i)
		    olColor(i).Visible = true
		    oeColor(i).Visible = true
		  next
		  
		  for i as integer = n to 7
		    olColor(i).Visible = false
		    oeColor(i).Visible = false
		  next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected InputProfile As WindowsICMProfileMBS
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected OutputProfile As WindowsICMProfileMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events SelectInputProfileButton
	#tag Event
		Sub Action()
		  dim f as FolderItem = GetopenFolderItem(FileTypes.All)
		  
		  if f = nil then Return
		  
		  dim b as BinaryStream = f.OpenAsBinaryFile(false)
		  
		  if b = nil then
		    MsgBox "Failed to open file."
		    Return
		  end if
		  
		  dim s as string = b.Read(b.Length)
		  
		  if lenb(s) = 0 then
		    MsgBox "Failed to read file."
		    Return
		  end if
		  
		  dim w as WindowsICMProfileMBS = WindowsICMProfileMBS.OpenProfileData(s, WindowsICMProfileMBS.PROFILE_READ)
		  
		  if b = nil then
		    MsgBox "Failed to load profile."
		    Return
		  end if
		  
		  InputProfileName.text = f.DisplayName
		  InputProfile = w
		  InputProfileClass.text = w.ProfileClassName
		  InputProfileColorspace.text = w.ProfileColorSpace
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SelectOutputProfileButton
	#tag Event
		Sub Action()
		  dim f as FolderItem = GetopenFolderItem(FileTypes.All)
		  
		  if f = nil then Return
		  
		  dim b as BinaryStream = f.OpenAsBinaryFile(false)
		  
		  if b = nil then
		    MsgBox "Failed to open file."
		    Return
		  end if
		  
		  dim s as string = b.Read(b.Length)
		  
		  if lenb(s) = 0 then
		    MsgBox "Failed to read file."
		    Return
		  end if
		  
		  dim w as WindowsICMProfileMBS = WindowsICMProfileMBS.OpenProfileData(s, WindowsICMProfileMBS.PROFILE_READ)
		  
		  if b = nil then
		    MsgBox "Failed to load profile."
		    Return
		  end if
		  
		  OutputProfileName.text = f.DisplayName
		  OutputProfile = w
		  OutputProfileClass.text = w.ProfileClassName
		  OutputProfileColorspace.text = w.ProfileColorSpace
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events InputPopupMenu
	#tag Event
		Sub Change()
		  Select case me.ListIndex
		  case 0 // Gray
		    SetInputColors 1, "Gray"
		    
		  case 1 // RGB
		    SetInputColors 3, "Red", "Green", "Blue"
		    
		  case 2 // CMYK
		    SetInputColors 4, "Cyan", "Magenta", "Yellow", "Black"
		    
		  case 3 // Named Index
		    SetInputColors 1, "Index"
		    
		  case 4 // Lab
		    SetInputColors 3, "L", "a", "b"
		    
		  case 5 // XYZ
		    SetInputColors 3, "X", "Y", "Z"
		    
		  case 6 // Yxy
		    SetInputColors 3, "Y", "x", "y"
		    
		  case 7 // 3 Channels
		    SetInputColors 3, "Channel 1", "Channel 2", "Channel 3"
		    
		  case 8 // 4 Channels
		    SetInputColors 4, "Channel 1", "Channel 2", "Channel 3", "Channel 4"
		    
		  case 9 // 5 Channels
		    SetInputColors 5, "Channel 1", "Channel 2", "Channel 3", "Channel 4", "Channel 5"
		    
		  case 10 // 6 Channels
		    SetInputColors 6, "Channel 1", "Channel 2", "Channel 3", "Channel 4", "Channel 5", "Channel 6"
		    
		  case 11 // 7 Channels
		    SetInputColors 7, "Channel 1", "Channel 2", "Channel 3", "Channel 4", "Channel 5", "Channel 6", "Channel 7"
		    
		  case 12 // 8 Channels
		    SetInputColors 8, "Channel 1", "Channel 2", "Channel 3", "Channel 4", "Channel 5", "Channel 6", "Channel 7", "Channel 8"
		    
		  end Select
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ConvertToRight
	#tag Event
		Sub Action()
		  ConvertColorToRight
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events OutputPopupMenu
	#tag Event
		Sub Change()
		  Select case me.ListIndex
		  case 0 // Gray
		    SetOutputColors 1, "Gray"
		    
		  case 1 // RGB
		    SetOutputColors 3, "Red", "Green", "Blue"
		    
		  case 2 // CMYK
		    SetOutputColors 4, "Cyan", "Magenta", "Yellow", "Black"
		    
		  case 3 // Named Index
		    SetOutputColors 1, "Index"
		    
		  case 4 // Lab
		    SetOutputColors 3, "L", "a", "b"
		    
		  case 5 // XYZ
		    SetOutputColors 3, "X", "Y", "Z"
		    
		  case 6 // Yxy
		    SetOutputColors 3, "Y", "x", "y"
		    
		  case 7 // 3 Channels
		    SetOutputColors 3, "Channel 1", "Channel 2", "Channel 3"
		    
		  case 8 // 4 Channels
		    SetOutputColors 4, "Channel 1", "Channel 2", "Channel 3", "Channel 4"
		    
		  case 9 // 5 Channels
		    SetOutputColors 5, "Channel 1", "Channel 2", "Channel 3", "Channel 4", "Channel 5"
		    
		  case 10 // 6 Channels
		    SetOutputColors 6, "Channel 1", "Channel 2", "Channel 3", "Channel 4", "Channel 5", "Channel 6"
		    
		  case 11 // 7 Channels
		    SetOutputColors 7, "Channel 1", "Channel 2", "Channel 3", "Channel 4", "Channel 5", "Channel 6", "Channel 7"
		    
		  case 12 // 8 Channels
		    SetOutputColors 8, "Channel 1", "Channel 2", "Channel 3", "Channel 4", "Channel 5", "Channel 6", "Channel 7", "Channel 8"
		    
		  end Select
		  
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
