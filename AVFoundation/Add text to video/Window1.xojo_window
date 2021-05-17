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
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1532391423
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Untitled"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  AVFoundation = new MyAVFoundation
		  
		  dim VideoFile as FolderItem = SpecialFolder.Desktop.Child("test.mp4")
		  dim OutputFile as FolderItem = SpecialFolder.Desktop.Child("output.mp4")
		  
		  
		  // 1. mergeComposition adds all the AVAssets
		  
		  mergeComposition = new AVMutableCompositionMBS
		  dim trackVideo as AVMutableCompositionTrackMBS = mergeComposition.addMutableTrackWithMediaType(AVFoundation.AVMediaTypeVideo, 0)
		  
		  // 2. Add a bank for theme insertion later
		  
		  //trackVideo.insertTimeRange(range, ofTrack: VideoHelper.Static.blankTrack, atTime: kCMTimeZero, error: nil)
		  
		  // 3. Source tracks
		  
		  dim sourceAsset as AVURLAssetMBS = AVURLAssetMBS.URLAssetWithFile(VideoFile)
		  
		  // wait for duration to become available
		  dim e as NSErrorMBS
		  while sourceAsset.statusOfValueForKey("duration", e) = sourceAsset.AVKeyValueStatusLoading 
		    // wait
		    app.YieldToNextThread
		  wend
		  
		  if e <> nil then
		    MsgBox e.LocalizedDescription
		  end if
		  
		  dim sourceDuration as CMTimeRangeMBS = new CMTimeRangeMBS(CMTimeMBS.kCMTimeZero, sourceAsset.duration)
		  
		  dim videoTracks() as AVAssetTrackMBS = sourceAsset.tracksWithMediaType(AVFoundation.AVMediaTypeVideo)
		  dim audioTracks() as AVAssetTrackMBS = sourceAsset.tracksWithMediaType(AVFoundation.AVMediaTypeAudio)
		  
		  dim vtrack as AVAssetTrackMBS = videoTracks(0)
		  dim atrack as AVAssetTrackMBS = audioTracks(0)
		  
		  if (vtrack = nil) then
		    break
		    return
		  end if
		  
		  
		  dim renderWidth as integer = vtrack.naturalSize.width
		  dim renderHeight as integer = vtrack.naturalSize.height
		  dim insertTime as CMTimeMBS = CMTimeMBS.kCMTimeZero
		  dim endTime as CMTimeMBS = sourceAsset.duration
		  dim range as CMTimeRangeMBS = sourceDuration
		  
		  // append tracks
		  
		  call trackVideo.insertTimeRange(sourceDuration, vtrack, insertTime, e)
		  
		  if e <> nil then
		    MsgBox e.LocalizedDescription
		    return
		  end if
		  
		  // add video track
		  
		  dim trackAudio as AVMutableCompositionTrackMBS = mergeComposition.addMutableTrackWithMediaType(AVFoundation.AVMediaTypeAudio, 0)
		  call trackAudio.insertTimeRange(sourceDuration, atrack, insertTime, e)
		  
		  if e <> nil then
		    MsgBox e.LocalizedDescription
		    return
		  end if
		  
		  
		  // 4. Add subtitles (we call it theme)
		  
		  dim themeVideoComposition as AVMutableVideoCompositionMBS = AVMutableVideoCompositionMBS.mutableVideoCompositionWithPropertiesOfAsset(sourceAsset)
		  
		  // 4.1 - Create AVMutableVideoCompositionInstruction
		  
		  dim mainInstruction as new AVMutableVideoCompositionInstructionMBS
		  mainInstruction.timeRange = range
		  
		  // 4.2 - Create an AVMutableVideoCompositionLayerInstruction for the video track and fix the orientation.
		  dim videolayerInstruction as AVMutableVideoCompositionLayerInstructionMBS = AVMutableVideoCompositionLayerInstructionMBS.videoCompositionLayerInstructionWithAssetTrack(trackVideo)
		  videolayerInstruction.setTransform(trackVideo.preferredTransform, insertTime)
		  'videolayerInstruction.setOpacity(0.0, endTime)
		  videolayerInstruction.setOpacity(1.0, 1.0, range)
		  
		  // 4.3 - Add instructions
		  
		  mainInstruction.setLayerInstructions array(videolayerInstruction)
		  
		  'themeVideoComposition.renderScale = 1.0
		  themeVideoComposition.renderSize =  new CGSizeMBS(renderWidth, renderHeight)
		  themeVideoComposition.frameDuration = new CMTimeMBS(1, 30)
		  themeVideoComposition.setInstructions array(mainInstruction)
		  
		  // add the theme
		  
		  // setup variables
		  
		  // add text
		  
		  dim r as new CGRectMBS(0, 0, renderWidth, renderHeight)
		  
		  dim title as string = "Testing this subtitle"
		  
		  dim titleLayer as new CATextLayerMBS
		  titleLayer.string = title
		  titleLayer.frame  = r
		  dim fontName as String = "Helvetica-Bold"
		  dim fontSize as double = 36
		  titleLayer.fontSize = fontSize
		  titleLayer.font = NSFontMBS.fontWithName(fontName, fontSize)
		  titleLayer.alignmentMode = CATextLayerMBS.kCAAlignmentCenter
		  titleLayer.foregroundColor = CGColorMBS.White
		  
		  dim backgroundLayer as new CALayerMBS
		  backgroundLayer.frame = r
		  backgroundLayer.masksToBounds = true
		  
		  // 2. set parent layer and video layer
		  
		  dim parentLayer as new CALayerMBS
		  dim videoLayer as new CALayerMBS
		  parentLayer.frame = r
		  videoLayer.frame  = r
		  
		  videoLayer.Hidden = false
		  parentLayer.Hidden = false
		  
		  parentLayer.addSublayer(backgroundLayer)
		  parentLayer.addSublayer(videoLayer)
		  parentLayer.addSublayer(titleLayer)
		  
		  // 3. make animation
		  
		  dim tool as AVVideoCompositionCoreAnimationToolMBS = AVVideoCompositionCoreAnimationToolMBS.videoCompositionCoreAnimationToolWithPostProcessingAsVideoLayer(videoLayer, parentLayer)
		  themeVideoComposition.animationTool = tool
		  
		  // Remove the file if it already exists (merger does not overwrite)
		  
		  OutputFile.Delete
		  
		  // export to output url
		  
		  dim PresetName as string = AVAssetExportSessionMBS.AVAssetExportPresetAppleM4V1080pHD
		  
		  exporter = new AVAssetExportSessionMBS(mergeComposition, PresetName)
		  exporter.outputFile = OutputFile
		  exporter.videoComposition = themeVideoComposition
		  exporter.outputFileType = AVFoundation.AVFileTypeAppleM4V 'AVFileTypeQuickTimeMovie
		  exporter.shouldOptimizeForNetworkUse = true
		  exporter.exportAsynchronously
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		AVFoundation As MyAVFoundation
	#tag EndProperty

	#tag Property, Flags = &h0
		exporter As AVAssetExportSessionMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		mergeComposition As AVMutableCompositionMBS
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
