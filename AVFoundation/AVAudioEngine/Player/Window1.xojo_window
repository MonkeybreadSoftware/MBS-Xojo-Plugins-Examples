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
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1659584511
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Player"
   Visible         =   True
   Width           =   600
   Begin PushButton LoadButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Select file"
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   105
   End
   Begin Label FileInfo
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
      Left            =   137
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   443
   End
   Begin PushButton PlayButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Play / Pause"
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   105
   End
   Begin Label PlayStatus
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
      Left            =   137
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
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
      Width           =   259
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   2
      Period          =   1000
      Scope           =   0
      TabPanelIndex   =   "0"
   End
   Begin Slider VolumeSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   132
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   150
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   87
      Transparent     =   True
      Value           =   100
      Visible         =   True
      Width           =   100
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
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Volume:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   87
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Slider VolumePan
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   132
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   100
      Minimum         =   -100
      PageStep        =   20
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   119
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   100
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
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Pan:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   119
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Slider PositionSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   408
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   1000
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   52
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   172
   End
   Begin Slider VolumeRate
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   132
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   32
      Minimum         =   -32
      PageStep        =   20
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   154
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   100
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
      Scope           =   0
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Rate:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   154
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Slider VolumePitch
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   132
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   2400
      Minimum         =   -2400
      PageStep        =   20
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   189
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   100
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
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Pitch:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   189
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Label LabelVolume
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
      Left            =   244
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   87
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   116
   End
   Begin Label LabelPan
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
      Left            =   244
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   119
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   116
   End
   Begin Label LabelRate
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
      Left            =   244
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   154
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   116
   End
   Begin Label LabelPitch
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
      Left            =   244
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   189
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   116
   End
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
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Output device:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   221
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PopupMenu PopupOutput
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
      Scope           =   0
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   220
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   177
   End
   Begin ProgressBar LevelChannel0
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Indeterminate   =   False
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   408
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   100
      Scope           =   0
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   84
      Transparent     =   True
      Value           =   0.0
      Visible         =   True
      Width           =   172
   End
   Begin ProgressBar LevelChannel1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Indeterminate   =   False
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   408
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   100
      Scope           =   0
      TabIndex        =   21
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   119
      Transparent     =   True
      Value           =   0.0
      Visible         =   True
      Width           =   172
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  player.removeTapOnBus 0
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  NoEvents = true
		  
		  // Needs OS X 10.10 or newer
		  Engine = new AVAudioEngineMBS
		  player = new myAVAudioPlayerNodeMBS
		  mixer = new AVAudioMixerNodeMBS
		  PitchNode = new AVAudioUnitTimePitchMBS
		  
		  output = Engine.outputNode
		  
		  Engine.attachNode player
		  Engine.attachNode mixer
		  Engine.attachNode PitchNode
		  
		  AddHandler player.Tap, WeakAddressOf OutputTap
		  
		  'dim f as AVAudioFormatMBS = mixer.outputFormatForBus(0)
		  player.installTapOnBus 0, 8192, nil
		  
		  PitchNode.bypass = true
		  
		  // you can build a channel layout and use it
		  'dim qlayout as new QTAudioChannelLayoutMBS
		  '
		  'qlayout.ChannelLayoutTag = qlayout.kAudioChannelLayoutTag_Mono
		  '
		  'dim layout as new AVAudioChannelLayoutMBS(qlayout)
		  'dim outputFormat as new AVAudioFormatMBS(48100.0, layout)
		  dim outputFormat as AVAudioFormatMBS = nil // default
		  
		  engine.connect(player, PitchNode, nil)
		  engine.connect(PitchNode, mixer, nil)
		  engine.connect(mixer, engine.outputNode, outputFormat)
		  
		  
		  dim devices as Dictionary = output.OutputDevices
		  dim DefaultDevice as integer = output.CurrentDeviceID
		  
		  for each key as Variant in devices.keys
		    dim name as String = devices.Value(key)
		    
		    PopupOutput.AddRow name
		    PopupOutput.RowTag(PopupOutput.ListCount-1) = key
		    
		    if key.IntegerValue = DefaultDevice then
		      PopupOutput.ListIndex = PopupOutput.ListCount-1
		    end if
		  next
		  
		  
		  
		  Finally
		    NoEvents = false
		    
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub OutputTap(m as avaudioNodeMBS, bus as integer, bufferSize as UInt32, format as AVAudioFormatMBS, buffer as AVAudioPCMBufferMBS, time as AVAudioTimeMBS, tag as variant)
		  dim l0 as Double = buffer.level(0)
		  dim l1 as Double = buffer.level(1)
		  'dim l2 as Double = buffer.level(2)
		  'dim l3 as Double = buffer.level(3)
		  
		  'dim mm as MemoryBlock = buffer.floatChannelDataCopy(0)
		  
		  
		  // -74 to 90 maybe
		  LevelChannel0.Value = 10 + l0
		  LevelChannel1.Value = 10 + l1
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartEngine()
		  if not engine.running then
		    
		    dim e as NSErrorMBS
		    if engine.startAndReturnError(e) then
		      // ok
		      
		      PopupOutput.Enabled = false // switching while playing doesn't work right now?
		      
		    else
		      MsgBox "Failed: "+e.localizedDescription
		    end if
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		audiofile As AVAudioFileMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		Engine As AVAudioEngineMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		file As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		fileFormat As AVAudioFormatMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		mixer As AVAudioMixerNodeMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		NoEvents As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		output As AVAudioOutputNodeMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		PitchNode As AVAudioUnitTimePitchMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		player As AVAudioPlayerNodeMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		StartPos As int64
	#tag EndProperty


