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
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   101303966
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Combine PDF files with DynaPDF"
   Visible         =   True
   Width           =   609
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
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   366
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
      Width           =   427
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton AddButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Add PDF file"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   459
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
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
      Width           =   130
   End
   Begin PushButton CombineButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Combine..."
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   459
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   360
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   130
   End
   Begin PopupMenu PopupMenu1
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
      Left            =   459
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   328
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   130
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub Combine()
		  dim pdf as new MyDynapdfMBS
		  
		  'pdf.SetLicenseKey "Pro" // For this example you can use a Lite, Pro or Enterprise License
		  
		  // you need DynaPDF Pro + PDF/A extension for fixing imported PDFs and convert to PDF/A.
		  
		  
		  dim outFile as folderitem = GetSaveFolderItem(MyFileTypes.Pdf, "Combine PDF files.pdf")
		  
		  if outFile = nil then Return
		  
		  call pdf.CreateNewPDF(outFile)
		  
		  dim flags as integer = Bitwise.BitOr(pdf.kifImportAsPage, pdf.kifImportAll, pdf.kifPrepareForPDFA)
		  call pdf.SetImportFlags(flags)
		  
		  // make it a tagged PDF
		  call pdf.CreateStructureTree
		  
		  
		  dim c as integer = List.ListCount-1
		  for i as integer = 0 to c
		    
		    dim f as FolderItem = List.CellTag(i, 0)
		    
		    call pdf.openimportFile(f)
		    call pdf.ImportPDFFile(pdf.GetPageCount+1)
		    call pdf.CloseImportFile
		    
		  next
		  
		  // flatten forms
		  // -> requires Pro
		  call pdf.FlattenForm
		  
		  // flatten annotations
		  call pdf.FlattenAnnots(pdf.kaffNone)
		  
		  // make sure we conform
		  // for perfect usage, you need PDF/A extension for DynaPDF (extra purchase)
		  // dim retval as integer = pdf.CheckConformance(pdf.kctPDFA_1b_2005,0)
		  dim retval as integer = pdf.CheckConformance(pdf.kctNormalize,0)
		  
		  // add missing output intent
		  Select case retval
		  case 1
		    call pdf.AddOutputIntent(FindFile("Generic RGB Profile.icc")) // RGB
		  case 2
		    call pdf.AddOutputIntent(FindFile("Generic CMYK Profile.icc")) // CMYK
		  case 3
		    call pdf.AddOutputIntent(FindFile("Generic Gray Profile.icc")) // Gray
		  end Select
		  
		  call pdf.setPDFVersion(DynapdfMBS.kpvPDFA_2005)
		  
		  call pdf.closefile
		  
		  
		  
		  outFile.Launch
		  
		  
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events AddButton
	#tag Event
		Sub Action()
		  dim f as FolderItem = GetOpenFolderItem(MyFileTypes.Pdf)
		  
		  if f<>Nil then
		    List.AddRow f.DisplayName
		    List.Celltag(List.LastIndex,0)=f
		  end if
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CombineButton
	#tag Event
		Sub Action()
		  combine
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupMenu1
	#tag Event
		Sub Open()
		  me.AddRow "PDF 1.3", DynaPDFMBS.kpvPDF_1_3
		  me.AddRow "PDF 1.4", DynaPDFMBS.kpvPDF_1_4
		  me.AddRow "PDF 1.5", DynaPDFMBS.kpvPDF_1_5
		  me.AddRow "PDF 1.6", DynaPDFMBS.kpvPDF_1_6
		  me.AddRow "PDF 1.7", DynaPDFMBS.kpvPDF_1_7
		  me.AddRow "PDF 2.0", DynaPDFMBS.kpvPDF_2_0
		  
		  me.AddRow "PDF/X-1a:2001", DynaPDFMBS.kpvPDFX1a_2001
		  me.AddRow "PDF/X-1a:2003", DynaPDFMBS.kpvPDFX1a_2003
		  me.AddRow "PDF/X-3:2002", DynaPDFMBS.kpvPDFX3_2002
		  me.AddRow "PDF/X-3:2003", DynaPDFMBS.kpvPDFX3_2003
		  me.AddRow "PDF/X-4", DynaPDFMBS.kpvPDFX_4
		  
		  me.AddRow "PDF/A 1a", DynaPDFMBS.kpvPDFA_1a
		  me.AddRow "PDF/A 2005", DynaPDFMBS.kpvPDFA_2005
		  me.AddRow "PDF/A-1b 2005", DynaPDFMBS.kpvPDFA_2005
		  
		  me.AddRow "PDF/A-2a", DynaPDFMBS.kpvPDFA_2a
		  me.AddRow "PDF/A-2b", DynaPDFMBS.kpvPDFA_2b
		  me.AddRow "PDF/A-2u", DynaPDFMBS.kpvPDFA_2u
		  
		  me.AddRow "PDF/A-3a", DynaPDFMBS.kpvPDFA_3a
		  me.AddRow "PDF/A-3b", DynaPDFMBS.kpvPDFA_3b
		  me.AddRow "PDF/A-3u", DynaPDFMBS.kpvPDFA_3u
		  
		  
		  
		  me.ListIndex = 13
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
