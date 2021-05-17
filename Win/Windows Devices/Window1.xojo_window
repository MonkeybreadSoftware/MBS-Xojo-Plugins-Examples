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
   MenuBar         =   2084152539
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Devices on this system"
   Visible         =   True
   Width           =   600
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
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
      Height          =   387
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Name	Value"
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
      Width           =   602
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // only serial devices:
		  
		  'const PortsGUID = "{4D36E978-E325-11CE-BFC1-08002BE10318}"
		  'dim devices(-1) as WindowsDeviceMBS = WindowsDeviceMBS.Devices(PortsGUID)
		  
		  // all devices
		  dim devices(-1) as WindowsDeviceMBS = WindowsDeviceMBS.Devices
		  
		  
		  for each d as WindowsDeviceMBS in devices
		    List.AddFolder d.Description
		    List.rowtag(List.LastIndex)=d
		  next
		  
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub ExpandRow(row As Integer)
		  dim w as WindowsDeviceMBS = me.RowTag(row)
		  
		  me.AddRow "Address", str(w.Address)
		  me.AddRow "BusNumber", str(w.BusNumber)
		  me.AddRow "BusTypeGUID", w.BusTypeGUID
		  me.AddRow "Capabilities", str(w.Capabilities)
		  me.AddRow "Characteristics", str(w.Characteristics)
		  me.AddRow "Class", w.ClassName
		  me.AddRow "ClassGUID", w.ClassGUID
		  me.AddRow "ConfigFlags", str(W.ConfigFlags)
		  me.AddRow "CompatibleIDs", Join(w.CompatibleIDs)
		  me.AddRow "Description", w.Description
		  me.AddRow "DeviceType", str(w.DeviceType)
		  me.AddRow "Driver", w.Driver
		  me.AddRow "EnumeratorName", w.EnumeratorName
		  me.AddRow "Exclusive", str(w.Exclusive)
		  me.AddRow "FriendlyName", w.FriendlyName
		  me.AddRow "HardwareID", Join(w.HardwareID)
		  me.AddRow "InstallState", str(w.InstallState)
		  me.AddRow "LegacyBusType", str(w.LegacyBusType)
		  me.AddRow "LocationInformation", w.LocationInformation
		  me.AddRow "LocationPaths", join(w.LocationPaths)
		  me.AddRow "LowerFilters", join(w.LowerFilters)
		  me.AddRow "Manufacturer", w.Manufacturer
		  me.AddRow "PhysicalDeviceObjectName", w.PhysicalDeviceObjectName
		  me.AddRow "RemovalPolicy", str(w.RemovalPolicy)
		  me.AddRow "RemovalPolicyHWDefault", str(W.RemovalPolicyHWDefault)
		  me.AddRow "RemovalPolicyOverride", str(w.RemovalPolicyOverride)
		  me.AddRow "SecurityDescriptor", w.SecurityDescriptor
		  me.AddRow "Service", w.Service
		  me.AddRow "UINumber", str(w.UINumber)
		  me.AddRow "UpperFilters", join(w.UpperFilters)
		  
		  me.AddRow "DeviceID", w.DeviceID
		  me.AddRow "DevicePath", w.DevicePath
		  me.AddRow "HID", str(w.HID)
		  if w.HID then
		    me.AddRow "Accessible", str(w.HIDAccessible)
		    me.AddRow "ProductName", w.HIDProductName
		    me.AddRow "ManufacturerName", w.HIDManufacturerName
		    me.AddRow "SerialNumber", w.HIDSerialNumber
		    me.AddRow "InputReportByteLength", str(w.HIDInputReportByteLength)
		    me.AddRow "OutputReportByteLength", str(w.HIDOutputReportByteLength)
		    me.AddRow "FeatureReportByteLength", str(w.HIDFeatureReportByteLength)
		    me.AddRow "ProductID", str(w.HIDProductID)
		    me.AddRow "VendorID", str(w.HIDVendorID)
		    me.AddRow "VersionNumber", str(w.HIDVersionNumber)
		    
		  end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  MsgBox me.Cell(me.ListIndex,0)+EndOfLine+me.Cell(me.ListIndex,1)
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
