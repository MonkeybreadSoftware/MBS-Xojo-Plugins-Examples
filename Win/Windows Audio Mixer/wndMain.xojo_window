#tag Window
Begin Window wndMain
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   353
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1943768990
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "WindowsAudioMixerMBS"
   Visible         =   True
   Width           =   426
   Begin ListBox lstMain
      AllowAutoHideScrollbars=   True
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      ColumnCount     =   3
      ColumnsResizable=   True
      ColumnWidths    =   "200"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DisabledBalloonHelp=   ""
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      FontUnit        =   0
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasBorder       =   True
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   355
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Name	Value	LastError"
      Italic          =   False
      Left            =   -1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      ScrollBarHorizontal=   True
      ScrollBarVertical=   True
      ScrollPosition  =   "0"
      ScrollPositionX =   "0"
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      Top             =   -1
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   428
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Dim xAudio As New WindowsAudioMixerMBS
		  
		  lstMain.AddRow("DestinationDigitalMute")
		  lstMain.CellType(lstMain.LastIndex,1) = 2
		  lstMain.CellCheck(lstMain.LastIndex,1) = (xAudio.DestinationDigitalMute)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("DestinationDigitalVolume")
		  lstMain.CellType(lstMain.LastIndex,1) = 3
		  lstMain.Cell(lstMain.LastIndex,1) = Str(xAudio.DestinationDigitalVolume)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("DestinationHeadPhonesMute")
		  lstMain.CellType(lstMain.LastIndex,1) = 2
		  lstMain.CellCheck(lstMain.LastIndex,1) = (xAudio.DestinationHeadPhonesMute)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("DestinationHeadPhonesVolume")
		  lstMain.CellType(lstMain.LastIndex,1) = 3
		  lstMain.Cell(lstMain.LastIndex,1) = Str(xAudio.DestinationHeadPhonesVolume)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("DestinationLineMute")
		  lstMain.CellType(lstMain.LastIndex,1) = 2
		  lstMain.CellCheck(lstMain.LastIndex,1) = (xAudio.DestinationLineMute)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("DestinationLineVolume")
		  lstMain.CellType(lstMain.LastIndex,1) = 3
		  lstMain.Cell(lstMain.LastIndex,1) = Str(xAudio.DestinationLineVolume)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("DestinationMonitorMute")
		  lstMain.CellType(lstMain.LastIndex,1) = 2
		  lstMain.CellCheck(lstMain.LastIndex,1) = (xAudio.DestinationMonitorMute)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("DestinationMonitorVolume")
		  lstMain.CellType(lstMain.LastIndex,1) = 3
		  lstMain.Cell(lstMain.LastIndex,1) = Str(xAudio.DestinationMonitorVolume)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("DestinationSpeakersMute")
		  lstMain.CellType(lstMain.LastIndex,1) = 2
		  lstMain.CellCheck(lstMain.LastIndex,1) = (xAudio.DestinationSpeakersMute)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("DestinationSpeakersVolume")
		  lstMain.CellType(lstMain.LastIndex,1) = 3
		  lstMain.Cell(lstMain.LastIndex,1) = Str(xAudio.DestinationSpeakersVolume)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("DestinationTelephoneMute")
		  lstMain.CellType(lstMain.LastIndex,1) = 2
		  lstMain.CellCheck(lstMain.LastIndex,1) = (xAudio.DestinationTelephoneMute)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("DestinationTelephoneVolume")
		  lstMain.CellType(lstMain.LastIndex,1) = 3
		  lstMain.Cell(lstMain.LastIndex,1) = Str(xAudio.DestinationTelephoneVolume)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("DestinationVoiceInMute")
		  lstMain.CellType(lstMain.LastIndex,1) = 2
		  lstMain.CellCheck(lstMain.LastIndex,1) = (xAudio.DestinationVoiceInMute)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("DestinationVoiceInVolume")
		  lstMain.CellType(lstMain.LastIndex,1) = 3
		  lstMain.Cell(lstMain.LastIndex,1) = Str(xAudio.DestinationVoiceInVolume)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("DestinationWaveInMute")
		  lstMain.CellType(lstMain.LastIndex,1) = 2
		  lstMain.CellCheck(lstMain.LastIndex,1) = (xAudio.DestinationWaveInMute)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("DestinationWaveInVolume")
		  lstMain.CellType(lstMain.LastIndex,1) = 3
		  lstMain.Cell(lstMain.LastIndex,1) = Str(xAudio.DestinationWaveInVolume)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("SourceAnalogMute")
		  lstMain.CellType(lstMain.LastIndex,1) = 2
		  lstMain.CellCheck(lstMain.LastIndex,1) = (xAudio.SourceAnalogMute)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("SourceAnalogVolume")
		  lstMain.CellType(lstMain.LastIndex,1) = 3
		  lstMain.Cell(lstMain.LastIndex,1) = Str(xAudio.SourceAnalogVolume)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("SourceAuxiliaryMute")
		  lstMain.CellType(lstMain.LastIndex,1) = 2
		  lstMain.CellCheck(lstMain.LastIndex,1) = (xAudio.SourceAuxiliaryMute)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("SourceAuxiliaryVolume")
		  lstMain.CellType(lstMain.LastIndex,1) = 3
		  lstMain.Cell(lstMain.LastIndex,1) = Str(xAudio.SourceAuxiliaryVolume)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("SourceCompactDiscMute")
		  lstMain.CellType(lstMain.LastIndex,1) = 2
		  lstMain.CellCheck(lstMain.LastIndex,1) = (xAudio.SourceCompactDiscMute)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("SourceCompactDiscVolume")
		  lstMain.CellType(lstMain.LastIndex,1) = 3
		  lstMain.Cell(lstMain.LastIndex,1) = Str(xAudio.SourceCompactDiscVolume)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("SourceDigitalMute")
		  lstMain.CellType(lstMain.LastIndex,1) = 2
		  lstMain.CellCheck(lstMain.LastIndex,1) = (xAudio.SourceDigitalMute)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("SourceDigitalVolume")
		  lstMain.CellType(lstMain.LastIndex,1) = 3
		  lstMain.Cell(lstMain.LastIndex,1) = Str(xAudio.SourceDigitalVolume)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("SourceLineMute")
		  lstMain.CellType(lstMain.LastIndex,1) = 2
		  lstMain.CellCheck(lstMain.LastIndex,1) = (xAudio.SourceLineMute)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("SourceLineVolume")
		  lstMain.CellType(lstMain.LastIndex,1) = 3
		  lstMain.Cell(lstMain.LastIndex,1) = Str(xAudio.SourceLineVolume)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("SourceMicrophoneMute")
		  lstMain.CellType(lstMain.LastIndex,1) = 2
		  lstMain.CellCheck(lstMain.LastIndex,1) = (xAudio.SourceMicrophoneMute)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("SourceMicrophoneVolume")
		  lstMain.CellType(lstMain.LastIndex,1) = 3
		  lstMain.Cell(lstMain.LastIndex,1) = Str(xAudio.SourceMicrophoneVolume)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("SourcePCSpeakerMute")
		  lstMain.CellType(lstMain.LastIndex,1) = 2
		  lstMain.CellCheck(lstMain.LastIndex,1) = (xAudio.SourcePCSpeakerMute)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("SourcePCSpeakerVolume")
		  lstMain.CellType(lstMain.LastIndex,1) = 3
		  lstMain.Cell(lstMain.LastIndex,1) = Str(xAudio.SourcePCSpeakerVolume)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("SourceSynthesizerMute")
		  lstMain.CellType(lstMain.LastIndex,1) = 2
		  lstMain.CellCheck(lstMain.LastIndex,1) = (xAudio.SourceSynthesizerMute)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("SourceSynthesizerVolume")
		  lstMain.CellType(lstMain.LastIndex,1) = 3
		  lstMain.Cell(lstMain.LastIndex,1) = Str(xAudio.SourceSynthesizerVolume)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("SourceTelephoneMute")
		  lstMain.CellType(lstMain.LastIndex,1) = 2
		  lstMain.CellCheck(lstMain.LastIndex,1) = (xAudio.SourceTelephoneMute)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("SourceTelephoneVolume")
		  lstMain.CellType(lstMain.LastIndex,1) = 3
		  lstMain.Cell(lstMain.LastIndex,1) = Str(xAudio.SourceTelephoneVolume)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("SourceWaveOutMute")
		  lstMain.CellType(lstMain.LastIndex,1) = 2
		  lstMain.CellCheck(lstMain.LastIndex,1) = (xAudio.SourceWaveOutMute)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		  
		  lstMain.AddRow("SourceWaveOutVolume")
		  lstMain.CellType(lstMain.LastIndex,1) = 3
		  lstMain.Cell(lstMain.LastIndex,1) = Str(xAudio.SourceWaveOutVolume)
		  lstMain.Cell(lstMain.LastIndex,2) = Str(xAudio.LastError)
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events lstMain
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  Dim xAudio As New WindowsAudioMixerMBS
		  
		  Select Case me.Cell(row,0)
		  Case "DestinationDigitalMute"
		    xAudio.DestinationDigitalMute = lstMain.CellCheck(row,1)
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "DestinationDigitalVolume"
		    xAudio.DestinationDigitalVolume = Val(me.Cell(row,1))
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "DestinationHeadPhonesMute"
		    xAudio.DestinationHeadPhonesMute = lstMain.CellCheck(row,1)
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "DestinationHeadPhonesVolume"
		    xAudio.DestinationHeadPhonesVolume = Val(me.Cell(row,1))
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "DestinationLineMute"
		    xAudio.DestinationLineMute = lstMain.CellCheck(row,1)
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "DestinationLineVolume"
		    xAudio.DestinationLineVolume = Val(me.Cell(row,1))
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "DestinationMonitorMute"
		    xAudio.DestinationMonitorMute = lstMain.CellCheck(row,1)
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "DestinationMonitorVolume"
		    xAudio.DestinationMonitorVolume = Val(me.Cell(row,1))
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "DestinationSpeakersMute"
		    xAudio.DestinationSpeakersMute = lstMain.CellCheck(row,1)
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "DestinationSpeakersVolume"
		    xAudio.DestinationSpeakersVolume = Val(me.Cell(row,1))
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "DestinationTelephoneMute"
		    xAudio.DestinationTelephoneMute = lstMain.CellCheck(row,1)
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "DestinationTelephoneVolume"
		    xAudio.DestinationTelephoneVolume = Val(me.Cell(row,1))
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "DestinationVoiceInMute"
		    xAudio.DestinationVoiceInMute = lstMain.CellCheck(row,1)
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "DestinationVoiceInVolume"
		    xAudio.DestinationVoiceInVolume = Val(me.Cell(row,1))
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "DestinationWaveInMute"
		    xAudio.DestinationWaveInMute = lstMain.CellCheck(row,1)
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "DestinationWaveInVolume"
		    xAudio.DestinationWaveInVolume = Val(me.Cell(row,1))
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "SourceAnalogMute"
		    xAudio.SourceAnalogMute = lstMain.CellCheck(row,1)
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "SourceAnalogVolume"
		    xAudio.SourceAnalogVolume = Val(me.Cell(row,1))
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "SourceAuxiliaryMute"
		    xAudio.SourceAuxiliaryMute = lstMain.CellCheck(row,1)
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "SourceAuxiliaryVolume"
		    xAudio.SourceAuxiliaryVolume = Val(me.Cell(row,1))
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "SourceCompactDiscMute"
		    xAudio.SourceCompactDiscMute = lstMain.CellCheck(row,1)
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "SourceCompactDiscVolume"
		    xAudio.SourceCompactDiscVolume = Val(me.Cell(row,1))
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "SourceDigitalMute"
		    xAudio.SourceDigitalMute = lstMain.CellCheck(row,1)
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "SourceDigitalVolume"
		    xAudio.SourceDigitalVolume = Val(me.Cell(row,1))
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "SourceLineMute"
		    xAudio.SourceLineMute = lstMain.CellCheck(row,1)
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "SourceLineVolume"
		    xAudio.SourceLineVolume = Val(me.Cell(row,1))
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "SourceMicrophoneMute"
		    xAudio.SourceMicrophoneMute = lstMain.CellCheck(row,1)
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "SourceMicrophoneVolume"
		    xAudio.SourceMicrophoneVolume = Val(me.Cell(row,1))
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "SourcePCSpeakerMute"
		    xAudio.SourcePCSpeakerMute = lstMain.CellCheck(row,1)
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "SourcePCSpeakerVolume"
		    xAudio.SourcePCSpeakerVolume = Val(me.Cell(row,1))
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "SourceSynthesizerMute"
		    xAudio.SourceSynthesizerMute = lstMain.CellCheck(row,1)
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "SourceSynthesizerVolume"
		    xAudio.SourceSynthesizerVolume = Val(me.Cell(row,1))
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "SourceTelephoneMute"
		    xAudio.SourceTelephoneMute = lstMain.CellCheck(row,1)
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "SourceTelephoneVolume"
		    xAudio.SourceTelephoneVolume = Val(me.Cell(row,1))
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "SourceWaveOutMute"
		    xAudio.SourceWaveOutMute = lstMain.CellCheck(row,1)
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  Case "SourceWaveOutVolume"
		    xAudio.SourceWaveOutVolume = Val(me.Cell(row,1))
		    lstMain.Cell(row,2) = Str(xAudio.LastError)
		  End Select
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
