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
   Height          =   174
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Overlay video track with picture"
   Visible         =   True
   Width           =   600
   Begin PushButton SelectVideoFileButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Select video file"
      Default         =   False
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
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   129
   End
   Begin PushButton SelectPictureFileButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Select picture file"
      Default         =   False
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
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   129
   End
   Begin Label VideoFilePath
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
      Left            =   161
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   419
   End
   Begin Label PictureFilePath
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
      Left            =   161
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   419
   End
   Begin PushButton SaveMovieButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Save Movie"
      Default         =   True
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   451
      LockBottom      =   False
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
      Top             =   140
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   129
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
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Use PNG with transparency for image."
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   140
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   288
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  #if DebugBuild then
		    
		    dim f as FolderItem = SpecialFolder.Desktop.Child("test.jpg")
		    
		    if f<>Nil then
		      dim img as CGImageMBS = CGImageMBS.CreateImageWithFile(F)
		      
		      if img<>Nil then
		        
		        PictureFilePath.Text = f.DisplayName
		        InputImageFile = f
		        InputImage = img
		      end if
		    end if
		    
		    
		    f = SpecialFolder.Desktop.Child("test.m4v")
		    
		    if f<>Nil then
		      dim a as AVURLAssetMBS = AVURLAssetMBS.URLAssetWithFile(F)
		      
		      if a<>Nil then
		        VideoFilePath.Text = f.DisplayName
		        InputVideoFile = f
		        InputVideoAsset = a
		      end if
		    end if
		    
		    SaveMovieButton.Enabled = InputImage <> nil and InputVideoAsset <> nil
		    
		    
		  #endif
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub run()
		  const kCMPersistentTrackID_Invalid = 0
		  
		  // load video and find tracks
		  
		  dim videoAsset as AVAssetMBS = InputVideoAsset
		  dim mixComposition as AVMutableCompositionMBS = AVMutableCompositionMBS.composition
		  
		  dim type as string = AVFoundationMBS.AVMediaTypeVideo
		  dim compositionVideoTrack as AVMutableCompositionTrackMBS = mixComposition.addMutableTrackWithMediaType(type, kCMPersistentTrackID_Invalid)
		  dim clipVideoTracks() as AVAssetTrackMBS = videoAsset.tracksWithMediaType(type)
		  dim clipVideoTrack as AVAssetTrackMBS = clipVideoTracks(0)
		  
		  dim error as NSErrorMBS
		  dim timeRange as CMTimeRangeMBS = CMTimeRangeMBS.Make(CMTimeMBS.kCMTimeZero, videoAsset.duration)
		  if not compositionVideoTrack.insertTimeRange(timeRange, clipVideoTrack, CMTimeMBS.kCMTimeZero, error) then
		    Break
		  end if
		  
		  compositionVideoTrack.preferredTransform = clipVideoTrack.preferredTransform
		  
		  // build layer with image
		  
		  dim myImage as CGImageMBS = InputImage
		  dim layer as CALayerMBS = CALayerMBS.layer
		  dim videoSize as CGSizeMBS = videoAsset.naturalSize
		  layer.contents = myImage
		  
		  // center
		  dim x as Double = (videoSize.Width  - myImage.Width ) / 2
		  dim y as Double = (videoSize.Height - myImage.Height) / 2
		  
		  layer.frame = CGMakeRectMBS(x, y, myImage.Width, myImage.Height)
		  layer.opacity = 0.65
		  
		  dim parentLayer as CALayerMBS = CALayerMBS.layer
		  dim videoLayer as CALayerMBS = CALayerMBS.layer
		  
		  parentLayer.frame = CGMakeRectMBS(0, 0, videoSize.width, videoSize.height)
		  videoLayer.frame = CGMakeRectMBS(0, 0, videoSize.width, videoSize.height)
		  parentLayer.addSublayer videoLayer
		  parentLayer.addSublayer Layer
		  
		  // Now we are creating the composition and add the instructions to insert the layer:
		  
		  
		  dim videoComp as AVMutableVideoCompositionMBS = AVMutableVideoCompositionMBS.mutableVideoComposition
		  videoComp.renderSize = videoSize
		  videoComp.frameDuration = CMTimeMBS.Make(1, 30)
		  videoComp.animationTool = AVVideoCompositionCoreAnimationToolMBS.videoCompositionCoreAnimationToolWithPostProcessingAsVideoLayer(videoLayer, parentLayer)
		  
		  /// instruction
		  
		  dim instruction as AVMutableVideoCompositionInstructionMBS = AVMutableVideoCompositionInstructionMBS.videoCompositionInstruction
		  
		  instruction.timeRange = CMTimeRangeMBS.Make(CMTimeMBS.kCMTimeZero, mixComposition.duration)
		  dim videoTracks() as AVAssetTrackMBS = mixComposition.tracksWithMediaType(type)
		  dim videoTrack as AVAssetTrackMBS = videoTracks(0)
		  dim layerInstruction as AVMutableVideoCompositionLayerInstructionMBS = AVMutableVideoCompositionLayerInstructionMBS.videoCompositionLayerInstructionWithAssetTrack(videoTrack)
		  
		  instruction.setLayerInstructions array(layerInstruction)
		  videoComp.setInstructions array(instruction)
		  
		  // add audio back
		  
		  dim clipAudioTracks() as AVAssetTrackMBS = videoAsset.tracksWithMediaType(AVFoundationMBS.AVMediaTypeAudio)
		  dim clipAudioTrack as AVAssetTrackMBS = clipAudioTracks(0)
		  dim compositionAudioTrack as AVMutableCompositionTrackMBS = mixComposition.addMutableTrackWithMediaType(AVFoundationMBS.AVMediaTypeAudio, kCMPersistentTrackID_Invalid)
		  if not compositionAudioTrack.insertTimeRange(timeRange, clipAudioTrack, CMTimeMBS.kCMTimeZero, error) then
		    Break
		  end if
		  
		  
		  // export
		  
		  dim pw as new ProgressWindow
		  
		  pw.info.Text = "Writing "+OutputVideoFile.name
		  
		  assetExport = new AVAssetExportSessionMBS(mixComposition, AVAssetExportSessionMBS.AVAssetExportPresetAppleM4VWiFi)
		  assetExport.videoComposition = videoComp
		  
		  if InputVideoFile.Exists then
		    InputVideoFile.Delete
		  end if
		  
		  assetExport.outputFileType = AVFoundationMBS.AVFileTypeAppleM4V
		  assetExport.outputFile = OutputVideoFile
		  assetExport.shouldOptimizeForNetworkUse = true
		  
		  pw.assetExport = assetExport
		  pw.show
		  assetExport.exportAsynchronously pw
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		assetExport As AVAssetExportSessionMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		InputImage As CGImageMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		InputImageFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		InputVideoAsset As AVURLAssetMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		InputVideoFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		OutputVideoFile As FolderItem
	#tag EndProperty


