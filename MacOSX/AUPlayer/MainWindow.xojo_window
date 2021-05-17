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
   Height          =   455
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1246952662
   MenuBarVisible  =   True
   MinHeight       =   450
   MinimizeButton  =   True
   MinWidth        =   1000
   Placement       =   0
   Resizeable      =   False
   Title           =   "AUPlayer"
   Visible         =   True
   Width           =   1026
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Load file..."
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
      Width           =   107
   End
   Begin PushButton Playbutton
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
      Left            =   139
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
      Width           =   65
   End
   Begin PushButton Pausebutton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Pause"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   216
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
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   65
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
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
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Track length in seconds:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   184
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
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
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Current Position:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   78
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   184
   End
   Begin Label LabelLength
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   216
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
      Text            =   ""
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Label LabelPosition
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   216
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   78
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Slider SliderPosition
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   100
      Minimum         =   0
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   110
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   296
   End
   Begin Label LabelLoopIn
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   216
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "0"
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   144
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Slider SliderLoopIn
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   100
      Minimum         =   0
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   176
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   296
   End
   Begin Label Label6
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
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
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Loop In Point in seconds:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   144
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   184
   End
   Begin Label Label7
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
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
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Loop Out Point in seconds:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   216
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   184
   End
   Begin Label LabelLoopOut
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   216
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   216
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Slider SliderLoopOut
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   100
      Minimum         =   0
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   248
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   296
   End
   Begin CheckBox CheckLooping
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Use loop in and out"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
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
      State           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   282
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   200
   End
   Begin CheckBox CheckInputEnabled
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Input 0 Volume:"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   328
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      State           =   1
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   77
      Transparent     =   True
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   184
   End
   Begin Label LabelInputVolume
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   524
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "1.0"
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   78
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Slider SliderInputVolume
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Left            =   328
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   200
      Minimum         =   0
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   109
      Transparent     =   True
      Value           =   100
      Visible         =   True
      Width           =   296
   End
   Begin ProgressBar MeterBar
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Indeterminate   =   False
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   328
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   128
      Scope           =   "0"
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   282
      Transparent     =   True
      Value           =   0.0
      Visible         =   True
      Width           =   296
   End
   Begin Label Label11
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   328
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Output Volume:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   216
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   184
   End
   Begin Label LabelOutputVolume
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   523
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "0.5"
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   216
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Slider SliderOutputVolume
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   328
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   200
      Minimum         =   0
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   21
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   248
      Transparent     =   True
      Value           =   50
      Visible         =   True
      Width           =   296
   End
   Begin Label LabelPitchRate
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   832
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   22
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "0"
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   144
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Label Label14
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   636
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   23
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Time Pitch Audio Unit Pitch"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   144
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   204
   End
   Begin Slider SliderPitchRate
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   636
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   2400
      Minimum         =   -2400
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   24
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   2
      Top             =   176
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   296
   End
   Begin Label LabelTimerate
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   832
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   25
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "1.0"
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   210
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Label Label16
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   636
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   26
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Time Pitch Audio Unit Tempo"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   210
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   204
   End
   Begin Slider SliderTimeRate
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   636
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   200
      Minimum         =   0
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   27
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   2
      Top             =   242
      Transparent     =   True
      Value           =   100
      Visible         =   True
      Width           =   296
   End
   Begin Label Label17
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   636
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   28
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Slower"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   274
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin Label Label18
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   863
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   29
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Faster"
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   274
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin Label Label19
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   750
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   30
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Normal"
      TextAlign       =   1
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   274
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin Label Label20
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
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
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   31
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Equalizer"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   330
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   184
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Left            =   20
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   32
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Left            =   50
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   33
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Left            =   80
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   34
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   3
      InitialParent   =   ""
      Left            =   110
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   35
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   4
      InitialParent   =   ""
      Left            =   140
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   36
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   5
      InitialParent   =   ""
      Left            =   170
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   37
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   6
      InitialParent   =   ""
      Left            =   200
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   38
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   7
      InitialParent   =   ""
      Left            =   230
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   39
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   8
      InitialParent   =   ""
      Left            =   260
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   40
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   9
      InitialParent   =   ""
      Left            =   290
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   41
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   10
      InitialParent   =   ""
      Left            =   320
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   42
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   11
      InitialParent   =   ""
      Left            =   350
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   43
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   12
      InitialParent   =   ""
      Left            =   380
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   44
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   13
      InitialParent   =   ""
      Left            =   410
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   45
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   14
      InitialParent   =   ""
      Left            =   440
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   46
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   15
      InitialParent   =   ""
      Left            =   470
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   47
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   16
      InitialParent   =   ""
      Left            =   500
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   48
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   17
      InitialParent   =   ""
      Left            =   530
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   49
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   18
      InitialParent   =   ""
      Left            =   560
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   50
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   19
      InitialParent   =   ""
      Left            =   590
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   51
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   20
      InitialParent   =   ""
      Left            =   620
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   52
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   21
      InitialParent   =   ""
      Left            =   650
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   53
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   22
      InitialParent   =   ""
      Left            =   680
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   54
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   23
      InitialParent   =   ""
      Left            =   710
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   55
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   24
      InitialParent   =   ""
      Left            =   740
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   56
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   25
      InitialParent   =   ""
      Left            =   770
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   57
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   26
      InitialParent   =   ""
      Left            =   800
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   58
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   27
      InitialParent   =   ""
      Left            =   830
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   59
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   28
      InitialParent   =   ""
      Left            =   860
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   60
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   29
      InitialParent   =   ""
      Left            =   890
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   61
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   30
      InitialParent   =   ""
      Left            =   920
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   62
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   31
      InitialParent   =   ""
      Left            =   950
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   63
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Slider EqualizerSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   32
      InitialParent   =   ""
      Left            =   980
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   120
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   64
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   362
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   26
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   2
      Period          =   1000
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
   Begin Label LabelInputVolume
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   524
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   66
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "1.0"
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   143
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   100
   End
   Begin Slider SliderInputVolume
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Left            =   328
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   200
      Minimum         =   0
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   67
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   174
      Transparent     =   True
      Value           =   100
      Visible         =   False
      Width           =   296
   End
   Begin CheckBox CheckInputEnabled1
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Input 1 Volume:"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   328
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      State           =   1
      TabIndex        =   68
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   144
      Transparent     =   True
      Underline       =   False
      Value           =   True
      Visible         =   False
      Width           =   184
   End
   Begin Slider SliderPan
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   636
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   100
      Minimum         =   -100
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   69
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   2
      Top             =   110
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   296
   End
   Begin Label LabelPan
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   832
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   70
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   77
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Label Label3
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   636
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   71
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Output Pan:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   77
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   184
   End
   Begin Canvas SamplesGraph
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   59
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   328
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   72
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   6
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   678
   End
