#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
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
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1536895357
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Capture & Play"
   Visible         =   True
   Width           =   851
   Begin Canvas Canvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   366
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   271
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   14
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
   End
   Begin Listbox VList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   True
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
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   153
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Video Device"
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   239
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin BevelButton ConnectButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "Connect"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   False
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   "0"
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   358
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   239
   End
   Begin Listbox AList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   True
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
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   167
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Audio Device"
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   179
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   239
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  CloseInterfaces
		End Sub
	#tag EndEvent

	#tag Event
		Sub Maximize()
		  if mc<>Nil then
		    mc.run
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Minimize()
		  if mc<>Nil then
		    mc.StopWhenReady
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  if TargetWin32 then
		    list alist, DirectShowEnumMonikerMBS.CLSID_AudioInputDeviceCategory, "Audio Input"
		    list vlist, DirectShowEnumMonikerMBS.CLSID_VideoInputDeviceCategory, "Video Input"
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  ResizeVideoWindow
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  ResizeVideoWindow 
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function AblageRecord() As Boolean Handles AblageRecord.Action
			dim f as FolderItem = GetSaveFolderItem(FileTypes1.All, "test.avi")
			
			if f = nil then Return true
			
			mc.stop
			
			// record video
			dim type as DirectShowGUIDMBS = DirectShowFileSinkFilterMBS.MEDIASUBTYPE_Avi
			
			dim multiplexer as DirectShowBaseFilterMBS
			dim sink as DirectShowFileSinkFilterMBS // destination
			
			Capture.SetOutputFileName type, f.NativePath, multiplexer, sink
			Capture.RenderStream(DirectShowPinMBS.PIN_CATEGORY_CAPTURE, Capture.MEDIATYPE_Video, VideoInput, nil, multiplexer)
			Capture.RenderStream(DirectShowPinMBS.PIN_CATEGORY_CAPTURE, Capture.MEDIATYPE_Audio, AudioInput, nil, multiplexer)
			
			
			dim m as DirectShowConfigAviMuxMBS = multiplexer.ConfigAviMux
			m.MasterStream = 1
			
			dim i as DirectShowConfigInterleavingMBS = multiplexer.ConfigInterleaving
			i.mode = i.kInterleaveFull
			
			mc.Run
			
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub Add(dest as listbox, dev As DirectShowMonikerMBS, type as string)
		  
		  // Microsoft calls it Displayname, but it looks more like some UniqueID
		  dim DisplayName as string = dev.DisplayName
		  
		  dim p as DirectShowPropertyBagMBS = dev.Properties
		  if p<>nil then
		    // we show some properties
		    
		    DisplayName = p.FriendlyName
		    
		  end if
		  
		  dest.AddRow DisplayName
		  dest.RowTag(dest.LastIndex) = dev
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Capture()
		  const VFW_S_NOPREVIEWPIN = &h0004027E
		  const VFW_E_NOT_IN_GRAPH = &h8004025F
		  
		  // Get DirectShow interfaces
		  GetInterfaces
		  
		  // Attach the filter graph to the capture graph
		  Capture.SetFiltergraph(graph)
		  
		  // Add Capture filter to our graph.
		  Graph.AddFilter VideoInput, "Video Capture"
		  
		  if Graph.Lasterror<>0 then
		    MsgBox "Graph.AddFilter VideoInput: "+Graph.LasterrorMessage
		  end if
		  
		  Graph.AddFilter AudioInput, "Audio Capture"
		  
		  if Graph.Lasterror<>0 then
		    MsgBox "Graph.AddFilter AudioInput: "+Graph.LasterrorMessage
		  end if
		  
		  // Render the preview pin on the video capture filter
		  Capture.RenderStream(DirectShowPinMBS.PIN_CATEGORY_PREVIEW, Capture.MEDIATYPE_Video, VideoInput)
		  
		  if Capture.Lasterror<>0 and Capture.Lasterror<>VFW_S_NOPREVIEWPIN then
		    MsgBox "Graph.RenderStream VideoInput "+str(Capture.Lasterror)+": "+Capture.LasterrorMessage
		  end if
		  
		  Capture.RenderStream(DirectShowPinMBS.PIN_CATEGORY_PREVIEW, Capture.MEDIATYPE_Audio, AudioInput)
		  
		  if Capture.Lasterror<>0 and Capture.Lasterror<>VFW_S_NOPREVIEWPIN then
		    MsgBox "Graph.RenderStream AudioInput: "+str(Capture.Lasterror)+": "+Capture.LasterrorMessage
		  end if
		  
		  
		  // Set video window style and position
		  SetupVideoWindow
		  
		  // Start previewing video data
		  mc.Run
		  if mc.Lasterror = 1 then // not yet ready, try again
		    mc.Run
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckButton()
		  ConnectButton.Enabled = alist.ListIndex >= 0 and VList.ListIndex >= 0
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CloseInterfaces()
		  // Stop previewing data
		  if mc<>Nil then
		    mc.StopWhenReady
		  end if
		  
		  // Stop receiving events
		  if mee<>nil then
		    'mee.SetNotifyWindow(
		  end if
		  
		  // Relinquish ownership (IMPORTANT!) of the video window.
		  // Failing to call Owner setter can lead to assert failures within
		  // the video renderer, as it still assumes that it has a valid
		  // parent window.
		  if vw<>nil then
		    vw.Visible = false
		    vw.Owner = nil
		  end if
		  
		  // Release DirectShow interfaces
		  mc = nil
		  mee = nil
		  vw = nil
		  Graph = nil
		  Capture = nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetInterfaces()
		  // Create the filter graph
		  graph = new DirectShowGraphBuilderMBS
		  
		  // Create the capture graph builder
		  capture = new DirectShowCaptureGraphBuilderMBS
		  
		  // Obtain interfaces for media control and Video Window
		  MC = Graph.MediaControl
		  VW = Graph.VideoWindow
		  MEE = Graph.MediaEventEx
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub List(dest as listbox, type as DirectShowGUIDMBS, types as string)
		  // Create an enumerator for the video capture devices
		  dim devenum as new DirectShowEnumMonikerMBS(type)
		  if devenum.Handle = 0 then
		    Return
		  end if
		  
		  dim dev as DirectShowMonikerMBS = devenum.NextObject
		  
		  while dev<>nil
		    Add dest, dev, types
		    
		    dev = devenum.NextObject
		  wend
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResizeVideoWindow()
		  if vw<>Nil then
		    // Resize the video preview window to match owner window size
		    vw.SetWindowPosition canvas1.Left, canvas1.top, canvas1.Width, canvas1.Height
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetupVideoWindow()
		  // Set the video window to be a child of the main window
		  vw.Owner = self
		  
		  // Set video window style
		  vw.WindowStyle = BitwiseOr(vw.WS_CHILD, vw.WS_CLIPCHILDREN)
		  
		  // Use helper function to position video window in client rect
		  // of main application window
		  ResizeVideoWindow 
		  
		  // Make the video window visible, now that it is properly positioned
		  vw.Visible = true
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AudioInput As DirectShowBaseFilterMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		Capture As DirectShowCaptureGraphBuilderMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		Graph As DirectShowGraphBuilderMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		MC As DirectShowMediaControlMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		MEE As DirectShowMediaEventExMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		VideoInput As DirectShowBaseFilterMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		VW As DirectShowVideoWindowMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events VList
	#tag Event
		Sub Change()
		  CheckButton
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ConnectButton
	#tag Event
		Sub Action()
		  dim VideoDevice as DirectShowMonikerMBS = VList.RowTag(vList.ListIndex)
		  dim AudioDevice as DirectShowMonikerMBS = AList.RowTag(vList.ListIndex)
		  
		  // Bind Moniker to a filter object
		  videoInput = VideoDevice.BindBaseFilter
		  
		  if VideoDevice.Lasterror<>0 then
		    MsgBox "VideoDevice.BindBaseFilter: "+VideoDevice.LasterrorMessage
		  end if
		  
		  audioInput = AudioDevice.BindBaseFilter
		  
		  if AudioDevice.Lasterror<>0 then
		    MsgBox "AudioDevice.BindBaseFilter: "+AudioDevice.LasterrorMessage
		  end if
		  
		  if videoInput<>Nil and audioInput<>nil then
		    Capture 
		  else
		    MsgBox "Failed to open devices."
		  end if
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AList
	#tag Event
		Sub Change()
		  checkButton
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
