#tag Window
Begin Window MainWindow
   BackColor       =   &c00000000
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   True
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1596930774
   MenuBarVisible  =   True
   MinHeight       =   200
   MinimizeButton  =   True
   MinWidth        =   300
   Placement       =   0
   Resizeable      =   True
   Title           =   "Still Photos"
   Visible         =   True
   Width           =   600
   Begin Canvas OutputCanvas
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   400
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   600
   End
   Begin BevelButton BevelButton1
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "Photo"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
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
      Left            =   520
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   60
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  
		  app.AVFoundation.Win = nil
		  
		  if session<>nil then
		    session.stopRunning
		    session = nil
		  end if
		  
		  window = nil
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  configure
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Configure()
		  
		  // Create a capture session
		  session = new AVCaptureSessionMBS
		  
		  // Set the session preset
		  dim preset as string = AVFoundationMBS.AVCaptureSessionPreset640x480
		  session.SessionPreset = preset
		  
		  dim error as NSErrorMBS
		  
		  // Find video devices
		  dim device as AVCaptureDeviceMBS = AVCaptureDeviceMBS.defaultDeviceWithMediaType(AVFoundationMBS.AVMediaTypeVideo)
		  if device = nil then
		    device = AVCaptureDeviceMBS.defaultDeviceWithMediaType(AVFoundationMBS.AVMediaTypeMuxed)
		  end if
		  
		  if device = nil then
		    MsgBox "No device found for video!"
		    return 
		  end if
		  
		  // Create a device input with the device and add it to the session
		  input = AVCaptureDeviceInputMBS.deviceInputWithDevice(device, error)
		  if error<>Nil then
		    MsgBox "deviceInputWithDevice: "+error.localizedDescription
		    return 
		  end if
		  
		  session.addInputWithNoConnections input
		  
		  
		  dim outputSettings as new Dictionary
		  outputSettings.Value(AVFoundationMBS.AVVideoCodecKey) = AVFoundationMBS.AVVideoCodecJPEG
		  
		  StillImageOutput = new AVCaptureStillImageOutputMBS
		  StillImageOutput.outputSettings = outputSettings
		  session.addOutput StillImageOutput
		  
		  
		  dim videoSettings as new Dictionary
		  videoSettings.Value(CVPixelBufferMBS.kCVPixelBufferPixelFormatTypeKey) = CVPixelBufferMBS.kCVPixelFormatType_32ARGB
		  videoSettings.Value(CVPixelBufferMBS.kCVPixelBufferWidthKey) = me.Width
		  videoSettings.Value(CVPixelBufferMBS.kCVPixelBufferHeightKey) = me.Height
		  
		  ' e.g. kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange, 
		  ' kCVPixelFormatType_420YpCbCr8BiPlanarFullRange or
		  ' kCVPixelFormatType_32BGRA.
		  
		  LiveImageOutput = New AVCaptureVideoDataOutputMBS
		  LiveImageOutput.videoSettings = videoSettings
		  LiveImageOutput.alwaysDiscardsLateVideoFrames = True
		  app.AVFoundation.win = Self
		  session.addOutput LiveImageOutput
		  
		  // let the plugin do heavy work on preemptive thread
		  AVCaptureVideoDataOutputMBS.PrepareCIImage = true
		  AVCaptureVideoDataOutputMBS.PrepareNSImage = True
		  
		  
		  session.startRunning
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CurrentImage As NSImageMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		currentPicture As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		devicesCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		input As AVCaptureDeviceInputMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		LastTicks As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		LiveImageOutput As AVCaptureVideoDataOutputMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		session As AVCaptureSessionMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		StillImageOutput As AVCaptureStillImageOutputMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		window As NSWindowMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events OutputCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  
		  if currentPicture <> nil then
		    g.DrawPicture currentPicture, 0, 0, g.Width, g.Height, 0, 0, currentPicture.width, currentPicture.height
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BevelButton1
	#tag Event
		Sub Action()
		  // search the video connection
		  dim videoConnection as AVCaptureConnectionMBS
		  dim connections() as AVCaptureConnectionMBS = stillImageOutput.connections
		  
		  for each connection as AVCaptureConnectionMBS in connections 
		    dim inputPorts() as AVCaptureInputPortMBS = connection.inputPorts
		    
		    for each port as AVCaptureInputPortMBS in inputPorts 
		      if port.mediaType = AVFoundationMBS.AVMediaTypeVideo then
		        videoConnection = connection
		        exit for connection
		      end if
		    next
		  next
		  
		  
		  StillImageOutput.captureStillImageAsynchronously videoConnection, true, 0
		  
		  exception m as NSExceptionMBS
		    MsgBox m.message
		    
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
		Name="devicesCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="currentPicture"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LastTicks"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Double"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
