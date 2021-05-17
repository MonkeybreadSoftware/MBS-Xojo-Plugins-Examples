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
   Height          =   539
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1727808528
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Scanner"
   Visible         =   True
   Width           =   922
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
      Height          =   473
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
      Top             =   46
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   233
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Scanners"
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
   Begin ImageWell Image
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   441
      HelpTag         =   ""
      Image           =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   265
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   46
      Transparent     =   True
      Visible         =   True
      Width           =   637
   End
   Begin PopupMenu PopupMode
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   702
      ListIndex       =   0
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
      Top             =   13
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin Label Label2
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
      Left            =   590
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Scan Mode:"
      TextAlign       =   2
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
   Begin PushButton OverviewButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Overview"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   638
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   499
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton ScanButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Scan"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   730
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   499
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton OpenButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Open"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   822
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   499
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin ProgressBar ProgressBar1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Indeterminate   =   False
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   265
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   100
      Scope           =   "0"
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   499
      Transparent     =   True
      Value           =   0.0
      Visible         =   False
      Width           =   200
   End
   Begin Label StatusMessage
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
      Left            =   477
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   499
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   149
   End
   Begin Timer ProgressTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   2
      Period          =   500
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  events = new MyImageCaptureEvents
		  
		  PopupMode.DeleteAllRows
		  PopupMode.Enabled = false
		  
		  DeviceBrowser = new ICDeviceBrowserMBS
		  DeviceBrowser.browsedDeviceTypeMask = bitwise.BitOr(ICDeviceMBS.ICDeviceLocationTypeMaskLocal, ICDeviceMBS.ICDeviceLocationTypeMaskRemote, ICDeviceMBS.ICDeviceTypeMaskScanner)
		  DeviceBrowser.start
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddDevice(scanner as ICScannerDeviceMBS)
		  
		  Scanners.Append scanner
		  
		  List.AddRow "", scanner.Name
		  List.RowTag(List.LastIndex) = scanner
		  
		  dim image as CGImageMBS = scanner.Icon
		  dim pic as Picture = image.Picture
		  
		  List.CellTag(List.LastIndex,0) = pic
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub deviceDidBecomeReady(scanner as ICScannerDeviceMBS)
		  dim availabeTypes() as integer = scanner.availableFunctionalUnitTypes
		  dim functionalUnit as ICScannerFunctionalUnitMBS = scanner.selectedFunctionalUnit
		  
		  PopupMode.Enabled = false
		  PopupMode.DeleteAllRows
		  
		  if availabeTypes.Ubound >= 0 then
		    dim selectedfunctionalUnit as integer = -1
		    
		    if functionalUnit<>nil then
		      selectedfunctionalUnit = functionalUnit.type
		    end if
		    
		    for each n as integer in availabeTypes 
		      Select case n
		      case ICScannerFunctionalUnitMBS.ICScannerFunctionalUnitTypeFlatbed
		        PopupMode.AddRow "Flatbed", ICScannerFunctionalUnitMBS.ICScannerFunctionalUnitTypeFlatbed
		        
		        if selectedfunctionalUnit = ICScannerFunctionalUnitMBS.ICScannerFunctionalUnitTypeFlatbed then
		          PopupMode.ListIndex = PopupMode.ListCount-1
		        end if
		        
		      case ICScannerFunctionalUnitMBS.ICScannerFunctionalUnitTypePositiveTransparency
		        PopupMode.AddRow "Postive Transparency", ICScannerFunctionalUnitMBS.ICScannerFunctionalUnitTypePositiveTransparency
		        
		        if selectedfunctionalUnit = ICScannerFunctionalUnitMBS.ICScannerFunctionalUnitTypePositiveTransparency then
		          PopupMode.ListIndex = PopupMode.ListCount-1
		        end if
		        
		      case ICScannerFunctionalUnitMBS.ICScannerFunctionalUnitTypeNegativeTransparency
		        PopupMode.AddRow "Negative Transparency", ICScannerFunctionalUnitMBS.ICScannerFunctionalUnitTypeNegativeTransparency
		        
		        if selectedfunctionalUnit = ICScannerFunctionalUnitMBS.ICScannerFunctionalUnitTypeNegativeTransparency then
		          PopupMode.ListIndex = PopupMode.ListCount-1
		        end if
		        
		      case ICScannerFunctionalUnitMBS.ICScannerFunctionalUnitTypeDocumentFeeder
		        PopupMode.AddRow "Document Feeder", ICScannerFunctionalUnitMBS.ICScannerFunctionalUnitTypeDocumentFeeder
		        
		        if selectedfunctionalUnit = ICScannerFunctionalUnitMBS.ICScannerFunctionalUnitTypeDocumentFeeder then
		          PopupMode.ListIndex = PopupMode.ListCount-1
		        end if
		        
		      end select
		    next
		    
		    PopupMode.Enabled = true
		  end if
		  scanButton.Enabled = true
		  overviewButton.Enabled = true
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub didCompleteOverviewScan(scanner as ICScannerDeviceMBS)
		  ProgressBar1.Visible = false
		  ProgressTimer.mode = 0
		  
		  if scanner<>Nil then
		    dim v as Variant = scanner.selectedFunctionalUnit.overviewImage
		    if v isa CGImageMBS then
		      dim img as CGImageMBS = v
		      dim pic as Picture = img.Picture
		      image.Image = pic.ProportinalScaled(image.Width, image.Height)
		      Return
		    end if
		  end if
		  
		  image.Image = nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub didCompleteScan()
		  ProgressBar1.Visible = false
		  ProgressTimer.mode = 0
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub didReceiveStatusInformation(Status as Dictionary)
		  
		  dim StatusValue as string = status.Lookup(ICDeviceMBS.ICStatusNotificationKey, "")
		  
		  if StatusValue = ICScannerDeviceMBS.ICScannerStatusWarmingUp then
		    
		    ProgressBar1.Maximum = 0
		    ProgressBar1.Value = 0
		    ProgressTimer.mode = 0
		    StatusMessage.Text = status.lookup(ICDeviceMBS.ICLocalizedStatusNotificationKey, "?")
		    ProgressBar1.Visible = True
		    
		  elseif StatusValue = ICScannerDeviceMBS.ICScannerStatusWarmUpDone then
		    
		    StatusMessage.Text = ""
		    ProgressBar1.Value = 0
		    ProgressBar1.Maximum = 100
		    ProgressBar1.Visible = True
		    ProgressTimer.mode = 2
		    
		  end if
		  
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
		Sub openCloseSession()
		  dim s as ICScannerDeviceMBS = selectedScanner
		  
		  if s<>nil then
		    
		    if s.HasOpenSession then
		      s.requestCloseSession
		    else
		      s.requestOpenSession
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function selectedScanner() As ICScannerDeviceMBS
		  if list.listindex >= 0 then
		    Return List.RowTag(List.ListIndex)
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub startOverviewScan()
		  dim scanner as ICScannerDeviceMBS = self.selectedScanner
		  dim fu as ICScannerFunctionalUnitMBS = scanner.selectedFunctionalUnit
		  
		  if ( fu.canPerformOverviewScan and ( fu.scanInProgress = false ) and ( fu.overviewScanInProgress = false ) ) then
		    
		    
		    fu.overviewResolution = fu.supportedResolutions.indexGreaterThanOrEqualToIndex(72)
		    
		    scanner.requestOverviewScan
		    ProgressBar1.Visible = true
		    ProgressBar1.Value = 0
		    ProgressBar1.Maximum = 100
		    ProgressTimer.mode = 2
		    
		  else
		    scanner.cancelScan
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartScan()
		  dim scanner as ICScannerDeviceMBS = self.selectedScanner
		  dim fu as ICScannerFunctionalUnitMBS = scanner.selectedFunctionalUnit
		  
		  if ( ( fu.scanInProgress = false ) and ( fu.overviewScanInProgress = false ) ) then
		    
		    if ( fu.type = ICScannerFunctionalUnitMBS.ICScannerFunctionalUnitTypeDocumentFeeder ) then
		      
		      dim dfu as ICScannerFunctionalUnitDocumentFeederMBS = ICScannerFunctionalUnitDocumentFeederMBS(fu)
		      
		      dfu.documentType  = ICScannerFunctionalUnitMBS.ICScannerDocumentTypeUSLetter
		      
		    else
		      dim s as NSSizeMBS = fu.physicalSize
		      
		      fu.measurementUnit  = ICScannerFunctionalUnitMBS.ICScannerMeasurementUnitInches
		      fu.scanArea         = new NSRectMBS( 0.0, 0.0, s.width, s.height )
		    end if
		    
		    fu.resolution                   = fu.supportedResolutions.indexGreaterThanOrEqualToIndex(100)
		    fu.bitDepth                     = ICScannerFunctionalUnitMBS.ICScannerBitDepth8Bits
		    fu.pixelDataType                = ICScannerFunctionalUnitMBS.ICScannerPixelDataTypeRGB
		    
		    scanner.transferMode            = ICScannerDeviceMBS.ICScannerTransferModeFileBased
		    scanner.downloadsDirectory      = SpecialFolder.Desktop.URLPath
		    scanner.documentName            = "Scan"
		    scanner.documentUTI             = UTTypeMBS.kUTTypeJPEG
		    
		    scanner.requestScan
		    ProgressBar1.Visible = true
		    ProgressBar1.Value = 0
		    ProgressBar1.Maximum = 100
		    ProgressTimer.mode = 2
		    
		  else
		    scanner.cancelScan
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		DeviceBrowser As ICDeviceBrowserMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		events As MyImageCaptureEvents
	#tag EndProperty

	#tag Property, Flags = &h0
		Scanners() As ICScannerDeviceMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events List
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
	#tag Event
		Sub Change()
		  OpenButton.Enabled = me.ListIndex >= 0
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupMode
	#tag Event
		Sub Change()
		  
		  if me.Enabled and me.ListIndex>=0 then
		    
		    dim scanner as ICScannerDeviceMBS = self.selectedScanner
		    dim selectedType as integer = me.RowTag(me.ListIndex)
		    
		    if selectedType <> scanner.selectedFunctionalUnit.type then
		      scanner.requestSelectFunctionalUnit selectedType
		    end if
		    
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events OverviewButton
	#tag Event
		Sub Action()
		  startOverviewScan
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ScanButton
	#tag Event
		Sub Action()
		  startscan
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events OpenButton
	#tag Event
		Sub Action()
		  openCloseSession
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProgressTimer
	#tag Event
		Sub Action()
		  dim scanner as ICScannerDeviceMBS = selectedScanner
		  
		  if scanner<>Nil then
		    dim fu as ICScannerFunctionalUnitMBS = scanner.selectedFunctionalUnit
		    
		    if fu<>nil then
		      dim d as Double = fu.scanProgressPercentDone
		      
		      ProgressBar1.Value = d
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
