#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   500
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "PortMidi Devices"
   Visible         =   True
   Width           =   800
   Begin ListBox ListBox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   4
      ColumnsResizable=   False
      ColumnWidths    =   "50%,30%"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   449
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Name	Interface	HasInput	HasOutput"
      Italic          =   False
      Left            =   -1
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   -1
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   802
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton ReadButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Read"
      Default         =   False
      Enabled         =   False
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
      Top             =   460
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin PushButton WriteButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Write"
      Default         =   False
      Enabled         =   False
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   460
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin PushButton WriteButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Search for new devices"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   610
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
      Top             =   460
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   170
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  p=new PortMidiMBS
		  
		  me.show
		  me.run
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub OpenReadDevice(DeviceID as integer, Name as string)
		  // Open the device for reading
		  
		  dim p as PortMidiMBS
		  dim s as PortMidiStreamMBS
		  dim e as integer
		  
		  // filter active sensing messages (&hFE): */
		  const PM_FILT_ACTIVE= &h1
		  // filter system exclusive messages (&hF0): */
		  const PM_FILT_SYSEX= &h2
		  // filter clock messages (&hF8 only, does not filter clock start, etc.): */
		  const PM_FILT_CLOCK= &h4
		  // filter play messages (start= &hFA, stop= &hFC, continue= &hFB) */
		  const PM_FILT_PLAY= &h8
		  // filter undefined F9 messages (some equipment uses this as a 10ms 'tick') */
		  const PM_FILT_F9= &h10
		  const PM_FILT_TICK = PM_FILT_F9
		  // filter undefined FD messages */
		  const PM_FILT_FD= &h20
		  // filter undefined real-time messages */
		  const PM_FILT_UNDEFINED = &h30 // (PM_FILT_F9 | PM_FILT_FD)
		  // filter reset messages (&hFF) */
		  const PM_FILT_RESET= &h40
		  // filter all real-time messages */
		  const PM_FILT_REALTIME =  &h7F // (PM_FILT_ACTIVE | PM_FILT_SYSEX | PM_FILT_CLOCK | PM_FILT_PLAY | PM_FILT_UNDEFINED | PM_FILT_RESET)
		  // filter note-on and note-off (&h90-&h9F and= &h80-&h8F */
		  const PM_FILT_NOTE= &h80
		  // filter channel aftertouch (most midi controllers use this) (&hD0-&hDF)*/
		  const PM_FILT_CHANNEL_AFTERTOUCH= &h100
		  // per-note aftertouch (&hA0-&hAF) */
		  const PM_FILT_POLY_AFTERTOUCH= &h200
		  // filter both channel and poly aftertouch */
		  const PM_FILT_AFTERTOUCH = &h300 // (PM_FILT_CHANNEL_AFTERTOUCH | PM_FILT_POLY_AFTERTOUCH)
		  // Program changes (&hC0-&hCF) */
		  const PM_FILT_PROGRAM= &h400
		  // Control Changes (CC's) (&hB0-&hBF)*/
		  const PM_FILT_CONTROL= &h800
		  // Pitch Bender (&hE0-&hEF*/
		  const PM_FILT_PITCHBEND= &h1000
		  // MIDI Time Code (&hF1)*/
		  const PM_FILT_MTC= &h2000
		  // Song Position (&hF2) */
		  const PM_FILT_SONG_POSITION= &h4000
		  // Song Select (&hF3)*/
		  const PM_FILT_SONG_SELECT= &h8000
		  // Tuning request (&hF6)*/
		  const PM_FILT_TUNE= &h10000
		  // All System Common messages (mtc, song position, song select, tune request) */
		  const PM_FILT_SYSTEMCOMMON = &h1E000 // (PM_FILT_MTC | PM_FILT_SONG_POSITION | PM_FILT_SONG_SELECT | PM_FILT_TUNE)
		  
		  
		  s=new PortMidiStreamMBS
		  
		  e=s.OpenInput(DeviceID,100)
		  
		  if e=0 then
		    
		    'e=s.SetFilter(&hFFFFF)
		    
		    ReadWindow.Show
		    ReadWindow.Title="Read from "+name
		    ReadWindow.p=p
		    ReadWindow.s=S
		  else
		    MsgBox "OpenInput returns "+str(e)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub OpenWriteDevice(DeviceID as integer, Name as string)
		  // Open the device for reading
		  
		  dim p as PortMidiMBS
		  dim s as PortMidiStreamMBS
		  dim e as integer
		  
		  s=new PortMidiStreamMBS
		  
		  e=s.OpenOutput(DeviceID,10000,100)
		  
		  if e=0 then
		    
		    'e=s.SetFilter(&hFFFFF)
		    
		    WriteWindow.Show
		    WriteWindow.Title="Write to "+name
		    WriteWindow.p=p
		    WriteWindow.s=S
		  else
		    MsgBox "OpenOutput returns "+str(e)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub run()
		  dim i,c as integer
		  dim info as PortMidiDeviceInfoMBS
		  dim s as string
		  
		  ListBox1.DeleteAllRows
		  
		  // Show the device list
		  c=p.CountDevices-1
		  
		  for i=0 to c
		    info=p.DeviceInfo(i)
		    
		    if info<>Nil then
		      ListBox1.AddRow info.Name
		      ListBox1.Cell(ListBox1.LastIndex,1)=info.InterfaceName
		      
		      if info.HasInput then
		        s="yes"
		      else
		        s="no"
		      end if
		      ListBox1.Cell(ListBox1.LastIndex,2)=s
		      if info.HasOutput then
		        s="yes"
		      else
		        s="no"
		      end if
		      ListBox1.Cell(ListBox1.LastIndex,3)=s
		      
		      ListBox1.Cell(ListBox1.LastIndex,4)=str(i)
		      
		    end if
		    
		  next
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected p As PortMidiMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events ListBox1
	#tag Event
		Sub Change()
		  if me.ListIndex<0 then
		    ReadButton.Enabled=False
		    WriteButton.Enabled=false
		  else
		    if me.Cell(me.ListIndex,2)="yes" then
		      ReadButton.Enabled=true
		    else
		      ReadButton.Enabled=False
		    end if
		    
		    if me.Cell(me.ListIndex,3)="yes" then
		      WriteButton.Enabled=true
		    else
		      WriteButton.Enabled=False
		    end if
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ReadButton
	#tag Event
		Sub Action()
		  dim i as integer
		  
		  i=val(ListBox1.Cell(ListBox1.ListIndex,4))
		  
		  OpenReadDevice i,ListBox1.Cell(ListBox1.ListIndex,0)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events WriteButton
	#tag Event
		Sub Action()
		  dim i as integer
		  
		  i=val(ListBox1.Cell(ListBox1.ListIndex,4))
		  
		  OpenWriteDevice i,ListBox1.Cell(ListBox1.ListIndex,0)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events WriteButton1
	#tag Event
		Sub Action()
		  dim i as integer
		  dim c as integer = WindowCount-1
		  dim w as window
		  
		  // close other windows so portmidi is not used.
		  for i=c DownTo 0
		    w = window(c)
		    if w isa MainWindow then
		      // ignore
		    else
		      w.Close
		    end if
		  next
		  
		  dim e as integer = p.ReInitialize
		  if e=0 then
		    // ok
		  else
		    MsgBox "Error: "+str(e)
		  end if
		  
		  
		  run
		  
		  
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
