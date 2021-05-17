#tag Window
Begin Window Window1 Implements AppleRemoteReceiver
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   231
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   678363474
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "ARRI Mouse Mover"
   Visible         =   True
   Width           =   550
   Begin Label StaticText1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   127
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
      Multiline       =   True
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "This is an example of the Apple Remote Receiver Interface.\r\rIt allows you to move the mouse with the apple remote using the:\r+: Up\r-: Down\rNext: Right\rPrevious: Left\rPlay/Pause: Click\r\rButtons for the specified Action"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   510
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Minimize Me"
      Default         =   True
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   191
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   249
   End
   Begin Label StaticText2
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   26
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "CLICKING CLOSE WILL QUIT THIS APPLICATION"
      TextAlign       =   1
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   20.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   550
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Quit"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   281
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   191
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   249
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  quit
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  //Dim k As new KeyCodesMBS
		  //MsgBox str(asc(Key)) + chr(13) + str(k.AsciiToKeyCode(asc(Key)))
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  Dim x, y As integer, p As PresskeyMBS
		  
		  addAppleRemoteListener self
		  
		  p= new PresskeyMBS
		  //x = System.MouseX
		  //y = System.MouseY
		  
		  x = (self.left + PushButton1.left) + (PushButton1.width/2)
		  y = (self.top + PushButton1.top-6) + (PushButton1.height/2)
		  
		  p.MouseMove x,y
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub pressKey(charCode As Integer, keyCode As integer)
		  Dim p As new PresskeyMBS
		  p.Charcode = charCode
		  p.Keycode = keyCode
		  p.press
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoteButtonPressed(button As integer, released As boolean)
		  // Part of the AppleRemoteReceiver interface.
		  ' Initialize x and y coordinates
		  ' initialize PresskeyMBS and KeyCodesMBS for Keyboard and mouse Functionality
		  Dim x, y As integer, p As PresskeyMBS, k As KeyCodesMBS
		  ' make new PresskeyMBS (For Mouse (and some Keyboard) Functionality)
		  p= new PresskeyMBS
		  ' make new KeyCodesMBS (For Keyboard Functionality)
		  k = new KeyCodesMBS
		  
		  if mReleased = TRUE AND button = AppleRemoteMBS.kRemoteButtonMenu then
		    isSleepingQuit = not isSleepingQuit
		  end if
		  
		  if isSleepingQuit = FALSE then
		    if button = AppleRemoteMBS.kRemoteButtonPlaySleep then
		      if mReleased = TRUE then
		        QuitWindow.Show
		      end if
		    end if
		    if button = AppleRemoteMBS.kRemoteButtonMenuHold then
		      mReleased = not mReleased
		    end if
		  end if
		  
		  
		  if button = AppleRemoteMBS.kRemoteButtonLeft or button = AppleRemoteMBS.kRemoteButtonLeftHold then
		    if AppleRemoteModule.keyMode = kKeyModeCursor then
		      
		      x=system.mouseX
		      y=system.mousey
		      x=x-5
		      if button = AppleRemoteMBS.kRemoteButtonLeftHold then x = 0
		      p.MouseMoveClick x, y, TRUE
		    else
		      pressKey(28, k.AsciiToKeyCode(70))
		    end if
		  end if
		  if button = AppleRemoteMBS.kRemoteButtonRight or button = AppleRemoteMBS.kRemoteButtonRightHold  then
		    if AppleRemoteModule.keyMode = kKeyModeCursor then
		      x=system.mouseX
		      y=system.mousey
		      x=x+5
		      if button = AppleRemoteMBS.kRemoteButtonRightHold then x = screen(0).Width
		      p.MouseMoveClick x, y, TRUE
		    else
		      pressKey(29, k.AsciiToKeyCode(66))
		    end if
		  end if
		  if button = AppleRemoteMBS.kRemoteButtonVolumePlus then
		    if AppleRemoteModule.keyMode = kKeyModeCursor then
		      
		      x=system.mouseX
		      y=system.mousey
		      y=y-5
		      p.MouseMoveClick x, y, TRUE
		    else
		      pressKey(30, k.AsciiToKeyCode(77))
		    end if
		  end if
		  if button = AppleRemoteMBS.kRemoteButtonVolumeMinus then
		    if AppleRemoteModule.keyMode = kKeyModeCursor then
		      x=system.mouseX
		      y=system.mousey
		      y = y+5
		      p.MouseMoveClick x, y, TRUE
		    else
		      pressKey(31, k.AsciiToKeyCode(72))
		    end if
		  end if
		  if button = AppleRemoteMBS.kRemoteButtonMenu then
		    if AppleRemoteModule.keyMode = kKeyModeKeyboard then
		      pressKey(51, k.AsciiToKeyCode(8))
		    else
		      p.MouseMoveClick system.MouseX, system.mouseY, true
		      p.MouseMoveClick system.MouseX, system.mouseY, false ' 1 click
		      p.MouseMoveClick system.MouseX, system.mouseY, true  ' +
		      p.MouseMoveClick system.MouseX, system.mouseY, false ' 1 click
		      ' 2 clicks = 1 Double Click
		    end if
		  end if
		  
		  if isSleepingQuit = TRUE then
		    if button = AppleRemoteMBS.kRemoteButtonMenuHold then
		      if AppleRemoteModule.keyMode <> kKeyModeCursor then
		        MsgBox "Switching to cursor mode"
		        AppleRemoteModule.keyMode = kKeyModeCursor
		      else
		        MsgBox "Switching to Keyboard mode"
		        AppleRemoteModule.keyMode = kKeyModeKeyboard
		      end if
		    end if
		  end if
		  
		  if button = AppleRemoteMBS.kRemoteButtonPlay then
		    p.MouseMoveClick system.MouseX, system.mouseY, true
		    p.MouseMoveClick system.MouseX, system.mouseY, false
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		isSleepingQuit As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		mReleased As boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  self.Minimize
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  QuitWindow.show
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
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
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
		Name="mReleased"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="isSleepingQuit"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
