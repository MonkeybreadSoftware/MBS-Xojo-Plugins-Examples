#tag Window
Begin Window MainWindow
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
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "List"
   Visible         =   True
   Width           =   600
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   4
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
      Height          =   334
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Item	Shop	Price	Comment\nDVD-Player	Amazon	50,00€	Just a test\nOranges	Grocery	20,00€	Health vegetables\nApples	Grocery	30,00€	A food for all Apple fans\niPad	Apple Store	499,00€	And something to surf on the couch."
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
   Begin PushButton SaveButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Save PDF"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   500
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
      Top             =   360
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  List.ColumnAlignment(2) = List.AlignRight
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events SaveButton
	#tag Event
		Sub Action()
		  // setup PDF
		  dim pdf as new MyDynaPDFMBS
		  
		  call pdf.CreateNewPDF
		  call pdf.SetPageCoords(pdf.kpcTopDown)
		  call pdf.Append
		  call pdf.SetFont("Helvetica", 12)
		  
		  // create table
		  dim ColumnCount as integer = List.ColumnCount
		  
		  const AllColumns = -1
		  const AllRows = -1
		  const TableWidth = 500.0
		  
		  dim tbl as DynaPDFTableMBS = pdf.CreateTable(List.ListCount, ColumnCount, TableWidth, 100.0)
		  call tbl.SetBorderWidth(AllRows, AllColumns, 1.0, 1.0, 1.0, 1.0)
		  call tbl.SetFont(AllRows, AllColumns, "Helvetica", pdf.kfsNone, false, pdf.kcpUnicode)
		  call tbl.SetGridWidth( 1.0, 1.0)
		  call tbl.SetGridHorizontalColor(100, 100, 100)
		  call tbl.SetGridVerticalColor(100, 100, 100)
		  call tbl.SetBorderColor(AllRows, AllColumns, 100, 100, 100)
		  
		  dim ColumnWidths() as Double
		  redim ColumnWidths(ColumnCount-1)
		  
		  // add header row
		  dim rowNum as integer = tbl.AddRow
		  
		  call tbl.SetFlags rowNum, -1, tbl.ktfHeaderRow
		  
		  for Column as integer = 0 to ColumnCount-1
		    dim t as string = List.Heading(Column)
		    call tbl.SetCellText rowNum, Column, pdf.ktaLeft,   tbl.kcoCenter, t
		    dim w as Double = pdf.GetTextWidth(t)
		    ColumnWidths(Column) = w
		  next
		  
		  // now fill all the cells
		  dim c as integer = List.ListCount-1
		  for Row as integer = 0 to c
		    
		    rowNum = tbl.AddRow
		    for Column as integer = 0 to ColumnCount-1
		      
		      // which alignment for this cell?
		      dim AlignMent as integer = pdf.ktaLeft
		      
		      Select case List.ColumnAlignment(column)
		      case List.AlignCenter
		        AlignMent = pdf.ktaCenter
		      case List.AlignRight
		        AlignMent = pdf.ktaRight
		      end Select
		      
		      dim t as string = list.Cell(row, Column)
		      call tbl.SetCellText rowNum, Column, AlignMent,  tbl.kcoCenter, t
		      dim w as Double = pdf.GetTextWidth(t)
		      if w > ColumnWidths(Column) then
		        ColumnWidths(Column) = w
		      end if
		      
		    next
		  next
		  
		  dim SumColumnWidth as Double
		  for Column as integer = 0 to ColumnCount-1
		    if ColumnWidths(Column) > TableWidth/2 then
		      // limit all columns to max 50%
		      ColumnWidths(Column) = TableWidth/2
		    end if
		    
		    SumColumnWidth = SumColumnWidth + ColumnWidths(Column)
		  next
		  
		  if SumColumnWidth >= TableWidth then
		    dim f as Double = TableWidth / SumColumnWidth
		    
		    for Column as integer = 0 to ColumnCount-1
		      ColumnWidths(Column) = ColumnWidths(Column) * f
		      
		      call tbl.SetColWidth(Column, ColumnWidths(Column), false)
		    next
		  end if
		  
		  
		  // Draw the table now
		  call tbl.DrawTable(50.0, 50.0, 742.0)
		  while tbl.HaveMore
		    call pdf.EndPage
		    call pdf.Append
		    call tbl.DrawTable(50.0, 50.0, 742.0)
		  wend
		  call pdf.EndPage
		  
		  
		  
		  
		  // A table stores errors and warnings in the error log
		  dim err as DynaPDFErrorMBS
		  
		  dim ErrLogMessageCount as integer = pdf.GetErrLogMessageCount
		  for ErrLogMessage as integer = 0 to ErrLogMessageCount-1
		    err = pdf.GetErrLogMessage(ErrLogMessage)
		    MsgBox err.Message
		  next
		  
		  // No fatal error occurred?
		  if pdf.HaveOpenDoc then
		    // We write the output file into the current directory.
		    // OK, now we can open the output file.
		    dim f as FolderItem = SpecialFolder.Desktop.Child("Table with Listbox.pdf")
		    if not pdf.OpenOutputFile(f) then
		      MsgBox "Failed to open output file!"
		    end if
		    call pdf.CloseFile
		    
		    f.launch
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
