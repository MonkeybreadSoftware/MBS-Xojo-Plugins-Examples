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
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   48961535
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "LTC Test"
   Visible         =   True
   Width           =   600
   Begin Listbox LogList
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
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   350
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   -1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   -1
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   602
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton PlayButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Play"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   281
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   361
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PopupMenu PopupDevice
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
      Left            =   20
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   360
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   249
   End
   Begin PushButton StopButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Stop"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   373
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   361
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Timer SendTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   1000
      Scope           =   0
      TabPanelIndex   =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  po = New PortAudioMBS
		  
		  'For i As Integer = 1 To 100
		  TestLTCEncoder
		  TestLTCDecoder
		  'Next
		  
		  
		  FillDeviceList
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub FillDeviceList()
		  
		  Dim DefaultOutputDeviceID As Integer = po.DefaultOutputDeviceID
		  
		  Dim PopupDeviceIndex As Integer
		  
		  Dim HostApiCount As Integer = po.HostApiCount-1
		  For HostApiIndex As Integer = 0 To HostApiCount
		    Dim host As PortAudioHostApiInfoMBS = po.HostApiInfo(HostApiIndex)
		    If host<>Nil Then
		      Dim HostDeviceCount As Integer = host.deviceCount-1
		      For HostDeviceIndex As Integer = 0 To HostDeviceCount
		        
		        Dim DeviceIndex As Integer = po.HostApiDeviceIndexToDeviceIndex(host.Index, HostDeviceIndex)
		        Dim deviceInfo As PortAudioDeviceInfoMBS = po.DeviceInfo(DeviceIndex)
		        
		        If deviceInfo.maxOutputChannels > 0 Then
		          PopupDevice.AddRow host.Name+": "+deviceInfo.Name
		          PopupDevice.RowTag(PopupDeviceIndex) = deviceInfo
		          
		          If DeviceIndex = DefaultOutputDeviceID Then
		            PopupDevice.ListIndex = PopupDeviceIndex
		          End If
		          
		          PopupDeviceIndex = PopupDeviceIndex + 1
		        End If
		      Next
		      
		    End If
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub log(s as string)
		  System.DebugLog s
		  LogList.AddRow s
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendTimecode()
		  // send a second of timecode
		  
		  Dim vframe_cnt As Integer = 0
		  Dim vframe_last As Integer = 25 // 25 fps
		  Dim Total As Integer
		  
		  While (vframe_cnt < vframe_last) 
		    
		    encoder.EncodeFrame
		    
		    // we use string to avoid conversion from MemoryBlock to string
		    Dim m As MemoryBlock = encoder.CopyBuffer
		    
		    Call ps.AddAudio(m, 0, m.size, 8, False)
		    
		    Call encoder.IncrementTimecode
		    
		    vframe_cnt = vframe_cnt + 1
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestLTCDecoder()
		  Dim f As FolderItem = SpecialFolder.Desktop.Child("ltctest")
		  Dim b As BinaryStream = BinaryStream.open(f)
		  
		  
		  
		  Dim apv As Integer = 1920 // = 48000 / 25
		  Dim total As UInt64
		  
		  total = 0
		  
		  Dim decoder As New LTCDecoderMBS(apv, 32)
		  Dim frame As New LTCFrameExtMBS
		  Dim stime As New LTCSMPTETimecodeMBS
		  
		  While Not b.EOF
		    Dim sound As String = b.Read(10000)
		    Dim n As Integer = LenB(sound)
		    decoder.WriteUInt8(sound, total)
		    
		    While decoder.read(frame)
		      
		      LTCMBS.FrameToTime(stime, frame, LTCMBS.LTC_USE_DATE)
		      
		      dim d as date = stime.Date
		      
		      Dim l1 As String = d.SQLDateTime
		      
		      Dim year As Integer = If((stime.years < 67), 2000+stime.years, 1900+stime.years)
		      
		      Dim l2 As String = Str(year, "0000")+"-"+_
		      Str(stime.months, "00")+"-"+_
		      Str(stime.days, "00")+" "+_
		      stime.TimeZone
		      
		      Dim l3 As String = Str(stime.Hours, "00")+":"+_
		      Str(stime.mins, "00")+":"+_
		      Str(stime.secs, "00")+_
		      If (frame.dfbit = 1, ".", ":")+_
		      Str(stime.frame, "00")+" | "+_
		      Str(frame.offStart, "00000000")+" "+_
		      Str(frame.offEnd, "00000000")+" "+_
		      If (frame.reverse = 1, " R", "")
		      
		      Log l1+" "+l2+" "+l3
		    Wend
		    total = total + n
		  Wend
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestLTCEncoder()
		  
		  Dim length     As Double = 2 // in seconds
		  Dim fps        As Double = 25
		  Dim sampleRate As Double = 48000
		  
		  
		  Dim st As New LTCSMPTETimecodeMBS
		  st.timezone = "+0100"
		  st.years =  8
		  st.months = 12
		  st.days =   31
		  st.hours = 23
		  st.mins = 59
		  st.secs = 59
		  st.frame = 0
		  
		  Dim f As FolderItem = SpecialFolder.Desktop.Child("ltctest")
		  Dim b As BinaryStream = BinaryStream.Create(f, True)
		   
		  
		  //* prepare encoder */
		  
		  Dim TVStandard As Integer = If (fps = 25, LTCMBS.LTC_TV_625_50, LTCMBS.LTC_TV_525_60)
		  
		  Dim encoder As New LTCEncoderMBS(sampleRate, fps, TVStandard, LTCMBS.LTC_USE_DATE)
		  encoder.TimeCode = st
		  
		  
		  //* ready To go, Print some info first */
		  Log "sample rate: " + Str(sampleRate)
		  Log "frames/sec: " + Str(fps)
		  Log "secs to write: " + Str(length)
		  Log "sample format: 8bit unsigned mono"
		  
		  Dim vframe_cnt As Integer = 0
		  Dim vframe_last As Integer = length * fps
		  Dim Total As Integer
		  
		  While (vframe_cnt < vframe_last) 
		    
		    encoder.EncodeFrame
		    
		    // we use string to avoid conversion from MemoryBlock to string
		    Dim m As String = encoder.CopyBufferString
		    
		    b.Write m
		    total = total + m.LenB
		    
		    'Dim m As MemoryBlock = encoder.CopyBuffer
		    '
		    'If m.size > 0 then
		    'b.Write m
		    'total = total + m.size
		    'End If
		    
		    Call encoder.IncrementTimecode
		    
		    vframe_cnt = vframe_cnt + 1
		  Wend
		  
		  b.Close
		  encoder = Nil
		  
		  Log "Done: wrote "+Str(Total) +" samples to file."
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		encoder As LTCEncoderMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		po As PortAudioMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		ps As PortAudioStreamBufferedMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events PlayButton
	#tag Event
		Sub Action()
		  If ps <> Nil Then
		    Call ps.stop
		    ps = Nil
		  End If
		  
		  
		  
		  Const fps        = 25
		  Const sampleRate = 48000
		  
		  
		  Dim deviceInfo As PortAudioDeviceInfoMBS = PopupDevice.RowTag(PopupDevice.ListIndex)
		  
		  Dim pasp As New PortAudioStreamParametersMBS
		  pasp.ChannelCount = 1
		  pasp.Device = deviceInfo.Index
		  pasp.SampleFormat = pasp.paFloat32 ' PortAudioStreamBufferedMBS needs float pasp.paUInt8
		  pasp.SuggestedLatency = 0.2
		  
		  ps = New PortAudioStreamBufferedMBS
		  
		  Dim e As Integer = ps.OpenStream(pasp, sampleRate, 0, 0)
		  
		  
		  Log "OpenDefaultStream: "+Str(e)
		  
		  if e <> 0 then return
		  
		  
		  
		  Dim st As New LTCSMPTETimecodeMBS
		  st.timezone = "+0100"
		  st.date = New date // now
		  st.Frame = 0
		  
		  
		  //* prepare encoder */
		  
		  Dim TVStandard As Integer = If (fps = 25, LTCMBS.LTC_TV_625_50, LTCMBS.LTC_TV_525_60)
		  
		  encoder = New LTCEncoderMBS(sampleRate, fps, TVStandard, LTCMBS.LTC_USE_DATE)
		  encoder.TimeCode = st
		  
		  
		  //* ready To go, Print some info first */
		  Log "sample rate: " + Str(sampleRate)
		  Log "frames/sec: " + Str(fps)
		  Log "sample format: 8bit unsigned mono"
		  
		  
		  SendTimecode
		  SendTimecode
		  SendTimecode
		  
		  SendTimer.mode = timer.ModeMultiple
		  
		  
		  e = ps.Start
		  Log "Start: "+Str(e)
		  
		  StopButton.Enabled = True
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupDevice
	#tag Event
		Sub Change()
		  If Me.ListIndex >= 0 Then
		    PlayButton.Enabled = True
		  End If
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StopButton
	#tag Event
		Sub Action()
		  If ps <> Nil Then
		    Call ps.Stop
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SendTimer
	#tag Event
		Sub Action()
		  SendTimecode
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
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
