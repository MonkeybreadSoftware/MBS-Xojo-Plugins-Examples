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
   Height          =   451
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1389869898
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Annotations"
   Visible         =   False
   Width           =   915
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   10
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
      Height          =   438
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Typ	Subtype	Name	Content	Rectangle	DestFile	DestPage	Subject	Author	State"
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
      Width           =   917
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub run(file as FolderItem)
		  Title = file.DisplayName
		  
		  dim p as new MyDynapdfMBS
		  
		  p.SetLicenseKey "Lite" // For this example you can use Lite, Pro or Enterprise License
		  
		  call p.CreateNewPDF(nil)
		  
		  // Skip anything that is not required
		  call p.SetImportFlags p.kifImportAll+p.kifImportAsPage
		  
		  // From which PDF file do you want to extract the images?
		  call p.OpenImportFile(file, p.kptOpen, "")
		  
		  // import pages
		  call p.ImportPDFFile(1, 1.0, 1.0)
		  
		  call p.CloseImportFile
		  
		  // lookup all links
		  dim u as integer = p.GetAnnotCount-1
		  Title = str(p.GetAnnotCount)+" annotations"
		  for i as integer = 0 to u
		    dim b as DynaPDFAnnotationExMBS = p.GetAnnotEx(i)
		    
		    dim bbox as DynaPDFRectMBS = b.BBox
		    List.AddRow ""
		    
		    Select case b.Type
		    case p.kat3D
		      List.Cell(List.LastIndex,0) = "3D"
		    case p.katCaret
		      List.Cell(List.LastIndex,0) = "Caret"
		    case p.katCircle
		      List.Cell(List.LastIndex,0) = "Circle"
		    case p.katFileAttach
		      List.Cell(List.LastIndex,0) = "FileAttach"
		    case p.katFileLink
		      List.Cell(List.LastIndex,0) = "FileLink"
		    case p.katFreeText
		      List.Cell(List.LastIndex,0) = "FreeText"
		    case p.katHighlight
		      List.Cell(List.LastIndex,0) = "Highlight"
		    case p.katInk
		      List.Cell(List.LastIndex,0) = "Ink"
		    case p.katLine
		      List.Cell(List.LastIndex,0) = "Line"
		    case p.katMovieAnnot
		      List.Cell(List.LastIndex,0) = "MovieAnnot"
		    case p.katPageLink
		      List.Cell(List.LastIndex,0) = "PageLink"
		    case p.katPolygon
		      List.Cell(List.LastIndex,0) = "Polygon"
		    case p.katPolyLine
		      List.Cell(List.LastIndex,0) = "PolyLine"
		    case p.katPopUp
		      List.Cell(List.LastIndex,0) = "PopUp"
		    case p.katPrinterMark
		      List.Cell(List.LastIndex,0) = "PrinterMark"
		    case p.katProjection
		      List.Cell(List.LastIndex,0) = "Projection"
		    case p.katRedact
		      List.Cell(List.LastIndex,0) = "Redact"
		    case p.katRichMedia
		      List.Cell(List.LastIndex,0) = "RichMedia"
		    case p.katScreen
		      List.Cell(List.LastIndex,0) = "Screen"
		    case p.katSoundAnnot
		      List.Cell(List.LastIndex,0) = "SoundAnnot"
		    case p.katSquare
		      List.Cell(List.LastIndex,0) = "Square"
		    case p.katSquiggly
		      List.Cell(List.LastIndex,0) = "Squiggly"
		    case p.katStamp
		      List.Cell(List.LastIndex,0) = "Stamp"
		    case p.katStrikeOut
		      List.Cell(List.LastIndex,0) = "StrikeOut"
		    case p.katText
		      List.Cell(List.LastIndex,0) = "Text"
		    case p.katTrapNet
		      List.Cell(List.LastIndex,0) = "TrapNet"
		    case p.katUnderline
		      List.Cell(List.LastIndex,0) = "Underline"
		    case p.katUnknown
		      List.Cell(List.LastIndex,0) = "Unknown"
		    case p.katWatermark
		      List.Cell(List.LastIndex,0) = "Watermark"
		    case p.katWebLink
		      List.Cell(List.LastIndex,0) = "WebLink"
		    case p.katWidget
		      List.Cell(List.LastIndex,0) = "Widget"
		    else
		      List.Cell(List.LastIndex,0) = str(b.Type)
		    end Select
		    
		    list.Cell(List.LastIndex,1) = b.Subtype
		    list.Cell(List.LastIndex,2) = b.name
		    list.Cell(List.LastIndex,3) = b.Content
		    List.Cell(List.LastIndex,4) = Format(BBox.Left,"0")+"/"+Format(BBox.top,"0")+" "+Format(BBox.Right,"0")+"/"+Format(BBox.Bottom,"0")
		    list.Cell(List.LastIndex,5) = b.DestFile
		    list.Cell(List.LastIndex,6) = str(b.DestPage)
		    list.Cell(List.LastIndex,7) = b.Subject
		    list.Cell(List.LastIndex,8) = b.Author
		    list.Cell(List.LastIndex,9) = b.State
		    
		  next
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		bookmarkChildren As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		bookmarks As Dictionary
	#tag EndProperty


#tag EndWindowCode

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
