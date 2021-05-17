#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   626
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   2091324213
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Recorder"
   Visible         =   True
   Width           =   890
   Begin Label Label5
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   721
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Audio Level"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   586
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   149
   End
   Begin Timer audioLevelTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   2
      Period          =   1000
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Audio"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   13
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PopupMenu PopupAudioDevices
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   132
      ListIndex       =   0
      LockBottom      =   False
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
      Top             =   12
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   194
   End
   Begin PopupMenu PopupAudioFormats
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   338
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   12
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   194
   End
   Begin Label Label3
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Presets"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   44
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PopupMenu PopupPresets
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   132
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   43
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   194
   End
   Begin Canvas Output
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   486
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
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   76
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   850
   End
   Begin Slider SliderVolume
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LineStep        =   1
      LiveScroll      =   False
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Maximum         =   100
      Minimum         =   0
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   568
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   129
   End
   Begin ProgressBar audioLevelMeter
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Indeterminate   =   False
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   721
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Maximum         =   20
      Scope           =   "0"
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   569
      Transparent     =   True
      Value           =   0.0
      Visible         =   True
      Width           =   149
   End
   Begin Label Label4
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   34
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Volume"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   584
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton StartButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Start Recording"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   186
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   584
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   131
   End
   Begin PushButton StopButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Stop Recording"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   329
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   585
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   131
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  // Invalidate the level meter timer here to avoid a retain cycle
		  audioLevelTimer.Mode = 0
		  
		  // Stop the session
		  if session<>Nil then
		    session.stopRunning
		    session = nil
		  end if
		  
		  redim audioDevices(-1)
		  
		  audioPreviewOutput = nil
		  movieFileOutput = nil
		  previewLayer = nil
		  videoDeviceInput = nil
		  audioDeviceInput = nil
		  
		  for each o as MyNSNotificationObserverMBS in observers
		    o.clear
		  next
		  redim observers(-1)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  win = new NSWindowMBS(Self)
		  
		  Init
		  Start
		  
		  
		  dim display as CGDisplayMBS = CGDisplayMBS.MainDisplay
		  screenInput = new AVCaptureScreenInputMBS(display)
		  
		  
		  session.addInput screenInput
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function audioDeviceFormat() As AVCaptureDeviceFormatMBS
		  return self.selectedAudioDevice.activeFormat
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function availableSessionPresets() As string()
		  dim allSessionPresets() as string = array(_
		  AVFoundationMBS.AVCaptureSessionPresetLow,_
		  AVFoundationMBS.AVCaptureSessionPresetMedium,_
		  AVFoundationMBS.AVCaptureSessionPresetHigh,_
		  AVFoundationMBS.AVCaptureSessionPreset320x240,_
		  AVFoundationMBS.AVCaptureSessionPreset352x288,_
		  AVFoundationMBS.AVCaptureSessionPreset640x480,_
		  AVFoundationMBS.AVCaptureSessionPreset960x540,_
		  AVFoundationMBS.AVCaptureSessionPreset1280x720,_
		  AVFoundationMBS.AVCaptureSessionPresetPhoto)
		  
		  dim availableSessionPresets() as string
		  
		  for each sessionPreset as string in allSessionPresets
		    if session.canSetSessionPreset(sessionPreset) then
		      availableSessionPresets.Append sessionPreset
		    end if
		  next
		  
		  return availableSessionPresets
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function frameRateRange() As AVFrameRateRangeMBS
		  dim activeFrameRateRange as AVFrameRateRangeMBS
		  
		  dim videoSupportedFrameRateRanges() as AVFrameRateRangeMBS = self.selectedVideoDevice.activeFormat.videoSupportedFrameRateRanges
		  
		  for each frameRateRange as AVFrameRateRangeMBS in videoSupportedFrameRateRanges
		    if frameRateRange.minFrameDuration = self.selectedVideoDevice.activeVideoMinFrameDuration then
		      activeFrameRateRange = frameRateRange
		      exit
		    end if
		  next
		  
		  return activeFrameRateRange
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub gotAVCaptureDeviceWasConnectedNotification(n as NSNotificationMBS)
		  refreshDevices
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub gotAVCaptureDeviceWasDisconnectedNotification(n as NSNotificationMBS)
		  refreshDevices
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub gotAVCaptureSessionDidStartRunningNotification(n as NSNotificationMBS)
		  System.DebugLog "did start running."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub gotAVCaptureSessionDidStopRunningNotification(n as NSNotificationMBS)
		  System.DebugLog "did stop running."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub gotAVCaptureSessionRuntimeErrorNotification(n as NSNotificationMBS)
		  dim userinfo as Dictionary = n.userinfo
		  
		  dim error as NSErrorMBS = userinfo.Lookup(AVFoundationMBS.AVCaptureSessionErrorKey, nil)
		  call win.presentError error
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function hasRecordingDevice() As Boolean
		  Return videoDeviceInput <> nil or audioDeviceInput <> nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init()
		  // Create a capture session
		  session = new AVCaptureSessionMBS
		  
		  // Capture Notification Observers
		  dim notificationCenter as NSNotificationCenterMBS = NSNotificationCenterMBS.defaultCenter
		  
		  dim runtimeErrorObserver as new MyNSNotificationObserverMBS(AddressOf gotAVCaptureSessionRuntimeErrorNotification)
		  notificationCenter.addObserver runtimeErrorObserver, AVFoundationMBS.AVCaptureSessionRuntimeErrorNotification
		  
		  dim didStartRunningObserver as new MyNSNotificationObserverMBS(AddressOf gotAVCaptureSessionDidStartRunningNotification)
		  notificationCenter.addObserver didStartRunningObserver, AVFoundationMBS.AVCaptureSessionDidStartRunningNotification
		  
		  dim didStopRunningObserver as new MyNSNotificationObserverMBS(AddressOf gotAVCaptureSessionDidStopRunningNotification)
		  notificationCenter.addObserver didStopRunningObserver, AVFoundationMBS.AVCaptureSessionDidStopRunningNotification
		  
		  dim deviceWasConnectedObserver as new MyNSNotificationObserverMBS(AddressOf gotAVCaptureDeviceWasConnectedNotification)
		  notificationCenter.addObserver deviceWasConnectedObserver, AVFoundationMBS.AVCaptureDeviceWasConnectedNotification
		  
		  dim deviceWasDisconnectedObserver as new MyNSNotificationObserverMBS(AddressOf gotAVCaptureDeviceWasDisconnectedNotification)
		  notificationCenter.addObserver deviceWasDisconnectedObserver, AVFoundationMBS.AVCaptureDeviceWasDisconnectedNotification
		  
		  observers.Append runtimeErrorObserver
		  observers.Append didStartRunningObserver
		  observers.Append didStopRunningObserver
		  observers.Append deviceWasConnectedObserver
		  observers.Append deviceWasDisconnectedObserver
		  
		  // Attach outputs to session
		  movieFileOutput = new AVCaptureMovieFileOutputMBS
		  
		  session.addOutput movieFileOutput
		  
		  audioPreviewOutput = new AVCaptureAudioPreviewOutputMBS
		  audioPreviewOutput.volume = 0
		  session.addOutput audioPreviewOutput
		  
		  // Initial refresh of device list
		  self.refreshDevices
		  
		  
		  UpdatePopupPresets
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isFastForwarding() As Boolean
		  dim device as AVCaptureDeviceMBS = self.selectedVideoDevice
		  
		  return device.transportControlsSupported and device.transportControlsSpeed>1
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isPlaying() As Boolean
		  dim device as AVCaptureDeviceMBS = self.selectedVideoDevice
		  
		  return device.transportControlsSupported and device.transportControlsPlaybackMode = AVCaptureDeviceMBS.AVCaptureDeviceTransportControlsPlayingMode and device.transportControlsSpeed = 1.0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isRecording() As Boolean
		  Return movieFileOutput.isRecording
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isRewinding() As Boolean
		  dim device as AVCaptureDeviceMBS = self.selectedVideoDevice
		  
		  return device.transportControlsSupported and device.transportControlsSpeed < -1.0
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub lockVideoDeviceForConfiguration(lock as Boolean)
		  if lock then
		    dim e as NSErrorMBS
		    call self.selectedVideoDevice.lockForConfiguration e
		  else
		    self.selectedVideoDevice.unlockForConfiguration
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function previewVolume() As Double
		  Return audioPreviewOutput.volume
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub refreshDevices()
		  
		  SetAudioDevices AVCaptureDeviceMBS.devicesWithMediaType(AVFoundationMBS.AVMediaTypeAudio)
		  
		  self.session.beginConfiguration
		  
		  if audioDevices.IndexOf(selectedAudioDevice) < 0 then
		    self.SelectedAudioDevice = nil
		  end if
		  
		  self.session.commitConfiguration
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function selectedAudioDevice() As AVCaptureDeviceMBS
		  dim d as AVCaptureDeviceInputMBS = audioDeviceInput
		  if d<>Nil then
		    Return d.device
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function selectedVideoDevice() As AVCaptureDeviceMBS
		  if videoDeviceInput <> nil then
		    Return self.videoDeviceInput.device
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function selectedVideoDeviceProvidesAudio() As Boolean
		  dim vd as AVCaptureDeviceMBS = self.selectedVideoDevice
		  
		  if vd <> nil then
		    Return vd.hasMediaType(AVFoundationMBS.AVMediaTypeMuxed) or vd.hasMediaType(AVFoundationMBS.AVMediaTypeAudio)
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setAudioDeviceFormat(deviceFormat as AVCaptureDeviceFormatMBS)
		  dim error as NSErrorMBS
		  
		  dim audioDevice as AVCaptureDeviceMBS = self.selectedAudioDevice
		  
		  if audioDevice <> nil then
		    if audioDevice.lockForConfiguration(error) then
		      audioDevice.activeFormat = deviceFormat
		      audioDevice.unlockForConfiguration
		    else
		      call win.presentError error
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setAudioDeviceInput(value as AVCaptureDeviceInputMBS)
		  audioDeviceInput = value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setAudioDevices(devices() as AVCaptureDeviceMBS)
		  audioDevices = devices
		  
		  UpdatePopupAudioDevices
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setFastForwarding(fastforward as Boolean)
		  dim device as AVCaptureDeviceMBS = self.selectedVideoDevice
		  
		  dim v as Double 
		  if fastforward then
		    v = 2.0
		  else
		    v = 0.0
		  end if
		  
		  self.setTransportMode device.transportControlsPlaybackMode, v, device
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setFrameRateRange(frameRateRange as AVFrameRateRangeMBS)
		  dim error as NSErrorMBS
		  
		  dim videoSupportedFrameRateRanges() as AVFrameRateRangeMBS = self.selectedVideoDevice.activeFormat.videoSupportedFrameRateRanges
		  if videoSupportedFrameRateRanges.IndexOf(frameRateRange) >= 0 then
		    
		    if self.selectedVideoDevice.lockForConfiguration(error) then
		      self.selectedVideoDevice.ActiveVideoMinFrameDuration = frameRateRange.minFrameDuration
		      self.selectedVideoDevice.unlockForConfiguration
		    else
		      call win.presentError error
		      
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setPlaying(play as Boolean)
		  dim device as AVCaptureDeviceMBS = self.selectedVideoDevice
		  
		  dim speed as Double = 0.0
		  if play then
		    speed = 1.0
		  end if
		  
		  self.setTransportMode(AVCaptureDeviceMBS.AVCaptureDeviceTransportControlsPlayingMode, speed, device)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setPreviewLayer(p as AVCaptureVideoPreviewLayerMBS)
		  previewLayer= p
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setPreviewVolume(newPreviewVolume as Double)
		  self.audioPreviewOutput.volume = newPreviewVolume
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setRecording(record as Boolean)
		  if record then
		    
		    // Record to a temporary file, which the user will relocate when recording is finished
		    dim f as FolderItem = SpecialFolder.Desktop.Child("Recording.mov")
		    movieFileOutput.startRecordingToOutputFile(f)
		    
		    StopButton.Enabled = true
		    StartButton.Enabled = false
		    
		  else
		    movieFileOutput.stopRecording
		    
		    StopButton.Enabled = false
		    StartButton.Enabled = true
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setSelectedAudioDevice(selectedAudioDevice as AVCaptureDeviceMBS)
		  self.session.beginConfiguration
		  
		  if self.audioDeviceInput <> nil then
		    // Remove the old device input from the session
		    session.removeInput self.audioDeviceInput
		    self.setAudioDeviceInput nil
		  end if
		  
		  
		  if selectedAudioDevice<>nil and not self.selectedVideoDeviceProvidesAudio then
		    dim error as NSErrorMBS
		    
		    // Create a device input for the device and add it to the session
		    dim newAudioDeviceInput as AVCaptureDeviceInputMBS = AVCaptureDeviceInputMBS.deviceInputWithDevice(selectedAudioDevice, error)
		    if newAudioDeviceInput = nil then
		      call win.presentError error
		      
		    else 
		      if not selectedAudioDevice.supportsAVCaptureSessionPreset(session.sessionPreset) then
		        self.session.sessionPreset = AVFoundationMBS.AVCaptureSessionPresetHigh
		      end if
		      self.session.addInput newAudioDeviceInput
		      self.setAudioDeviceInput newAudioDeviceInput
		    end if
		  end if
		  
		  self.session.commitConfiguration
		  
		  NoEvents = true
		  PopupAudioDevices.SetByTag selectedAudioDevice
		  
		  Finally
		    NoEvents = False
		    
		    
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setSessionPreset(s as string)
		  session.sessionPreset = s
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setTransportMode(playbackMode as integer, speed as Double, device as AVCaptureDeviceMBS)
		  dim error as NSErrorMBS
		  
		  
		  if device.transportControlsSupported then
		    if device.lockForConfiguration(error) then
		      device.setTransportControlsPlaybackMode playbackMode, speed
		      device.unlockForConfiguration
		    else
		      call win.presentError error
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setVideoDeviceFormat(deviceFormat as AVCaptureDeviceFormatMBS)
		  dim error as NSErrorMBS
		  
		  dim videoDevice as AVCaptureDeviceMBS = self.selectedVideoDevice
		  
		  if videoDevice.lockForConfiguration(error) then
		    videoDevice.activeFormat = deviceFormat
		    videoDevice.unlockForConfiguration
		  else
		    call win.presentError error
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setVideoDeviceInput(Input as AVCaptureDeviceInputMBS)
		  videoDeviceInput = input
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start()
		  // Attach preview to session
		  previewViewLayer = output.CALayerMBS
		  previewViewLayer.BackgroundColor = CGColorMBS.Black
		  
		  
		  newPreviewLayer = new AVCaptureVideoPreviewLayerMBS(session)
		  newPreviewLayer.frame = previewViewLayer.bounds
		  newPreviewLayer.autoresizingMask = newPreviewLayer.kCALayerWidthSizable + newPreviewLayer.kCALayerHeightSizable
		  
		  previewViewLayer.addSublayer newPreviewLayer
		  self.setPreviewLayer newPreviewLayer
		  
		  
		  // Start the session
		  self.session.startRunning
		  
		  // Start updating the audio level meter
		  audioLevelTimer.Period = 100
		  audioLevelTimer.Mode = 2
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  self.setTransportMode AVCaptureDeviceMBS.AVCaptureDeviceTransportControlsNotPlayingMode, 0.0, self.selectedVideoDevice
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub updateAudioLevels()
		  dim channelCount as integer = 0
		  dim decibels as double = 0
		  
		  // Sum all of the average power levels and divide by the number of channels
		  
		  dim connections() as AVCaptureConnectionMBS = self.movieFileOutput.connections
		  
		  for each connection as AVCaptureConnectionMBS in connections
		    dim audioChannels() as AVCaptureAudioChannelMBS = connection.audioChannels
		    for each audioChannel as AVCaptureAudioChannelMBS in audioChannels
		      decibels = decibels + audioChannel.averagePowerLevel
		      channelCount = channelCount + 1
		    next
		  next
		  
		  dim Value as integer = 0
		  dim Enabled as Boolean = False
		  
		  if channelCount > 0 then
		    
		    decibels = decibels / channelCount
		    Enabled = true
		    Value = (pow(10., 0.05 * decibels) * 20.0)
		  end if
		  
		  // update only if value changed, so we don't cause too many redrawings
		  if value <> audioLevelMeter.Value then
		    audioLevelMeter.Value = value
		  end if
		  if enabled <> audioLevelMeter.Enabled then
		    audioLevelMeter.Enabled = Enabled
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdatePopupAudioDevices()
		  dim selected as Variant = PopupAudioDevices.SelectedTag
		  
		  PopupAudioDevices.DeleteAllRows
		  
		  for each d as AVCaptureDeviceMBS in audioDevices
		    PopupAudioDevices.add d.localizedName, d
		  next
		  
		  PopupAudioDevices.SetByTag selected
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub updatePopupAudioFormats()
		  dim selected as Variant = PopupAudioFormats.SelectedTag
		  
		  PopupAudioFormats.DeleteAllRows
		  
		  dim selectedAudioDevice as AVCaptureDeviceMBS = self.selectedAudioDevice
		  if selectedAudioDevice<>Nil then
		    
		    dim formats() as AVCaptureDeviceFormatMBS = selectedAudioDevice.formats
		    
		    for each d as AVCaptureDeviceFormatMBS in formats
		      PopupAudioFormats.add d.DisplayName, d
		    next
		    
		    PopupAudioFormats.SetByTag selected
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdatePopupPresets()
		  dim selected as Variant = PopupPresets.SelectedTag
		  
		  PopupPresets.DeleteAllRows
		  
		  dim presets() as string = availableSessionPresets
		  for each d as string in presets
		    PopupPresets.add d,d
		  next
		  
		  PopupPresets.SetByTag selected
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function videoDeviceFormat() As AVCaptureDeviceFormatMBS
		  return self.selectedVideoDevice.activeFormat
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		audioDeviceFormat As AVCaptureDeviceFormatMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		audioDeviceInput As AVCaptureDeviceInputMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		audioDevices() As AVCaptureDeviceMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		audioPreviewOutput As AVCaptureAudioPreviewOutputMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		frameRateRange As AVFrameRateRangeMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		movieFileOutput As AVCaptureMovieFileOutputMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		newPreviewLayer As AVCaptureVideoPreviewLayerMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		NoEvents As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		observers() As MyNSNotificationObserverMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		previewLayer As AVCaptureVideoPreviewLayerMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		previewViewLayer As CALayerMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		previewVolume As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		screenInput As AVCaptureScreenInputMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		selectedAudioDevice As AVCaptureDeviceMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		selectedVideoDevice As AVCaptureDeviceMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		session As AVCaptureSessionMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		videoDeviceFormat As AVCaptureDeviceFormatMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		videoDeviceInput As AVCaptureDeviceInputMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		win As NSWindowMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events audioLevelTimer
	#tag Event
		Sub Action()
		  updateAudioLevels
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupAudioDevices
	#tag Event
		Sub Change()
		  if selectedAudioDevice <> me.SelectedTag then
		    setSelectedAudioDevice me.SelectedTag
		  end if
		  
		  updatePopupAudioFormats
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupAudioFormats
	#tag Event
		Sub Change()
		  if audioDeviceFormat <> me.SelectedTag then
		    setAudioDeviceFormat me.SelectedTag
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupPresets
	#tag Event
		Sub Change()
		  if NoEvents = false then
		    setSessionPreset me.SelectedTag
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SliderVolume
	#tag Event
		Sub ValueChanged()
		  setPreviewVolume me.Value / 100.0
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StartButton
	#tag Event
		Sub Action()
		  setRecording true
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StopButton
	#tag Event
		Sub Action()
		  setRecording false
		  
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
		Name="previewVolume"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Double"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="NoEvents"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
