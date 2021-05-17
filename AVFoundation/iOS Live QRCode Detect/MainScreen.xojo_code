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
   TintColor       =   0
   Title           =   "Barcode Scanning"
   Top             =   0
   Begin MobileCanvas outputCanvas
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   outputCanvas, 4, BottomLayoutGuide, 3, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   outputCanvas, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   outputCanvas, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   outputCanvas, 3, TopLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   503
      Left            =   0
      LockedInPosition=   True
      Scope           =   2
      TintColor       =   ""
      Top             =   65
      Visible         =   True
      Width           =   320
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub Closing()
		  
		  If Self.CaptureSession <> Nil Then
		    Self.CaptureSession.stopRunning
		    Self.CaptureSession = Nil
		  End If
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  // We delay this since the AutoLayout has to be done before the camera session is activated.
		  Timer.CallLater 100, AddressOf Configure
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Configure()
		  Self.CaptureSession = New AVCaptureSessionMBS
		  
		  Var videoCaptureDevice As AVCaptureDeviceMBS = AVCaptureDeviceMBS.defaultDeviceWithMediaType(AVFoundationMBS.AVMediaTypeVideo)
		  If videoCaptureDevice = Nil Then
		    MessageBox "Failed to load video capute device"
		    Return
		  End If
		  
		  Var error As NSErrorMBS
		  Var videoInput As New AVCaptureDeviceInputMBS(videoCaptureDevice, error)
		  
		  If error <> Nil Then
		    MessageBox "VideoInput had an error: "+error.LocalizedDescription
		    Return
		  End If
		  
		  If Self.CaptureSession.canAddInput(videoInput) Then
		    Self.CaptureSession.addInput(videoInput)
		  Else
		    MessageBox "Failed to add capture session input"
		    Return
		  End If
		  
		  Var metadataOutput As New AVCaptureMetadataOutputMBS
		  If self.CaptureSession.canAddOutput(metadataOutput) Then
		    Self.CaptureSession.addOutput(metadataOutput)
		    
		    Var availableTypes() As String = metadataOutput.availableMetadataObjectTypes
		    Var wantedTypes() As String 
		    
		    System.DebugLog "Available Types: " + String.FromArray(availableTypes, ", ")
		    
		    If availableTypes.IndexOf(AVMetadataObjectMBS.AVMetadataObjectTypeQRCode) > -1 Then
		      wantedTypes.Add(AVMetadataObjectMBS.AVMetadataObjectTypeQRCode)
		    End If
		    
		    metadataOutput.SetMetadataObjectTypes wantedTypes
		    
		  Else
		    MessageBox "Failed to add capture session output. Simulator has no camera!"
		    Return
		  End If
		  
		  Self.canvasLayer = CALayerMBS.layerFromHandle(outputCanvas.Handle)
		  Self.canvasLayer.BackgroundColor = CGColorMBS.Black
		  
		  Self.previewLayer = New AVCaptureVideoPreviewLayerMBS(Self.CaptureSession)
		  Self.previewLayer.frame = Self.canvasLayer.bounds
		  Self.previewLayer.videoGravity = AVFoundationMBS.AVLayerVideoGravityResizeAspectFill
		  
		  Self.canvasLayer.addSublayer Self.previewLayer
		  
		  Self.CaptureSession.startRunning
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private canvasLayer As CALayerMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CaptureSession As AVCaptureSessionMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private previewLayer As AVCaptureVideoPreviewLayerMBS
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
#tag EndViewBehavior
