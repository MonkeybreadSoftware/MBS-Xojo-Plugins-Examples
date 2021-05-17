#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   251
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   2078429253
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Test MidiPlaybackMBS"
   Visible         =   True
   Width           =   392
   Begin Slider tunSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   95
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Maximum         =   1200
      Minimum         =   -1200
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   146
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   205
   End
   Begin Slider revSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   95
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Maximum         =   40
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   180
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   205
   End
   Begin PushButton playBut
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Play Scale"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   278
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   94
   End
   Begin Timer scaleTimer
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   0
      Period          =   300
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
   Begin Label sText
      Active          =   ""
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Tuning"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   142
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   52
      Window          =   "0"
      _mWindow        =   "0"
   End
   Begin Label sText
      Active          =   ""
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Reverb"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   176
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   52
      Window          =   "0"
      _mWindow        =   "0"
   End
   Begin CheckBox streamCheck
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Stream from disk"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   186
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      State           =   1
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   111
      Transparent     =   True
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   186
   End
   Begin CheckBox revCheck
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Use internal reverb"
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
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      State           =   1
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   111
      Transparent     =   True
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   153
   End
   Begin Slider volSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   95
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Maximum         =   40
      Minimum         =   -120
      PageStep        =   20
      Scope           =   "0"
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   214
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   205
   End
   Begin Label sText
      Active          =   ""
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Volume"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   210
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   52
      Window          =   "0"
      _mWindow        =   "0"
   End
   Begin PopupMenu samplePop
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Quicktime Instruments"
      Italic          =   False
      Left            =   128
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   45
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   244
   End
   Begin Label sText
      Active          =   ""
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   3
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Sample set"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   46
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   79
      Window          =   "0"
      _mWindow        =   "0"
   End
   Begin PopupMenu patchPop
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Piano 1"
      Italic          =   False
      Left            =   128
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   77
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   244
   End
   Begin Label sText
      Active          =   ""
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   4
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Patch"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   78
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   79
      Window          =   "0"
      _mWindow        =   "0"
   End
   Begin PopupMenu channelPop
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "1\r2\r3\r4\r5\r6\r7\r8\r9\r10\r11\r12\r13\r14\r15\r16"
      Italic          =   False
      Left            =   128
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   13
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   55
   End
   Begin Label sText
      Active          =   ""
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   5
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "MIDI channel"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   96
      Window          =   "0"
      _mWindow        =   "0"
   End
   Begin TextField tunField
      AcceptTabs      =   False
      Alignment       =   0
      AllowSpellChecking=   False
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Hint            =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   312
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Mask            =   ""
      Multiline       =   ""
      Password        =   False
      ReadOnly        =   True
      Scope           =   "0"
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   "True"
      Styled          =   ""
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "0"
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   141
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   60
   End
   Begin TextField revField
      AcceptTabs      =   False
      Alignment       =   0
      AllowSpellChecking=   False
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Hint            =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   312
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Mask            =   ""
      Multiline       =   ""
      Password        =   False
      ReadOnly        =   True
      Scope           =   "0"
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   "True"
      Styled          =   ""
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "0"
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   175
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   60
   End
   Begin TextField volField
      AcceptTabs      =   False
      Alignment       =   0
      AllowSpellChecking=   False
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Hint            =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   312
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Mask            =   ""
      Multiline       =   ""
      Password        =   False
      ReadOnly        =   True
      Scope           =   "0"
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   "True"
      Styled          =   ""
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "0"
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   209
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   60
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  setup
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub loadSampleSet(n as string, tag as variant)
		  dim j as integer
		  
		  if n = "Quicktime Instruments" then
		    
		    //LOAD QUICKTIME
		    theSynth = Nil
		    theSynth = new MidiPlaybackMBS(true)
		    
		    
		  else
		    
		    //LOAD SOUNDFONT
		    for j = 0 to Ubound(soundfontList)
		      if soundfontList(j) <> Nil then
		        if n = NthField(soundfontList(j).name, ".", 1) then
		          theSynth.LoadSoundBankFile(soundfontList(j))
		        end if
		      end if
		    next
		    
		  end if
		  
		  //STORE PATCH LIST
		  redim patch(-1)
		  'not all 127 are used for every sample set
		  for j = 0 to 127
		    patch.Append trim(theSynth.InstrumentName(j))
		  next
		  
		  //PATCH POPUP
		  settingUp = true
		  patchPop.DeleteAllRows
		  for j = 0 to 127
		    'sample set instrument names
		    'sound fonts usually do not use all 127 instruments
		    if asc(patch(j)) > 31 and patch(j) <> "" then
		      patchPop.AddRow patch(j)
		      'the rowtag gives the actual patch number
		      patchPop.RowTag(patchPop.ListCount-1) = j
		    end if
		  next
		  settingUp = false
		  patchPop.ListIndex = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub scanSoundfonts()
		  dim j, m as integer
		  dim f as folderItem
		  
		  redim soundfontList(-1)
		  
		  //STORE SOUNDFONT FILE POINTERS IN A GLOBAL ARRAY
		  for m = 0 to 1
		    if m = 0 then
		      'check user banks first
		      f = SpecialFolder.UserHome.Child("Library").Child("Audio").Child("Sounds").Child("Banks")
		    else
		      'then check system banks
		      f = Volume(0).Child("Library").Child("Audio").Child("Sounds").Child("Banks")
		    end if
		    if f <> Nil then
		      if f.Directory then
		        if f.Count > 0 then
		          'add each soundfont
		          for j = 1 to f.Count
		            f.item(j).ExtensionVisible = true
		            if lowercase(right(f.item(j).name,4)) = ".sf2" then
		              'don't add duplicate files
		              if soundfontList.IndexOf(f.item(j)) = -1 then
		                soundfontList.append f.item(j)
		              end if
		            end if
		          next
		        end if
		      end if
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setup()
		  dim j as integer
		  
		  settingUp = true
		  
		  //SYNTH
		  theSynth = new MidiPlaybackMBS(true)
		  if theSynth.Inited=false then
		    msgbox "Synth failed to initialize."
		    quit
		    Return
		  end if
		  
		  //BUILD SOUNDFONT LIST
		  scanSoundfonts
		  
		  //SAMPLE SET POPUP
		  samplePop.DeleteAllRows
		  'QT synth
		  samplePop.AddRow "Quicktime Instruments"
		  samplePop.AddSeparator
		  'SoundFonts
		  for j = 0 to UBound(soundfontList)
		    samplePop.Addrow NthField(soundfontList(j).name, ".", 1)
		  next
		  
		  //DEFAULT PATCH LIST
		  for j = 0 to 127
		    patch.Append trim(theSynth.InstrumentName(j))
		  next
		  
		  revCheck.Value=theSynth.UsesInternalReverb
		  streamCheck.Value=theSynth.StreamFromDisk
		  tunSlider.Value=theSynth.Tuning
		  revSlider.Value=theSynth.ReverbVolume
		  volSlider.Value=theSynth.Volume
		  
		  settingUp = false
		  
		  //DEFAULT SAMPLE SET and PATCH
		  samplePop.ListIndex = 0
		  patchPop.ListIndex = 0
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		#tag Note
			MIDI channel
			
		#tag EndNote
		ch As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			list of available patches for the current sample set
		#tag EndNote
		patch(-1) As string
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			scale tone number for Play Scale timer
		#tag EndNote
		scaleTone As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			tells popup menus whether to react to Change events
		#tag EndNote
		settingUp As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			references to sound font files installed in system + user sound bank library
		#tag EndNote
		soundFontList(-1) As folderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		theSynth As MidiPlaybackMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events tunSlider
	#tag Event
		Sub ValueChanged()
		  if not settingUp then
		    theSynth.Tuning = me.value
		  end if
		  
		  tunField.text = str(me.value)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events revSlider
	#tag Event
		Sub ValueChanged()
		  if not settingUp then
		    theSynth.ReverbVolume = me.value
		  end if
		  
		  revField.text = str(me.value)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events playBut
	#tag Event
		Sub Action()
		  theSynth.Start
		  scaleTimer.mode = 1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events scaleTimer
	#tag Event
		Sub Action()
		  //PLAY A CHROMATIC SCALE
		  
		  'turn off previous note
		  theSynth.SendMidiEvent(144+ch, scaleTone+60, 0,  0)
		  
		  'move to next note
		  scaleTone = scaleTone + 1
		  
		  if scaleTone < 14 then 
		    'turn on this note
		    theSynth.SendMidiEvent(144+ch, scaleTone+60, 100,  0)
		    me.mode = 1
		  else
		    'reset scale
		    scaleTone = 0
		    me.mode = 0
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events streamCheck
	#tag Event
		Sub Action()
		  if not settingUp then
		    theSynth.StreamFromDisk=me.Value
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events revCheck
	#tag Event
		Sub Action()
		  if not settingUp then
		    theSynth.UsesInternalReverb = me.value
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events volSlider
	#tag Event
		Sub ValueChanged()
		  if not settingUp then
		    theSynth.Volume = me.value
		  end if
		  
		  volField.text = str(me.value)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events samplePop
	#tag Event
		Sub Change()
		  if settingUp then return
		  loadSampleSet(me.text, me.RowTag(me.ListIndex))
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events patchPop
	#tag Event
		Sub Change()
		  if settingUp then return
		  
		  'patch change
		  theSynth.SendMidiEvent(192+ch, me.rowTag(me.listIndex), 0, 0)
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
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="300"
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
		InitialValue="False"
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
		Name="scaleTone"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="settingUp"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ch"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
