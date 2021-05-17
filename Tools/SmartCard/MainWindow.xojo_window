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
   Height          =   344
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   19153800
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "SmartCard"
   Visible         =   True
   Width           =   291
   Begin PopupMenu GroupMenu
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
      Left            =   92
      ListIndex       =   0
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
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   179
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Group:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   15
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   60
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Device:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   48
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   60
   End
   Begin PopupMenu DeviceMenu
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
      Left            =   92
      ListIndex       =   0
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
      Top             =   47
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   179
   End
   Begin PushButton ConnectButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Connect"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   166
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
      Top             =   80
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   105
   End
   Begin PushButton QueryVersionButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Query Version"
      Default         =   False
      Enabled         =   False
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
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   118
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   251
   End
   Begin PushButton QuerySerialNoButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Query Serial No"
      Default         =   False
      Enabled         =   False
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
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   150
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   251
   End
   Begin PushButton QueryStatusButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Query Status"
      Default         =   False
      Enabled         =   False
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
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   182
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   251
   End
   Begin PushButton QuerySwiss
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Query Swiss Health Card"
      Default         =   False
      Enabled         =   False
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
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   214
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   251
   End
   Begin PushButton QueryBelgian
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Query Belgian ID Card"
      Default         =   False
      Enabled         =   False
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
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   246
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   251
   End
   Begin Label Label3
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   46
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
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Commands are card dependent. Those buttons above work for specific cards only."
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   278
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   251
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  context = New SmartCardContextMBS
		  
		  dim groups() as string = context.ReaderGroups
		  
		  GroupMenu.DeleteAllRows
		  for each g as string in groups
		    GroupMenu.AddRow g
		  Next
		  
		  dim devices() as string = context.Readers
		  
		  DeviceMenu.DeleteAllRows
		  for each d as string in devices
		    DeviceMenu.AddRow d
		  next
		  
		  
		  // Pick first group
		  If GroupMenu.ListCount = 1 Then
		    GroupMenu.ListIndex = 0
		  End If
		  
		  // pick first device
		  If DeviceMenu.ListCount = 1 Then
		    DeviceMenu.ListIndex = 0
		  End If
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub CheckConnect()
		  if DeviceMenu.ListIndex >= 0 then
		    ConnectButton.Enabled = true
		  else
		    ConnectButton.Enabled = false
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private card As SmartCardMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private context As SmartCardContextMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events GroupMenu
	#tag Event
		Sub Change()
		  
		  dim groupname as string = me.Text
		  dim devices() as string = context.Readers(array(groupname))
		  
		  DeviceMenu.DeleteAllRows
		  for each d as string in devices
		    DeviceMenu.AddRow d
		  next
		  
		  
		  // pick first device
		  If DeviceMenu.ListCount = 1 Then
		    DeviceMenu.ListIndex = 0
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DeviceMenu
	#tag Event
		Sub Change()
		  CheckConnect
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ConnectButton
	#tag Event
		Sub Action()
		  ConnectButton.Enabled = False
		  
		  dim DeviceName as string = DeviceMenu.Text
		  
		  card = context.Connect(DeviceName, SmartCardMBS.kShareShared, SmartCardMBS.kProtocolAny)
		  if card <> nil then
		    GroupMenu.Enabled = false
		    DeviceMenu.Enabled = False
		    QueryVersionButton.Enabled = true
		    QuerySerialNoButton.Enabled = true
		    QueryStatusButton.Enabled = true
		    QuerySwiss.Enabled = true
		    QueryBelgian.Enabled = True
		    
		  else
		    
		    MsgBox "Error: "+str(context.Lasterror)
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events QueryVersionButton
	#tag Event
		Sub Action()
		  dim header as new memoryBlock(8)
		  
		  header.Int32Value(0) = 2 // T1
		  header.Int32Value(4) = 8 // size of this block
		  
		  dim command as new MemoryBlock(5)
		  command.Int8Value(0) = 0
		  command.Int8Value(1) = &hCA
		  command.Int8Value(2) = 1
		  command.Int8Value(3) = &h82
		  command.Int8Value(4) = 2
		  
		  dim buffer as new MemoryBlock(512)
		  
		  dim RecvLength as UInt32 = 512
		  card.Transmit(header, command, command.Size, nil, buffer, RecvLength)
		  
		  if card.Lasterror = 0 then
		    // MsgBox "Received "+str(RecvLength)+" bytes: "
		    // C9039000
		    
		    dim answer as string = buffer.StringValue(0, RecvLength)
		    
		    Select case answer.Left(4)
		    case "C903"
		      MsgBox "Version 53"
		    case "C901"
		      MsgBox "Version 50"
		    else
		      MsgBox EncodeHex(answer)
		    end Select
		  else
		    MsgBox "Error: "+str(card.Lasterror)
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events QuerySerialNoButton
	#tag Event
		Sub Action()
		  
		  dim header as new memoryBlock(8)
		  
		  header.Int32Value(0) = 2 // T1
		  header.Int32Value(4) = 8 // size of this block
		  
		  dim command as new MemoryBlock(5)
		  command.Int8Value(0) = 0
		  command.Int8Value(1) = &hCA
		  command.Int8Value(2) = 1
		  command.Int8Value(3) = &h81
		  command.Int8Value(4) = 8
		  
		  dim buffer as new MemoryBlock(512)
		  dim ReceiveHeader as new MemoryBlock(8)
		  
		  dim RecvLength as UInt32 = 512
		  card.Transmit(header, command, command.Size, nil, buffer, RecvLength)
		  
		  if card.Lasterror = 0 then
		    'MsgBox "Received "+str(RecvLength)+" bytes: "
		    // 020610BF000241429000
		    
		    dim answer as string = buffer.StringValue(0, 8)
		    MsgBox EncodeHex(answer)
		    
		    
		  else
		    MsgBox "Error: "+str(card.Lasterror)
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events QueryStatusButton
	#tag Event
		Sub Action()
		  dim state as integer
		  dim protocol as integer
		  dim cardID as string
		  
		  card.Status(state, protocol, cardID)
		  if card.Lasterror <> 0 then
		    MsgBox "Error: "+str(card.Lasterror)
		  else
		    
		    dim states() as string
		    if BitwiseAnd(state, card.kCardStateAbsent) <> 0 then
		      states.Append "absent"
		    end if
		    if BitwiseAnd(state, card.kCardStateNegotiable) <> 0 then
		      states.Append "Negotiable"
		    end if
		    if BitwiseAnd(state, card.kCardStatePowered) <> 0 then
		      states.Append "powered"
		    else
		      states.Append "not powered"
		    end if
		    if BitwiseAnd(state, card.kCardStatePresent) <> 0 then
		      states.Append "present"
		    end if
		    if BitwiseAnd(state, card.kCardStateSpecific) <> 0 then
		      states.Append "Specific"
		    else
		      states.Append "not Specific"
		    end if
		    if BitwiseAnd(state, card.kCardStateSwallowed) <> 0 then
		      states.Append "Swallowed"
		    end if
		    if BitwiseAnd(state, card.kCardStateUnknown) <> 0 then
		      states.Append "Unknown"
		    end if
		    
		    dim protocolName as string
		    Select case protocol
		    case card.kProtocolT0
		      protocolName = "T0"
		    case card.kProtocolT1
		      protocolName = "T1"
		    case card.kProtocolRAW
		      protocolName = "RAW"
		    case card.kProtocolT15
		      protocolName = "T15"
		    case card.kProtocolAny
		      protocolName = "Any"
		    case card.kProtocolUnset
		      protocolName = "Unset"
		    case card.kProtocolUndefined
		      protocolName = "Undefined"
		    else
		      protocolName = "?"
		    end Select
		    
		    MsgBox "State: "+Join(states,", ")+EndOfLine+"Protocol: "+protocolName+EndOfLine+"CardID: "+EncodeHex(cardID)
		    
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events QuerySwiss
	#tag Event
		Sub Action()
		  Dim FileID1 As New MemoryBlock(2)
		  FileID1.UInt8Value(0) = &h2F
		  FileID1.UInt8Value(1) = &h06
		  
		  dim FileID2 as new MemoryBlock(2)
		  FileID2.UInt8Value(0) = &h2F
		  FileID2.UInt8Value(1) = &h07
		  
		  dim Data1 as MemoryBlock = card.ReadFile(FileID1)
		  dim Data2 as MemoryBlock = card.ReadFile(FileID2)
		  
		  
		  Dim dic1 As Dictionary = card.SplitValues(data1)
		  dim dic2 as Dictionary = card.SplitValues(data2)
		  
		  dim list() as string
		  
		  for each k as Variant in dic1.keys
		    list.Append k.StringValue + ": "+dic1.Value(k).StringValue
		  next
		  for each k as Variant in dic2.keys
		    list.Append k.StringValue + ": "+dic2.Value(k).StringValue
		  next
		  
		  MsgBox Join(list, EndOfLine)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events QueryBelgian
	#tag Event
		Sub Action()
		  // addressFile
		  
		  If True Then
		    Dim FileID1 As New MemoryBlock(4)
		    FileID1.UInt8Value(0) = &hDF
		    FileID1.UInt8Value(1) = &h01
		    FileID1.UInt8Value(2) = &h40
		    FileID1.UInt8Value(3) = &h33
		    
		    Dim Data1 As MemoryBlock = card.ReadFile(FileID1)
		    
		    If Data1 <> Nil Then
		      Dim dic1 As Dictionary = card.SplitValues(data1)
		      
		      Dim list() As String
		      For Each k As Variant In dic1.keys
		        
		        Dim v As String = dic1.Value(k).StringValue
		        If InStr(v, ChrB(0)) > 0 Then
		          // contains zeros
		          v = EncodeHex(v)
		        Else
		          v = DefineEncoding(v, encodings.UTF8)
		        End If
		        
		        list.Append k.StringValue + ": "+v
		      Next
		      
		      MsgBox Join(list, EndOfLine)
		    End If
		    
		  End If
		  
		  // basicInfoFile
		  
		  
		  If True Then
		    Dim FileID2 As New MemoryBlock(4)
		    FileID2.UInt8Value(0) = &hDF
		    FileID2.UInt8Value(1) = &h01
		    FileID2.UInt8Value(2) = &h40
		    FileID2.UInt8Value(3) = &h31
		    
		    Dim Data2 As MemoryBlock = card.ReadFile(FileID2)
		    
		    If Data2 <> Nil Then
		      Dim dic2 As Dictionary = card.SplitValues(data2)
		      
		      Dim list() As String
		      For Each k As Variant In dic2.keys
		        Dim v As String = dic2.Value(k).StringValue
		        If InStr(v, ChrB(0)) > 0 Then
		          // contains zeros
		          v = EncodeHex(v)
		        Else
		          v = DefineEncoding(v, encodings.UTF8)
		        End If
		        
		        list.Append k.StringValue + ": "+v
		      Next
		      
		      MsgBox Join(list, EndOfLine)
		      
		    End If
		    
		    
		  End If
		  
		  
		  // idFile
		  
		  If False Then
		    Dim FileID3 As New MemoryBlock(4)
		    FileID3.UInt8Value(0) = &hDF
		    FileID3.UInt8Value(1) = &h01
		    FileID3.UInt8Value(2) = &h40
		    FileID3.UInt8Value(3) = &h38
		    
		    Dim Data3 As MemoryBlock = card.ReadFile(FileID3)
		    
		    If Data3 <> Nil Then
		      Dim dic3 As Dictionary = card.SplitValues(data3)
		      
		      Dim list() As String
		      For Each k As Variant In dic3.keys
		        Dim v As String = dic3.Value(k).StringValue
		        If InStr(v, ChrB(0)) > 0 Then
		          // contains zeros
		          v = EncodeHex(v)
		        Else
		          v = DefineEncoding(v, encodings.UTF8)
		        End If
		        
		        list.Append k.StringValue + ": "+v
		      Next
		      
		      MsgBox Join(list, EndOfLine)
		      
		    End If
		    
		    
		  End If
		  
		  
		  
		  // to get photo, use query with &h31 in ID
		  'FileID.UInt8Value(3) = &h31
		  
		  // picture
		  
		  If True Then
		    Dim FileID3 As New MemoryBlock(4)
		    FileID3.UInt8Value(0) = &hDF
		    FileID3.UInt8Value(1) = &h01
		    FileID3.UInt8Value(2) = &h40
		    FileID3.UInt8Value(3) = &h35
		    
		    Dim Data3 As MemoryBlock = card.ReadFile(FileID3)
		    
		    If Data3 <> Nil Then
		      Dim p As Picture = picture.FromData(data3)
		      If p <> Nil Then
		        Dim w As New PicWindow
		        w.Backdrop = p
		        w.show
		      End If
		      
		    End If
		    
		    
		  End If
		  
		  
		  
		  
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
