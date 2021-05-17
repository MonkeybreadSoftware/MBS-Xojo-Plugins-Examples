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
   MenuBar         =   1787652095
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "PortAudio Record and Play"
   Visible         =   True
   Width           =   600
   Begin Label InfoLabel
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
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   348
   End
   Begin PushButton RecordButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Record"
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
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton PlayButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Play"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   296
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton SaveButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Save"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   204
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Canvas Output
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   296
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   84
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
   End
   Begin PushButton StopButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Stop"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   112
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Timer RecorderTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   100
      Scope           =   0
      TabPanelIndex   =   "0"
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  po = New PortAudioMBS
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Play()
		  
		  If RecordedData = Nil Then Return // no data
		  
		  // get samples
		  Dim audioBuffer As MemoryBlock = RecordedData.CopyMemory
		  
		  
		  
		  Dim c As New PortAudioStreamBufferedMBS
		  
		  Dim e As Integer = c.OpenDefaultStream(1, SampleRate)
		  
		  System.DebugLog "OpenDefaultStream: "+Str(e)
		  
		  If e = 0 Then
		    
		  Else
		    MsgBox "Host Error: "+Str(c.HostError)
		    Return
		  End If
		  
		  
		  If Not c.AddFloatAudio(audioBuffer) Then
		    MsgBox "Failed to play audio!"
		    Return
		  Else
		    System.DebugLog "AddFloatAudio ok"
		    
		    e=c.Start
		    System.DebugLog "Start: "+Str(e)
		    
		    e=c.IsStreamActive
		    System.DebugLog "Active: "+Str(e)
		    
		    PlayStream = c
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessFrames(m as MemoryBlock, l as integer)
		  // show In canvas
		  
		  dim c as integer = l-1
		  
		  
		  // just find min and max and display it here
		  Dim b As Double = m.SingleValue(0)
		  Dim mi As Double = b
		  Dim ma As Double = b
		  
		  For i As Integer = 0 To c
		    b = m.SingleValue(4*i)
		    
		    If b > ma Then
		      ma = b
		    End If
		    
		    If b < mi Then
		      mi = b
		    End If
		  next
		  
		  // scale so we see more
		  'ma = ma * 2.0
		  'mi = mi * 2.0
		  
		  ma = abs(ma)
		  mi = abs(mi)
		  
		  
		  // draw to the screen directly
		  
		  Dim w As Integer = Output.width
		  Dim h As Integer = Output.Height
		  Dim h2 As Double = h/2
		  
		  
		  If out = Nil Or out.Width <> w Or out.Height <> h Then
		    out = New Picture(w, h, 32)
		  End If
		  
		  
		  Dim g As Graphics = out.Graphics
		  
		  
		  g.ForeColor=&cFFFFFF
		  g.DrawLine index, 0, index, h
		  
		  g.ForeColor=&cFF0000
		  g.DrawLine index, h2, index, h2 - ma * h2
		  
		  g.ForeColor=&c00FF00
		  g.DrawLine index, h2, index, h2 + mi * h2
		  
		  Output.Invalidate
		  
		  // move to the next line
		  index = index + 1
		  
		  If index = w Then
		    index = 0
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save()
		  // save as WAV
		  // for more options, please use SoundFileMBS class
		  
		  Dim size As Integer=0
		  
		  Dim f As FolderItem = GetSaveFolderItem(FileTypes1.AudioWav,"audio.wav")
		  If f <> Nil Then
		    Dim b As BinaryStream = f.CreateBinaryFile(FileTypes1.AudioWav)
		    
		    If b = Nil Then
		      
		      MsgBox "Failed to create file " + f.NativePath
		      
		    Else
		      
		      Dim buf As MemoryBlock = RecordedData.CopyMemory
		      Dim samples As Integer = buf.size \ 4
		      
		      // convert to 16-bit data
		      Dim x As New MemoryBlock(samples*2)
		      x.LittleEndian=True
		      
		      Dim p As Integer = 0
		      Dim q As Integer = 0
		      
		      Dim c As Integer = samples-1
		      For i As Integer = 0 To c
		        x.Short(q) = buf.SingleValue(p) * 32767.0
		        p = p + 4
		        q = q + 2
		      Next
		      
		      
		      
		      
		      size = size + x.size
		      
		      b.LittleEndian=True
		      
		      b.Write "RIFF"
		      b.WriteInt32 6+4+16+4+Size // size of file
		      b.Write "WAVE"
		      
		      b.Write "fmt "
		      b.WriteInt32 16 // size of following data
		      b.WriteInt16 1 // format, uncompressed
		      b.WriteInt16 1 // 1 Channel
		      b.WriteInt32 SampleRate // Samples per Second
		      b.WriteInt32 SampleRate * 2 // Bytes per Second
		      b.WriteInt16 2 // Block align, Size of Sample in Bytes
		      b.WriteInt16 16 // bits per sample
		      
		      b.Write "data"
		      b.WriteInt32 Size
		      
		      b.Write x
		      
		      b.Close
		      
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartRecording()
		  SampleRate = 48000 // Native Frequency of my Macbook
		  
		  Dim defaultInputDevice As Integer = po.DefaultInputDeviceID
		  Dim deviceInfo As PortAudioDeviceInfoMBS = po.DeviceInfo(defaultInputDevice)
		  
		  If deviceInfo <> Nil Then
		    
		    SampleRate = deviceInfo.DefaultSampleRate
		    
		    System.DebugLog "SampleRate: "+Str(SampleRate)
		    
		  End If
		  
		  
		  
		  
		  Recorder = New PortAudioStreamRecorderMBS(1024 * 1024)
		  
		  // read 1 second maximum per timer loop
		  temp = New MemoryBlock(4 * SampleRate) 
		  
		  RecordedData = New StringHandleMBS
		  
		  If Recorder.OpenDefaultStream(1, SampleRate) = 0 Then
		    If Recorder.Start = 0 Then
		      RecorderTimer.Mode = RecorderTimer.ModeMultiple
		      
		      PlayButton.Enabled = false
		      StopButton.Enabled = True
		      
		    Else
		      MsgBox "Failed to start recording."
		    End If
		  Else
		    MsgBox "Failed to initialize."
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopRecording()
		  
		  RecorderTimer.Mode = timer.ModeOff
		  
		  If Recorder <> Nil Then
		    Call Recorder.Close
		    Recorder = Nil
		  End If
		  
		  temp = Nil
		  
		  
		  StopButton.Enabled = False
		  RecordButton.Enabled = True
		  PlayButton.Enabled = True
		  SaveButton.Enabled = True
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		index As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		out As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		PlayStream As PortAudioStreamBufferedMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		po As PortAudioMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		RecordedData As StringHandleMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		Recorder As PortAudioStreamRecorderMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		SampleRate As Integer = 44100
	#tag EndProperty

	#tag Property, Flags = &h0
		temp As MemoryBlock
	#tag EndProperty


#tag EndWindowCode

#tag Events RecordButton
	#tag Event
		Sub Action()
		  StartRecording
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PlayButton
	#tag Event
		Sub Action()
		  Play
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SaveButton
	#tag Event
		Sub Action()
		  save
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Output
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma unused areas
		  
		  If out <> Nil Then
		    g.DrawPicture out, 0, 0, g.Width, g.Height, 0, 0, out.Width, out.Height
		  End If
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StopButton
	#tag Event
		Sub Action()
		  StopRecording
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RecorderTimer
	#tag Event
		Sub Action()
		  
		  // we ask for samples in the buffer
		  Dim l As Integer = Recorder.ReadFrames(temp, temp.Size) 
		  
		  If l > 0 Then
		    
		    RecordedData.Add temp, l*4 // 4 bytes per sample
		    
		    // process the l frames we got
		    ProcessFrames temp, l
		    
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
	#tag ViewProperty
		Name="out"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="index"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="SampleRate"
		Visible=false
		Group="Behavior"
		InitialValue="44100"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
