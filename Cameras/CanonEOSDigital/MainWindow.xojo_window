#tag Window
Begin Window MainWindow
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
   MenuBar         =   2092720942
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "EdsTest"
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
      Height          =   334
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
      Top             =   46
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton TakePictureButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Take picture"
      Default         =   False
      Enabled         =   False
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
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   122
   End
   Begin PushButton ShowPictureButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Show Picture"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   154
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   122
   End
   Begin ProgressBar bar
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Indeterminate   =   False
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Maximum         =   100
      Scope           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   380
      Transparent     =   True
      Value           =   0.0
      Visible         =   False
      Width           =   560
   End
   Begin PushButton DeleteFileButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Delete File"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   288
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   122
   End
   Begin PushButton StartLiveButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Start Live Video"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   422
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   122
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   100
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub Add(v as EdsDirectoryItemMBS)
		  if v<>nil then
		    
		    dim info as EdsDirectoryItemInfoMBS = v.DirectoryItemInfo
		    
		    if info.IsFolder then
		      List.AddFolder info.FileName
		    else
		      List.AddRow info.FileName
		    end if
		    
		    List.RowTag(List.LastIndex) = v
		    
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Add(v as EdsVolumeMBS)
		  if v<>nil then
		    
		    dim info as EdsVolumeInfoMBS = v.VolumeInfo
		    
		    List.AddFolder info.VolumeLabel
		    List.RowTag(List.LastIndex) = v
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  List.DeleteAllRows
		  TakePictureButton.Enabled = false
		  StartLiveButton.Enabled = false
		  
		  camera = nil
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OpenDevice()
		  if camera <> nil then Return // ignore second device
		  
		  List.DeleteAllRows
		  
		  dim c as EdsCameraListMBS = EDSModuleMBS.GetCameraList
		  
		  if c<>Nil then
		    dim count as integer = c.ChildCount
		    
		    if count>0 then // we only care for first device
		      
		      camera = c.Child(0)
		      camera.OpenSession
		      
		      // we install a couple of handlers to get events from device
		      MyEdsObjectEventHandler = new MyEdsObjectEventHandlerMBS(camera, EDSModuleMBS.kEdsObjectEvent_All)
		      MyEdsCameraStateEventHandler = new MyEdsCameraStateEventHandlerMBS(camera, EDSModuleMBS.kEdsStateEvent_All)
		      MyEdsPropertyEventHandler = new MyEdsPropertyEventHandlerMBS(camera, EDSModuleMBS.kEdsPropertyEvent_All)
		      MyEdsPropertyEventHandler.camera = camera
		      
		      
		      timer1.Mode = 2
		      
		      
		      dim d as EdsDeviceInfoMBS = camera.DeviceInfo
		      
		      List.AddFolder d.DeviceDescription
		      List.RowTag(MainWindow.List.LastIndex) = camera
		      
		      
		      TakePictureButton.Enabled = true
		      StartLiveButton.Enabled = true
		      
		    end if
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartLiveView(camera as EdsCameraMBS)
		  // we set bit for redirecting output to PC, leave other bits as they are.
		  
		  dim device as UInt32 = camera.GetPropertyDataUInt32(camera.kEdsPropID_Evf_OutputDevice)
		  
		  CheckError camera
		  
		  if camera.lasterror = EDSModuleMBS.EDS_ERR_OK then
		    
		    device = Bitwise.BitOr(device, EDSModuleMBS.kEdsEvfOutputDevice_PC)
		    
		    camera.SetPropertyDataUInt32 camera.kEdsPropID_Evf_OutputDevice, 0, device
		    CheckError camera
		    
		    System.DebugLog "Set Property"
		    
		    PicWindow.Camera = camera
		    PicWindow.show
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopLiveView(camera as EdsCameraMBS)
		  // we reset the output device bits to not include PC
		  
		  dim device as UInt32 = camera.GetPropertyDataUInt32(camera.kEdsPropID_Evf_OutputDevice)
		  
		  CheckError camera
		  
		  if camera.lasterror = EDSModuleMBS.EDS_ERR_OK then
		    
		    dim n as Uint32 = EDSModuleMBS.kEdsEvfOutputDevice_PC
		    n = Bitwise.OnesComplement(n)
		    device = Bitwise.BitAnd(device, n)
		    
		    camera.SetPropertyDataUInt32 camera.kEdsPropID_Evf_OutputDevice, 0, device
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateButton()
		  if camera<>nil then
		    TakePictureButton.enabled = true
		    StartLiveButton.Enabled = true
		  else
		    TakePictureButton.enabled = false
		    StartLiveButton.Enabled = false
		  end if
		  
		  if List.ListIndex >= 0 then
		    dim v as Variant = List.RowTag(List.ListIndex)
		    if v isa EdsCameraMBS then
		      ShowPictureButton.Enabled = false
		      DeleteFileButton.Enabled = false
		    elseif v isa EdsDirectoryItemMBS then
		      dim d as EdsDirectoryItemMBS = v
		      if d.DirectoryItemInfo.IsFolder then
		        ShowPictureButton.Enabled = false
		        DeleteFileButton.Enabled = false
		      else
		        ShowPictureButton.Enabled = true
		        DeleteFileButton.Enabled = true
		      end if
		    else
		      ShowPictureButton.Enabled = false
		      DeleteFileButton.Enabled = false
		    end if
		    
		  else
		    DeleteFileButton.Enabled = false
		    ShowPictureButton.Enabled = false
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		camera As EdsCameraMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		MyEdsCameraStateEventHandler As MyEdsCameraStateEventHandlerMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		MyEdsObjectEventHandler As MyEdsObjectEventHandlerMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		MyEdsPropertyEventHandler As MyEdsPropertyEventHandlerMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		Progress As MyEdsProgressMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		stream As EdsStreamMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub ExpandRow(row As Integer)
		  dim v as Variant = me.RowTag(row)
		  
		  if v isa EdsCameraMBS then
		    dim camera as EdsCameraMBS = v
		    
		    camera.OpenSession
		    
		    dim u as integer = camera.ChildCount-1
		    CheckError camera
		    
		    for i as integer = 0 to u
		      Add camera.Child(i)
		    next
		    
		  elseif v isa EdsVolumeMBS then
		    
		    dim volume as EdsVolumeMBS = v
		    dim u as integer = volume.ChildCount-1
		    System.DebugLog "Lasterror: "+str(volume.Lasterror)
		    
		    
		    for i as integer = 0 to u
		      add volume.Child(i)
		    next
		    
		  elseif v isa EdsDirectoryItemMBS then
		    
		    dim folder as EdsDirectoryItemMBS = v
		    dim u as integer = folder.ChildCount-1
		    System.DebugLog "Lasterror: "+str(folder.Lasterror)
		    
		    
		    for i as integer = 0 to u
		      add folder.Child(i)
		    next
		  end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  UpdateButton
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TakePictureButton
	#tag Event
		Sub Action()
		  // send take picture command
		  
		  // set save to host if you don't have a SD card
		  'camera.SetPropertyDataInt32(camera.kEdsPropID_SaveTo, 0, EDSModuleMBS.kEdsSaveTo_Host)
		  'CheckError camera
		  
		  camera.SendCommand camera.kEdsCameraCommand_TakePicture
		  CheckError camera
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ShowPictureButton
	#tag Event
		Sub Action()
		  // download selected file
		  
		  dim c as EdsDirectoryItemMBS = List.RowTag(List.ListIndex)
		  dim info as EdsDirectoryItemInfoMBS = c.DirectoryItemInfo
		  dim file as FolderItem = SpecialFolder.Desktop.Child(info.FileName)
		  
		  stream = new EdsStreamMBS(file, EdsStreamMBS.kEdsFileCreateDisposition_CreateNew, EdsStreamMBS.kEdsAccess_Write)
		  
		  // with progress, so we install progress callback
		  bar.Value = 0
		  bar.Visible = true
		  Progress = new MyEdsProgressMBS
		  
		  stream.SetProgress Progress, c.kEdsProgressOption_Periodically
		  CheckError c
		  
		  // run download
		  c.Download(info.Size, stream)
		  CheckError c
		  
		  // tell camera we are done
		  c.DownloadComplete
		  CheckError c
		  
		  // cleanup
		  stream = nil
		  bar.Visible = false
		  
		  // and show file
		  file.Launch
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DeleteFileButton
	#tag Event
		Sub Action()
		  // delete a file
		  
		  dim c as EdsDirectoryItemMBS = List.RowTag(List.ListIndex)
		  
		  c.DeleteDirectoryItem
		  CheckError c
		  
		  List.RemoveRow List.ListIndex
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StartLiveButton
	#tag Event
		Sub Action()
		  
		  StartLiveView camera
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  EDSModuleMBS.GetEvent
		  
		  if EDSModuleMBS.Lasterror <> 0 then
		    me.Mode = 0
		    MsgBox "Error "+str(EDSModuleMBS.Lasterror)+": "+GetErrorMessage(EDSModuleMBS.Lasterror)
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
