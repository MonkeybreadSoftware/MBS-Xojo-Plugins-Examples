#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   498
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1781617930
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "QCView"
   Visible         =   True
   Width           =   600
   Begin Rectangle Rectangle1
      AutoDeactivate  =   True
      BorderWidth     =   1.0
      BottomRightColor=   
      Enabled         =   True
      FillColor       =   
      Height          =   93
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   390
      TopLeftColor    =   
      Transparent     =   True
      Visible         =   True
      Width           =   560
      Begin PushButton PauseBtn
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
         InitialParent   =   "Rectangle1"
         Italic          =   False
         Left            =   128
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   "0"
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   449
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton PlayBtn
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
         InitialParent   =   "Rectangle1"
         Italic          =   False
         Left            =   36
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   "0"
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   449
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton StopBtn
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Stop"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Rectangle1"
         Italic          =   False
         Left            =   220
         LockBottom      =   True
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
         Top             =   449
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin TextField txt
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
         InitialParent   =   "Rectangle1"
         Italic          =   False
         Left            =   140
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   "0"
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   416
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   309
      End
      Begin CheckBox ckloop
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Loop"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Rectangle1"
         Italic          =   False
         Left            =   312
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   "0"
         State           =   1
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   449
         Transparent     =   True
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   53
      End
      Begin PushButton OpenBtn
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Media file :"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Rectangle1"
         Italic          =   False
         Left            =   36
         LockBottom      =   True
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
         Top             =   417
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   92
      End
      Begin ProgressBar bar
         AutoDeactivate  =   True
         Enabled         =   False
         Height          =   14
         HelpTag         =   ""
         Indeterminate   =   False
         Index           =   -2147483648
         InitialParent   =   "Rectangle1"
         Left            =   32
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Maximum         =   100
         Scope           =   "0"
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   397
         Transparent     =   True
         Value           =   0.0
         Visible         =   True
         Width           =   535
      End
      Begin Slider Slider1
         AutoDeactivate  =   True
         Enabled         =   False
         Height          =   23
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Rectangle1"
         Left            =   407
         LineStep        =   1
         LiveScroll      =   True
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Maximum         =   100
         Minimum         =   0
         PageStep        =   20
         Scope           =   "0"
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         TickStyle       =   0
         Top             =   449
         Transparent     =   True
         Value           =   0
         Visible         =   True
         Width           =   158
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
         InitialParent   =   "Rectangle1"
         Italic          =   False
         Left            =   377
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
         Text            =   "Mix"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   449
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   25
      End
      Begin PushButton Overlaybtn
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Load overlay"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Rectangle1"
         Italic          =   False
         Left            =   461
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   "0"
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   417
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   104
      End
   End
   Begin Timer Timer2
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   0
      Period          =   10
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   0
      Period          =   100
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
   Begin QCViewControlMBS view
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   364
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   14
      Transparent     =   True
      Visible         =   True
      Width           =   560
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Play(file as string)
		  
		  QCin("Movie",file) // Select and play the current file
		  
		  //Movie info :
		  Timer1.Mode = 2
		  
		  if playing then
		    //Put the selection at the beginning :
		    QCin("SelStart", 0 )
		    QCin("SelDuration", .003 )
		    Timer2.Mode = 2 //restart streaming
		  end if
		  
		  if paused then
		    paused = false
		    PauseBtn.Caption = "Pause"
		  end if
		  
		  stoped = false
		  playing = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub QCin(InputCommand as string, valeur as Variant)
		  //make "input" port command (write) inside the patch file :
		  if v.isRendering then
		    if v.setValueForInputKey(valeur, InputCommand) then
		    end if
		  end if
		  
		  exception
		    exit
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function QCout(valeur as string) As Variant
		  //make "output" port command (read) inside the patch file :
		  return v.valueForOutputKey(valeur) 
		  
		  exception
		    exit
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  
		  QCin("Movie","")  //empty file string from the quartz file
		  position = 0
		  bar.Value = 0
		  Timer1.mode = 0
		  
		  if paused then
		    paused = false
		    PauseBtn.Caption = "Pause"
		  end if
		  
		  stoped = true
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		duration As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		paused As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		playing As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		position As double
	#tag EndProperty

	#tag Property, Flags = &h0
		stoped As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		v As QCViewMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		val As double
	#tag EndProperty


#tag EndWindowCode

#tag Events PauseBtn
	#tag Event
		Sub Action()
		  
		  if not playing or stoped then exit
		  
		  if not paused then
		    '
		    QCin("SelStart", QCout("MoviePosition") )  //put selection at position
		    QCin("SelDuration",0.003) //while method to make pause
		    me.Caption = "Resume"
		    paused = true
		    '
		  else
		    '
		    QCin("SelStart", QCout("MoviePosition") )
		    QCin("SelDuration",0 ) //playing all
		    me.Caption = "Pause"
		    paused = false
		    '
		  end if
		  
		  exit sub
		  
		  // brut method, sound in background :
		  
		  if v.isRendering and not v.isPausedRendering then 
		    v.pauseRendering
		    me.Caption = "Resume"
		  else
		    v.resumeRendering
		    me.Caption = "Pause"
		  end if
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PlayBtn
	#tag Event
		Sub Action()
		  if txt.Text ="" then exit
		  
		  //Play Movie :
		  Play(txt.Text)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StopBtn
	#tag Event
		Sub Action()
		  //reset Movie
		  Stop
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events OpenBtn
	#tag Event
		Sub Action()
		  dim d as openDialog = new openDialog
		  dim f as folderitem = d.showModalWithin(self)
		  
		  if f = nil then Return
		  
		  txt.Text = f.UnixpathMBS
		  
		  Play(txt.Text)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Slider1
	#tag Event
		Sub ValueChanged()
		  val = me.value /100
		  QCin("Alpha",val)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Overlaybtn
	#tag Event
		Sub Action()
		  //load image (or movie) overlay :
		  dim NSImage as NSImageMBS = new NSImageMBS(LogoMBS(500))
		  QCin("Image",NSImage)
		  'QCin("Image",txt2.text)
		  Slider1.Enabled = True
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer2
	#tag Event
		Sub Action()
		  
		  //restart to the beginning :
		  if QCout("MoviePosition") = 0.0 then 
		    QCin("SelDuration",0)
		    me.Mode = 0
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  
		  //setting Movie position & duration from the patch file :
		  
		  if position < 1 then
		    duration =QCout("MovieDuration") 
		    bar.Maximum = duration
		  end if
		  
		  position = QCout("MoviePosition")
		  
		  bar.Value = position
		  
		  dim second as string = str(round(position))
		  dim total as string = str(round(duration))
		  
		  self.Title = second + " / " + total + " sec"
		  
		  if not ckloop.value then
		    //Stopping the movie at the end :
		    if second  = total  then Stop
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events view
	#tag Event
		Sub Open()
		  
		  v = me.View
		  
		  //load quartz file :
		  dim f as FolderItem = FindFile("quartz_patch.qtz")
		  
		  if f <> nil and f.Exists then
		    
		    if v.loadCompositionFromFile(f) then v.autostartsRendering=true
		    
		  else
		    
		    msgbox "cannot load patch file!"
		    
		  end if
		  
		  exception
		    exit
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
		Name="val"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="double"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="position"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="double"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="duration"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Double"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="playing"
		Visible=false
		Group="Behavior"
		InitialValue="false"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="paused"
		Visible=false
		Group="Behavior"
		InitialValue="false"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="stoped"
		Visible=false
		Group="Behavior"
		InitialValue="true"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