End
#tag EndWindow

#tag WindowCode
	#tag Property, Flags = &h0
		p As AUPlayerMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		Ready As Boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  dim f as FolderItem = GetOpenFolderItem(AudioFileTypes.All)
		  
		  if f = nil then Return
		  
		  
		  p = new AUPlayerMBS
		  if p.LoadFile(f) then
		    // ok
		    
		    SliderPosition.Value = 0
		    
		    dim l as Double = p.TrackLength
		    SliderPosition.Maximum = l
		    SliderLoopIn.Maximum = l
		    SliderLoopOut.Maximum = l
		    
		    p.TimeRate = 1.0
		    p.PitchRate = 0.0
		    p.pan = 0
		    p.Loopin = 0
		    p.LoopOut = l
		    p.LoopIng = false
		    p.InputEnabled(0) = true
		    p.InputEnabled(1) = true
		    p.InputVolume(0) = 1.0
		    p.InputVolume(1) = 1.0
		    p.OutputVolume = 0.5
		    
		    'MsgBox str(p.InputVolume(0))+" "+str(p.OutputVolume)+" "+stR(p.InputEnabled(0))
		    
		    if p.DataIsFloat and p.DataSampleWordSize = 4 then
		      dim d as MemoryBlock = p.Data
		      dim count as integer = d.size / 4 // 4 bytes per Float32 value
		      SamplesGraph.Backdrop = RenderSamplesMBS(d, count, 0, SamplesGraph.Width, SamplesGraph.Height, 1, &c88B5C4, &c274C5A, &c203F4E, -32)
		    end if
		    
		    LabelLength.Text = str(l)
		    
		    ready = true
		  else
		    MsgBox "Failed to load with error: "+str(p.LastError)
		    p = nil
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Playbutton
	#tag Event
		Sub Action()
		  me.Enabled = false
		  if p<>Nil then
		    p.play
		  end if
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Pausebutton
	#tag Event
		Sub Action()
		  me.Enabled = false
		  if p<>nil then
		    p.Pause
		  end if
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SliderPosition
	#tag Event
		Sub ValueChanged()
		  
		  if ready then
		    dim v as Double = me.Value
		    
		    LabelPosition.Text = str(v)
		    p.CurrentTime = v
		    
		    
		    dim e as integer = p.Lasterror
		    if e <> 0 then
		      Break
		    end if
		    
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SliderLoopIn
	#tag Event
		Sub ValueChanged()
		  dim value as Double = me.Value
		  
		  LabelLoopIn.text = str(Value)
		  
		  if not ready then Return
		  
		  p.LoopIn = value
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SliderLoopOut
	#tag Event
		Sub ValueChanged()
		  dim value as Double = me.Value
		  
		  LabelLoopout.text = str(Value)
		  
		  if not ready then Return
		  
		  p.Loopout = value
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckLooping
	#tag Event
		Sub Action()
		  if not ready then Return
		  
		  p.Looping = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckInputEnabled
	#tag Event
		Sub Action(index as Integer)
		  if not Ready then Return
		  
		  p.InputEnabled(0) = me.Value
		  
		  dim e as integer = p.Lasterror
		  if e <> 0 then
		    Break
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SliderInputVolume
	#tag Event
		Sub ValueChanged(index as Integer)
		  dim value as Double = (me.Value / 100.0)
		  
		  LabelInputVolume(index).text = str(Value)
		  
		  if not ready then Return
		  
		  p.InputVolume(index) = value
		  
		  dim e as integer = p.Lasterror
		  if e <> 0 then
		    Break
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SliderOutputVolume
	#tag Event
		Sub ValueChanged()
		  dim value as Double = (me.Value / 100.0)
		  
		  LabelOutputVolume.text = str(Value)
		  
		  if not ready then Return
		  
		  p.OutputVolume = value
		  
		  dim e as integer = p.Lasterror
		  if e <> 0 then
		    Break
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SliderPitchRate
	#tag Event
		Sub ValueChanged()
		  dim value as Double = floor(me.Value)
		  
		  LabelPitchRate.text = str(Value)
		  
		  if not ready then Return
		  
		  p.PitchRate = value
		  
		  dim e as integer = p.Lasterror
		  if e <> 0 then
		    Break
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SliderTimeRate
	#tag Event
		Sub ValueChanged()
		  dim value as Double = me.Value / 100.0
		  
		  LabelTimerate.Text = str(value)
		  
		  if not ready then Return
		  
		  
		  if value < 0.25 then
		    value = 0.25
		  end if
		  
		  p.TimeRate = value
		  
		  dim e as integer = p.Lasterror
		  if e <> 0 then
		    Break
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EqualizerSlider
	#tag Event
		Sub ValueChanged(index as Integer)
		  if not ready then Return
		  
		  
		  dim values() as Double
		  for i as integer = 0 to 31
		    values.Append EqualizerSlider(i).Value / 10.0
		  next
		  
		  
		  p.updateEQ values
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  if p<>Nil then
		    ready = false
		    
		    dim v as Double = p.MeterLevel
		    if v >= -120 then
		      // ok
		    else
		      v = -120
		    end if
		    MeterBar.Value = 120 + v
		    
		    
		    v = p.CurrentTime
		    SliderPosition.Value = v
		    LabelPosition.Text = str(v, "0.0")
		    
		    dim Playing as Boolean = p.Playing
		    
		    if Playing then
		      if not Pausebutton.Enabled then
		        Pausebutton.Enabled = true
		      end if
		    else
		      if not Playbutton.Enabled then
		        Playbutton.Enabled = true
		      end if
		    end if
		    
		    ready = true
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckInputEnabled1
	#tag Event
		Sub Action(index as Integer)
		  if not Ready then Return
		  
		  p.InputEnabled(index) = me.Value
		  
		  dim e as integer = p.Lasterror
		  if e <> 0 then
		    Break
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SliderPan
	#tag Event
		Sub ValueChanged()
		  dim value as Double = me.Value / 100.0
		  
		  LabelPan.Text = str(value)
		  
		  if not ready then Return
		  
		  
		  p.pan = value
		  
		  dim e as integer = p.Lasterror
		  if e <> 0 then
		    Break
		  end if
		  
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
		Name="Ready"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
