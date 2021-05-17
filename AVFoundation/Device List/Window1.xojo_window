#tag Window
Begin Window Window1
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
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   224749902
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Devices"
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
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   366
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Key	Value"
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
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  Dim devices() As AVCaptureDeviceMBS = AVCaptureDeviceMBS.devices
		  
		  for each d as AVCaptureDeviceMBS in devices
		    AddCaptureDevice d, "Device "+Str(devices.IndexOf(d))
		  next
		  
		  Dim device1 As AVCaptureDeviceMBS = AVCaptureDeviceMBS.defaultDeviceWithMediaType(AVFoundationMBS.AVMediaTypeVideo)
		  If device1 <> Nil Then
		    AddCaptureDevice device1, "Default Audio Device"
		  End If
		  
		  Dim device2 As AVCaptureDeviceMBS = AVCaptureDeviceMBS.defaultDeviceWithMediaType(AVFoundationMBS.AVMediaTypeAudio)
		  If device2 <> Nil Then
		    AddCaptureDevice device2, "Default Video Device"
		  End If
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddCaptureDevice(d as AVCaptureDeviceMBS, label as string)
		  List.AddFolder label, d
		  List.Cell(List.LastIndex,1) = d.localizedName
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddCaptureDeviceFormat(d as AVCaptureDeviceFormatMBS)
		  
		  List.AddFolder "Format"
		  List.RowTag(List.LastIndex) = d
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddCaptureDeviceInput(d as AVCaptureDeviceInputMBS)
		  List.AddFolder "Device Input"
		  List.RowTag(List.LastIndex) = d
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddCaptureDeviceInputSource(d as AVCaptureDeviceInputSourceMBS)
		  List.AddFolder d.localizedName
		  List.RowTag(List.LastIndex) = d
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddCaptureInputPort(d as AVCaptureInputPortMBS)
		  
		  List.AddFolder "Input Port"
		  List.RowTag(List.LastIndex) = d
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddFormatDescription(d as CMFormatDescriptionMBS)
		  list.AddRow "name", d.name
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddFrameRateRange(d as AVFrameRateRangeMBS, label as string = "")
		  if label = "" then label = "FormatDescription"
		  List.AddFolder label
		  List.RowTag(List.LastIndex) = d
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowCaptureDevice(v as AVCaptureDeviceMBS)
		  
		  dim activeFormat as AVCaptureDeviceFormatMBS = v.activeFormat
		  if activeFormat = nil then
		    List.AddRow "activeFormat","nil"
		  else
		    List.AddFolder "activeFormat", activeFormat
		  end if
		  
		  List.AddRow "activeVideoMinFrameDuration", Format(v.activeVideoMinFrameDuration.Seconds,"0.00")
		  List.AddRow "exposureMode", str(v.exposureMode)
		  List.AddRow "exposurePointOfInterest", FormatPoint(v.exposurePointOfInterest)
		  List.AddRow "flashMode", str(v.flashMode)
		  List.AddRow "focusMode", str(v.focusMode)
		  List.AddRow "focusPointOfInterest", FormatPoint(v.focusPointOfInterest)
		  
		  dim formats() as AVCaptureDeviceFormatMBS = v.formats
		  if Formats.Ubound < 0 then
		    list.AddRow "Formats", "n/a"
		  else
		    list.AddFolder "Formats", Formats
		  end if
		  
		  List.AddRow "hasFlash", str(v.hasFlash)
		  List.AddRow "hasTorch", str(v.hasTorch)
		  
		  dim inputSources() as AVCaptureDeviceInputSourceMBS = v.inputSources
		  if inputSources.Ubound < 0 then
		    list.AddRow "inputSources", "n/a"
		  else
		    list.AddFolder "inputSources", inputSources
		  end if
		  
		  List.AddRow "isAdjustingExposure", str(v.isAdjustingExposure)
		  List.AddRow "isAdjustingFocus", str(v.isAdjustingFocus)
		  List.AddRow "isAdjustingWhiteBalance", str(v.isAdjustingWhiteBalance)
		  List.AddRow "isConnected", str(v.isConnected)
		  List.AddRow "isExposurePointOfInterestSupported", str(v.isExposurePointOfInterestSupported)
		  List.AddRow "isFocusPointOfInterestSupported", str(v.isFocusPointOfInterestSupported)
		  List.AddRow "isInUseByAnotherApplication", str(v.isInUseByAnotherApplication)
		  List.AddRow "isSuspended", str(v.isSuspended)
		  
		  dim linkedDevices() as AVCaptureDeviceMBS = v.linkedDevices
		  if linkedDevices.Ubound < 0 then
		    list.AddRow "linkedDevices", "n/a"
		  else
		    list.AddFolder "linkedDevices", linkedDevices
		  end if
		  
		  List.AddRow "localizedName", (v.localizedName)
		  List.AddRow "modelID", (v.modelID)
		  List.AddRow "position", str(v.position)
		  List.AddRow "transportControlsPlaybackMode", str(v.transportControlsPlaybackMode)
		  List.AddRow "transportControlsSpeed", str(v.transportControlsSpeed)
		  List.AddRow "transportControlsSupported", str(v.transportControlsSupported)
		  List.AddRow "transportType", str(v.transportType)
		  List.AddRow "uniqueID", (v.uniqueID)
		  List.AddRow "whiteBalanceMode", str(v.whiteBalanceMode)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowCaptureDeviceFormat(v as AVCaptureDeviceFormatMBS)
		  dim formatDescription as CMFormatDescriptionMBS = v.formatDescription
		  
		  if formatDescription = nil then
		    List.AddRow "formatDescription", "n/a"
		  else
		    List.AddRow "formatDescription", formatDescription.Name
		    'List.AddFolder "formatDescription", formatDescription
		  end if
		  
		  List.AddRow "mediaType", v.mediaType
		  
		  dim videoSupportedFrameRateRanges() as AVFrameRateRangeMBS = v.videoSupportedFrameRateRanges
		  if videoSupportedFrameRateRanges.Ubound < 0 then
		    list.AddRow "videoSupportedFrameRateRanges", "n/a"
		  else
		    list.AddFolder "videoSupportedFrameRateRanges", videoSupportedFrameRateRanges
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowCaptureDeviceInput(v as AVCaptureDeviceInputMBS)
		  dim Ports() as AVCaptureInputPortMBS = v.Ports
		  if Ports.Ubound < 0 then
		    list.AddRow "Ports", "n/a"
		  else
		    list.AddFolder "Ports", Ports
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowCaptureDeviceInputSource(v as AVCaptureDeviceInputSourceMBS)
		  List.AddRow "inputSourceID", v.inputSourceID
		  List.AddRow "localizedName", v.localizedName
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowCaptureInportPort(v as AVCaptureInputPortMBS)
		  dim formatDescription as CMFormatDescriptionMBS = v.formatDescription
		  
		  if formatDescription = nil then
		    List.AddRow "formatDescription", "n/a"
		  else
		    List.AddFolder "formatDescription", formatDescription
		  end if
		  
		  List.AddRow "mediaType", v.mediaType
		  List.AddRow "Enabled", str(v.Enabled)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowFormatDescription(v as CMFormatDescriptionMBS)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowFrameRateRange(d as AVFrameRateRangeMBS)
		  List.AddRow "minFrameDuration: "+str(d.minFrameDuration)
		  List.AddRow "maxFrameDuration: "+str(d.maxFrameDuration)
		  List.AddRow "minFrameRate: "+str(d.minFrameRate)
		  List.AddRow "maxFrameRate: "+str(d.maxFrameRate)
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub ExpandRow(row As Integer)
		  dim v as Variant = me.RowTag(row)
		  if v = nil then Return
		  
		  if v.IsArray then
		    // special handling for arrays
		    dim u as integer = GetVariantArrayUboundMBS(v)
		    if u>=0 then
		      dim e as Variant = GetVariantArrayValueMBS(v,0)
		      if e isa AVCaptureDeviceInputMBS then
		        dim a() as AVCaptureDeviceInputMBS = v
		        for each x as AVCaptureDeviceInputMBS in a
		          addCaptureDeviceInput x
		        next
		      elseif e isa AVCaptureDeviceMBS then
		        dim a() as AVCaptureDeviceMBS = v
		        For Each x As AVCaptureDeviceMBS In a
		          addCaptureDevice x, "Device"
		        next
		      elseif e isa AVCaptureDeviceInputSourceMBS then
		        dim a() as AVCaptureDeviceInputSourceMBS = v
		        for each x as AVCaptureDeviceInputSourceMBS in a
		          AddCaptureDeviceInputSource x
		        next
		      elseif e isa AVCaptureDeviceFormatMBS then
		        dim a() as AVCaptureDeviceFormatMBS = v
		        for each x as AVCaptureDeviceFormatMBS in a
		          AddCaptureDeviceFormat x
		        next
		      elseif e isa AVCaptureInputPortMBS then
		        dim a() as AVCaptureInputPortMBS = v
		        for each x as AVCaptureInputPortMBS in a
		          AddCaptureInputPort x
		        next
		      elseif e isa CMFormatDescriptionMBS then
		        dim a() as CMFormatDescriptionMBS = v
		        for each x as CMFormatDescriptionMBS in a
		          AddFormatDescription x
		        next
		      else
		        Break
		      end if
		    end if
		  else
		    // show normal item
		    if v isa AVCaptureDeviceInputMBS then
		      ShowCaptureDeviceInput v
		    elseif v isa AVCaptureDeviceMBS then 
		      ShowCaptureDevice v
		    elseif v isa AVCaptureDeviceInputSourceMBS then
		      ShowCaptureDeviceInputSource v
		    elseif v isa AVCaptureDeviceFormatMBS then
		      ShowCaptureDeviceFormat v
		    elseif v isa AVCaptureInputPortMBS then
		      ShowCaptureInportPort v
		    elseif v isa CMFormatDescriptionMBS then
		      ShowFormatDescription v
		    else
		      Break
		    end if
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
