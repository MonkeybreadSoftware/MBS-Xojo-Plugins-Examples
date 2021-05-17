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
   Height          =   771
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1706603725
   MenuBarVisible  =   True
   MinHeight       =   300
   MinimizeButton  =   True
   MinWidth        =   800
   Placement       =   0
   Resizeable      =   True
   Title           =   "WIA"
   Visible         =   True
   Width           =   1045
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
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
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   168
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Devices"
      Italic          =   False
      Left            =   217
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   13
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   808
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Listbox PList
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
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   558
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Key	Value"
      Italic          =   False
      Left            =   217
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
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   193
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   808
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin BevelButton SelectDeviceDialogButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "Select Device Dialog"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   "0"
      Scope           =   "0"
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   99
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   185
   End
   Begin BevelButton TakePictureButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "Take Picture"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   False
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   "0"
      Scope           =   "0"
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   247
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   185
   End
   Begin BevelButton TransferButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "Transfer"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   False
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   "0"
      Scope           =   "0"
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   329
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   185
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
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   100
      Scope           =   "0"
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   363
      Transparent     =   True
      Value           =   0.0
      Visible         =   True
      Width           =   185
   End
   Begin BevelButton ImageButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "Image Dialog"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   "0"
      Scope           =   "0"
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   165
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   185
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   40
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
      Multiline       =   True
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "1. Find a device. Select one via dialog or pick from list:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   13
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   185
   End
   Begin BevelButton SelectDeviceDialogButton1
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "List Local Devices"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   "0"
      Scope           =   "0"
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   65
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   185
   End
   Begin Label Label3
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
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
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "2. You can use Image Dialog:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   133
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   185
   End
   Begin Label Label4
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   36
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
      Multiline       =   True
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "3. For dialogless scan request a picture:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   199
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   185
   End
   Begin Label Label5
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   36
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
      Multiline       =   True
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "4. Or pick an item from device and transfer it:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   281
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   185
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  DeviceManager = new WIADeviceManager1MBS
		  
		  if 0 = DeviceManager.Handle then
		    MsgBox "Failed to initialize device manager."
		  else
		    
		    
		  end if
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddItem(it as WIAItemMBS)
		  dim p as WIAPropertyStorageMBS = it.PropertyStorage
		  if p <> nil then
		    dim v as Variant = p.Read(p.kDevicePropertyDevNameString)
		    if v = nil then
		      v = p.Read(p.kItemPropertyItemNameString)
		    end if
		    dim name as string = v
		    System.DebugLog "Name: "+name
		    
		    if BitwiseAnd(it.ItemType,it.kTypeFolder)=it.kTypeFolder or BitwiseAnd(it.ItemType, it.kTypeHasAttachments)=it.kTypeHasAttachments then
		      List.addfolder name
		    else
		      List.addrow name
		    end if
		    
		    List.RowTag(List.LastIndex) = it
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnumerateItems(root as WIAItemMBS)
		  dim e as WIAItemEnumeratorMBS = Root.EnumerateChildItems
		  
		  System.DebugLog "EnumerateChildItems: "+str(root.Lasterror)
		  
		  if e <> Nil then
		    
		    dim it as WIAItemMBS = e.NextItem
		    
		    while it<>nil 
		      
		      AddItem it
		      
		      it = e.NextItem
		    wend
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ListDevices()
		  List.DeleteAllRows
		  PList.DeleteAllRows
		  
		  const WIA_DEVINFO_ENUM_LOCAL = &h10
		  
		  
		  dim e as WIADeviceInfoEnumeratorMBS = DeviceManager.EnumDeviceInfo(WIA_DEVINFO_ENUM_LOCAL)
		  
		  dim d as WIAPropertyStorageMBS = e.NextItem
		  while d <> nil
		    
		    dim DeviceID as string = d.Read(d.kDevicePropertyDevIdString)
		    System.DebugLog "DeviceID: "+DeviceID
		    
		    dim Device as WIAItemMBS = DeviceManager.CreateDevice(DeviceID)
		    if Device = nil then
		      Break
		    else
		      AddItem device
		    end if
		    
		    d = e.NextItem
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ListProperties(it as WIAItemMBS)
		  PList.DeleteAllRows
		  
		  dim p as WIAPropertyStorageMBS = it.PropertyStorage
		  
		  if p<>Nil then
		    ListProperties p
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ListProperties(p as WIAPropertyStorageMBS)
		  PList.DeleteAllRows
		  
		  dim e as WIAPropertyEnumeratorMBS = p.Enumerate
		  
		  if e<>nil then
		    dim ps as WIAPropertyMBS  = e.NextItem
		    
		    while ps<>Nil 
		      dim v as Variant = p.Read(ps)
		      
		      dim k as string = ps.Name
		      if len(k)=0 then
		        k = str(ps.ID)
		      end if
		      
		      PList.AddRow  k
		      
		      if v.Type = v.TypeObject then
		        if v isa WIAGUIDMBS then
		          dim g as WIAGUIDMBS = v
		          PList.Cell(PList.LastIndex,1)=g.DisplayString
		        else
		          PList.Cell(PList.LastIndex,1)="? some object"
		        end if
		      else
		        PList.Cell(PList.LastIndex,1)=v.StringValue
		      end if
		      
		      ps = e.NextItem
		    wend
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Transfer()
		  dim v as Variant = List.RowTag(List.ListIndex)
		  if v isa WIAItemMBS then
		    dim it as WIAItemMBS = v
		    dim p as WIAPropertyStorageMBS = it.PropertyStorage
		    
		    p.Write(p.kItemPropertyFormat, p.kImageFormatBMP)
		    p.Write(p.kItemPropertyTymed, p.kTymedFile)
		    
		    dim t as WIADataTransferMBS = it.DataTransfer
		    if t<>Nil then
		      dim c as new MyWIADataCallbackMBS
		      
		      dim f as FolderItem = T.GetDataFile(c)
		      
		      if f=nil then
		        MsgBox "Failed to get a path."
		      else
		        MsgBox "File saved to: "+f.NativePath
		        
		        dim pic as Picture = Picture.Open(f)
		        
		        if pic=nil then
		          MsgBox "Failed to load picture."
		        else
		          dim w as new PicWindow
		          w.Backdrop = pic
		          w.Title = f.name
		          w.show
		        end if
		      end if
		      
		    else
		      MsgBox "DataTransfer object not available."
		    end if
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		DeviceManager As WIADeviceManager1MBS
	#tag EndProperty


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub Change()
		  if List.ListIndex >= 0 then
		    dim v as Variant = List.RowTag(List.ListIndex)
		    
		    if v isa WIAItemMBS then
		      dim it as WIAItemMBS = v
		      ListProperties it
		      
		      TransferButton.Enabled=True
		      TakePictureButton.Enabled = true
		      
		      Return
		    elseif v isa WIAPropertyStorageMBS then
		      dim it as WIAPropertyStorageMBS = v
		      
		      ListProperties it
		      TransferButton.Enabled = false
		      TakePictureButton.Enabled = false
		      Return
		    else
		      MsgBox "no item or property storage." 
		    end if
		  end if
		  
		  
		  
		  TransferButton.Enabled = false
		  TakePictureButton.Enabled = false
		  
		  
		  PList.DeleteAllRows
		End Sub
	#tag EndEvent
	#tag Event
		Sub ExpandRow(row As Integer)
		  dim v as Variant = List.RowTag(row)
		  
		  if v isa WIAItemMBS then
		    dim it as WIAItemMBS = v
		    
		    EnumerateItems it
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SelectDeviceDialogButton
	#tag Event
		Sub Action()
		  dim it as WIAItemMBS = DeviceManager.SelectDeviceDialog(self, DeviceManager.kDeviceTypeDefault, DeviceManager.kSelectDeviceNoDefault)
		  
		  if it <> nil then
		    
		    List.DeleteAllRows
		    
		    AddItem it
		    
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TakePictureButton
	#tag Event
		Sub Action()
		  dim v as Variant = List.RowTag(list.ListIndex)
		  
		  if v isa WIAItemMBS then
		    dim device as WIAItemMBS = v
		    dim it as WIAItemMBS = device.DeviceCommand(device.kCommandTakePicture)
		    
		    if device.Lasterror<>0 then
		      MsgBox "Lasterror: "+str(device.Lasterror)+EndOfLine+EndOfLine+GetWindowsErrorMessageMBS(device.Lasterror)
		    end if
		    
		    if it<>Nil then
		      AddItem it
		    end if
		    
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TransferButton
	#tag Event
		Sub Action()
		  Transfer
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ImageButton
	#tag Event
		Sub Action()
		  dim v as Variant = List.RowTag(list.ListIndex)
		  dim SelectedDevice as WIAItemMBS
		  
		  if v isa WIAItemMBS then
		    SelectedDevice = v
		  end if
		  
		  
		  if DeviceManager <> nil then
		    
		    dim DeviceType as integer = DeviceManager.kDeviceTypeDefault
		    // or kDeviceTypeDigitalCamera, kDeviceTypeScanner, kDeviceTypeStreamingVideo
		    
		    dim flags as integer = 0
		    // flags:
		    // DeviceManager.kSelectDeviceNoDefault: 
		    //    Force this method to display the Select Device dialog box. For more information, see the Remarks section of this reference page.
		    // DeviceManager.kDeviceDialogSingleImage
		    //    Restrict image selection to a single image in the device image acquisition dialog box.
		    // DeviceManager.kDeviceDialogUseCommonUI
		    //    Use the system UI, if available, rather than the vendor-supplied UI. If the system UI is not available, the vendor UI is used. If neither UI is available, the function returns E_NOTIMPL.
		    
		    dim Intent as integer = DeviceManager.kIntentImageTypeColor // we like to get color preset
		    
		    dim root as WIAItemMBS = SelectedDevice // optional, can be nil
		    dim file as FolderItem = SpecialFolder.Desktop.Child("test.jpg")
		    
		    DeviceManager.GetImageDialog(self, DeviceType, flags, intent, file, root)
		    
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SelectDeviceDialogButton1
	#tag Event
		Sub Action()
		  ListDevices
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