#tag EndWindowCode

#tag Events SelectVideoFileButton
	#tag Event
		Sub Action()
		  dim f as FolderItem = GetOpenFolderItem(MovieFileTypes.All)
		  
		  if f<>Nil then
		    dim a as AVURLAssetMBS = AVURLAssetMBS.URLAssetWithFile(F)
		    
		    if a<>Nil then
		      VideoFilePath.Text = f.DisplayName
		      InputVideoFile = f
		      InputVideoAsset = a
		    end if
		  end if
		  
		  SaveMovieButton.Enabled = InputImage <> nil and InputVideoAsset <> nil
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SelectPictureFileButton
	#tag Event
		Sub Action()
		  dim f as FolderItem = GetOpenFolderItem(ImageFileTypes.All)
		  
		  if f<>Nil then
		    dim img as CGImageMBS = CGImageMBS.CreateImageWithFile(F)
		    
		    if img<>Nil then
		      
		      PictureFilePath.Text = f.DisplayName
		      InputImageFile = f
		      InputImage = img
		    end if
		  end if
		  
		  
		  SaveMovieButton.Enabled = InputImage <> nil and InputVideoAsset <> nil
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SaveMovieButton
	#tag Event
		Sub Action()
		  dim n as string = InputVideoFile.NameWithoutExtensionMBS
		  n = n + " copy"
		  
		  dim f as FolderItem = GetSaveFolderItem(MovieFileTypes.VideoXM4v, n)
		  
		  if f<>Nil then
		    OutputVideoFile = f
		    run
		  end if
		  
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
