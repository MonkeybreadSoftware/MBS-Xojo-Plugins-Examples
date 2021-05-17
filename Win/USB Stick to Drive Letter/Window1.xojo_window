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
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   77963611
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "USB Stick to Drive Letter"
   Visible         =   True
   Width           =   600
   Begin Listbox Listbox1
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
      EnableDragReorder=   True
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   330
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
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
      Top             =   52
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Query"
      Default         =   False
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
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   102
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  listbox1.DeleteAllRows
		  
		  if not TargetWin32 then
		    MsgBox "This example is for Windows only."
		    Return
		  end if
		  
		  dim w1 as new WindowsWMIMBS
		  dim w2 as new WindowsWMIMBS
		  dim w3 as new WindowsWMIMBS
		  
		  // connect three objects, so we can query in parallel
		  if not w1.ConnectServer("root\cimv2") or not w2.ConnectServer("root\cimv2") or not w3.ConnectServer("root\cimv2") then
		    MsgBox "ConnectServer: fail"+EndOfLine+"Lasterror: "+str(w1.Lasterror)
		    Return
		  end if
		  
		  // look for USB Devices
		  dim query1 as string = "select * from Win32_DiskDrive where InterfaceType='USB'"
		  System.DebugLog query1
		  if not w1.query("WQL", query1) then
		    System.DebugLog str(w1.Lasterror)+" "+hex(w1.Lasterror)+": "+w1.LasterrorMessage
		    MsgBox "query: fail"+EndOfLine+"Lasterror: "+str(w1.Lasterror)
		    Return
		  end if
		  
		  dim Volumes() as string
		  
		  // loop over USB devices
		  while w1.NextItem
		    
		    dim DeviceID     as string = w1.GetProperty("DeviceID")
		    dim Description  as string = w1.GetProperty("Description")
		    dim PNPDeviceID  as string = w1.GetProperty("PNPDeviceID")
		    dim SerialNumber as string = w1.GetProperty("SerialNumber")
		    dim Size         as string = w1.GetProperty("Size")
		    dim Status       as string = w1.GetProperty("Status")
		    
		    Listbox1.AddRow "DeviceID", DeviceID
		    Listbox1.AddRow "Description", Description
		    Listbox1.AddRow "PNPDeviceID", PNPDeviceID
		    Listbox1.AddRow "SerialNumber", SerialNumber
		    Listbox1.AddRow "Size", Size
		    Listbox1.AddRow "Status", Status
		    
		    // look for Disks
		    dim query2 as string = "Associators of {Win32_DiskDrive.DeviceID='"+DeviceID+"'} where AssocClass=Win32_DiskDriveToDiskPartition"
		    System.DebugLog query2
		    if not w2.query("WQL", query2) then
		      System.DebugLog str(w2.Lasterror)+" "+hex(w2.Lasterror)+": "+w2.LasterrorMessage
		      MsgBox "query: fail"+EndOfLine+"Lasterror: "+str(w2.Lasterror)
		      Return
		    end if
		    
		    while w2.NextItem
		      dim DiskDeviceID as string = w2.GetProperty("DeviceID")
		      dim DiskSize     as string = w2.GetProperty("Size")
		      
		      Listbox1.AddRow "DiskDeviceID", DiskDeviceID
		      Listbox1.AddRow "DiskSize", DiskSize
		      
		      // look for logical volumes
		      dim query3 as string = "Associators of {Win32_DiskPartition.DeviceID='"+DiskDeviceID+"'} where AssocClass=Win32_LogicalDiskToPartition"
		      System.DebugLog query3
		      if not w3.query("WQL", query3) then
		        System.DebugLog str(w3.Lasterror)+" "+hex(w3.Lasterror)+": "+w3.LasterrorMessage
		        MsgBox "query: fail"+EndOfLine+"Lasterror: "+str(w3.Lasterror)
		        Return
		      end if
		      
		      while w3.NextItem
		        dim VolumeDeviceID    as string = w3.GetProperty("DeviceID")
		        dim VolumeDescription as string = w3.GetProperty("Description")
		        dim VolumeName        as string = w3.GetProperty("VolumeName")
		        dim VolumeSize        as string = w3.GetProperty("Size")
		        dim FileSystem        as string = w3.GetProperty("FileSystem")
		        dim FreeSpace         as string = w3.GetProperty("FreeSpace")
		        
		        
		        Listbox1.AddRow "VolumeDeviceID", VolumeDeviceID
		        Listbox1.AddRow "VolumeDescription", VolumeDescription
		        Listbox1.AddRow "VolumeName", VolumeName
		        Listbox1.AddRow "VolumeSize", VolumeSize
		        Listbox1.AddRow "FileSystem", FileSystem
		        Listbox1.AddRow "FreeSpace", FreeSpace
		        
		        Volumes.Append VolumeDeviceID
		      wend
		    wend
		    
		    Listbox1.AddRow ""
		    
		  wend
		  
		  
		  listbox1.AddRow "Found volumes:", Join(Volumes, ", ")
		  
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
