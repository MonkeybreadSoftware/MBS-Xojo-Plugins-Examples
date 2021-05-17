#tag Window
Begin Window MainWindow
   BackColor       =   &c00000000
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   True
   HasFullScreenButton=   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   "True"
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
   Title           =   "Screen as Source"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  if videoPreviewLayer<>Nil then
		    videoPreviewLayer.session = nil
		  end if
		  
		  
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

	#tag Event
		Sub Resized()
		  Resize
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  Resize
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Configure()
		  // Create a screen-sized window and Core Animation layer
		  createWindowAndRootLayer
		  
		  // Create a capture session
		  session = new AVCaptureSessionMBS
		  
		  // Set the session preset
		  dim preset as string = AVFoundationMBS.AVCaptureSessionPreset640x480
		  session.SessionPreset = preset
		  
		  dim error as NSErrorMBS
		  
		  // Find video devices
		  screenInput = new AVCaptureScreenInputMBS(CGDisplayMBS.MainDisplay)
		  
		  // some options you can try:
		  screenInput.removesDuplicateFrames = true
		  screenInput.capturesCursor = true
		  screenInput.capturesMouseClicks = true
		  'screenInput.cropRect = CGMakeRectMBS(0, 0, 1000, 500)
		  
		  
		  session.addInputWithNoConnections screenInput
		  
		  // Find the video input port
		  dim videoPort as AVCaptureInputPortMBS = screenInput.portWithMediaType(AVFoundationMBS.AVMediaTypeVideo)
		  
		  videoPreviewLayer = AVCaptureVideoPreviewLayerMBS.layerWithSessionWithNoConnection(session)
		  
		  // Create a connection with the input port and the preview layer
		  // and add it to the session
		  connection = AVCaptureConnectionMBS.connectionWithInputPort(videoPort,videoPreviewLayer)
		  session.addConnection connection
		  
		  CATransactionMBS.begin
		  // Disable implicit animations for this transaction
		  CATransactionMBS.setValue(true, CATransactionMBS.kCATransactionDisableActions)
		  
		  // Set the layer frame
		  videoPreviewLayer.Frame = rootLayer.frame
		  
		  // We want the video content to always fill the entire layer regardless of the layer size,
		  // so set video gravity to ResizeAspectFill
		  videoPreviewLayer.VideoGravity = AVFoundationMBS.AVLayerVideoGravityResizeAspectFill
		  
		  // move to back
		  videoPreviewLayer.zPosition = -1 
		  
		  // Add the preview layer to the root layer
		  rootLayer.addSublayer videoPreviewLayer
		  
		  CATransactionMBS.commit
		  
		  
		  session.startRunning
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub createWindowAndRootLayer()
		  window = MainWindow.NSWindowMBS
		  
		  // Make the content view layer-backed
		  dim windowContentView as NSViewMBS = window.contentView
		  windowContentView.wantsLayer = true
		  
		  // Grab the Core Animation layer
		  rootLayer = windowContentView.layer
		  rootLayer.autoresizingMask = rootLayer.kCALayerHeightSizable + rootLayer.kCALayerWidthSizable
		  'rootLayer = window1.canvas1.calayermbs
		  
		  // Set its background color to opaque black
		  dim colorspace as CGColorSpaceMBS = CGColorSpaceMBS.CreateDeviceRGB
		  
		  dim black as new MemoryBlock(8*4)
		  black.SingleValue(0) = 0 // red
		  black.SingleValue(4) = 0 // green
		  black.SingleValue(8) = 0 // blue
		  black.SingleValue(12) = 1.0 // alpha
		  dim blackcolor as CGColorMBS = CGColorMBS.Create(colorspace, black)
		  
		  rootLayer.backgroundColor = blackColor
		  
		  // Show the window
		  MainWindow.show
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Resize()
		  
		  CATransactionMBS.begin
		  // Disable implicit animations for this transaction
		  CATransactionMBS.setValue(true, CATransactionMBS.kCATransactionDisableActions)
		  
		  
		  dim rootBounds as CGRectMBS = rootlayer.bounds
		  
		  dim curLayerFrame as CGRectMBS = rootBounds
		  videoPreviewLayer.Frame = curLayerFrame
		  
		  CATransactionMBS.commit
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		connection As AVCaptureConnectionMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		rootLayer As CALayerMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		screenInput As AVCaptureScreenInputMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		session As AVCaptureSessionMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		videoPreviewLayer As AVCaptureVideoPreviewLayerMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		window As NSWindowMBS
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
