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
   MenuBar         =   61865983
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "SSH Tunnel"
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
      Height          =   360
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
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
      Top             =   20
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   360
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton StartTunnelButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Start Tunnel"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   392
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
      Width           =   188
   End
   Begin PushButton ConnectButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Connect Database"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   392
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
      Top             =   110
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   188
   End
   Begin PushButton StopTunnelButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Stop Tunnel"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   392
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
      Top             =   52
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   188
   End
   Begin PushButton DisconnectButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Disconnect Database"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   392
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
      Top             =   142
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   188
   End
   Begin PushButton QueryButton
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
      Left            =   392
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
      Top             =   174
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   188
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub log(s as string)
		  List.AddRow s
		  List.ScrollPosition = List.ListCount
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub logMessages(s as string)
		  s = ReplaceLineEndings(s, EndOfLine)
		  dim m() as string = split(s, EndOfLine)
		  
		  for each t as string in m
		    log t
		  next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		db As MySQLCommunityServer
	#tag EndProperty

	#tag Property, Flags = &h0
		session As MySSH2SessionMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		tunnel As SSH2TunnelMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events StartTunnelButton
	#tag Event
		Sub Action()
		  const Address = "192.168.1.123"
		  const username = "xxx"
		  const password = "xxx"
		  const keyfile1 = ""
		  const keyfile2 = ""
		  
		  dim hostAddr as string = System.Network.LookupIPAddress(Address)
		  log hostAddr
		  
		  //* Create a session instance and start it up. This will trade welcome
		  //* banners, exchange keys, and setup crypto, compression, and MAC layers
		  
		  session = new MySSH2SessionMBS(hostAddr, 22)
		  session.MyPassword = password
		  
		  if session.Handle = 0 then
		    log "Failed to connect socket!"
		    Return 
		  end if
		  
		  session.SessionHandshake 
		  if session.lasterror<>0 then
		    log "Failure establishing SSH session"
		    Return 
		  end if
		  
		  
		  //* At this point we havn't authenticated. The first thing to do is check
		  //* the hostkey's fingerprint against our known hosts Your app may have it
		  //* hard coded, may go to a file, may present it to the user, that's your
		  //* call
		  
		  dim fingerprint as string = session.HostKeyHash(session.kHostKeyHashSHA1)
		  log "Fingerprint: "+EncodeHex(fingerprint)
		  
		  //* check what authentication methods are available */
		  dim userauthlist as string = session.UserAuthList(username)
		  
		  dim authPassword as Boolean = false
		  dim authKeyboardInteractive as Boolean = false
		  dim authPublickey as Boolean = false
		  log "Authentication methods: "+ userauthlist
		  
		  
		  if instr(userauthlist, "password")>0 then
		    authPassword = true
		  end if
		  
		  if instr(userauthlist, "keyboard-interactive")>0 then
		    authKeyboardInteractive = true
		  end if
		  
		  if instr(userauthlist, "publickey")>0 then
		    authPublickey = true
		  end if
		  
		  if authPassword then
		    //* We could authenticate via password */
		    
		    session.UserAuthPassword(username, password)
		    
		    if session.LastError = 0 then
		      // ok
		      log "Authentication by password succeeded."
		    else
		      // failed
		      log "Authentication by password failed!"
		      Return 
		    end if
		    
		    
		  elseif authKeyboardInteractive then
		    //* Or via keyboard-interactive */
		    session.UserAuthKeyboardInteractive username
		    if session.LastError <> 0 then
		      log "Authentication by keyboard-interactive failed!"
		      return 
		    else
		      log "Authentication by keyboard-interactive succeeded."
		    end if
		    
		    //* Or by public key */
		  elseif authPublickey then
		    session.UserAuthPublicKeyFromFile(username, keyfile1, keyfile2, password)
		    
		    if session.LastError <> 0 then
		      log "Authentication by public key failed!"
		      Return 
		    else
		      log "Authentication by public key succeeded."
		    end if
		  else
		    log "No supported authentication methods found!"
		    Return 
		  end if
		  
		  
		  
		  // here we are authorized
		  
		  //* Open tunnel */
		  tunnel = new SSH2TunnelMBS(session)
		  tunnel.LocalAddress = "127.0.0.1"
		  tunnel.LocalPort = 3307
		  tunnel.RemoteAddress = "127.0.0.1"
		  tunnel.RemotePort = 3306
		  
		  // avoid timeing out in Socket and SSH layers
		  tunnel.KeepAlive = True
		  session.ConfigureKeepAlive
		  
		  // run it
		  tunnel.Run
		  
		  // while it runs, connect to database server
		  // don't alter session while tunnel runs
		  
		  app.DoEvents(200)
		  logMessages tunnel.Messages
		  
		  StopTunnelButton.Enabled = true
		  StartTunnelButton.Enabled = false
		  QueryButton.Enabled = false
		  ConnectButton.Enabled = true
		  DisconnectButton.Enabled = false
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ConnectButton
	#tag Event
		Sub Action()
		  
		  // now use it, e.g. with MySQL via Xojo's plugin
		  
		  db = new MySQLCommunityServer
		  db.Host = "127.0.0.1"
		  db.DatabaseName = "xxx"
		  db.UserName = "xxx"
		  db.Password = "xxx"
		  db.Port = 3307
		  
		  if db.Connect then
		    log "Connected"
		  else
		    log "Failed to connect: "+db.ErrorMessage
		    Return
		  end if
		  
		  
		  QueryButton.Enabled = true
		  ConnectButton.Enabled = false
		  DisconnectButton.Enabled = true
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StopTunnelButton
	#tag Event
		Sub Action()
		  db = nil
		  tunnel.Cancel = true
		  
		  // wait for shutdown
		  do
		    app.DoEvents 10
		  loop until not tunnel.Running
		  
		  logMessages tunnel.Messages
		  
		  
		  session.Disconnect "Normal Shutdown, Thank you for playing"
		  
		  session = nil
		  log "done"
		  
		  
		  StopTunnelButton.Enabled = false
		  StartTunnelButton.Enabled = true
		  QueryButton.Enabled = false
		  ConnectButton.Enabled = false
		  DisconnectButton.Enabled = false
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DisconnectButton
	#tag Event
		Sub Action()
		  db = nil
		  
		  
		  QueryButton.Enabled = false
		  ConnectButton.Enabled = true
		  DisconnectButton.Enabled = false
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events QueryButton
	#tag Event
		Sub Action()
		  
		  dim r as RecordSet = db.SQLSelect("SELECT VERSION();")
		  
		  if db.Error then
		    MsgBox db.ErrorMessage
		  else
		    MsgBox "Version: "+r.IdxField(1).StringValue
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
#tag EndViewBehavior