#tag EndWindowCode

#tag Events LoadButton
	#tag Event
		Sub Action()
		  dim f as FolderItem = GetOpenFolderItem("")
		  
		  if f = nil then Return
		  
		  
		  dim error as NSErrorMBS
		  dim a as new AVAudioFileMBS(f, error)
		  
		  if error <> nil then
		    MsgBox error.LocalizedDescription
		    return
		  end if
		  
		  NoEvents = true
		  
		  dim ff as AVAudioFormatMBS = a.fileFormat
		  dim d as Double = a.Length/a.fileFormat.sampleRate
		  
		  FileInfo.Text = f.DisplayName+": "+str(ff.sampleRate)+"Hz, "+str(ff.channelCount)+" channels, "+str(d, "0.00")+" seconds"
		  
		  
		  self.fileFormat = ff
		  self.AudioFile = a
		  self.File = f
		  
		  PositionSlider.Value = 0
		  
		  player.scheduleFile(a, nil)
		  
		  StartEngine
		  
		  if not player.Playing then
		    player.play
		  end if
		  
		  
		  
		  Finally
		    NoEvents = false
		    
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PlayButton
	#tag Event
		Sub Action()
		  if player.Playing then
		    player.pause
		  else
		    player.play
		  end if
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  NoEvents = true
		  
		  
		  dim lines() as string
		  
		  if player.Playing then
		    lines.Append "playing"
		  else
		    lines.Append "paused"
		  end if
		  
		  if audiofile <> nil and fileFormat <> nil then
		    lines.Append str(audiofile.FramePosition / fileFormat.sampleRate)+" seconds"
		  end if
		  
		  PlayStatus.Text = Join(lines, ", ")
		  
		  if audiofile <> nil then
		    dim nodetime   as AVAudioTimeMBS = self.player.lastRenderTime
		    
		    if nodetime <> nil then
		      dim playerTime as AVAudioTimeMBS = self.player.playerTimeForNodeTime(nodetime)
		      
		      if playerTime <> nil then
		        PositionSlider.Value = 1000.0 * (StartPos + playerTime.sampleTime) / audiofile.Length
		      end if
		    end if
		  end if
		  
		  LabelVolume.Text = str(player.volume, "-0.0%")
		  labelpan.Text    = str(mixer.pan, "-0.0")
		  LabelPitch.Text  = str(PitchNode.pitch, "-0.00")
		  LabelRate.Text   = str(PitchNode.rate, "-0.00")
		  
		  
		  
		  Finally 
		    NoEvents = False
		    
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VolumeSlider
	#tag Event
		Sub ValueChanged()
		  if NoEvents then Return
		  
		  player.volume = me.Value / 100.0
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VolumePan
	#tag Event
		Sub ValueChanged()
		  if NoEvents then Return
		  
		  mixer.pan = me.Value / 100.0
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PositionSlider
	#tag Event
		Sub ValueChanged()
		  if NoEvents then Return
		  
		  dim playing as Boolean = player.Playing
		  
		  player.stop
		  
		  dim l as Int64 = audiofile.Length
		  dim x as Int64 = (me.Value * l) / 1000.0
		  dim r as int64 = audiofile.Length - x
		  
		  player.scheduleSegment(audiofile, nil, x, r)
		  StartPos = x
		  
		  if Playing then
		    player.play
		  end if
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VolumeRate
	#tag Event
		Sub ValueChanged()
		  if NoEvents then Return
		  
		  PitchNode.bypass = false
		  
		  dim v as integer = me.Value
		  if v >= 1 then
		    
		    PitchNode.rate = v
		    
		  elseif v = 0 then
		    PitchNode.rate = 1
		    
		  elseif v < 0 then
		    
		    PitchNode.rate = 1 / abs(v)
		    
		  else
		    Break // impossible?
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VolumePitch
	#tag Event
		Sub ValueChanged()
		  if NoEvents then Return
		  
		  PitchNode.bypass = false
		  PitchNode.pitch = me.Value 
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupOutput
	#tag Event
		Sub Change()
		  if NoEvents then Return
		  
		  
		  'engine.stop
		  output.CurrentDeviceID = me.RowTag(me.ListIndex)
		  
		  'dim e as NSErrorMBS
		  'if engine.startAndReturnError(e) then
		  '// ok
		  '
		  'else
		  'MsgBox "Failed: "+e.localizedDescription
		  'end if
		  '
		  
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
		Name="NoEvents"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="StartPos"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="int64"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
