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
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   2024634367
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Mac Bluetooth Connection"
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
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   294
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
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton ListenButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Connect"
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
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   94
   End
   Begin TextField MessageField
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "0"
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   358
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   468
   End
   Begin PushButton SendButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Send"
      Default         =   True
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   500
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   359
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  if ServiceBrowserController <> nil then
		    ServiceBrowserController.parent = nil
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  ServiceBrowserController = new IOBluetoothServiceBrowserController(IOBluetoothServiceBrowserController.kOptionsNone)
		  ServiceBrowserController.Title = "Service Browser"
		  ServiceBrowserController.parent = self
		  
		  
		  
		  #if DebugBuild then
		    
		    device = IOBluetoothDeviceMBS.deviceWithAddressString("00-16-53-5c-02-b7")
		    if device <> nil then
		      
		      const ChannelID = 1
		      
		      log "Device: "+device.name+" "+device.addressString
		      
		      log "Open service on channel "+str(ChannelID)
		      
		      
		      Channel = new MyChannel
		      if Channel.openRFCOMMChannelAsync(Device, ChannelID) then
		        
		      else
		        log "Open failed with error "+str(Channel.Lasterror)
		      end if
		      
		    end if
		    
		  #endif
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function MindstormEV3PlaySound() As Boolean Handles MindstormEV3PlaySound.Action
			if Channel <> nil and channel.isOpen then
			EVPlaySound
			else
			MsgBox "Channel not open?"
			end if
			
			Return True
			
			
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function MindstormEV3QueryDeviceInputList() As Boolean Handles MindstormEV3QueryDeviceInputList.Action
			if Channel <> nil and channel.isOpen then
			EVQueryInputDeviceList
			else
			MsgBox "Channel not open?"
			end if
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function MindstormEV3Querydirectorylisting() As Boolean Handles MindstormEV3Querydirectorylisting.Action
			if Channel <> nil and channel.isOpen then
			EVListFiles
			else
			MsgBox "Channel not open?"
			end if
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub EVListFiles()
		  'Bytes send to the brick:
		  'xxxxxxxx0199xxxxxxx
		  'bbbbmmmmttssllllnnn...
		  'bbbb = bytes in message mmmm = message counter tt = type of message
		  'ss = system command
		  'llll = max. bytes to read nnn.. = path name
		  
		  
		  dim path as string = "/" // put linux path here
		  
		  //   bbbbmmmmttssllllnnn
		  
		  dim m as MemoryBlock = new MemoryBlock(9 + lenb(path))
		  m.LittleEndian = true
		  m.UInt16Value(0) = m.size
		  m.UInt16Value(2) = 0
		  m.UInt8Value(4) = 1
		  m.UInt8Value(5) = &h99
		  m.UInt16Value(6) = 1012
		  m.StringValue(8,lenb(path)) = path
		  
		  Channel.EVListFiles = true
		  Channel.writeAsync m
		  
		  log EncodeHex(m)
		  log str(m.size)+" Bytes sent."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EVPlaySound()
		  'Play a 1Kz tone at level 2 for 1 sec.
		  
		  'opSOUND,LC0(TONE),LC1(2),LC2(1000),LC2(1000)
		  'opSOUND LC0(TONE) LC1(2) LC2(1000) LC2(1000)
		  
		  'Bytes sent to the brick:
		  'Opcode sound related
		  'Command (TONE) encoded as single byte constant Sound-level 2 encoded as one constant
		  'byte to follow Frequency 1000 Hz. encoded as two constant bytes to follow Duration 1000 mS. 
		  'encoded as two constant bytes to follow
		  
		  '0F00xxxx8000009401810282E80382E803 
		  'Bbbbmmmmtthhhhcccccccccccccccccccc
		  
		  'bbbb = bytes in message 15 excl. packet length bytes
		  'mmmm = message counter
		  'tt = type of command - Direct command no reply 
		  'hhhh = header – variable alloc*).
		  'cc/CC = byte codes.
		  '*)hhhh = 10 least significant bits are number of globals, 6 most significal bits are locals
		  
		  dim s as string
		  
		  s = "0F0000000000009401810282E80382E803"
		  //   Bbbbmmmmtthhhhcccccccccccccccccccc
		  
		  dim m as MemoryBlock = DecodeHex(s)
		  
		  Channel.writeAsync m
		  
		  log EncodeHex(m)
		  log str(m.size)+" Bytes sent."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EVQueryInputDeviceList()
		  'opINPUT_DEVICE_LIST Example
		  '
		  'Get all device types connected to input ports:
		  '
		  'Byte codes:             opINPUT_DEVICE_LIST,LC0(4),GV0(0),GV0(4),
		  '\            /
		  '\    -------
		  '\  /
		  'Hex values send:    0900xxxx00050098046064
		  '
		  '
		  'Hex value received: 0800xxxx027E7E7E7D00
		  '^---------
		  '|
		  'Command global variable (response buffer offset) 
		  '0=port 1 type, 1=port 2 type, 2=port 3 type, 3=port4 type, 4=change flag.
		  
		  
		  dim s as string
		  
		  
		  
		  s = "0900000000050098046064"
		  //   bbbbmmmmtthhhhcccccccc
		  
		  
		  dim m as MemoryBlock = DecodeHex(s)
		  
		  Channel.writeAsync m
		  
		  log EncodeHex(m)
		  log str(m.size)+" Bytes sent."
		  Channel.EVQueryInputDeviceList = true
		  
		  // seems like answer doesn't come until next packet goes to device?
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Log(s as string)
		  List.AddRow s
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OpenService(Service as IOBluetoothSDPServiceRecordMBS)
		  device = Service.Device
		  
		  dim ChannelID as integer = Service.RFCOMMChannelID
		  
		  if ChannelID = 0 then
		    // no channel?
		    break
		  else
		    Channel = nil // clear old if any
		    
		    log "Device: "+device.name+" "+device.addressString
		    log "Open service on channel "+str(ChannelID)
		    
		    
		    Channel = new MyChannel
		    if Channel.openRFCOMMChannelAsync(Service.Device, ChannelID) then
		      // okay
		      
		    else
		      log "Open failed with error "+str(Channel.Lasterror)
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Channel As MyChannel
	#tag EndProperty

	#tag Property, Flags = &h0
		counter As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		device As IOBluetoothDeviceMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		ServiceBrowserController As IOBluetoothServiceBrowserController
	#tag EndProperty


#tag EndWindowCode

#tag Events ListenButton
	#tag Event
		Sub Action()
		  ServiceBrowserController.beginSheetModalForWindow(self)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MessageField
	#tag Event
		Sub TextChange()
		  SendButton.Enabled = me.text.len > 0 
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SendButton
	#tag Event
		Sub Action()
		  dim s as string = MessageField.Text.ConvertEncoding(encodings.UTF8)
		  
		  if lenb(s) > 0 then
		    
		    dim m as MemoryBlock = s
		    
		    Channel.writeAsync m
		    
		    log str(m.size)+" Bytes sent."
		    
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
	#tag ViewProperty
		Name="counter"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
