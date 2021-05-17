#tag WebPage
Begin WebPage WebPage1
   AllowTabOrderWrap=   True
   Compatibility   =   ""
   ControlID       =   ""
   Enabled         =   True
   Height          =   508
   ImplicitInstance=   True
   Index           =   0
   Indicator       =   0
   IsImplicitInstance=   False
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   244
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   LockVertical    =   False
   MinimumHeight   =   400
   MinimumWidth    =   600
   TabIndex        =   0
   Title           =   "Infos"
   Top             =   170
   Visible         =   True
   Width           =   1008
   _ImplicitInstance=   False
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mName          =   ""
   _mPanelIndex    =   -1
   Begin WebListBox List
      ColumnCount     =   2
      ColumnWidths    =   "30%,70%"
      ControlID       =   ""
      Enabled         =   True
      HasHeader       =   False
      Height          =   440
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   ""
      InitialValue    =   "Key	Value"
      LastAddedRowIndex=   0
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      NoRowsMessage   =   ""
      RowCount        =   0
      RowSelectionType=   1
      Scope           =   0
      SearchCriteria  =   ""
      SelectedRowColor=   &c0272D300
      SelectedRowIndex=   0
      TabIndex        =   1
      Tooltip         =   ""
      Top             =   48
      Visible         =   True
      Width           =   968
      _mPanelIndex    =   -1
   End
   Begin WebLabel Label1
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   22
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   0
      TabIndex        =   2
      Text            =   "Just a few values you can grab on the session and server."
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   14
      Underline       =   False
      Visible         =   True
      Width           =   843
      _mPanelIndex    =   -1
   End
   Begin WebLink Link1
      Appearance      =   0
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   22
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   False
      Multiline       =   False
      Scope           =   0
      TabIndex        =   3
      Target          =   2
      Text            =   "© 2010-2012 by Monkeybread Software. Visit our blog for news"
      TextAlignment   =   ""
      TextColor       =   &c0000FF00
      Tooltip         =   ""
      Top             =   486
      Underline       =   False
      URL             =   "http://www.mbsplugins.de/"
      Visible         =   True
      Width           =   423
      _mPanelIndex    =   -1
   End
   Begin WebLabel Label2
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   22
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   455
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   False
      Multiline       =   False
      Scope           =   0
      TabIndex        =   4
      Text            =   "Compiled with..."
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   486
      Underline       =   False
      Visible         =   True
      Width           =   523
      _mPanelIndex    =   -1
   End
   Begin WebTimer Timer1
      ControlID       =   ""
      Enabled         =   True
      Index           =   -2147483648
      Location        =   "Locations.Browser"
      LockedInPosition=   False
      Period          =   1000
      RunMode         =   2
      Scope           =   0
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Event
		Sub Open()
		  update
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AutoUpdate()
		  dim d as new date
		  
		  List.Cell(0,1) = d.LongDate+" "+d.LongTime
		  List.Cell(2,1) = str(app.SessionCount)
		  
		  dim l as new LinuxSysInfoMBS
		  
		  if l.Valid = false then
		    Return
		  end if
		  
		  list.Cell( FindIndex("NumberOfProcesses"), 1) =  str(l.NumberOfProcesses)
		  list.Cell( FindIndex("availablePhysicalPages"), 1) = str(l.availablePhysicalPages)+" pages"
		  
		  dim MB as double = 1024*1024
		  
		  dim n as integer = l.upTime
		  dim seconds as integer = n mod 60
		  n = n \ 60
		  dim minutes as integer = n mod 60
		  n = n \ 60
		  dim hours as integer = n mod 24
		  n = n \ 24
		  dim days as integer = n
		  
		  n = FindIndex("availablePhysicalPages")
		  list.Cell( n, 1) = str(l.availablePhysicalPages)+" pages"
		  list.Cell( n+1, 1) = str(l.upTime)+" seconds"
		  list.Cell( n+2, 1) = str(Days)+" days, "+str(hours)+" hours, "+str(minutes)+" minutes, "+str(seconds)+" seconds"
		  list.Cell( n+3, 1) = str(l.loads(0))
		  list.Cell( n+4, 1) = str(l.loads(1))
		  list.Cell( n+5, 1) = str(l.loads(2))
		  list.Cell( n+6, 1) = format(l.TotalRam / MB, "0.0") + " MB"
		  list.Cell( n+7, 1) = format(l.FreeRam / MB, "0.0") + " MB"
		  list.Cell( n+8, 1) = format(l.SharedRam / MB, "0.0") + " MB"
		  list.Cell( n+9, 1) = format(l.BufferRam / MB, "0.0") + " MB"
		  list.Cell( n+10, 1) = format(l.TotalSwap / MB, "0.0") + " MB"
		  list.Cell( n+11, 1) = format(l.FreeSwap / MB, "0.0") + " MB"
		  list.Cell( n+12, 1) = format(l.TotalHigh / MB, "0.0") + " MB"
		  list.Cell( n+13, 1) = format(l.FreeHigh / MB, "0.0") + " MB"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindIndex(name as string) As integer
		  dim c as integer = List.RowCount-1
		  for i as integer = 0 to c
		    
		    if List.Cell(i, 0) = name then 
		      Return i
		    end if
		  next
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBrowserName(s as WebSession.BrowserType) As string
		  Select case s
		  case WebSession.BrowserType.Android
		    Return "Andriod"
		  case WebSession.BrowserType.Blackberry
		    Return "Blackberry"
		  case WebSession.BrowserType.Chrome
		    Return "Chrome"
		  case WebSession.BrowserType.ChromeOS
		    Return "ChromeOS"
		  case WebSession.BrowserType.Firefox
		    Return "Firefox"
		  case WebSession.BrowserType.InternetExplorer
		    Return "InternetExplorer"
		  case WebSession.BrowserType.Opera
		    Return "Opera"
		  case WebSession.BrowserType.Safari
		    Return "Safari"
		  case WebSession.BrowserType.SafariMobile
		    Return "SafariMobile"
		  case WebSession.BrowserType.Unknown
		    Return "Unknown"
		  else
		    Return "Unkown: "+str(integer(s))
		  end Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPlatformName(s as WebSession.PlatformType) As string
		  Select case s
		  case WebSession.PlatformType.AndroidPhone
		    Return "AndroidPhone"
		  case WebSession.PlatformType.AndroidTablet
		    Return "AndroidTablet"
		  case WebSession.PlatformType.Blackberry
		    Return "Blackberry"
		  case WebSession.PlatformType.iPad
		    Return "iPad"
		  case WebSession.PlatformType.iPhone
		    Return "iPhone"
		  case WebSession.PlatformType.iPodTouch
		    Return "iPodTouch"
		  case WebSession.PlatformType.Linux
		    Return "Linux"
		  case WebSession.PlatformType.Macintosh
		    Return "Macintosh"
		  case WebSession.PlatformType.PS3
		    Return "PS3"
		  case WebSession.PlatformType.Unknown
		    Return "Unknown"
		  case WebSession.PlatformType.WebOS
		    Return "WebOS"
		  case WebSession.PlatformType.Wii
		    Return "Wii"
		  case WebSession.PlatformType.Windows
		    Return "Windows"
		  else
		    Return "Unkown: "+str(integer(s))
		  end Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRenderingEngineName(s as WebSession.EngineType) As string
		  Select case s
		  case WebSession.EngineType.Gecko
		    Return "Gecko"
		  case WebSession.EngineType.Presto
		    Return "Presto"
		  case WebSession.EngineType.Trident
		    Return "Trident"
		  case WebSession.EngineType.Unknown
		    Return "Unknown"
		  case WebSession.EngineType.WebKit
		    Return "WebKit"
		  else
		    Return "Unkown: "+str(integer(s))
		  end Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update()
		  dim mysession as Session = Session
		  list.DeleteAllRows
		  
		  dim d as new date
		  
		  List.AddRow "Time on Server:", d.LongDate+" "+d.LongTime
		  List.AddRow "Web App running since:", app.StartDate.LongDate+" "+app.StartDate.LongTime
		  List.AddRow "Number of sessions:", str(app.SessionCount)
		  List.AddRow "Detected Browser", GetBrowserName(mysession.Browser)
		  List.AddRow "Detected Platform", GetPlatformName(mysession.Platform)
		  List.AddRow "Detected Rendering Engine", GetRenderingEngineName(mysession.RenderingEngine)
		  List.AddRow "Detected Remote Address", mysession.RemoteAddress
		  
		  // you need MBS Real Studio Util Plugin
		  List.AddRow "Computer Name",SystemInformationMBS.ComputerName
		  List.AddRow "CPU Brand String",SystemInformationMBS.CPUBrandString
		  List.AddRow "Processor Count", str(SystemInformationMBS.ProcessorCount)
		  
		  list.AddRow "Header", str(mysession.HeaderCount)
		  dim u as integer = mysession.HeaderCount
		  for i as integer = 0 to u-1
		    dim h as string = mysession.HeaderName(i)
		    
		    List.AddRow h, mysession.Header(h)
		  next
		  
		  list.AddRow "URL Parameter", str(mysession.URLParameterCount)
		  u = mysession.URLParameterCount
		  for i as integer = 0 to u-1
		    dim h as string = mysession.URLParameterName(i)
		    
		    List.AddRow h, mysession.URLParameter(h)
		  next
		  
		  
		  dim l as new LinuxSysInfoMBS 
		  
		  if l.Valid = false then
		    Return
		  end if
		  
		  List.AddRow "NumberOfProcesses", str(l.NumberOfProcesses)
		  List.AddRow "NumberOfProcessors", str(l.NumberOfProcessors)
		  List.AddRow "NumberOfProcessorsConfigured", str(l.NumberOfProcessorsConfigured)
		  List.AddRow "PhysicalPages", str(l.PhysicalPages)+" pages"
		  List.AddRow "availablePhysicalPages", str(l.availablePhysicalPages)+" pages"
		  
		  dim n as integer = l.upTime
		  dim seconds as integer = n mod 60
		  n = n \ 60
		  dim minutes as integer = n mod 60
		  n = n \ 60
		  dim hours as integer = n mod 24
		  n = n \ 24
		  dim days as integer = n
		  
		  
		  List.AddRow "upTime", str(l.upTime)+" seconds"
		  List.AddRow "", str(Days)+" days, "+str(hours)+" hours, "+str(minutes)+" minutes, "+str(seconds)+" seconds"
		  
		  List.AddRow "loads 1 min", str(l.loads(0))
		  List.AddRow "loads 5 min", str(l.loads(1))
		  List.AddRow "loads 15 min", str(l.loads(2))
		  
		  dim MB as double = 1024*1024
		  
		  List.AddRow "TotalRam", format(l.TotalRam / MB, "0.0") + " MB"
		  List.AddRow "FreeRam", format(l.FreeRam / MB, "0.0") + " MB"
		  List.AddRow "SharedRam", format(l.SharedRam / MB, "0.0") + " MB"
		  List.AddRow "BufferRam", format(l.BufferRam / MB, "0.0") + " MB"
		  List.AddRow "TotalSwap", format(l.TotalSwap / MB, "0.0") + " MB"
		  List.AddRow "FreeSwap", format(l.FreeSwap / MB, "0.0") + " MB"
		  List.AddRow "TotalHigh", format(l.TotalHigh / MB, "0.0") + " MB"
		  List.AddRow "FreeHigh", format(l.FreeHigh / MB, "0.0") + " MB"
		  
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Label2
	#tag Event
		Sub Opening()
		  me.text = "Compiled with Real Studio "+RBVersionString+" and MBS Real Studio Plugins "+mbs.VersionString
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Run()
		  AutoUpdate
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="_mPanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue="-1"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutType"
		Visible=true
		Group="Behavior"
		InitialValue="LayoutTypes.Fixed"
		Type="LayoutTypes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Fixed"
			"1 - Flex"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockHorizontal"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockVertical"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignHeight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignWidth"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mName"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="IsImplicitInstance"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabOrderWrap"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Visual Controls"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Indicator"
		Visible=false
		Group="Visual Controls"
		InitialValue=""
		Type="WebUIControl.Indicators"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Primary"
			"2 - Secondary"
			"3 - Success"
			"4 - Danger"
			"5 - Warning"
			"6 - Info"
			"7 - Light"
			"8 - Dark"
			"9 - Link"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutDirection"
		Visible=true
		Group="WebView"
		InitialValue="LayoutDirections.LeftToRight"
		Type="LayoutDirections"
		EditorType="Enum"
		#tag EnumValues
			"0 - LeftToRight"
			"1 - RightToLeft"
			"2 - TopToBottom"
			"3 - BottomToTop"
		#tag EndEnumValues
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
		Name="Index"
		Visible=false
		Group="ID"
		InitialValue=""
		Type="Integer"
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
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_ImplicitInstance"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
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
#tag EndViewBehavior
