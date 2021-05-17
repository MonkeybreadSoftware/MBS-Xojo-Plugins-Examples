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
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   67170679
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "OpenCL"
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
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   387
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
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
		  if not OpenCLMBS.isAvailable then
		    if TargetMachO and TargetX86 then
		      MsgBox "OpenCL not available. Please install Mac OS X 10.6 to use it."
		    else
		      MsgBox "OpenCL not available. You need a Mac with Intel processor running Mac OS X 10.6."
		    end if
		    
		    Return
		  end if
		  
		  
		  dim Platforms(-1) as CLPlatformMBS = OpenCLMBS.Platforms
		  
		  for each p as CLPlatformMBS in Platforms
		    AddPlatform p
		  next
		  
		  // show all devices of all platforms...
		  'dim Devices(-1) as CLDeviceMBS = OpenCLMBS.AllDevices(CLDeviceMBS.kDeviceTypeAll)
		  '
		  'for each p as CLDeviceMBS in Devices
		  'AddDevice p
		  'next
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Add(value as variant, key as string)
		  List.AddRow key
		  List.cell(List.LastIndex,1)=value
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddDevice(d as CLDeviceMBS)
		  List.Addfolder "Device "+hex(d.handle)
		  List.Celltag(List.LastIndex,0)=d
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddPlatform(p as CLPlatformMBS)
		  List.Addfolder "Platform "+hex(p.Handle)
		  List.Celltag(List.LastIndex,0)=p
		  List.Expanded(list.LastIndex)=true
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub ExpandRow(row As Integer)
		  dim id as variant = List.Celltag(row,0)
		  if id isa CLPlatformMBS then
		    // Platform
		    
		    dim platform as CLPlatformMBS = id
		    Add platform.Profile, "Profile"
		    Add platform.Version, "Version"
		    Add platform.Name, "Name"
		    Add platform.Vendor, "Vendor"
		    Add platform.Extensions, "Extensions"
		    
		    dim Devices(-1) as CLDeviceMBS = platform.Devices(CLDeviceMBS.kDeviceTypeAll)
		    
		    for each d as CLDeviceMBS in Devices
		      AddDevice d
		    next
		    
		  elseif id isa CLDeviceMBS then
		    // Device
		    
		    dim device as CLDeviceMBS = id
		    
		    Add device.Name, "Name"
		    Add device.Vendor, "Vendor"
		    Add device.Profile, "Profile"
		    Add device.DriverVersion, "DriverVersion"
		    Add device.DeviceVersion, "DeviceVersion"
		    Add device.Extensions, "Extensions"
		    
		    Add device.VendorId,"VendorId"
		    Add device.MaxComputeUnits,"MaxComputeUnits"
		    Add device.MaxWorkItemDimensions,"MaxWorkItemDimensions"
		    Add device.MaxWorkGroupSize,"MaxWorkGroupSize"
		    Add device.PreferredVectorWidthChar,"PreferredVectorWidthChar"
		    Add device.PreferredVectorWidthShort,"PreferredVectorWidthShort"
		    Add device.PreferredVectorWidthInt,"PreferredVectorWidthInt"
		    Add device.PreferredVectorWidthLong,"PreferredVectorWidthLong"
		    Add device.PreferredVectorWidthFloat,"PreferredVectorWidthFloat"
		    Add device.PreferredVectorWidthDouble,"PreferredVectorWidthDouble"
		    Add device.MaxClockFrequency,"MaxClockFrequency"
		    Add device.AddressBits,"AddressBits"
		    Add device.MaxMemoryAllocSize,"MaxMemoryAllocSize"
		    Add device.ImageSupport,"ImageSupport"
		    Add device.MaxReadImageArgs,"MaxReadImageArgs"
		    Add device.MaxWriteImageArgs,"MaxWriteImageArgs"
		    Add device.Image2dMaxWidth,"Image2dMaxWidth"
		    Add device.Image2dMaxHeight,"Image2dMaxHeight"
		    Add device.Image3dMaxWidth,"Image3dMaxWidth"
		    Add device.Image3dMaxHeight,"Image3dMaxHeight"
		    Add device.Image3dMaxDepth,"Image3dMaxDepth"
		    Add device.MaxSamplers,"MaxSamplers"
		    Add device.MaxParameterSize,"MaxParameterSize"
		    Add device.MemoryBaseAddressAlign,"MemoryBaseAddressAlign"
		    Add device.MinDataTypeAlignSize,"MinDataTypeAlignSize"
		    Add device.GlobalMemoryCachelineSize,"GlobalMemoryCachelineSize"
		    Add device.GlobalMemoryCacheSize,"GlobalMemoryCacheSize"
		    Add device.GlobalMemorySize,"GlobalMemorySize"
		    Add device.MaxConstantBufferSize,"MaxConstantBufferSize"
		    Add device.MaxConstantArgs,"MaxConstantArgs"
		    Add device.LocalMemorySize,"LocalMemorySize"
		    Add device.ErrorCorrectionSupport,"ErrorCorrectionSupport"
		    Add device.ProfilingTimerResolution,"ProfilingTimerResolution"
		    Add device.EndianLittle,"EndianLittle"
		    Add device.Available,"Available"
		    Add device.CompilerAvailable,"CompilerAvailable"
		    
		  end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  MsgBox List.cell(List.ListIndex,0)+EndOfLine+EndOfLine+List.cell(List.ListIndex,1)
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
