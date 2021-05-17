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
   MenuBar         =   1779822591
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "SSH Terminal"
   Visible         =   True
   Width           =   600
   Begin TextArea Output
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   326
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
   End
   Begin TextField InputField
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "Input"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
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
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   358
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
   End
   Begin Label HelpLabel
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
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Type commands like ls and press return key."
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   380
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   560
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  channel.Close
		  channel = Nil
		  session.Disconnect "Normal Shutdown, Thank you for playing"
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  Const Address = "localhost"
		  Const username = "xxx"
		  Const password = "yyy"
		  Const keyfile1 = ""
		  Const keyfile2 = ""
		  Const commandline = "/bin/sh"
		  
		  
		  Break // change values above!
		  
		  
		  Dim hostAddr As String = System.Network.LookupIPAddress(Address)
		  Print "Connect to IP: "+hostAddr
		  
		  //* Create a session instance and start it up. This will trade welcome
		  //* banners, exchange keys, and setup crypto, compression, and MAC layers
		  
		  session = New MySSH2SessionMBS(hostAddr, 22)
		  session.MyPassword = password
		  
		  If session.Handle = 0 Then
		    Print "Failed to connect socket!"
		    Return 
		  End If
		  
		  session.SessionHandshake 
		  If session.lasterror<>0 Then
		    Print "Failure establishing SSH session"
		    Return 
		  End If
		  
		  
		  //* At this point we havn't authenticated. The first thing to do is check
		  //* the hostkey's fingerprint against our known hosts Your app may have it
		  //* hard coded, may go to a file, may present it to the user, that's your
		  //* call
		  
		  Dim fingerprint As String = session.HostKeyHash(session.kHostKeyHashSHA1)
		  Print "Fingerprint: "+EncodeHex(fingerprint)
		  
		  //* check what authentication methods are available */
		  Dim userauthlist As String = session.UserAuthList(username)
		  
		  Dim authPassword As Boolean = False
		  Dim authKeyboardInteractive As Boolean = False
		  Dim authPublickey As Boolean = False
		  Print "Authentication methods: "+ userauthlist
		  
		  
		  If InStr(userauthlist, "password")>0 Then
		    authPassword = True
		  End If
		  
		  If InStr(userauthlist, "keyboard-interactive")>0 Then
		    authKeyboardInteractive = True
		  End If
		  
		  If InStr(userauthlist, "publickey")>0 Then
		    authPublickey = True
		  End If
		  
		  If authPassword Then
		    //* We could authenticate via password */
		    
		    session.UserAuthPassword(username, password)
		    
		    If session.LastError = 0 Then
		      // ok
		      Print "Authentication by password succeeded."
		    Else
		      // failed
		      Print "Authentication by password failed!"
		      Return 
		    End If
		    
		    
		  Elseif authKeyboardInteractive Then
		    //* Or via keyboard-interactive */
		    session.UserAuthKeyboardInteractive username
		    If session.LastError <> 0 Then
		      Print "Authentication by keyboard-interactive failed!"
		      Return 
		    Else
		      Print "Authentication by keyboard-interactive succeeded."
		    End If
		    
		    //* Or by public key */
		  Elseif authPublickey Then
		    session.UserAuthPublicKeyFromFile(username, keyfile1, keyfile2, password)
		    
		    If session.LastError <> 0 Then
		      Print "Authentication by public key failed!"
		      Return 
		    Else
		      Print "Authentication by public key succeeded."
		    End If
		  Else
		    Print "No supported authentication methods found!"
		    Return 
		  End If
		  
		  
		  //* Request a shell */
		  channel = new MySSH2ChannelMBS(session)
		  channel.SetBlocking False
		  
		  app.DoEvents 10
		  
		  // read greetings
		  Dim s As String = channel.Read(10000)
		  Print s 
		  
		  // execute command line
		  app.DoEvents 10
		  
		  channel.execute commandline
		  
		  If channel.LastError <> 0 and channel.LastError <> -37 Then
		    Print "Execute failed with error: "+Str(channel.LastError)
		  End If
		  
		  
		  // now continue with DataAvailable Handler
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Print(s as string, isError as Boolean = false)
		  If isError Then
		    // red color for errors
		    output.SelTextColor = &c990000
		  end if
		  
		  output.AppendText s
		  Output.AppendText EndOfLine
		  
		  If isError Then
		    output.SelTextColor = TextColor
		  End If
		  
		  Output.ScrollPosition = 999999 // jump to end
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		channel As MySSH2ChannelMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		session As MySSH2SessionMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events InputField
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Asc(key) = 13 Or Asc(key) = 3 Then
		    
		    Dim I As String = InputField.Text.ConvertEncoding(encodings.UTF8) + EndOfLine.UNIX
		    
		    Dim n As Integer = channel.Write(I)
		    
		    // show in text area
		    Output.SelBold = True
		    Output.AppendText InputField.Text
		    Output.AppendText EndOfLine
		    Output.SelBold = False
		    
		    If channel.LastError <> 0 Then
		      Print "Write reports error: "+Str(channel.LastError)
		    End If
		    
		    InputField.Text = ""
		    
		    Output.ScrollPosition = 999999 // jump to end
		  End If
		  
		End Function
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
