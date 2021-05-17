#tag Window
Begin Window Window1
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
   Title           =   "Video Wall"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  for each layer as AVCaptureVideoPreviewLayerMBS in videoPreviewLayers
		    layer.session = nil
		  next
		  
		  
		  if session<>nil then
		    session.stopRunning
		    session = nil
		  end if
		  
		  window = nil
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  call configure
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
		Function Configure() As Boolean
		  
		  // Create a screen-sized window and Core Animation layer
		  createWindowAndRootLayer
		  
		  // Create a capture session
		  session = new AVCaptureSessionMBS
		  
		  // Set the session preset
		  dim preset as string = AVFoundationMBS.AVCaptureSessionPreset640x480
		  session.SessionPreset = preset
		  
		  // Create a wall of video out of the video capture devices on your Mac
		  dim success as boolean = setupVideoWall
		  return success
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub createWindowAndRootLayer()
		  window = window1.NSWindowMBS
		  
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
		  window1.show
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function devicesThatCanProduceVideo() As AVCaptureDeviceMBS()
		  dim devices() as AVCaptureDeviceMBS
		  
		  dim allDevices() as AVCaptureDeviceMBS = AVCaptureDeviceMBS.devices
		  
		  for each d as AVCaptureDeviceMBS in allDevices
		    if d.HasMediaType(AVFoundationMBS.AVMediaTypeVideo) or  d.HasMediaType(AVFoundationMBS.AVMediaTypeMuxed) then
		      devices.Append d
		    end if
		  next
		  
		  Return devices
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function rectForQuadrant(i as integer, rect as CGRectMBS) As CGRectMBS
		  dim curLayerFrame as new CGRectMBS(rect)
		  curLayerFrame.width = curLayerFrame.width / 2
		  curLayerFrame.height = curLayerFrame.height / 2
		  
		  select case i
		  case 0 // top left
		    // currentLayerBounds.origin.x/y are unchanged.
		    
		  case 1 // top right
		    curLayerFrame.left = curLayerFrame.left + curLayerFrame.width
		    
		  case 2 // bottom left
		    curLayerFrame.top = curLayerFrame.top + curLayerFrame.height
		    
		  case 3 // bottom right
		    curLayerFrame.top = curLayerFrame.top + curLayerFrame.height
		    curLayerFrame.left = curLayerFrame.left + curLayerFrame.width
		  end Select
		  
		  // Make a 2-pixel border
		  curLayerFrame.top = curLayerFrame.top + 2
		  curLayerFrame.left = curLayerFrame.left + 2
		  curLayerFrame.width = curLayerFrame.width - 4
		  curLayerFrame.height = curLayerFrame.height - 4
		  
		  return curLayerFrame
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Resize()
		  
		  CATransactionMBS.begin
		  // Disable implicit animations for this transaction
		  CATransactionMBS.setValue(true, CATransactionMBS.kCATransactionDisableActions)
		  
		  
		  dim u as integer = UBound(videoPreviewLayers)
		  for i as integer = 0 to u
		    dim currentDevice as integer = i \ 4
		    dim rootBounds as CGRectMBS = rootlayer.bounds
		    dim deviceSquareBounds as CGRectMBS = CGRectMBS.Make(0, 0, rootBounds.size.width / devicesCount, rootBounds.size.height)
		    deviceSquareBounds.left = deviceSquareBounds.size.width * currentDevice
		    
		    dim videoPreviewLayer as AVCaptureVideoPreviewLayerMBS = videoPreviewLayers(i)
		    
		    dim q as integer = quadrantIndexes(i)
		    dim curLayerFrame as CGRectMBS = rectForQuadrant(q, deviceSquareBounds)
		    videoPreviewLayer.Frame = curLayerFrame
		    
		  next
		  
		  CATransactionMBS.commit
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function setupVideoWall() As Boolean
		  // Create 4 video preview layers per video device in a mirrored square, and
		  // set up these squares left to right within the root layer
		  
		  dim error as NSErrorMBS
		  
		  // Find video devices
		  dim devices() as AVCaptureDeviceMBS = devicesThatCanProduceVideo
		  
		  devicesCount = UBound(devices)+1
		  dim currentDevice as integer = 0
		  
		  dim rootBounds as CGRectMBS = rootlayer.bounds
		  if devicesCount = 0 then
		    return false
		  end if
		  
		  // For each video device
		  for each d as AVCaptureDeviceMBS in devices
		    // Create a device input with the device and add it to the session
		    input = AVCaptureDeviceInputMBS.deviceInputWithDevice(d, error)
		    if error<>Nil then
		      MsgBox "deviceInputWithDevice: "+error.localizedDescription
		      return false
		    end if
		    
		    session.addInputWithNoConnections input
		    
		    // Find the video input port
		    dim videoPort as AVCaptureInputPortMBS = input.portWithMediaType(AVFoundationMBS.AVMediaTypeVideo)
		    
		    // Set up its corresponding square within the root layer
		    dim deviceSquareBounds as CGRectMBS = CGRectMBS.Make(0, 0, rootBounds.size.width / devicesCount, rootBounds.size.height)
		    deviceSquareBounds.left = deviceSquareBounds.size.width * currentDevice
		    
		    // Create 4 video preview layers in the square
		    for i as integer = 0 to 3
		      // Create a video preview layer with the session
		      videoPreviewLayer = AVCaptureVideoPreviewLayerMBS.layerWithSessionWithNoConnection(session)
		      
		      // Add it to the arrays
		      videoPreviewLayers.append videoPreviewLayer
		      quadrantIndexes.append i
		      
		      // Create a connection with the input port and the preview layer
		      // and add it to the session
		      dim connection as AVCaptureConnectionMBS = AVCaptureConnectionMBS.connectionWithInputPort(videoPort,videoPreviewLayer)
		      session.addConnection connection
		      
		      // If the preview layer is at top-right (i=1) or bottom-left (i=2),
		      // flip it left-right.
		      dim doMirror as boolean = ((i = 1) or (i = 2))
		      if ( doMirror ) then
		        connection.AutomaticallyAdjustsVideoMirroring = false
		        connection.VideoMirrored = true
		      end if
		      
		      // Compute the frame for the current layer
		      // Each layer fills a quadrant of the square
		      dim curLayerFrame as CGRectMBS = rectForQuadrant(i, deviceSquareBounds)
		      
		      CATransactionMBS.begin
		      // Disable implicit animations for this transaction
		      CATransactionMBS.setValue(true, CATransactionMBS.kCATransactionDisableActions)
		      
		      // Set the layer frame
		      videoPreviewLayer.Frame = curLayerFrame
		      
		      // Save the frame in an array for the "sendLayersHome" animation
		      '[_homeLayerRects addObject:[NSValue valueWithRect:NSRectFromCGRect(curLayerFrame)]];
		      
		      // We want the video content to always fill the entire layer regardless of the layer size,
		      // so set video gravity to ResizeAspectFill
		      videoPreviewLayer.VideoGravity = AVFoundationMBS.AVLayerVideoGravityResizeAspectFill
		      
		      // If the layer is at top of the square (i=0, 1), make it upside down
		      if ( i < 2 ) then
		        connection.VideoOrientation = AVCaptureConnectionMBS.AVCaptureVideoOrientationPortraitUpsideDown
		      end if
		      
		      // Add the preview layer to the root layer
		      rootLayer.addSublayer videoPreviewLayer
		      
		      CATransactionMBS.commit
		    next
		    currentDevice = currentDevice +1 
		  next
		  session.startRunning
		  
		  return true
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		devicesCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		input As AVCaptureDeviceInputMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		quadrantIndexes() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		rootLayer As CALayerMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		session As AVCaptureSessionMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		videoPreviewLayer As AVCaptureVideoPreviewLayerMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		videoPreviewLayers(-1) As AVCaptureVideoPreviewLayerMBS
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
	#tag ViewProperty
		Name="devicesCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
