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
   Width           =   600
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
      Left            =   20
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
		    CaptureVideo
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
			Dim f As FolderItem = GetSaveFolderItem(FileTypes1.All, "test.avi")
			
			if f = nil then Return true
			
			mc.stop
			
			// record video
			dim type as DirectShowGUIDMBS = DirectShowFileSinkFilterMBS.MEDIASUBTYPE_Avi
			
			dim multiplexer as DirectShowBaseFilterMBS
			dim sink as DirectShowFileSinkFilterMBS // destination
			
			'dim f as FolderItem = SpecialFolder.Desktop.Child("test.avi")
			Capture.SetOutputFileName type, f.NativePath, multiplexer, sink
			Capture.RenderStream(DirectShowPinMBS.PIN_CATEGORY_CAPTURE, Capture.MEDIATYPE_Video, srcfilter, encoder, multiplexer)
			
			mc.Run
			
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub CaptureVideo()
		  // Get DirectShow interfaces
		  GetInterfaces
		  
		  // Attach the filter graph to the capture graph
		  Capture.SetFiltergraph(graph)
		  
		  // Use the system device enumerator and class enumerator to find
		  // a video capture/preview device, such as a desktop USB video camera.
		  srcfilter = FindCaptureDevice
		  
		  // Add Capture filter to our graph.
		  Graph.AddFilter srcfilter, "Video Capture"
		  
		  'srcfilter.ShowPropertyDialog
		  'MsgBox "Result: "+Str(srcfilter.Lasterror)+": "+srcfilter.LasterrorMessage
		  
		  // let's pick a video encoder
		  encoder = FindEncoder
		  If encoder <> Nil Then
		    Graph.AddFilter encoder, "Video Encoder"
		    
		    'encoder.ShowPropertyDialog
		    'MsgBox "Result: "+Str(encoder.Lasterror)+": "+encoder.LasterrorMessage
		    
		    'Dim AMVideoCompression As DirectShowAMVideoCompressionMBS = encoder.AMVideoCompression
		    'If AMVideoCompression <> Nil Then
		    'AMVideoCompression.ShowPropertyDialog
		    '
		    'MsgBox "Result: "+Str(AMVideoCompression.Lasterror)+": "+AMVideoCompression.LasterrorMessage
		    'Else
		    'MsgBox "No AMVideoCompression."
		    'End If
		    
		  End If
		  
		  
		  'Dim AMVideoCompression As DirectShowAMVideoCompressionMBS = srcfilter.AMVideoCompression
		  'If AMVideoCompression <> Nil Then
		  'AMVideoCompression.ShowPropertyDialog
		  '
		  'MsgBox "Result: "+Str(AMVideoCompression.Lasterror)+": "+AMVideoCompression.LasterrorMessage
		  'Else
		  'MsgBox "No AMVideoCompression."
		  'end if
		  '
		  'Dim AMCameraControl As DirectShowAMCameraControlMBS = srcfilter.AMCameraControl
		  'If AMCameraControl <> Nil Then
		  'AMCameraControl.ShowPropertyDialog
		  '
		  'MsgBox "Result: "+Str(AMCameraControl.Lasterror)+": "+AMCameraControl.LasterrorMessage
		  'Else
		  'MsgBox "No AMCameraControl."
		  'End If
		  '
		  'Dim AMCrossbar As DirectShowAMCrossbarMBS = srcfilter.AMCrossbar
		  'If AMCrossbar <> Nil Then
		  'AMCrossbar.ShowPropertyDialog
		  '
		  'MsgBox "Result: "+Str(AMCrossbar.Lasterror)+": "+AMCrossbar.LasterrorMessage
		  'Else
		  'MsgBox "No AMCrossbar."
		  'End If
		  '
		  'Dim AMStreamConfig2 As DirectShowAMStreamConfigMBS = capture.GetStreamConfig(False, srcfilter)
		  'If AMStreamConfig2 <> Nil Then
		  'AMStreamConfig2.ShowPropertyDialog
		  '
		  'MsgBox "Result: "+Str(AMStreamConfig2.Lasterror)+": "+AMStreamConfig2.LasterrorMessage
		  'Else
		  'MsgBox "No AMStreamConfig with srcfilter."
		  'End If
		  
		  
		  // Render the preview pin on the video capture filter
		  Capture.RenderStream(DirectShowPinMBS.PIN_CATEGORY_PREVIEW, Capture.MEDIATYPE_Video, srcfilter)
		  
		  
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
		Function FindCaptureDevice() As DirectShowBaseFilterMBS
		  // Create an enumerator for the video capture devices
		  dim devenum as new DirectShowEnumMonikerMBS(DirectShowEnumMonikerMBS.CLSID_VideoInputDeviceCategory)
		  if devenum.Handle = 0 then
		    MsgBox "No video capture device found."
		  end if
		  
		  dim dev as DirectShowMonikerMBS = devenum.NextObject
		  dim f as DirectShowBaseFilterMBS
		  
		  while dev<>nil 
		    // Bind Moniker to a filter object
		    f = dev.BindBaseFilter
		    
		    if f<>Nil then
		      System.DebugLog dev.DisplayName
		      
		      'Title = "Connected to "+dev.DisplayName
		      Return f
		    end if
		    
		    dev = devenum.NextObject
		  wend
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindEncoder() As DirectShowBaseFilterMBS
		  // Create an enumerator for the video capture devices
		  Dim devenum As New DirectShowEnumMonikerMBS(DirectShowEnumMonikerMBS.CLSID_VideoCompressorCategory)
		  if devenum.Handle = 0 then
		    MsgBox "No video capture device found."
		  end if
		  
		  dim dev as DirectShowMonikerMBS = devenum.NextObject
		  dim f as DirectShowBaseFilterMBS
		  
		  while dev<>nil 
		    // Bind Moniker to a filter object
		    f = dev.BindBaseFilter
		    
		    If f<>Nil Then
		      System.DebugLog dev.DisplayName
		      
		      Dim FriendlyName As String = dev.Properties.FriendlyName
		      
		      System.DebugLog "FriendlyName: "+FriendlyName
		      
		      'Title = "Connected to "+dev.DisplayName
		      
		      If InStr(FriendlyName, "Microsoft Video") > 0 Then
		        Return f
		      end if
		      
		    end if
		    
		    dev = devenum.NextObject
		  wend
		  
		  
		End Function
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
		Capture As DirectShowCaptureGraphBuilderMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		encoder As DirectShowBaseFilterMBS
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
		srcfilter As DirectShowBaseFilterMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		VW As DirectShowVideoWindowMBS
	#tag EndProperty


#tag EndWindowCode

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
