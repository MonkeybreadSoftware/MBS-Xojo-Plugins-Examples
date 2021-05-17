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
   MenuBar         =   605417471
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Raw Socket for UDP"
   Visible         =   True
   Width           =   600
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
      Scope           =   "2"
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Message:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   21
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin TextField iMessage
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
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   132
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "2"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Hello World"
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   337
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
      Scope           =   "2"
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "IP:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   54
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin TextField iIP
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
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   132
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "2"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "127.0.0.1"
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   53
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   272
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
      Left            =   416
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   "2"
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Port:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   53
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   53
   End
   Begin TextField iPort
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
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   481
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "2"
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "12345"
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   53
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   99
   End
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
      Height          =   295
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
      Scope           =   "2"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   86
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton SendButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Send"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   481
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   99
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  ssock = nil
		  dsock = nil
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  // this example must be run as root to be allowed to use truely RAW Socket
		  // Second, this app does not work. It does send, but we don't see results in the window.
		  
		  ChecksumTest
		  
		  // Create RAW Socket to send UDP ourselves
		  dsock = new RAWSocketMBS(RAWSocketMBS.AddressFamilyINet, RAWSocketMBS.SocketTypeRaw, RAWSocketMBS.ProtocolRaw)
		  
		  
		  // Create UDP socket to receive packets
		  ssock = new MyRawSocket(RAWSocketMBS.AddressFamilyINet, RAWSocketMBS.SocketTypeDatagram, RAWSocketMBS.ProtocolUDP)
		  
		  if ssock.Lasterror <> 0 or ssock.Handle = -1 then
		    MsgBox "Failed to create normal UDP socket"+EndOfLine+EndOfLine+"Error "+str(ssock.Lasterror)
		    quit
		  end if
		  
		  // to test receive, we bind to any address with given port
		  
		  // convert IPv4 from text to numeric value
		  dim IP as Uint32 = 0 // all IPv4
		  
		  // create destination address. This is for Mac! Windows and Linux have different structures
		  dim dest as new MemoryBlock(16)
		  #if TargetMacOS then
		    dest.UInt8Value(0) = dest.size
		    dest.UInt8Value(1) = RAWSocketMBS.AddressFamilyINet
		    dest.UInt16Value(2) = RAWSocketMBS.htons(12345)
		    dest.UInt32Value(4) = IP
		  #else
		    dest.UInt8Value(0) = RAWSocketMBS.AddressFamilyINet
		    dest.UInt16Value(2) = RAWSocketMBS.htons(12345)
		    dest.UInt32Value(4) = IP
		  #endif
		  
		  if ssock.Bind(dest, dest.size) then
		    log "Bind OK"
		  else
		    log "Bind: "+str(ssock.Lasterror)
		  end if
		  
		  
		  
		  Exception r as UnsupportedOperationException
		    MsgBox "Must be run as root!"+EndOfLine+EndOfLine+r.message
		    quit
		    
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Sub ChecksumTest()
		  // some test packet
		  
		  dim s as string = decodehex("4500003c1c4640004006b1e6ac100a63ac100a0c")
		  dim m as MemoryBlock = s
		  
		  
		  dim checksum as integer = m.UInt16Value(10)
		  m.UInt16Value(10) = 0 // for calculation
		  
		  dim calc as integer = RAWSocketMBS.CalcChecksum(m, m.size)
		  
		  if checksum <> calc then
		    Break // plugin broken?
		  end if
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub log(s as string)
		  List.AddRow s
		  list.ScrollPosition = list.ScrollPosition + 1
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		dsock As RAWSocketMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		ssock As MyRawSocket
	#tag EndProperty


#tag EndWindowCode

