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
   Height          =   550
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1864017834
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Camera Browser"
   Visible         =   True
   Width           =   1183
   Begin Label Label1
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Cameras"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   False
      ColumnWidths    =   "60"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   50
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   452
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
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
      TabIndex        =   1
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
      Width           =   236
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin TabPanel tab
      AutoDeactivate  =   True
      Bold            =   False
      Enabled         =   True
      Height          =   484
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   268
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   "0"
      SmallTabs       =   False
      TabDefinition   =   "List View\rOutline View"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Value           =   0
      Visible         =   True
      Width           =   895
      Begin Listbox HList
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   8
         ColumnsResizable=   False
         ColumnWidths    =   "10%, 15%, 15%, 10%, 10%, 10%, 10%"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   18
         DropIndicatorVisible=   False
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   False
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   True
         HeadingIndex    =   -1
         Height          =   438
         HelpTag         =   ""
         Hierarchical    =   True
         Index           =   -2147483648
         InitialParent   =   "tab"
         InitialValue    =   " 	Name	Date	Size	Width	Height	Make	Model"
         Italic          =   False
         Left            =   280
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         RequiresSelection=   False
         Scope           =   "0"
         ScrollbarHorizontal=   False
         ScrollBarVertical=   True
         SelectionType   =   1
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   52
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   873
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin Listbox FList
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   8
         ColumnsResizable=   False
         ColumnWidths    =   "60, 15%, 15%, 10%, 10%, 10%, 10%"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   50
         DropIndicatorVisible=   False
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   False
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   True
         HeadingIndex    =   -1
         Height          =   444
         HelpTag         =   ""
         Hierarchical    =   False
         Index           =   -2147483648
         InitialParent   =   "tab"
         InitialValue    =   " 	Name	Date	Size	Width	Height	Make	Model"
         Italic          =   False
         Left            =   280
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         RequiresSelection=   False
         Scope           =   "0"
         ScrollbarHorizontal=   False
         ScrollBarVertical=   True
         SelectionType   =   1
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   46
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   873
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
   End
   Begin PushButton SyncButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Sync Clock"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   510
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   118
   End
   Begin PushButton TakeButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Take Picture"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   150
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   510
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   118
   End
   Begin PushButton DownloadButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Download"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   314
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   510
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   118
   End
   Begin PushButton DeleteButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Delete"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   444
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   510
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   118
   End
   Begin PushButton ReadButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Read Data"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   574
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   510
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   118
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  events = new MyImageCaptureEvents
		  
		  DeviceBrowser = new ICDeviceBrowserMBS
		  DeviceBrowser.browsedDeviceTypeMask = Bitwise.BitOr(ICDeviceMBS.ICDeviceLocationTypeMaskLocal, ICDeviceMBS.ICDeviceLocationTypeMaskRemote, ICDeviceMBS.ICDeviceTypeMaskCamera)
		  DeviceBrowser.start
		  
		  
		  FList.ColumnAlignment(2) = Listbox.AlignRight
		  FList.ColumnAlignment(3) = Listbox.AlignRight
		  FList.ColumnAlignment(4) = Listbox.AlignRight
		  FList.ColumnAlignment(5) = Listbox.AlignRight
		  
		  
		  HList.ColumnAlignment(2) = Listbox.AlignRight
		  HList.ColumnAlignment(3) = Listbox.AlignRight
		  HList.ColumnAlignment(4) = Listbox.AlignRight
		  HList.ColumnAlignment(5) = Listbox.AlignRight
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddDevice(camera as ICCameraDeviceMBS)
		  
		  Cameras.Append camera
		  
		  List.AddRow "", camera.Name
		  List.RowTag(List.LastIndex) = camera
		  
		  dim image as CGImageMBS = camera.Icon
		  dim pic as Picture = image.Picture
		  
		  List.CellTag(List.LastIndex,0) = pic
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddItem(it as ICCameraItemMBS)
		  
		  if it isa ICCameraFolderMBS then
		    dim f as ICCameraFolderMBS = ICCameraFolderMBS(it)
		    dim c as integer = f.contents.Ubound+1
		    dim size   as string = str(c)+" items"
		    if c = 1 then size = "one item"
		    
		    HList.AddFolder ""
		    HList.Cell(HList.LastIndex,1) = f.Name
		    HList.Cell(HList.LastIndex,3) = size
		    HList.RowTag(HList.LastIndex) = f
		    
		    ShowMetaData  HList, HList.LastIndex, f
		    ShowThumbnail HList, HList.LastIndex, f
		    
		  elseif it isa ICCameraFileMBS then
		    dim f as ICCameraFileMBS = ICCameraFileMBS(it)
		    dim size   as string = str(f.FileSize/1024,"-0")+" KB"
		    
		    HList.AddRow "", f.Name, "", size
		    HList.RowTag(HList.LastIndex) = f
		    
		    ShowThumbnail HList, HList.LastIndex, f
		    ShowMetaData  HList, HList.LastIndex, f
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function canDelete() As Boolean
		  dim files() as ICCameraFileMBS = SelectedFiles
		  
		  for each f as ICCameraFileMBS in files
		    if not f.locked then
		      Return true
		    end if
		  next
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function canDownload() As Boolean
		  if HList.SelCount > 0 or FList.SelCount > 0 then
		    Return true
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckCamera()
		  dim camera as ICCameraDeviceMBS = selectedCamera
		  SyncButton.Enabled = Camera.canSyncClock
		  TakeButton.Enabled = Camera.canTakePicture
		  
		  dim files() as ICCameraFileMBS = camera.mediaFiles
		  for each f as ICCameraFileMBS in files
		    dim size   as string = str(f.FileSize/1024,"-0")+" KB"
		    
		    FList.AddRow "", f.Name, "", size
		    FList.RowTag(FList.LastIndex) = f
		    
		    ShowMetaData FList, FList.LastIndex, f
		    ShowThumbnail FList, FList.LastIndex, f
		  next
		  
		  dim items() as ICCameraItemMBS = camera.contents
		  for each it as ICCameraItemMBS in items
		    AddItem it
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub deletefiles(files() as ICCameraFileMBS)
		  dim camera as ICCameraDeviceMBS = selectedCamera
		  
		  camera.requestDeleteFiles files
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub didReceiveMetadataForItem(item as ICCameraItemMBS)
		  // got metadata or thumbnail
		  
		  dim u as integer = fList.ListCount-1
		  for i as integer = 0 to u
		    dim f as ICCameraItemMBS = fList.RowTag(i)
		    if f = item then
		      ShowMetaData FList, i, f
		    end if
		  next
		  
		  u = hList.ListCount-1
		  for i as integer = 0 to u
		    dim f as ICCameraItemMBS = hList.RowTag(i)
		    if f = item then
		      ShowMetaData FList, i, f
		    end if
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub didReceiveThumbnailForItem(item as ICCameraItemMBS)
		  // got metadata or thumbnail
		  
		  dim u as integer = fList.ListCount-1
		  for i as integer = 0 to u
		    dim f as ICCameraItemMBS = fList.RowTag(i)
		    if f = item then
		      ShowThumbnail FList, i, f
		      
		    end if
		  next
		  
		  u = hList.ListCount-1
		  for i as integer = 0 to u
		    dim f as ICCameraItemMBS = hList.RowTag(i)
		    if f = item then
		      ShowThumbnail FList, i, f
		      
		    end if
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub didRemoveDevice(d as ICDeviceMBS)
		  dim u as integer = List.ListCount-1
		  for i as integer = 0 to u
		    if list.RowTag(i) = d then
		      List.RemoveRow i
		    end if
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub didRemoveItems(items() as ICCameraItemMBS)
		  // remove items from both lists
		  
		  dim u as integer = FList.ListCount-1
		  for i as integer = u downto 0
		    dim v as Variant = Flist.RowTag(i)
		    if items.IndexOf(v) >= 0 then
		      FList.RemoveRow i
		    end if
		  next
		  
		  u = HList.ListCount-1
		  for i as integer = u downto 0
		    dim v as Variant = HList.RowTag(i)
		    if items.IndexOf(v) >= 0 then
		      HList.RemoveRow i
		    end if
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub downloadFiles(files() as ICCameraFileMBS)
		  dim options as new Dictionary
		  dim cfurl as CFURLMBS = NewCFURLMBSFile(SpecialFolder.Desktop)
		  
		  options.Value(ICCameraDeviceMBS.ICDownloadsDirectoryURL) = cfurl
		  
		  for each f as ICCameraFileMBS in files
		    dim d as ICDeviceMBS = f.Device
		    if d isa ICCameraDeviceMBS then
		      dim c as ICCameraDeviceMBS = ICCameraDeviceMBS(d)
		      c.requestDownloadFile f, options
		    end if
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub openCamera()
		  dim camera as ICCameraDeviceMBS = selectedCamera
		  
		  if camera<>Nil then
		    camera.requestOpenSession
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub readFiles(files() as ICCameraFileMBS)
		  
		  for each f as ICCameraFileMBS in files
		    dim d as ICDeviceMBS = f.Device
		    if d isa ICCameraDeviceMBS then
		      dim c as ICCameraDeviceMBS = ICCameraDeviceMBS(d)
		      c.requestReadDataFromFile f, 0, f.fileSize
		    end if
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function selectedCamera() As ICCameraDeviceMBS
		  
		  if List.ListIndex >= 0 then
		    Return List.RowTag(List.ListIndex)
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectedFiles() As ICCameraFileMBS()
		  dim files() as ICCameraFileMBS
		  
		  if Tab.Value = 0 then
		    dim u as integer = FList.ListCount-1
		    for i as integer = 0 to u
		      if FList.Selected(i) then
		        files.Append FList.RowTag(i)
		      end if
		    next
		  else
		    dim u as integer = HList.ListCount-1
		    for i as integer = 0 to u
		      if HList.Selected(i) then
		        files.Append HList.RowTag(i)
		      end if
		    next
		  end if
		  
		  Return files
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowMetaData(list as listbox, row as integer, f as ICCameraItemMBS)
		  dim d as Dictionary = f.MetadataIfAvailable
		  
		  if d<>Nil then
		    dim make as string
		    dim model as string
		    dim width as string
		    dim height as string
		    dim datum as string
		    
		    dim Exif as Dictionary = d.Lookup("{Exif}", nil)
		    dim Tiff as Dictionary = d.Lookup("{TIFF}", nil)
		    If Tiff<>nil then
		      make   = tiff.Lookup("Make", "")
		      model  = tiff.Lookup("Model", "")
		    end if
		    If Exif<>nil then
		      datum  = Exif.Lookup("DateTimeOriginal", "")
		      width  = Exif.Lookup("PixelWidth", "")
		      height = Exif.Lookup("PixelHeight", "")
		    end if
		    
		    List.Cell(row,2) = datum
		    List.Cell(row,4) = Width
		    List.Cell(row,5) = height
		    List.Cell(row,6) = make
		    List.Cell(row,7) = model
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowThumbnail(list as listbox, row as integer, f as ICCameraItemMBS)
		  dim image as CGImageMBS = f.thumbnailIfAvailable
		  if image<>nil then
		    dim pic as Picture = image.Picture
		    
		    if pic<>Nil then
		      if FList = list then
		        list.CellTag(row,0) = pic
		      elseif list = HList then
		        list.RowPicture(row) = pic.ProportinalScaled(16,16)
		      end if
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateButtons()
		  dim l as listbox
		  
		  if tab.Value = 0 then
		    l = FList
		  else
		    l = HList
		  end if
		  
		  if l.SelCount > 0 then
		    DownloadButton.Enabled = true
		    
		    ReadButton.Enabled = true
		    DeleteButton.Enabled = true
		  else
		    DownloadButton.Enabled = false
		    
		    ReadButton.Enabled = false
		    DeleteButton.Enabled = false
		    
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Untitled
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		Cameras() As ICCameraDeviceMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		DeviceBrowser As ICDeviceBrowserMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		events As MyImageCaptureEvents
	#tag EndProperty


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub Change()
		  
		  
		  HList.DeleteAllRows
		  FList.DeleteAllRows
		  SyncButton.Enabled = false
		  TakeButton.Enabled = false
		  
		  if me.ListIndex >= 0 then
		    openCamera
		    
		  end if
		  
		  UpdateButtons
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  if column = 0 then
		    dim pic as Picture = me.CellTag(row, column)
		    if pic<>Nil then
		      g.DrawPicture pic, 0, 0, 50, 50, 0, 0, pic.Width, pic.Height
		      Return true
		    end if
		  end if
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events HList
	#tag Event
		Sub Change()
		  UpdateButtons
		End Sub
	#tag EndEvent
	#tag Event
		Sub ExpandRow(row As Integer)
		  dim v as Variant = me.RowTag(row)
		  
		  if v isa ICCameraFolderMBS then
		    dim c as ICCameraFolderMBS = v
		    
		    dim items() as ICCameraItemMBS = c.contents
		    for each it as ICCameraItemMBS in items
		      AddItem it
		    next
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FList
	#tag Event
		Sub Change()
		  UpdateButtons
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  if column = 0 then
		    dim pic as Picture = me.CellTag(row, column)
		    if pic<>Nil then
		      g.DrawPicture pic, 0, 0, 50, 50, 0, 0, pic.Width, pic.Height
		      Return true
		    end if
		  end if
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events SyncButton
	#tag Event
		Sub Action()
		  dim camera as ICCameraDeviceMBS = selectedCamera
		  
		  if camera<>nil then
		    camera.requestSyncClock
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TakeButton
	#tag Event
		Sub Action()
		  dim camera as ICCameraDeviceMBS = selectedCamera
		  
		  if camera<>nil then
		    camera.requestTakePicture
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DownloadButton
	#tag Event
		Sub Action()
		  downloadFiles SelectedFiles
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DeleteButton
	#tag Event
		Sub Action()
		  deletefiles SelectedFiles
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ReadButton
	#tag Event
		Sub Action()
		  readFiles SelectedFiles
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
