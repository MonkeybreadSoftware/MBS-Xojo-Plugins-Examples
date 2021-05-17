#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   600
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   -1166721843
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Image Capture"
   Visible         =   True
   Width           =   800
   Begin TabPanel Tab
      AutoDeactivate  =   True
      Bold            =   False
      Enabled         =   True
      Height          =   566
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   "0"
      SmallTabs       =   False
      TabDefinition   =   "Device\rEvents\rFiles"
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Value           =   2
      Visible         =   True
      Width           =   760
      Begin Label StaticText1
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Tab"
         Italic          =   False
         Left            =   40
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Device List"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   60
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin PushButton PushButton1
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Refresh"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Tab"
         Italic          =   False
         Left            =   680
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   "0"
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   58
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin ListBox DeviceListbox
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
         Height          =   448
         HelpTag         =   ""
         Hierarchical    =   True
         Index           =   -2147483648
         InitialParent   =   "Tab"
         InitialValue    =   ""
         Italic          =   False
         Left            =   40
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
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   90
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   720
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin PushButton PushButton4
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Import Images with Dialog from any device"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Tab"
         Italic          =   False
         Left            =   40
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Scope           =   "0"
         TabIndex        =   4
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   550
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   310
      End
      Begin Label StaticText2
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Tab"
         Italic          =   False
         Left            =   40
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Multiline       =   False
         Scope           =   "0"
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "List of Events:"
         TextAlign       =   0
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   60
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin ListBox EventListbox
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
         Height          =   472
         HelpTag         =   ""
         Hierarchical    =   True
         Index           =   -2147483648
         InitialParent   =   "Tab"
         InitialValue    =   ""
         Italic          =   False
         Left            =   40
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
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   92
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   720
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin PushButton PushButton2
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Clear"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Tab"
         Italic          =   False
         Left            =   680
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   "0"
         TabIndex        =   2
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   60
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PopupMenu DevicePopup
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Tab"
         InitialValue    =   ""
         Italic          =   False
         Left            =   40
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   "0"
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   60
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   159
      End
      Begin PushButton PushShowTree
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Show file hierarchie"
         Default         =   False
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Tab"
         Italic          =   False
         Left            =   211
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   "0"
         TabIndex        =   1
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   60
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   164
      End
      Begin PushButton PushShowData
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Show file list"
         Default         =   False
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Tab"
         Italic          =   False
         Left            =   387
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   "0"
         TabIndex        =   2
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   61
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   114
      End
      Begin ListBox TreeListbox
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
         Height          =   445
         HelpTag         =   ""
         Hierarchical    =   True
         Index           =   -2147483648
         InitialParent   =   "Tab"
         InitialValue    =   ""
         Italic          =   False
         Left            =   40
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
         TabIndex        =   3
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   93
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   720
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin PushButton ThumbnailButton
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Copy Thumbnail"
         Default         =   False
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Tab"
         Italic          =   False
         Left            =   40
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Scope           =   "0"
         TabIndex        =   4
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   550
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   137
      End
      Begin PushButton PictureButton
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Copy Picture"
         Default         =   False
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Tab"
         Italic          =   False
         Left            =   189
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Scope           =   "0"
         TabIndex        =   5
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   550
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   137
      End
      Begin PushButton ImportButton
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Import all images"
         Default         =   False
         Enabled         =   False
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Tab"
         Italic          =   False
         Left            =   513
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   "0"
         TabIndex        =   7
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   61
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   137
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  m = new MyImageCapture
		  
		  RegisterEvents
		  RefreshDeviceList
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ExpandList(row as integer, liste as listbox)
		  dim o as Variant = liste.CellTag(row,0)
		  
		  if o isa ImageCaptureObjectMBS then
		    dim c as ImageCaptureObjectMBS = o
		    dim d as Dictionary = c.PropertyDictionary
		    
		    liste.Addfolder "Properties"
		    Liste.Celltag(liste.LastIndex,0)=d
		    
		  elseif o isa Dictionary then
		    dim p as Dictionary = o
		    
		    for each key as Variant in p.keys
		      dim v as Variant = p.Value(key)
		      
		      if key = "icao" then
		        
		        if handle <> 0 then
		          dim co as new ImageCaptureObjectMBS(v)
		          liste.AddFolder key
		          Liste.Cell(liste.LastIndex,1)=v
		          Liste.CellTag(liste.LastIndex,0)=co
		        else
		          liste.AddRow key.StringValue
		          Liste.Cell(liste.LastIndex,1)=v
		        end if
		        
		      elseif v.IsArray then
		        liste.Addfolder key
		        Liste.Celltag(liste.LastIndex,0)=v
		      elseif v isa Dictionary then
		        liste.Addfolder key
		        Liste.Celltag(liste.LastIndex,0)=v
		      else
		        liste.AddRow key.StringValue
		        Liste.Cell(liste.LastIndex,1)=v
		      end if
		      
		    next
		  elseif o.IsArray then
		    dim a(-1) as Variant = o
		    
		    for each v as Variant in a
		      
		      if v.IsArray then
		        liste.Addfolder "array"
		        Liste.Celltag(liste.LastIndex,0)=v
		      elseif v isa Dictionary then
		        liste.Addfolder "dictionary"
		        Liste.Celltag(liste.LastIndex,0)=v
		      else
		        liste.AddRow "value"
		        Liste.Cell(liste.LastIndex,1)=v
		      end if
		      
		      
		    next
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Import()
		  dim flags as integer = ImageCaptureObjectMBS.kICAAllowMultipleImages
		  dim types(-1) as string
		  
		  types.Append "tif"
		  types.Append "tiff"
		  types.Append "jpg"
		  types.Append "png"
		  
		  dim files(-1) as string = m.ImportImage(flags, types)
		  
		  for each data as string in files
		    ShowPicture data, "?"
		    
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ImportAllPictures()
		  // get device
		  dim deviceHandle as integer = DevicePopup.RowTag(DevicePopup.ListIndex)
		  dim deviceObject as new ImageCaptureObjectMBS(deviceHandle)
		  
		  // now import
		  dim d1 as Dictionary = deviceObject.PropertyDictionary
		  
		  if d1<>nil then
		    
		    dim items(-1) as Variant = d1.Value("data")
		    
		    for each item as Dictionary in items
		      dim handle as integer = item.Value("icao")
		      dim o as new ImageCaptureObjectMBS(handle)
		      
		      dim d2 as Dictionary = o.PropertyDictionary
		      dim size as integer = d2.Value(o.kICAPropertyImageSize)
		      
		      dim data as string = o.CopyData(0, size)
		      
		      if lenb(data)>0 then
		        ShowPicture data, d2.Lookup(o.kICAPropertyImageFilename,"?")
		      end if
		      
		      if o.Lasterror<>0 then
		        MsgBox "Lasterror: "+str(o.Lasterror)
		      end if
		      
		    next
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshDeviceList()
		  DeviceListbox.deleteAllRows
		  DevicePopup.DeleteAllRows
		  
		  // get the list object
		  dim list as ImageCaptureObjectMBS = m.DeviceList
		  
		  if List<>Nil then
		    // look into properties
		    dim dic as Dictionary = list.PropertyDictionary
		    
		    // take the devices array there
		    if dic<>Nil and dic.HasKey(ImageCaptureObjectMBS.kICADevicesArrayKey) then
		      dim a(-1) as Variant = dic.Value(ImageCaptureObjectMBS.kICADevicesArrayKey)
		      
		      // add each Device to device listbox
		      for each properties as Dictionary in a
		        dim name as string = Properties.Value("ifil")
		        
		        DeviceListbox.Addfolder name
		        DeviceListbox.Celltag(DeviceListbox.LastIndex,0)=properties
		        DeviceListbox.Expanded(DeviceListbox.LastIndex)=true
		        
		        // and to the Device popupmenu
		        dim handle as integer = properties.Value("icao")
		        
		        DevicePopup.AddRow name
		        DevicePopup.RowTag(DevicePopup.ListCount-1)=handle
		        
		      next
		    end if
		  end if
		  
		  if DevicePopup.ListCount>=0 then
		    DevicePopup.ListIndex=-1
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RegisterEvents()
		  
		  
		  dim events(-1) as string
		  
		  events.Append m.kICANotificationTypeObjectAdded
		  events.Append m.kICANotificationTypeObjectRemoved
		  events.Append m.kICANotificationTypeObjectInfoChanged
		  
		  events.Append m.kICANotificationTypeStoreAdded
		  events.Append m.kICANotificationTypeStoreRemoved
		  events.Append m.kICANotificationTypeStoreFull
		  events.Append m.kICANotificationTypeStoreInfoChanged
		  
		  events.Append m.kICANotificationTypeDeviceAdded
		  events.Append m.kICANotificationTypeDeviceRemoved
		  
		  events.Append m.kICANotificationTypeDeviceInfoChanged
		  events.Append m.kICANotificationTypeDevicePropertyChanged
		  events.Append m.kICANotificationTypeDeviceWasReset
		  events.Append m.kICANotificationTypeDeviceStatusInfo
		  events.Append m.kICANotificationTypeDeviceStatusError
		  
		  events.Append m.kICANotificationTypeCaptureComplete
		  events.Append m.kICANotificationTypeRequestObjectTransfer
		  events.Append m.kICANotificationTypeTransactionCanceled
		  
		  events.Append m.kICANotificationTypeUnreportedStatus
		  events.Append m.kICANotificationTypeProprietary
		  
		  events.Append m.kICANotificationTypeDeviceConnectionProgress
		  events.Append m.kICANotificationTypeDownloadProgressStatus
		  events.Append m.kICANotificationTypeScanProgressStatus
		  events.Append m.kICANotificationTypeScannerSessionClosed
		  events.Append m.kICANotificationTypeScannerScanDone
		  events.Append m.kICANotificationTypeScannerPageDone
		  events.Append m.kICANotificationTypeScannerButtonPressed
		  
		  events.Append m.kICANotificationTypeScannerOverviewOverlayAvailable
		  
		  m.RegisterForEventNotification(nil, events ,nil)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowFiles(kind as string)
		  dim deviceHandle as integer = DevicePopup.RowTag(DevicePopup.ListIndex)
		  dim deviceObject as new ImageCaptureObjectMBS(deviceHandle)
		  dim d1 as Dictionary = deviceObject.PropertyDictionary
		  
		  if d1<>nil then
		    
		    TreeListbox.AddFolder d1.Value("ifil")
		    TreeListbox.CellTag(TreeListbox.LastIndex,0)=d1.Value(kind)
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowPicture(data as string, title as string)
		  // We try different functions to get the picture from a video
		  
		  dim p as Picture= JPEGStringToPictureMBS(data, true)
		  if p = nil then
		    p = TIFFStringToPictureMBS(data)
		    if p=nil then
		      p = PNGStringToPictureMBS(data,0)
		    end if
		  end if
		  
		  if p<>Nil then
		    dim pw as new PicWindow
		    pw.Backdrop = p
		    pw.Title = Title
		    pw.Show
		  else
		    MsgBox "Failed to decode picture."
		  end if
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		m As MyImageCapture
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  RefreshDeviceList
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DeviceListbox
	#tag Event
		Sub ExpandRow(row As Integer)
		  ExpandList row, me
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton4
	#tag Event
		Sub Action()
		  Import
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EventListbox
	#tag Event
		Sub ExpandRow(row As Integer)
		  ExpandList row, me
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  EventListbox.DeleteAllRows
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DevicePopup
	#tag Event
		Sub Change()
		  if me.ListIndex>=0 then
		    PushShowData.Enabled = True
		    PushShowtree.Enabled = True
		    ImportButton.Enabled = true
		  else
		    PushShowData.Enabled = false
		    PushShowtree.Enabled = false
		    ImportButton.Enabled = false
		  end if
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushShowTree
	#tag Event
		Sub Action()
		  ShowFiles "tree"
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushShowData
	#tag Event
		Sub Action()
		  ShowFiles "data"
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TreeListbox
	#tag Event
		Sub ExpandRow(row As Integer)
		  ExpandList row, me
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  if me.ListIndex<0 then
		    ThumbnailButton.Enabled = false
		    PictureButton.Enabled = False
		  else
		    
		    dim v as Variant = me.CellTag(me.ListIndex,0)
		    
		    if v isa ImageCaptureObjectMBS then
		      
		      ThumbnailButton.Enabled = true
		      PictureButton.Enabled = true
		    else
		      ThumbnailButton.Enabled = false
		      PictureButton.Enabled = false
		      
		    end if
		    
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ThumbnailButton
	#tag Event
		Sub Action()
		  dim v as Variant = TreeListbox.CellTag(TreeListbox.ListIndex,0)
		  if v isa ImageCaptureObjectMBS then
		    dim o as ImageCaptureObjectMBS = v
		    
		    dim data as string = o.CopyThumbnail(o.kICAThumbnailFormatJPEG)
		    
		    if lenb(data)>0 then
		      ShowPicture data, o.PropertyDictionary.Lookup(o.kICAPropertyImageFilename,"?")
		    end if
		    
		    if o.Lasterror<>0 then
		      MsgBox "Lasterror: "+str(o.Lasterror)
		    end if
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PictureButton
	#tag Event
		Sub Action()
		  dim v as Variant = TreeListbox.CellTag(TreeListbox.ListIndex,0)
		  if v isa ImageCaptureObjectMBS then
		    dim o as ImageCaptureObjectMBS = v
		    
		    dim d as Dictionary = o.PropertyDictionary
		    dim size as integer = d.Value(o.kICAPropertyImageSize)
		    
		    dim data as string = o.CopyData(0, size)
		    
		    if lenb(data)>0 then
		      ShowPicture data, d.Lookup(o.kICAPropertyImageFilename,"?")
		    end if
		    
		    if o.Lasterror<>0 then
		      MsgBox "Lasterror: "+str(o.Lasterror)
		    end if
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ImportButton
	#tag Event
		Sub Action()
		  ImportAllPictures
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
