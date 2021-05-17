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
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1536895357
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "List Devices"
   Visible         =   True
   Width           =   600
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   5
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
      Height          =   366
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "DisplayName	Type	FriendlyName	Description	DevicePath"
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
		  list DirectShowEnumMonikerMBS.CLSID_AudioCompressorCategory, "Audio Compressor"
		  list DirectShowEnumMonikerMBS.CLSID_AudioInputDeviceCategory, "Audio Input"
		  list DirectShowEnumMonikerMBS.CLSID_AudioRendererCategory, "Audio Renderer"
		  list DirectShowEnumMonikerMBS.CLSID_DeviceControlCategory, "Device Control"
		  list DirectShowEnumMonikerMBS.CLSID_DVDHWDecodersCategory, "DVD Hardware Decoder"
		  list DirectShowEnumMonikerMBS.CLSID_LegacyAmFilterCategory, "Legacy AmFilter"
		  list DirectShowEnumMonikerMBS.CLSID_MidiRendererCategory, "Midi Renderer"
		  list DirectShowEnumMonikerMBS.CLSID_TransmitCategory, "Transcoder"
		  list DirectShowEnumMonikerMBS.CLSID_VideoCompressorCategory, "Video Compressor"
		  list DirectShowEnumMonikerMBS.CLSID_VideoInputDeviceCategory, "Video Input"
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Add(dev As DirectShowMonikerMBS, type as string)
		  // check subobjects
		  dim e as DirectShowEnumMonikerMBS = dev.EnumMonikers(true)
		  
		  // Microsoft calls it Displayname, but it looks more like some UniqueID
		  dim DisplayName as string = dev.DisplayName
		  
		  if e<>Nil then // there could be components of a composite moniker.
		    List.AddFolder DisplayName
		  else
		    List.AddRow DisplayName
		  end if
		  System.DebugLog str(dev.Lasterror)+" "+str(dev.LasterrorMessage)
		  
		  dim p as DirectShowPropertyBagMBS = dev.Properties
		  if p<>nil then
		    // we show some properties
		    
		    List.Cell(List.LastIndex,2) = p.FriendlyName
		    
		    if p.Lasterror = &h80070002 or p.Lasterror = &h80070490 then // property not found
		      List.Cell(List.LastIndex,2) = "-"
		    elseif p.Lasterror <>0 then
		      List.Cell(List.LastIndex,2) = "Error "+hex(p.Lasterror)+": "+p.LasterrorMessage
		    end if
		    
		    List.Cell(List.LastIndex,3) = p.Description
		    if p.Lasterror = &h80070002 or p.Lasterror = &h80070490 then // property not found
		      List.Cell(List.LastIndex,3) = "-"
		    elseif p.Lasterror <>0 then
		      List.Cell(List.LastIndex,3) = "Error "+hex(p.Lasterror)+": "+p.LasterrorMessage
		    end if
		    
		    List.Cell(List.LastIndex,4) = p.DevicePath
		    if p.Lasterror = &h80070002 or p.Lasterror = &h80070490 then // property not found
		      List.Cell(List.LastIndex,4) = "-"
		    elseif p.Lasterror <>0 then
		      List.Cell(List.LastIndex,4) = "Error "+hex(p.Lasterror)+": "+p.LasterrorMessage
		    end if
		  end if
		  
		  List.Cell(List.LastIndex,1) = type
		  List.RowTag(List.LastIndex) = e
		  
		  // help tags make long text more visible when you move mouse over entry
		  for i as integer = 0 to 4
		    List.CellHelpTag(list.lastIndex,i) = List.Cell(list.lastIndex,i)
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub List(type as DirectShowGUIDMBS, types as string)
		  // Create an enumerator for the video capture devices
		  dim devenum as new DirectShowEnumMonikerMBS(type)
		  if devenum.Handle = 0 then
		    Return
		  end if
		  
		  dim dev as DirectShowMonikerMBS = devenum.NextObject
		  
		  while dev<>nil
		    Add dev, types
		    
		    dev = devenum.NextObject
		  wend
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub ExpandRow(row As Integer)
		  dim e as DirectShowEnumMonikerMBS = me.RowTag(row)
		  dim dev as DirectShowMonikerMBS = e.NextObject
		  
		  while dev<>nil
		    Add dev, ""
		    
		    dev = e.NextObject
		  wend
		  
		  
		  
		  
		  
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
