#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   526
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   -1130394432
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Find computers"
   Visible         =   True
   Width           =   977
   Begin ListBox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   6
      ColumnsResizable=   True
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
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   513
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Domain	Service	Name	IP	Host	Fullname"
      Italic          =   False
      Left            =   -1
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
      Top             =   -1
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   979
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  SetMaximumOpenFileCountMacOSXMBS 10000
		  
		  InitBonjour
		  'InitUDP
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddDomain(type as string)
		  if Domains.IndexOf(type) < 0 then
		    
		    Domains.Append type
		    update
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddType(type as string)
		  if ServiceTypes.IndexOf(Type) < 0 then
		    
		    ServiceTypes.Append type
		    update
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearAddrInfo()
		  dim u as integer = UBound(addrinfo)
		  for i as integer = u downto 0
		    if addrinfo(i).done then
		      addrinfo.Remove i
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearLookups()
		  
		  dim u as integer = UBound(lookup)
		  for i as integer = u downto 0
		    if lookup(i).done then
		      lookup.Remove i
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitBonjour()
		  // always search for those:
		  serviceTypes.append "_ftp._tcp"
		  serviceTypes.append "_afpovertcp._tcp"
		  serviceTypes.append "_nfs._tcp"
		  serviceTypes.append "_http._tcp"
		  serviceTypes.append "_printer._tcp"
		  serviceTypes.append "_ichat._tcp"
		  serviceTypes.append "_presence._tcp"
		  serviceTypes.append "_daap._tcp"
		  serviceTypes.append "_dpap._tcp"
		  serviceTypes.append "_ipp._tcp"
		  serviceTypes.append "_pdl-datastream._tcp"
		  serviceTypes.append "_distcc._tcp"
		  serviceTypes.append "_xserveraid._tcp"
		  
		  browsers = new Dictionary
		  
		  #if TargetMachO
		    m = new MyMetaQuery
		  #endif
		  
		  MyDomainEnumeration = new MyDomainEnumeration
		  
		  call MyDomainEnumeration.EnumerateDomains(DNSServiceDomainEnumerationMBS.kFlagsBrowseDomains, DNSServiceDomainEnumerationMBS.kInterfaceIndexAny)
		  
		  update
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitUDP()
		  dim u as new UDPSocket
		  
		  u.port = 0
		  u.Connect
		  
		  for each n as NetworkInterfaceMBS in NetworkInterfaceMBS.AllInterfaces
		    if n.Broadcast then
		      u.Write n.BroadcastAddress, "Hello"
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Report(ServiceName as string, RegType as string, domain as string, status as string, host as string = "", fullname as string = "")
		  fullname = ReplaceAll(fullname, "\032", " ")
		  
		  
		  dim c as integer = List.ListCount-1
		  for i as integer = 0 to c
		    if List.Cell(i,0) = domain then
		      if List.Cell(i,1) = RegType then
		        if List.Cell(i,2) = ServiceName then
		          
		          
		          List.Cell(i,3) = status
		          List.Cell(i,4) = host
		          List.Cell(i,5) = fullname
		          Return
		        end if
		      end if
		    end if
		    
		  next
		  
		  List.AddRow domain, RegType, Servicename, status, host, fullname
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartAddrInfo(name as string, type as string, domain as string, HostName as string, FullName as string, Port as integer)
		  
		  ClearAddrInfo
		  
		  dim b as new MyAddrInfo
		  b.ServiceType = type
		  b.ServiceName = name
		  b.ServiceDomain = domain
		  b.FullName = FullName
		  b.port = port
		  
		  if b.AddrInfo(0, b.kProtocolIPv4, HostName) then
		    addrinfo.Append b
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartBrowse(domain as string, ServiceType as string)
		  dim key as string = ServiceType+domain
		  
		  if browsers.HasKey(key) then Return
		  
		  dim b as new MyBrowser
		  
		  if b.Browse(0,ServiceType,domain) then
		    b.type=ServiceType
		    b.domain = domain
		    browser.Append b
		    browsers.Value(key) = b
		  else
		    System.DebugLog "Failed to init browser for "+ServiceType
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartLookup(name as string, type as string, domain as string)
		  dim b as MyLookup
		  
		  ClearLookups
		  b=new MyLookup
		  
		  b.type = type
		  b.name = name
		  b.domain = domain
		  
		  if b.Resolve(0,name,type,domain) then
		    lookup.Append b
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update()
		  for each domain as string in domains
		    for each ServiceType as string in ServiceTypes
		      StartBrowse domain, ServiceType
		    next
		  next
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		addrinfo(-1) As MyAddrInfo
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected browser(-1) As MyBrowser
	#tag EndProperty

	#tag Property, Flags = &h0
		browsers As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Domains() As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected lookup(-1) As MyLookup
	#tag EndProperty

	#tag Property, Flags = &h0
		m As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		MyDomainEnumeration As MyDomainEnumeration
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			s
		#tag EndNote
		ServiceTypes() As string
	#tag EndProperty


#tag EndWindowCode

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
#tag EndViewBehavior
