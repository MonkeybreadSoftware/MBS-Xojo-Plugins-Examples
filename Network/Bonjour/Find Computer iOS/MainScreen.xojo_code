#tag MobileScreen
Begin MobileScreen MainScreen
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   HasNavigationBar=   True
   LargeTitleDisplayMode=   2
   Left            =   0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   "&h00000000"
   Title           =   "Devices"
   Top             =   0
   Begin iOSMobileTable List
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowRefresh    =   False
      AllowSearch     =   False
      AutoLayout      =   List, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   List, 2, <Parent>, 2, False, +1.00, 4, 1, -0, , True
      AutoLayout      =   List, 3, TopLayoutGuide, 3, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   List, 4, BottomLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      ControlCount    =   0
      EditingEnabled  =   False
      EditingEnabled  =   False
      Enabled         =   True
      EstimatedRowHeight=   -1
      Format          =   0
      Height          =   503
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      SectionCount    =   0
      TintColor       =   ""
      Top             =   65
      Visible         =   True
      Width           =   320
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub Opening()
		  app.MainScreen = Self
		  
		  InitBonjour
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddDomain(type as string)
		  If Domains.IndexOf(type) < 0 Then
		    
		    Domains.Append type
		    
		    update
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddType(type as string)
		  If ServiceTypes.IndexOf(Type) < 0 Then
		    
		    list.AddSection type
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
		  'serviceTypes.append "_ftp._tcp"
		  serviceTypes.append "_afpovertcp._tcp"
		  'serviceTypes.append "_nfs._tcp"
		  serviceTypes.append "_http._tcp"
		  serviceTypes.append "_printer._tcp"
		  'serviceTypes.append "_ichat._tcp"
		  'serviceTypes.append "_presence._tcp"
		  'serviceTypes.append "_daap._tcp"
		  'serviceTypes.append "_dpap._tcp"
		  serviceTypes.append "_ipp._tcp"
		  'serviceTypes.append "_pdl-datastream._tcp"
		  'serviceTypes.append "_distcc._tcp"
		  'serviceTypes.append "_xserveraid._tcp"
		  
		  For Each serviceType As String In serviceTypes
		    list.AddSection serviceType
		  Next
		  
		  
		  browsers = new Dictionary
		  
		  #if TargetMachO
		    m = new MyMetaQuery
		  #endif
		  
		  MyDomainEnumeration = new MyDomainEnumeration
		  
		  Call MyDomainEnumeration.EnumerateDomains(DNSServiceDomainEnumerationMBS.kFlagsBrowseDomains, DNSServiceDomainEnumerationMBS.kInterfaceIndexAny)
		  
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
		  fullname = fullname.ReplaceAll("\032", " ")
		  
		  Dim SectionUbound As Integer = list.SectionCount-1
		  For SectionIndex As Integer = 0 To SectionUbound
		    
		    Dim RowUbound As Integer = List.RowCount(SectionIndex) - 1
		    For RowIndex As Integer = 0 To RowUbound
		      Dim v As MobileTableCellData = list.RowCellData(SectionIndex, RowIndex)
		      Dim e As entry = v.tag
		      
		      If e.domain = domain And e.RegType = RegType And e.ServiceName = ServiceName Then
		        
		        // update this one
		        
		        e.status = status
		        e.host = host
		        e.fullname = fullname
		        
		        v.Text = domain + ServiceName
		        v.DetailText = status
		        
		        list.ReloadRow(SectionIndex, RowIndex)
		        
		        Return
		      end if
		    Next
		  next
		  
		  // new entry
		  
		  Dim e As New Entry
		  
		  e.domain = domain
		  e.RegType = RegType
		  e.host = host
		  e.ServiceName = ServiceName
		  e.status = status
		  e.fullname = fullname
		  
		  Dim value As MobileTableCellData = list.CreateCell(ServiceName + domain, status)
		  value.Tag = e
		  
		  
		  Dim section As Integer = ServiceTypes.IndexOf(RegType)
		  If section = -1 Then
		    // extra dot on end of name!?
		    RegType = RegType.Left(RegType.Length - 1)
		    section = ServiceTypes.IndexOf(RegType)
		  End If
		  
		  List.AddRow section, value
		  
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
		  
		  if b.AddrInfo(b.kInterfaceIndexAny, b.kProtocolIPv4, HostName) then
		    addrinfo.Append b
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartBrowse(domain as string, ServiceType as string)
		  dim key as string = ServiceType+domain
		  
		  if browsers.HasKey(key) then Return
		  
		  dim b as new MyBrowser
		  
		  If b.Browse(b.kInterfaceIndexAny, ServiceType,domain) Then
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
		  ClearLookups
		  
		  Dim b As New MyLookup
		  
		  b.type = type
		  b.name = name
		  b.domain = domain
		  
		  if b.Resolve(b.kInterfaceIndexAny, name, type, domain) then
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
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
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
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackButtonCaption"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasNavigationBar"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIcon"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LargeTitleDisplayMode"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="MobileScreen.LargeTitleDisplayModes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabBarVisible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TintColor"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="ColorGroup"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
