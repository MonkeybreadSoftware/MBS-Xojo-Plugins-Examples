#tag MobileScreen
Begin MobileScreen MainScreen
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   HasNavigationBar=   True
   LargeTitleDisplayMode=   2
   Left            =   0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   "&h00000000"
   Title           =   "Barcode Scanning"
   Top             =   0
   Begin MobileCanvas outputCanvas
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   outputCanvas, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   outputCanvas, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   outputCanvas, 3, TopLayoutGuide, 3, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   outputCanvas, 8, , 0, False, +1.00, 4, 1, 284, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   284
      Left            =   0
      LockedInPosition=   False
      Scope           =   2
      TintColor       =   ""
      Top             =   65
      Visible         =   True
      Width           =   320
   End
   Begin iOSMobileTable List
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowRefresh    =   False
      AllowSearch     =   False
      AutoLayout      =   List, 1, outputCanvas, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   List, 2, outputCanvas, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   List, 3, <Parent>, 3, False, +1.00, 4, 1, 348, , True
      AutoLayout      =   List, 4, BottomLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      ControlCount    =   0
      EditingEnabled  =   False
      EditingEnabled  =   False
      Enabled         =   True
      EstimatedRowHeight=   -1
      Format          =   0
      Height          =   220
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      SectionCount    =   0
      TintColor       =   ""
      Top             =   348
      Visible         =   True
      Width           =   320
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub Closing()
		  
		  app.AVFoundation.Win = Nil
		  
		  If session<>Nil Then
		    session.stopRunning
		    session = Nil
		  End If
		  
		  Window = Nil
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
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
		    MessageBox "No device found for video!"
		    return 
		  end if
		  
		  // Create a device input with the device and add it to the session
		  input = AVCaptureDeviceInputMBS.deviceInputWithDevice(device, error)
		  if error<>Nil then
		    MessageBox "deviceInputWithDevice: "+error.localizedDescription
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
		  
		  ' e.g. kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange, 
		  ' kCVPixelFormatType_420YpCbCr8BiPlanarFullRange or
		  ' kCVPixelFormatType_32BGRA.
		  
		  CIContext = New CIContextMBS
		  
		  CIDetector = new CIDetectorMBS(CIDetectorMBS.CIDetectorTypeQRCode, CIContext)
		  
		  
		  BarcodeOutput = new AVCaptureVideoDataOutputMBS(CIDetector)
		  BarcodeOutput.videoSettings = videoSettings
		  BarcodeOutput.alwaysDiscardsLateVideoFrames = True
		  
		  app.AVFoundation.win = self
		  session.addOutput BarcodeOutput
		  
		  
		  // Attach preview to session
		  
		  previewViewLayer = CALayerMBS.layerFromHandle(outputCanvas.Handle)
		  previewViewLayer.BackgroundColor = CGColorMBS.Black
		  
		  
		  newPreviewLayer = new AVCaptureVideoPreviewLayerMBS(session)
		  newPreviewLayer.frame = previewViewLayer.bounds
		  newPreviewLayer.autoresizingMask = newPreviewLayer.kCALayerWidthSizable + newPreviewLayer.kCALayerHeightSizable
		  
		  previewViewLayer.addSublayer newPreviewLayer
		  
		  
		  
		  session.startRunning
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		BarcodeOutput As AVCaptureVideoDataOutputMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		CIContext As CIContextMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		CIDetector As CIDetectorMBS
	#tag EndProperty

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
		newPreviewLayer As AVCaptureVideoPreviewLayerMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		previewViewLayer As CALayerMBS
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

#tag ViewBehavior
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
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
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackButtonCaption"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasNavigationBar"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIcon"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LargeTitleDisplayMode"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="MobileScreen.LargeTitleDisplayModes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabBarVisible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TintColor"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="ColorGroup"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlCount"
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
		Name="devicesCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
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
