#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1363269586
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "DNS Query on Windows"
   Visible         =   True
   Width           =   600
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   333
      HelpTag         =   ""
      Hierarchical    =   True
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   47
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin TextField EditField1
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
      Left            =   20
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "0"
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   "True"
      Styled          =   ""
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "monkeybreadsoftware.de"
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   468
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Run"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   500
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   15
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub Add(r as WindowsDNSRecordAAAAMBS)
		  if r<>Nil then
		    List.AddRow "Address",r.Address
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Add(r as WindowsDNSRecordAMBS)
		  if r<>Nil then
		    List.AddRow "Address",r.Address
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Add(w as WindowsDNSRecordMBS)
		  if w<>Nil then
		    List.AddFolder GetTypeName(w.Type)
		    List.RowTag(List.LastIndex)=w
		    List.Expanded(List.LastIndex)=true
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Add(r as WindowsDNSRecordMInfoMBS)
		  if r<>Nil then
		    List.AddRow "NameMailbox",r.NameMailbox
		    List.AddRow "NameErrorsMailbox",r.NameErrorsMailbox
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Add(r as WindowsDNSRecordMXMBS)
		  if r<>Nil then
		    List.AddRow "NameExchange",r.NameExchange
		    List.AddRow "Preference",str(r.Preference)
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Add(r as WindowsDNSRecordNullMBS)
		  if r<>Nil then
		    List.AddRow "ByteCount",str(r.ByteCount)
		    List.AddRow "Data", ReplaceNonPrintableCharactersMBS(r.Data,asc("."))
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Add(r as WindowsDNSRecordPTRMBS)
		  if r<>Nil then
		    List.AddRow "NameHost",r.NameHost
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Add(r as WindowsDNSRecordSOAMBS)
		  if r<>Nil then
		    List.AddRow "NamePrimaryServer", r.NamePrimaryServer
		    List.AddRow "NameAdministrator", r.NameAdministrator
		    List.AddRow "SerialNo", str(r.SerialNo)
		    List.AddRow "Refresh", str(r.Refresh)
		    List.AddRow "Retry", str(r.Retry)
		    List.AddRow "Expire", str(r.Expire)
		    List.AddRow "DefaultTTL", str(r.DefaultTTL)
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Add(r as WindowsDNSRecordTXTMBS)
		  if r<>Nil then
		    List.AddRow "StringCount", STR(r.StringCount)
		    
		    dim a() as string = r.Strings
		    dim c as integer = r.StringCount-1
		    for i as integer = 0 to c
		      List.AddRow "String("+str(i)+")", a(i)
		    next
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTypeName(n as integer) As string
		  Select case n
		  case WindowsDNSRecordMBS.kDNSTypeA
		    return "A"
		  case WindowsDNSRecordMBS.kDNSTypeNS
		    return "NS"
		  case WindowsDNSRecordMBS.kDNSTypeMD
		    return "MD"
		  case WindowsDNSRecordMBS.kDNSTypeMF
		    return "MF"
		  case WindowsDNSRecordMBS.kDNSTypeCNAME
		    return "CNAME"
		  case WindowsDNSRecordMBS.kDNSTypeSOA
		    return "SOA"
		  case WindowsDNSRecordMBS.kDNSTypeMB
		    return "MB"
		  case WindowsDNSRecordMBS.kDNSTypeMG
		    return "MG"
		  case WindowsDNSRecordMBS.kDNSTypeMR
		    return "MR"
		  case WindowsDNSRecordMBS.kDNSTypeNULL
		    return "NULL"
		  case WindowsDNSRecordMBS.kDNSTypeWKS
		    return "WKS"
		  case WindowsDNSRecordMBS.kDNSTypePTR
		    return "PTR"
		  case WindowsDNSRecordMBS.kDNSTypeHINFO
		    return "HINFO"
		  case WindowsDNSRecordMBS.kDNSTypeMINFO
		    return "MINFO"
		  case WindowsDNSRecordMBS.kDNSTypeMX
		    return "MX"
		  case WindowsDNSRecordMBS.kDNSTypeTEXT
		    return "TEXT"
		    
		    //  RFC 1183
		  case WindowsDNSRecordMBS.kDNSTypeRP
		    return "RP"
		  case WindowsDNSRecordMBS.kDNSTypeAFSDB
		    return "AFSDB"
		  case WindowsDNSRecordMBS.kDNSTypeX25
		    return "X25"
		  case WindowsDNSRecordMBS.kDNSTypeISDN
		    return "ISDN"
		  case WindowsDNSRecordMBS.kDNSTypeRT
		    return "RT"
		    
		    //  RFC 1348
		  case WindowsDNSRecordMBS.kDNSTypeNSAP
		    return "NSAP"
		  case WindowsDNSRecordMBS.kDNSTypeNSAPPTR
		    return "NSAPPTR"
		    
		    //  RFC 2065    (DNS security)
		  case WindowsDNSRecordMBS.kDNSTypeSIG
		    return "SIG"
		  case WindowsDNSRecordMBS.kDNSTypeKEY
		    return "KEY"
		    
		    //  RFC 1664    (X.400 mail)
		  case WindowsDNSRecordMBS.kDNSTypePX
		    return "PX"
		    
		    //  RFC 1712    (Geographic position)
		  case WindowsDNSRecordMBS.kDNSTypeGPOS
		    return "GPOS"
		    
		    //  RFC 1886    (IPv6 Address)
		  case WindowsDNSRecordMBS.kDNSTypeAAAA
		    return "AAAA"
		    
		    //  RFC 1876    (Geographic location)
		  case WindowsDNSRecordMBS.kDNSTypeLOC
		    return "LOC"
		    
		    //  RFC 2065    (Secure negative response)
		  case WindowsDNSRecordMBS.kDNSTypeNXT
		    return "NXT"
		    
		    //  RFC 2052    (Service location)
		  case WindowsDNSRecordMBS.kDNSTypeSRV
		    return "SRV"
		    
		    //  ATM Standard something-or-another
		  case WindowsDNSRecordMBS.kDNSTypeATMA
		    return "ATMA"
		    
		    //
		    //  Query only types (1035, 1995)
		    //
		  case WindowsDNSRecordMBS.kDNSTypeTKEY
		    return "TKEY"
		  case WindowsDNSRecordMBS.kDNSTypeTSIG
		    return "TSIG"
		  case WindowsDNSRecordMBS.kDNSTypeIXFR
		    return "IXFR"
		  case WindowsDNSRecordMBS.kDNSTypeAXFR
		    return "AXFR"
		  case WindowsDNSRecordMBS.kDNSTypeMAILB
		    return "MAILB"
		  case WindowsDNSRecordMBS.kDNSTypeMAILA
		    return "MAILA"
		  case WindowsDNSRecordMBS.kDNSTypeALL
		    return "ALL"
		  case WindowsDNSRecordMBS.kDNSTypeANY
		    return "ANY"
		    
		    //
		    //  Temp Microsoft types -- use until get IANA approval for real type
		    //
		  case WindowsDNSRecordMBS.kDNSTypeWINS
		    return "WINS"
		  case WindowsDNSRecordMBS.kDNSTypeWINSR
		    return "WINSR"
		  case WindowsDNSRecordMBS.kDNSTypeNBSTAT
		    return "NBSTAT"
		  else
		    Return str(n)
		  end Select
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub run()
		  List.DeleteAllRows
		  
		  dim w as WindowsDNSRecordMBS = WindowsDNSRecordMBS.Query(EditField1.text, WindowsDNSRecordMBS.kDNSTypeALL, WindowsDNSRecordMBS.kDNSQueryStandard)
		  
		  if w<>Nil then
		    
		    Add w
		    while w.NextRecord<>Nil
		      w = w.NextRecord
		      
		      add w
		    wend
		  else
		    beep
		  end if
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub ExpandRow(row As Integer)
		  dim v as Variant = me.RowTag(row)
		  dim s as string
		  
		  if v isa WindowsDNSRecordMBS then
		    dim w as WindowsDNSRecordMBS = WindowsDNSRecordMBS(v)
		    
		    
		    
		    
		    List.AddRow "Name: "+w.Name
		    List.AddRow "Type: "+str(w.type)
		    List.AddRow "DataLength: "+str(w.DataLength)
		    
		    Select case w.Section
		    case WindowsDNSRecordMBS.kSectionQuestion
		      s = " = SectionQuestion"
		    case WindowsDNSRecordMBS.kSectionAnswer
		      s = " = SectionAnswer"
		    case WindowsDNSRecordMBS.kSectionAuthority
		      s = " = SectionAuthority"
		    case WindowsDNSRecordMBS.kSectionAddtional
		      s = " = SectionAddtional"
		    else
		      s = ""
		    end Select
		    
		    List.AddRow "Section: "+str(w.Section)+s
		    
		    Select case w.Section
		    case WindowsDNSRecordMBS.kCharSetUnknown
		      s = " = CharSetUnknown"
		    case WindowsDNSRecordMBS.kCharSetUnicode
		      s = " = CharSetUnicode"
		    case WindowsDNSRecordMBS.kCharSetUtf8
		      s = " = CharSetUtf8"
		    case WindowsDNSRecordMBS.kCharSetAnsi
		      s = " = CharSetAnsi"
		    else
		      s = ""
		    end Select
		    
		    List.AddRow "CharSet: "+str(w.CharSet)+s
		    
		    add w.A
		    add w.AAAA
		    add w.SOA
		    add w.NS
		    add w.CNAME
		    add w.MB
		    add w.MD
		    add w.MF
		    add w.MG
		    add w.MR
		    add w.MINFO
		    add w.RP
		    add w.MX
		    add w.AFSDB
		    add w.RT
		    add w.HINFO
		    add w.ISDN
		    add w.TXT
		    add w.X25
		    add w.Null
		    
		    
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  run
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
