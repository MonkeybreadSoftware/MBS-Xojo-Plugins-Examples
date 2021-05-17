#tag Window
Begin Window MainWindow
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
   Title           =   "Main"
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
      Height          =   332
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
      Top             =   48
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin BevelButton BevelButton1
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "Add file"
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
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   "0"
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   83
   End
   Begin BevelButton BevelButton2
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "Add folder"
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
      Left            =   115
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   "0"
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   83
   End
   Begin BevelButton NextFileButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "Start"
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
      Left            =   497
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   "0"
      Scope           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   83
   End
   Begin Timer DoneTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   1
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  do
		    if obj.FolderItemAvailable then
		      dim f as FolderItem = obj.FolderItem
		      
		      if f.Directory then
		        Addfolder f
		      else
		        add f
		      end if
		    end if
		  loop until not obj.NextItem
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  AcceptFileDrop FileTypes1.AudioAac
		  AcceptFileDrop FileTypes1.AudioAiff
		  AcceptFileDrop FileTypes1.Mp3
		  AcceptFileDrop FileTypes1.Mpeg
		  AcceptFileDrop FileTypes1.Quicktime
		  AcceptFileDrop FileTypes1.SpecialFolder
		  AcceptFileDrop FileTypes1.AudioXM4a
		  AcceptFileDrop FileTypes1.AudioXM4b
		  AcceptFileDrop FileTypes1.AudioXM4p
		  
		  AVFoundation = new MyAVFoundation
		  
		  if DebugBuild then
		    // for debugging I have a folder on desktop with test files...
		    
		    dim testfolder as FolderItem = SpecialFolder.Desktop.Child("test")
		    if testfolder.Exists then Addfolder testfolder
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub add(f as FolderItem)
		  List.AddRow f.DisplayName
		  List.RowTag(List.LastIndex) = f
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Addfolder(f as FolderItem)
		  dim c as integer = f.Count
		  for i as integer = 1 to c
		    dim file as FolderItem = f.TrueItem(i)
		    
		    if file<>Nil and file.Visible then
		      
		      if file.Directory then
		        Addfolder file
		      else
		        add file
		      end if
		    end if
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Cleanup()
		  list.RemoveRow 0
		  
		  // plugin called markAsFinished already!
		  
		  if assetWriter<>nil then
		    call assetWriter.finishWriting
		  end if
		  
		  if assetReader<>nil then
		    assetReader.cancelReading
		  end if
		  
		  
		  // release a lot of stuff
		  assetReader = nil
		  assetReaderOutput = nil
		  assetWriter = nil
		  assetWriterInput = nil
		  songAsset = nil
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MoveFileToTrash(f as FolderItem)
		  f.Delete
		  
		  dim r as FolderItem
		  'call MacFileOperationMBS.MoveObjectToTrashSync(f, r, MacFileOperationMBS.kFSFileOperationDefaultOptions)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NextFile()
		  if List.ListCount = 0 then Return
		  
		  dim file as FolderItem = List.RowTag(0)
		  
		  List.CellBold(0,0) = true
		  
		  songAsset = AVURLAssetMBS.URLAssetWithFile(file)
		  dim assetError as NSErrorMBS
		  
		  assetReader = AVAssetReaderMBS.assetReaderWithAsset(songAsset, assetError)
		  if assetError<>nil then
		    dim e as string = assetError.localizedDescription
		    MsgBox "Error: "+e
		    
		    break
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
		  
		  exportFile = SpecialFolder.Desktop.Child(file.name+".wav")
		  
		  if exportFile<>Nil then
		    MoveFileToTrash exportFile
		    
		    exportFile = SpecialFolder.Desktop.Child(file.name+".wav")
		  end if
		  
		  assetWriter = AVAssetWriterMBS.assetWriterWithFile(exportFile, AVFoundationMBS.AVFileTypeWAVE, assetError)
		  if assetError<>nil then
		    dim e as string = assetError.localizedDescription
		    MsgBox "Error: "+e
		    break
		    Return
		  end if
		  
		  
		  // Mono layout
		  dim channelLayout as new QTAudioChannelLayoutMBS
		  channelLayout.ChannelLayoutTag = QTAudioChannelLayoutMBS.kAudioChannelLayoutTag_Mono
		  
		  // settings
		  dim outputSettings as new Dictionary
		  
		  outputSettings.Value(AVFoundationMBS.AVLinearPCMBitDepthKey) = 16
		  outputSettings.Value(AVFoundationMBS.AVLinearPCMIsNonInterleaved) = false
		  outputSettings.Value(AVFoundationMBS.AVLinearPCMIsFloatKey) = false
		  outputSettings.Value(AVFoundationMBS.AVLinearPCMIsBigEndianKey) = false
		  outputSettings.Value(AVFoundationMBS.AVFormatIDKey) = OSTypeFromStringMBS(AVFoundationMBS.kAudioFormatLinearPCM)
		  outputSettings.Value(AVFoundationMBS.AVSampleRateKey) = 44100.0
		  outputSettings.Value(AVFoundationMBS.AVNumberOfChannelsKey) = 1
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
		  
		  'assetWriterInput.check
		  
		  // here we pass ID for job so we can later find it back
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

#tag Events BevelButton1
	#tag Event
		Sub Action()
		  dim f as FolderItem = GetOpenFolderItem("")
		  
		  if f<>Nil then
		    add f
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BevelButton2
	#tag Event
		Sub Action()
		  dim f as FolderItem = SelectFolder
		  
		  if f<>Nil then
		    Addfolder f
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NextFileButton
	#tag Event
		Sub Action()
		  me.Enabled = False
		  
		  NextFile
		  
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
