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
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1031150881
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Convert"
   Visible         =   True
   Width           =   600
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
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
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   366
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
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
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  'Run 1, ".m4a", AVFoundationMBS.AVFileTypeMPEG4, false
		  'Run 2, ".m4a", AVFoundationMBS.AVFileTypeMPEG4, false
		  
		  'Run 1, ".wav", AVFoundationMBS.AVFileTypeWAVE, true
		  Run 2, ".wav", AVFoundationMBS.AVFileTypeWAVE, true
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Cleanup()
		  list.AddRow "Cleanup"
		  
		  
		  
		  if assetWriter<>nil then
		    call assetWriter.finishWriting
		  end if
		  
		  if assetReader<>nil then
		    assetReader.cancelReading
		  end if
		  
		  MsgBox "Done. File size is "+str(exportFile.Length)+" bytes."
		  
		  
		  // release a lot of stuff
		  assetReader = nil
		  assetReaderOutput = nil
		  assetWriter = nil
		  assetWriterInput = nil
		  songAsset = nil
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Run(channels as integer, extension as string, OutputFileType as string, uncompressed as Boolean)
		  AVFoundation = new MyAVFoundation
		  
		  
		  dim file as FolderItem = FindFile("test.mov")
		  
		  songAsset = AVURLAssetMBS.URLAssetWithFile(file)
		  list.AddRow "Loaded file: "+songAsset.URL
		  
		  dim assetError as NSErrorMBS
		  
		  assetReader = AVAssetReaderMBS.assetReaderWithAsset(songAsset, assetError)
		  if assetError<>nil then
		    dim e as string = assetError.localizedDescription
		    list.AddRow "Error: "+e
		    
		    break
		    MsgBox e
		    Return
		  end if
		  
		  dim audioSettings as Dictionary = nil // no settings
		  dim tracks() as AVAssetTrackMBS = songAsset.tracks
		  assetReaderOutput = AVAssetReaderAudioMixOutputMBS.assetReaderAudioMixOutputWithAudioTracks(tracks, audioSettings)
		  
		  if not assetReader.canAddOutput(assetReaderOutput) then
		    break
		    MsgBox "can't add reader output... die!"
		    return
		  end if
		  
		  assetReader.addOutput(assetReaderOutput)
		  
		  exportFile = SpecialFolder.Desktop.Child("test"+str(channels)+extension)
		  
		  assetWriter = AVAssetWriterMBS.assetWriterWithFile(exportFile, outputFileType, assetError)
		  if assetError<>nil then
		    dim e as string = assetError.localizedDescription
		    list.AddRow "Error: "+e
		    break
		    MsgBox e
		    Return
		  end if
		  
		  
		  dim channelLayout as new QTAudioChannelLayoutMBS
		  if channels = 1 then
		    channelLayout.ChannelLayoutTag = QTAudioChannelLayoutMBS.kAudioChannelLayoutTag_Mono
		  elseif channels = 2 then
		    channelLayout.ChannelLayoutTag = QTAudioChannelLayoutMBS.kAudioChannelLayoutTag_Stereo
		  else
		    break
		  end if
		  
		  dim outputSettings as new Dictionary
		  
		  if uncompressed then
		    outputSettings.Value(AVFoundationMBS.AVFormatIDKey) = OSTypeFromStringMBS("lpcm") 'kAudioFormatLinearPCM
		    outputSettings.Value(AVFoundationMBS.AVLinearPCMBitDepthKey) = 16
		    outputSettings.Value(AVFoundationMBS.AVLinearPCMIsNonInterleaved) = false
		    outputSettings.Value(AVFoundationMBS.AVLinearPCMIsFloatKey) = false
		    outputSettings.Value(AVFoundationMBS.AVLinearPCMIsBigEndianKey) = false
		  else
		    outputSettings.Value(AVFoundationMBS.AVFormatIDKey) = OSTypeFromStringMBS("aac ") 'kAudioFormatMPEG4AAC
		  end if
		  
		  outputSettings.Value(AVFoundationMBS.AVSampleRateKey) = 44100.0
		  outputSettings.Value(AVFoundationMBS.AVNumberOfChannelsKey) = channels
		  outputSettings.Value(AVFoundationMBS.AVChannelLayoutKey) = channelLayout.Memory
		  
		  assetWriterInput = AVAssetWriterInputMBS.assetWriterInputWithMediaType(AVFoundationMBS.AVMediaTypeAudio, outputSettings)
		  
		  if assetWriter.canAddInput(assetWriterInput) then
		    assetWriter.addInput(assetWriterInput)
		  else
		    break
		    MsgBox "can't add asset writer input... die!"
		    return
		  end if
		  
		  assetWriterInput.expectsMediaDataInRealTime = false
		  
		  call assetWriter.startWriting
		  assetReader.startReading
		  
		  dim soundTrack as AVAssetTrackMBS = tracks(0)
		  dim startTime as CMTimeMBS = CMTimeMBS.Make(0, soundTrack.naturalTimeScale)
		  assetWriter.startSessionAtSourceTime(startTime)
		  
		  
		  list.AddRow "Starting conversion..."
		  assetWriterInput.requestMediaDataWhenReadyOnQueue(assetWriterInput, AssetReaderOutput)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		assetReader As AVAssetReaderMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		assetReaderOutput As AVAssetReaderOutputMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		assetWriter As AVAssetWriterMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		assetWriterInput As AVAssetWriterInputMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		AVFoundation As MyAVFoundation
	#tag EndProperty

	#tag Property, Flags = &h0
		exportFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		songAsset As AVURLAssetMBS
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
