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
   MenuBar         =   802088959
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "LibUSB"
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
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   402
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Key	Value"
      Italic          =   False
      Left            =   -1
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   -1
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
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
		  // we have some libraries here:
		  // https://www.monkeybreadsoftware.de/xojo/download/plugin/Libs/
		  
		  #if TargetWin32 then
		    #if Target64Bit then
		      call LibUSBDeviceMBS.LoadLibrary("libusb0.dll") 
		    #else
		      call LibUSBDeviceMBS.LoadLibrary("libusb0_x86.dll") 
		    #endif
		  #endif
		  
		  #if TargetMachO then
		    dim ff as FolderItem = SpecialFolder.Desktop.Child("libusb-1.0.0.dylib")
		    if not LibUSBDeviceMBS.LoadLibrary(ff) then
		      MsgBox LibUSBDeviceMBS.LibraryLoadErrorMessage
		    end if
		  #endif
		  
		  List.AddRow "LibraryLoaded", yes(LibUSBDeviceMBS.LibraryLoaded)
		  List.AddRow "LibraryLoadErrorMessage", LibUSBDeviceMBS.LibraryLoadErrorMessage
		  List.AddRow ""
		  
		  if LibUSBDeviceMBS.LibraryLoaded then
		    
		    try
		      
		      dim v as LibUSBVersionMBS = LibUSBDeviceMBS.LibVersion
		      List.AddRow "LibVersion.Major", str(v.Major)
		      List.AddRow "LibVersion.Minor", str(v.Minor)
		      List.AddRow "LibVersion.Micro", str(v.Micro)
		      List.AddRow "LibVersion.Nano", str(v.Nano)
		      List.AddRow "LibVersion.RC", str(v.RC)
		      List.AddRow "LibVersion.Describe", str(v.Describe)
		      List.AddRow ""
		    catch f as FunctionNotFoundException
		      
		    end try
		    
		    
		    dim r as integer = LibUSBDeviceMBS.Initialize
		    if r = 0 then
		      
		      dim Devices() as LibUSBDeviceMBS = LibUSBDeviceMBS.Devices
		      for each device as LibUSBDeviceMBS in devices
		        
		        List.AddFolder "Device "+str(device.BusNumber)+":"+str(device.DeviceAddress)
		        List.RowTag(List.LastIndex) = device
		        
		        
		      next
		      
		    end if
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FindDevice(row as integer) As LibUSBDeviceMBS
		  for i as integer = row downto 0
		    
		    dim v as Variant = List.RowTag(i)
		    
		    if v isa LibUSBDeviceMBS then
		      return v
		    end if
		    
		  next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Yes(b as Boolean) As string
		  if b then
		    Return "Yes"
		  else
		    return "No"
		  end if
		  
		End Function
	#tag EndMethod


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub ExpandRow(row As Integer)
		  dim v as variant = me.RowTag(row)
		  
		  if v isa LibUSBDeviceMBS then
		    dim d as LibUSBDeviceMBS = v
		    
		    List.AddRow "BusNumber", str(d.BusNumber)
		    List.AddRow "DeviceAddress", str(d.DeviceAddress)
		    List.AddRow "DeviceSpeed", str(d.DeviceSpeed)
		    
		    dim dd as LibUSBDeviceDescriptorMBS = d.GetDeviceDescriptor
		    
		    if dd <> nil then
		      List.AddFolder "Device Descriptor"
		      List.RowTag(List.LastIndex) = dd
		      
		      dim NumConfigurations as integer = dd.NumConfigurations
		      
		      for i as integer = 0 to NumConfigurations-1
		        dim dc as LibUSBConfigDescriptorMBS = d.GetConfigDescriptor(i)
		        
		        List.AddFolder "Config Descriptor "+str(i)
		        List.RowTag(List.LastIndex) = dc
		        
		      next
		      
		    end if
		    
		  end if
		  
		  if v isa LibUSBDeviceDescriptorMBS then
		    dim d as LibUSBDeviceDescriptorMBS = v
		    
		    dim dev as LibUSBDeviceMBS = FindDevice(row)
		    
		    // to query device for descriptors, we need to connect.
		    if not dev.IsOpen then
		      if dev.Open then
		        System.DebugLog "Open okay."
		      else
		        System.DebugLog "Open failed."
		      end if
		    end if
		    
		    
		    List.AddRow "DescriptorType", str(d.DescriptorType)
		    List.AddRow "USBReleaseNumber", hex(d.USBReleaseNumber)
		    List.AddRow "DeviceClass", str(d.DeviceClass)
		    List.AddRow "DeviceSubClass", str(d.DeviceSubClass)
		    List.AddRow "DeviceProtocol", str(d.DeviceProtocol)
		    List.AddRow "MaxPacketSize0", str(d.MaxPacketSize0)
		    List.AddRow "VendorID", str(d.VendorID)
		    List.AddRow "ProductID", str(d.ProductID)
		    List.AddRow "DeviceReleaseNumber", str(d.DeviceReleaseNumber)
		    List.AddRow "IndexManufacturer", str(d.IndexManufacturer)
		    if dev.IsOpen then
		      dim s as string = dev.GetStringDescriptor(d.IndexManufacturer, 0)
		      if s <> "" then
		        List.AddRow "Manufacturer", s
		      else
		        s = dev.GetStringDescriptorAscii(d.IndexManufacturer)
		        List.AddRow "Manufacturer ASCII", s
		      end if
		    end if
		    List.AddRow "IndexProduct", str(d.IndexProduct)
		    if dev.IsOpen then
		      dim s as string = dev.GetStringDescriptor(d.IndexProduct, 0)
		      if s <> "" then
		        List.AddRow "Product", s
		      else
		        s = dev.GetStringDescriptorAscii(d.IndexProduct)
		        List.AddRow "Product ASCII", s
		      end if
		    end if
		    List.AddRow "IndexSerialNumber", str(d.IndexSerialNumber)
		    if dev.IsOpen then
		      dim s as string = dev.GetStringDescriptor(d.IndexSerialNumber, 0)
		      if s <> "" then
		        List.AddRow "SerialNumber", s
		      else
		        s = dev.GetStringDescriptorAscii(d.IndexSerialNumber)
		        List.AddRow "SerialNumber ASCII", s
		      end if
		    end if
		    List.AddRow "NumConfigurations", str(d.NumConfigurations)
		    
		    
		  end if
		  
		  if v isa LibUSBConfigDescriptorMBS then
		    dim d as LibUSBConfigDescriptorMBS = v
		    
		    dim NumInterfaces as integer = d.NumInterfaces
		    
		    List.AddRow "DescriptorType", str(d.DescriptorType)
		    List.AddRow "TotalLength", str(d.TotalLength)
		    List.AddRow "NumInterfaces", str(NumInterfaces)
		    List.AddRow "ConfigurationValue", str(d.ConfigurationValue)
		    List.AddRow "Configuration", str(d.Configuration)
		    List.AddRow "Attributes", str(d.AttributesBitmap)
		    List.AddRow "MaxPower", str(d.MaxPower)
		    
		    
		    for i as integer = 0 to NumInterfaces-1
		      dim dc as LibUSBInterfaceMBS = d.GetInterface(i)
		      
		      List.AddFolder "Interface "+str(i)
		      List.RowTag(List.LastIndex) = dc
		      
		    next
		    
		  end if
		  
		  if v isa LibUSBInterfaceMBS then
		    dim d as LibUSBInterfaceMBS = v
		    dim Count as integer = d.Count
		    
		    List.AddRow "Count", str(Count)
		    
		    for i as integer = 0 to Count-1
		      dim dc as LibUSBInterfaceDescriptorMBS = d.InterfaceDescriptor(i)
		      
		      List.AddFolder "Interface Descriptor "+str(i)
		      List.RowTag(List.LastIndex) = dc
		      
		    next
		    
		  end if
		  
		  
		  if v isa LibUSBInterfaceDescriptorMBS then
		    dim d as LibUSBInterfaceDescriptorMBS = v
		    
		    dim NumEndpoints as integer = d.NumEndpoints
		    
		    List.AddRow "DescriptorType", str(d.DescriptorType)
		    List.AddRow "InterfaceNumber", str(d.InterfaceNumber)
		    List.AddRow "AlternateSetting", str(d.AlternateSetting)
		    List.AddRow "NumEndpoints", str(NumEndpoints)
		    List.AddRow "InterfaceClass", str(d.InterfaceClass)
		    List.AddRow "InterfaceSubClass", str(d.InterfaceSubClass)
		    List.AddRow "InterfaceProtocol", str(d.InterfaceProtocol)
		    List.AddRow "IndexInterface", str(d.IndexInterface)
		    
		    for i as integer = 0 to NumEndpoints-1
		      dim dc as LibUSBEndpointDescriptorMBS = d.EndpointDescriptor(i)
		      
		      List.AddFolder "Endpoint Descriptor "+str(i)
		      List.RowTag(List.LastIndex) = dc
		      
		    next
		    
		    
		  end if
		  
		  if v isa LibUSBEndpointDescriptorMBS then
		    dim d as LibUSBEndpointDescriptorMBS = v
		    
		    List.AddRow "DescriptorType", str(d.DescriptorType)
		    List.AddRow "EndpointAddress", str(d.EndpointAddress)
		    List.AddRow "AttributesBitmap", str(d.AttributesBitmap)
		    List.AddRow "MaxPacketSize", str(d.MaxPacketSize)
		    List.AddRow "Interval", str(d.Interval)
		    List.AddRow "Refresh", str(d.Refresh)
		    List.AddRow "SynchAddress", str(d.SynchAddress)
		    List.AddRow "TransferType", str(d.TransferType)
		    List.AddRow "EndpointDirection", str(d.EndpointDirection)
		    
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