#tag Events iMessage
	#tag Event
		Sub TextChange()
		  SendButton.Enabled = me.text.len > 0
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SendButton
	#tag Event
		Sub Action()
		  dim Flags as integer = 0
		  dim r as Integer
		  
		  // port
		  dim port as integer = val(iPort.Text)
		  if port <= 0 or port >= 65535 then
		    break
		    MsgBox "Wrong port: "+iPort.Text
		    Return
		  end if
		  
		  
		  // dest address
		  ' UDP protocol header:
		  'struct udp_header
		  '{
		  'u_int32_t source_address;
		  'u_int32_t dest_address;
		  'u_int8_t placeholder;
		  'u_int8_t protocol;
		  'u_int16_t udp_length;
		  '};
		  
		  // IP Header
		  'struct iphdr {
		  '__u8    ihl:4,version:4;
		  '__u8    tos;
		  '__be16    tot_len;
		  '__be16    id;
		  '__be16    frag_off;
		  '__u8    ttl;
		  '__u8    protocol;
		  '__sum16    check;
		  '__be32    saddr;
		  '__be32    daddr;
		  '/*The options start here. */
		  '};
		  'struct udphdr
		  '{
		  'u_int16_t uh_sport;        /* source port */
		  'u_int16_t uh_dport;        /* destination port */
		  'u_int16_t uh_ulen;        /* udp length */
		  'u_int16_t uh_sum;        /* udp checksum */
		  '};
		  
		  // message
		  dim m as string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" // ConvertEncoding(iMessage.Text, encodings.UTF8)
		  dim data as MemoryBlock = m
		  
		  // allocate memory
		  dim udph as new MemoryBlock(8)
		  dim iph  as new MemoryBlock(20)
		  
		  // convert IPv4 from text to numeric value
		  dim DestIP   as Uint32 = RAWSocketMBS.inet_addr(iIP.Text)
		  dim SourceIP as Uint32 = RAWSocketMBS.inet_addr("127.0.0.1")
		  System.DebugLog "DestIP: &h"+hex(DestIP)
		  System.DebugLog "SourceIP: &h"+hex(SourceIP)
		  
		  // create destination address for OS. This is for Mac! Windows and Linux have different structures
		  dim dest as new MemoryBlock(16)
		  #if TargetMacOS
		    dest.UInt8Value(0)  = dest.size
		    dest.UInt8Value(1)  = RAWSocketMBS.AddressFamilyINet
		    dest.UInt16Value(2) = RAWSocketMBS.htons(port)
		    dest.UInt32Value(4) = DestIP
		  #else
		    dest.UInt8Value(0)  = RAWSocketMBS.AddressFamilyINet
		    dest.UInt16Value(2) = RAWSocketMBS.htons(port)
		    dest.UInt32Value(4) = DestIP
		  #endif
		  
		  dim TotalLength as integer = (iph.size + data.size + udph.size)
		  
		  // Fill in the IP Header
		  iph.UInt8Value(0)   = &h45 // version (4) and Header length (5*4 bytes)
		  iph.UInt8Value(1)   = 0 // tos
		  iph.UInt16Value(2)  = TotalLength // total length
		  iph.UInt16Value(4)  = RAWSocketMBS.htons(54321) // packet ID
		  iph.UInt16Value(6)  = RAWSocketMBS.htons(0)
		  iph.UInt8Value(8)   = 255
		  iph.UInt8Value(9)   = RAWSocketMBS.ProtocolUDP // 17
		  iph.UInt16Value(10) = 0 // Set to 0 before calculating checksum
		  iph.UInt32Value(12) = SourceIP
		  iph.UInt32Value(16) = DestIP
		  
		  // IP checksum
		  dim ipData as MemoryBlock = iph + udph + data
		  iph.UInt16Value(10) = RAWSocketMBS.CalcChecksum(ipData, ipData.size)
		  System.DebugLog "checksum ip: &h"+ hex(iph.UInt16Value(10))
		  
		  // UDP header
		  udph.UInt16Value(0) = RAWSocketMBS.htons(port) // source port
		  udph.UInt16Value(2) = RAWSocketMBS.htons(port) // dest port
		  udph.UInt16Value(4) = RAWSocketMBS.htons(udph.size+data.size) // UDP header size + data size
		  udph.UInt16Value(6) = 0 // leave checksum 0 now, filled later by pseudo header
		  
		  #if true then
		    // Checksum optional
		    
		    // Now the UDP checksum using the pseudo header
		    dim psh as new MemoryBlock(12)
		    psh.UInt32Value(0)  = SourceIP
		    psh.UInt32Value(4)  = DestIP
		    psh.UInt8Value(8)   = 0
		    psh.UInt8Value(9)   = RAWSocketMBS.ProtocolUDP
		    psh.UInt16Value(10) = RAWSocketMBS.htons(udph.size + data.size)
		    
		    dim pseudogram as MemoryBlock = psh + udph + data
		    udph.UInt16Value(6) = RAWSocketMBS.CalcChecksum(pseudogram, pseudogram.size)
		    System.DebugLog "checksum udp: &h"+ hex(udph.UInt16Value(6))
		  #endif
		  
		  dim DataToSend as MemoryBlock = iph + udph + data
		  System.DebugLog "DataToSend: "+str(DataToSend.size)
		  
		  // send
		  if dsock <> nil then
		    r = dsock.SendTo(DataToSend, DataToSend.size, Flags, dest, dest.size)
		    
		    System.DebugLog "SendTo: "+str(r)+" "+str(dsock.Lasterror)
		  end if
		  
		  iMessage.Text = ""
		  
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
