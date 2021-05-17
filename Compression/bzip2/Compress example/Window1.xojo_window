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
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   -1193386507
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Compress example"
   Visible         =   True
   Width           =   500
   Begin TextArea EditField1
      AcceptTabs      =   False
      Alignment       =   0
      AllowSpellChecking=   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   302
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
      Multiline       =   True
      Password        =   "False"
      ReadOnly        =   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Monkeybread Realbasic Plugin Kit\r\rAbout the items in this folder.\r\rMonkeybread Software Plugin\r\rThis is our big Realbasic plugin. To install simply drop it inside the folder ""plugins"" inside your Realbasic Folder.\r\rPlugin Documentation.html\r\rThe current Dokumentation to our functions. You'll find the current version on http://www.monkeybreadsoftware.de/realbasic in the plugin section.\r\rexamples\r\rLots of examples for you to try this functions from the plugin.\r\rExtras\r\rThis folder contains some additional things for you.\r\rRegistration and Contact\r\rThis file tells you how to register or contact the author\r\rmonkeybreadsoftware.de/realbasic\r\rA link to our homepage\r\rsupport@monkeybreadsoftware.de\r\rFinally the emailaddress for all questions about that plugin kit.\r\r\rWhy is this plugin so big?\r\rIn version 2.3 this plugin is a 1 megabyte file.\rFrom version 2.4 on the plugin includes documentation for Plugin Plunger.\rif you take a close look on it using Resedit you can see that there are ten plugins in one file:\r\rID 128 - general\rID 129 - Mac OS X only functions\rID 130 - Mac OS Classic only functions\rID 131 - Mac only functions\rID 132 - Memoryblock class\rID 133 - Registration stuff\rID 134 - QuickTime functions\rID 135 - Resolution Plugin\rID 136 - Process class\rID 137 - Registry class\rID 138 - Hardware functions\rID 139 - Mac OS stuff from Thomas Tempelmann\rID 140 - Folder functions\rID 141 - Eventmonitor class\rID 142 - MacSerialPlugin\rID 143 - VideoForWindows class\r\rSo if you use only one thing from one part of the plugin Realbasic will only place the used part of this plugin into your application. So using Unixpath of folderitem class will cost you 6 kilobyte because only the plugin ID 129 with the Mac OS X stuff is included.\r\rSome people helped with code for that plugin:\rThomas Tempelmann\rStephan Huber\r\rVersion history:\r\r- isFileMapping functions where missed.\r- New VideoForWindows Class added\r- Added VideoForWindows Class\r- MacClassicSerial Class doesn't work on Classic from Carbon applications. Can't fix.\r- Improved stability of ATA stuff.\r- PictureToString works now for Windows. Example added.\r- Added Registrykey.ValueItem\r- Added RegistryValue.SetBinaryStr\r- Added RegistryValue.SetBinaryMem\r- Changed some things for Registry Stuff\r- Added a QuickTimePresent function\r- StringtoPicture works now for Windows. Example added.\r- Added Eventmonitor class\r- Added System.ComputerName for Mac and Windows.\r- Presskey sends keys to all apps on Windows.\r- Added Environment Class \r- removed several debug boxes\r- Fixed two bugs in Collection class\r- Added several commands to Movie and Movieplayer\r- Added some support for RB Plugin Plunger.\r- addloginitem was missing in version 2.3.\r- removeLoginItem added.\r- added pictureToString function.\r- added TimeZone Class\r- Renamed ""Debug"" into ""CallDebugger"" and ""DebugMessage"".\r- Renamed ""DebugEnable"" into ""DebugMessageEnable"".\r- For RB 4.5 the folderitem.launch function is no more registered by the plugin, so you will only get RBs launch version.\r\r2.3 - 4. Mar 2002\r\r- Added Windows support for DocumentsFolder, ApplicationsFolder, ApplicationSupportFolder and PictureDocumentsFolder\r- Added Windows only folders like AdminToolsFolder, CookiesFolder, HistoryFolder and InternetCacheFolder\r- Added a Registry Class for Windows\r- Added folderitem.unmount to eject volumes on Mac OS.\r- Added presskey.mousemove for Mac OS X.\r- ATAInfoDrive class now works again in Mac OS Classic\r- All ATA Stuff works now in Carbon apps running on Mac OS Classic.\r- The namereg class works now in Carbon apps running on Mac OS Classic.\r- Added CountProcesses\r- The serial class was given to Realsoftware to include this into RB 4.5\r- Added Newstracker as a free example project (see Extra folder)\r- Added App Optimizer 2.0 as a free example project (see Extra folder)\r- RezLib is no longer needed. Resplugin redone.\r\r2.2 - 31. Jan 2002\r\r- Added Process Class\r- Added MoviePlayer Class Extension\r- Added Movie Class Extension\r- Fixed bug in folderitem.drawwideicon\r- Added MacClassicSerial Class\r- ResPlugin is no weak linked so you don't need the library file.\r- Added ResolutionLibraryPresent method\r- Classic plugin now weak linked so it works on older Mac OS versions\r- Documentation splited into lot's of HTML files\r\r2.1 - 21. Jan 2002 \r\r- Added CurrentAppearanceTheme function\r- Added folderitem.Unixpath function\r- Added AddLoginItem function\r- Added ScreenRect object\r- Added Window.WindowFrameRect function\r- Added Window.Collapsable property\r- Added Window.Collapsed property\r- Added AquaPrefMenuEnable method\r- Added AquaPrefMenuDisable method\r- Added MenuBarHeight function\r- Added CollapseAllWindows method\r- Plugin splitted in 7 internal plugins to reduce space in apps.\r- Added the Resolution Plugin\r- Fixed a bug in Resolution Plugin to let it work on Mac OS X again\r- Added Application.ApplicationName method\r- Added Application.ApplicationCreatorCode method\r- Added Application.Frontmost property\r\r2.0 - 13. Jan 2002 - First Release"
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   460
   End
   Begin Label StaticText1
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
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Example for Compress and Decompress:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   318
      Window          =   "0"
      _mWindow        =   "0"
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Compress"
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   360
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   102
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Decompress"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   134
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
      Top             =   360
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   108
   End
   Begin Label StaticText2
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
      InitialParent   =   ""
      Italic          =   False
      Left            =   254
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
      Text            =   ""
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   360
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   226
      Window          =   "0"
      _mWindow        =   "0"
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  backup=editfield1.text
		  staticText2.text=str(lenb(backup))+" Bytes"
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h1
		Protected backup As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected delta As string
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  dim s as string
		  
		  me.Enabled=false
		  s=editfield1.text
		  
		  // Compression is from Level 0 to Level 9, where 0 is no compression and 9 is best compression.
		  
		  s=CompressBZip2MBS(s,9)
		  
		  delta=s
		  staticText2.text=str(lenb(s))+" Bytes"
		  
		  editfield1.text=s
		  editfield1.selstart=0
		  
		  PushButton2.Enabled=true
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  dim s as string
		  
		  me.Enabled=false
		  
		  's=editfield1.text
		  s=delta
		  
		  // on Windows you can't reuse the string form the editfield,
		  // so we save it now in delta.
		  
		  // You need to give a good guess for the output size.
		  // if your guess is to small you get an empty string back
		  
		  s=DecompressBZip2MBS(s,10000)
		  
		  editfield1.text=s
		  editfield1.selstart=0
		  
		  staticText2.text=str(lenb(s))+" Bytes"
		  
		  PushButton1.Enabled=true
		  
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
