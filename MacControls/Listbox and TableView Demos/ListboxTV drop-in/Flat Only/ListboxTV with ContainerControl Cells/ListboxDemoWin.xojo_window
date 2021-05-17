#tag Window
Begin Window ListboxDemoWin Implements ListBoxTVDataSource
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   355
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   332690377
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "NSTableControlMBS Demo"
   Visible         =   True
   Width           =   523
   Begin ListBoxTV cocoaListbox
      AcceptTabs      =   False
      allowsColumnReordering=   True
      allowsColumnResizing=   False
      allowsColumnSelection=   False
      allowsEmptySelection=   False
      allowsMultipleSelection=   False
      AutoDeactivate  =   True
      AutoHideScrollBars=   True
      autohidesScrollers=   False
      ColumnCount     =   2
      ColumnsResizable=   True
      ColumnWidths    =   "30%"
      DefaultRowHeight=   0
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      hasHorizontalScroller=   False
      hasVerticalScroller=   False
      Height          =   321
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Col 1	Col 2"
      IntercellSpacing=   0
      Left            =   0
      ListCount       =   0
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaintainColumnWidths=   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      ScrollPosition  =   0
      SelectionType   =   1
      SortedColumn    =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   14
      Transparent     =   True
      UseContextualClickEvent=   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   523
      _suppressReload =   False
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub adjustContainerSizes()
		  for each c as ContainerCell in mCellContainers
		    c.AdjustContainerSize
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSource_Cell(row as Integer, column as Integer) As ListCellTV
		  // Part of the ListBoxTVDataSource interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_CellDidUpdate(row as Integer, column as Integer, cell as ListCellTV, updatesText as Boolean, updatesChecked as Boolean)
		  // Part of the ListBoxTVDataSource interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_CellWillUpdate(row as Integer, column as Integer, cell as ListCellTV, updatesText as Boolean, updatesChecked as Boolean)
		  // Part of the ListBoxTVDataSource interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_DeleteAllRows()
		  // Part of the ListBoxTVDataSource interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_MoveColumn(fromIdx as Integer, toIdx as Integer)
		  // Part of the ListBoxTVDataSource interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_MoveRows(fromIdxs() as Integer, toAboveIdx as Integer)
		  // Part of the ListBoxTVDataSource interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSource_RowCount() As Integer
		  // Part of the ListBoxTVDataSource interface.
		  
		  return mRowCount
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSource_RowTag(row as Integer) As Variant
		  // Part of the ListBoxTVDataSource interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_RowTag(row as Integer, assigns tag as Variant)
		  // Part of the ListBoxTVDataSource interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_SetColumnCount(colCount as Integer)
		  // Part of the ListBoxTVDataSource interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_SortRows(sorters() as NSSortDescriptorMBS)
		  // Part of the ListBoxTVDataSource interface.
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mCellContainers() As ContainerCell
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRowCount As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events cocoaListbox
	#tag Event
		Sub Open()
		  me.TableView.rowHeight = 120
		  me.TableView.backgroundColor = NSColorMBS.grayColor
		  me.IntercellSpacing = 0 // Removes gaps between cells
		  
		  mRowCount = 10
		  me.DataSource = self // this lets ListboxTV invoke the DataSource_... functions here to inquire the count of rows in our list
		End Sub
	#tag EndEvent
	#tag Event
		Function view(tableColumn as NSTableColumnMBS, row as Integer) As NSViewMBS
		  dim c as new ContainerCell (me, tableColumn, row)
		  mCellContainers.Append c
		  c.EmbedWithin (self, 0, 0)
		  
		  c.Width = tableColumn.Width
		  
		  if me.TableView.rowHeight > 0 then
		    c.Height = me.TableView.rowHeight
		  else
		    break // you should set TableView.rowHeight to a fixed value in the Open event
		  end if
		  
		  return c.NSViewMBS
		End Function
	#tag EndEvent
	#tag Event
		Sub DidResizeCells()
		  adjustContainerSizes
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
