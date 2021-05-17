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
   MenuBar         =   -1193225324
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "CD Player Example"
   Visible         =   True
   Width           =   300
   Begin PushButton PlayButton
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      Cancel          =   False
      Caption         =   "Play"
      Default         =   False
      DisabledBalloonHelp=   ""
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
      MacButtonStyle  =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   70
   End
   Begin PushButton PauseButton
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      Cancel          =   False
      Caption         =   "Pause"
      Default         =   False
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   115
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   70
   End
   Begin PushButton ResumeButton
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      Cancel          =   False
      Caption         =   "Resume"
      Default         =   False
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   210
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   70
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
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   46
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin PushButton EjectButton
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      Cancel          =   False
      Caption         =   "Eject"
      Default         =   False
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   115
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   46
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin PushButton CloseButton2
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      Cancel          =   False
      Caption         =   "Close"
      Default         =   False
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   210
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   46
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin Label lasterror
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   52
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
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   228
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   260
   End
   Begin Timer UpdateTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   1000
      TabPanelIndex   =   "0"
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
      MultiLine       =   False
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Position:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   132
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Label position
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
      Italic          =   False
      Left            =   115
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MultiLine       =   False
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   132
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   164
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
      MultiLine       =   False
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Track:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   164
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Label track
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
      Italic          =   False
      Left            =   115
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MultiLine       =   False
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   164
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   164
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
      MultiLine       =   False
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "TrackCount:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   196
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Label Trackcount
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
      Italic          =   False
      Left            =   116
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MultiLine       =   False
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   196
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   164
   End
   Begin PushButton RandomButton
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      Cancel          =   False
      Caption         =   "Random"
      Default         =   False
      DisabledBalloonHelp=   ""
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
      MacButtonStyle  =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   78
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin PushButton PrevButton
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      Cancel          =   False
      Caption         =   "Prev"
      Default         =   False
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   116
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   78
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin PushButton NextButton
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      Cancel          =   False
      Caption         =   "Next"
      Default         =   False
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   211
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   78
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  // close the device and quit
		  
		  v.command="close cdaudio"
		  v.run
		  quit
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  // open the CD Device and set time format to Track:Minute:Second:Frame
		  
		  v=new WindowsMCIMBS
		  v.Command="open cdaudio"
		  v.run
		  checkerror
		  
		  v.Command="set cdaudio time format TMSF"
		  v.run
		  
		  updatetimer.mode=2
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub checkerror()
		  // show the errorcode and the error message
		  
		  lasterror.text=str(v.errorcode)+" "+v.errorstring
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub update()
		  // get the current position, track and track count to display.
		  
		  v.Command="Status cdaudio Current Track"
		  v.run
		  track.text=v.result
		  
		  v.command="Status cdaudio Number of Tracks"
		  v.run
		  if trackcount.text<>v.result then // redraw screen only if changed
		    trackcount.text=v.result
		  end if
		  
		  v.command="Status cdaudio position"
		  v.run
		  if position.text<>v.result then // redraw screen only if changed
		    position.text=v.result
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected v As windowsMCIMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events PlayButton
	#tag Event
		Sub Action()
		  // just play the music...
		  
		  v.command="play cdaudio"
		  v.run
		  checkerror
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PauseButton
	#tag Event
		Sub Action()
		  // send pause command
		  
		  v.command="pause cdaudio"
		  v.run
		  checkerror
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ResumeButton
	#tag Event
		Sub Action()
		  // send resume command
		  
		  v.command="resume cdaudio"
		  v.run
		  checkerror
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StopButton
	#tag Event
		Sub Action()
		  // send stop command
		  
		  v.command="stop cdaudio"
		  v.run
		  checkerror
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EjectButton
	#tag Event
		Sub Action()
		  // eject the disk by setting the door state to open
		  
		  v.command="set cdaudio door open"
		  v.run
		  checkerror
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CloseButton2
	#tag Event
		Sub Action()
		  // close the door...
		  
		  v.command="set cdaudio door closed"
		  v.run
		  checkerror
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UpdateTimer
	#tag Event
		Sub Action()
		  update
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RandomButton
	#tag Event
		Sub Action()
		  // get the number of tracks and play a random one
		  
		  dim count as integer
		  
		  v.command="Status cdaudio Number of Tracks"
		  v.run
		  
		  count=val(v.result)
		  
		  v.command="Play cdaudio From "+format(floor(1+rnd*count),"0")
		  v.run
		  
		  checkerror
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PrevButton
	#tag Event
		Sub Action()
		  // get the current one, subtract one and play it if it's in range
		  
		  dim current as integer
		  dim counts as string
		  
		  v.command="Status cdaudio Current Track"
		  v.run
		  current=val(v.result)
		  
		  v.command="Status cdaudio Number of Tracks"
		  v.run
		  counts=v.result
		  
		  if current>1 then
		    v.command="Play cdaudio From "+format(current-1,"0")+" to "+counts
		    v.run
		  end if
		  
		  checkerror
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NextButton
	#tag Event
		Sub Action()
		  // get the current one, add one and play it if it's in range
		  
		  dim current,count as integer
		  dim counts as string
		  
		  v.command="Status cdaudio Current Track"
		  v.run
		  current=val(v.result)
		  
		  v.command="Status cdaudio Number of Tracks"
		  v.run
		  counts=v.result
		  count=Val(counts)
		  
		  if current<count then
		    v.command="Play cdaudio From "+format(current+1,"0")+" To "+counts
		    v.run
		  end if
		  
		  checkerror
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
