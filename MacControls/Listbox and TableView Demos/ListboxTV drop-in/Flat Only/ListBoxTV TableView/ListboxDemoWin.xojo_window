#tag Window
Begin Window ListboxDemoWin
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   693
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
   Width           =   603
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
      ColumnCount     =   5
      ColumnsResizable=   True
      ColumnWidths    =   "30%,*,2*,0,"
      DefaultRowHeight=   0
      Enabled         =   True
      EnableDrag      =   True
      EnableDragReorder=   True
      GridLinesHorizontal=   2
      GridLinesVertical=   2
      HasHeading      =   True
      hasHorizontalScroller=   False
      hasVerticalScroller=   False
      Height          =   300
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "TypeEditable	Col1	Col2	#3	Col4"
      IntercellSpacing=   0
      Left            =   20
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
      ScrollbarHorizontal=   True
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
      UseFocusRing    =   True
      Visible         =   True
      Width           =   420
      _suppressReload =   False
   End
   Begin Listbox xojoListbox
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   5
      ColumnsResizable=   True
      ColumnWidths    =   "30%,*,2*,0,"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   True
      EnableDragReorder=   True
      GridLinesHorizontal=   2
      GridLinesVertical=   2
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   320
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "TypeEditable	Col1	Col2	#3	Col4"
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   True
      ScrollBarVertical=   True
      SelectionType   =   1
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   326
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   420
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   2
      Period          =   200
      Scope           =   "0"
      TabPanelIndex   =   "0"
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
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   658
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   563
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Invert Sel"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   452
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
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   131
   End
   Begin PushButton PushButton3
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Recalc ColWidths"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   452
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   78
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   131
   End
   Begin PushButton PushButton5
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Sort"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   452
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   276
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   131
   End
   Begin CheckBox CheckBox1
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "CellClick -> True"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   452
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      State           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   141
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   140
   End
   Begin CheckBox CheckBox2
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Has Heading"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   452
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      State           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   167
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   140
   End
   Begin TextField TextField1
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   452
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "0"
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   197
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   131
   End
   Begin PushButton setSortedColumn
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Set SortedColumn"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   452
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   225
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   131
   End
   Begin PushButton PushButton6
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "PressHeader"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   452
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   251
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   131
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   ">>"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   534
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   49
   End
   Begin PushButton PushButton7
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "<<"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   452
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   49
   End
   Begin PushButton PushButton4
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Upd. WidthExprs"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   452
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   109
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   131
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  arrangeListBoxes()
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  arrangeListBoxes
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub arrangeListBoxes()
		  // Make both list boxes share half of the window height each
		  dim h as Integer = xojoListbox.Height + cocoaListbox.Height
		  cocoaListbox.Height = h \ 2
		  dim h2 as Integer = h - cocoaListbox.Height
		  xojoListbox.Top = xojoListbox.Top - (h2 - xojoListbox.Height)
		  xojoListbox.Height = h2
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  dim p as new Picture (16, 16)
		  dim g as Graphics = p.Graphics
		  g.ForeColor = &cDBE8FB00
		  g.FillRect 0, 0, g.Width, g.Height
		  g.ForeColor = &c041DFF00
		  g.DrawRoundRect 1, 1, g.Width-2, g.Height-2, 8, 8
		  g.DrawLine 1, 1, g.Width-2, g.Height-2
		  g.DrawLine 1, g.Height-2, g.Width-2, 1
		  mSampleImage = p
		  
		  super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub log(msg as String)
		  LogWin.Log msg
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mCellClickResult As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSampleImage As Picture
	#tag EndProperty


	#tag Constant, Name = DynamicListCount, Type = Double, Dynamic = False, Default = \"25", Scope = Public
	#tag EndConstant

	#tag Constant, Name = StaticListCount, Type = Double, Dynamic = False, Default = \"20", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events cocoaListbox
	#tag Event
		Sub Open()
		  for row as integer = 0 to StaticListCount-1
		    me.AddRow Format(row, "#.0")
		    for col as Integer = 1 to me.ColumnCount-1
		      if col = 1 or col = 2 then
		        // 2nd and 3rd columns get random values for sort testing
		        me.Cell (row, col) = Chr(col+65)+Str(Rnd*30,"#")
		      else
		        me.Cell (row, col) = Chr(col+65)+Str(row)
		      end if
		    next
		  next
		  
		  for row as Integer = 1 to 8
		    me.CellAlignmentOffset (row, 1) = row * 4
		  next
		  
		  me.CellAlignment (1, 0) = ListBox.AlignLeft
		  me.CellAlignment (2, 0) = ListBox.AlignCenter
		  me.CellAlignment (3, 0) = ListBox.AlignRight
		  me.CellAlignment (4, 0) = ListBox.AlignDecimal
		  me.Cell (1, 0) = "AlignLeft"
		  me.Cell (2, 0) = "AlignCenter"
		  me.Cell (3, 0) = "AlignRight"
		  me.Cell (4, 0) = "AlignDecimal"
		  
		  me.ColumnAlignment (2) = ListBox.AlignCenter
		  
		  me.Column(0).MinWidthActual = 40
		  me.Column(1).MinWidthActual = 60
		  me.Column(2).MinWidthActual = 30
		  me.Column(4).MinWidthActual = 10
		  
		  me.ColumnType(0) = ListBox.TypeEditable
		  me.CellType(1,1) = ListBox.TypeCheckbox
		  me.CellType(1,2) = ListBox.TypeCheckbox
		  me.CellType(2,1) = ListBox.TypeCheckbox
		  me.CellType(2,2) = ListBox.TypeCheckbox
		  me.CellType(3,1) = ListBox.TypeEditable
		  me.CellType(4,1) = ListBox.TypeEditable
		  me.Cell(1,1) = me.Cell(1,1) + " TypeCheckbox"
		  me.Cell(1,2) = me.Cell(1,2) + " TypeCheckbox"
		  me.Cell(2,1) = me.Cell(2,1) + " TypeCheckbox"
		  me.Cell(2,2) = me.Cell(2,2) + " TypeCheckbox"
		  me.Cell(3,1) = me.Cell(3,1) + " TypeEditable"
		  me.Cell(4,1) = me.Cell(4,1) + " TypeEditable"
		  
		  me.RowPicture(6) = mSampleImage
		  me.CellType(6,0) = ListBox.TypeEditable
		  me.Cell(6,0) = "RowPicture, TypeEditable"
		  
		  for row as Integer = 2 to 4
		    me.CellTag(row, 1) = &cFFFE2500 : &cF4004500 ' let's use the CellTag to specify their background and text colors
		    me.Cell(row,1) = me.Cell(row,1) + " BgColor TextColor"
		  next
		  
		  me.AcceptRawDataDrop ("Test")
		  
		  //
		  // Custom settings that are not available in ListBox
		  //
		  
		  for col as Integer = 0 to me.ColumnCount-1
		    me.Column(col).SetFontAndSize "System", 0
		  next
		  
		  for row as Integer = 2 to 4
		    me.CellStyle(row,1).BackgroundColor = &cFFFE2500
		    me.CellStyle(row,1).TextColor = &cF4004500
		  next
		  
		  me.TableView.usesAlternatingRowBackgroundColors = true
		  me.TableView.allowsTypeSelect = true
		  
		  // Set up the dynamic DataSource
		  me.DataSource = new DynamicListBoxTVDataSource (me.DataSource, DynamicListCount)
		  
		  me.Reload ' this loads the listbox immediately - otherwise there may be a little delay (due to the Timer in _Private_ListBoxTV._needsReload)
		End Sub
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem, clickedRow as Integer, clickedColumn as Integer) As Boolean
		  if clickedRow < 0 then
		    MsgBox "You chose "+hitItem.Text+" on column "+Str(clickedColumn)
		  else
		    dim allSel() as String
		    for i as Integer = 0 to me.ListCount-1
		      if me.Selected (i) then
		        allSel.Append Str(i)
		      end if
		    next
		    MsgBox "You chose "+hitItem.Text+" on these rows:"+EndOfLine+Join(allSel, ", ")
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Function DenyReorderColumn(fromColumn as Integer, toColumn as Integer) As Boolean
		  return fromColumn = 0 or toColumn = 0 ' this ensures that the first columns always remains the first (leftmost)
		End Function
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenuForHeader(base as MenuItem, x as Integer, y as Integer, clickedColumn as Integer, parentMenu as NSMenuMBS) As Boolean
		  base.Append new MenuItem ("Header 1", 1)
		  base.Append new MenuItem ("Header 2", 2)
		  
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  'log "Change: "+Str(me.ListIndex) + " (" + Str(me.SelCount) + ")"
		End Sub
	#tag EndEvent
	#tag Event
		Function SortColumn(column as Integer) As Boolean
		  log "cocoa.SortColumn "+Str(column)
		End Function
	#tag EndEvent
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  log "cocoa.CellClick ("+Str(row)+", "+Str(column)+", "+Str(x)+", "+Str(y)+"), isCMM: "+Str(IsContextualClick)+")"
		  return mCellClickResult
		End Function
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer, clickedRow as Integer, clickedColumn as Integer, parentMenu as NSMenuMBS) As Boolean
		  base.Append new MenuItem ("Item 1", 1)
		  base.Append new MenuItem ("Item 2", 2)
		  
		  parentMenu.allowsContextMenuPlugIns = true ' enables System Services
		  
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Sub EnableMenuItems()
		  log "cocoa.EnableMenuItems"
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x as Integer, y as Integer) As Boolean
		  log "MouseDown ("+Str(x) + ", " + Str(y) + ")"
		End Function
	#tag EndEvent
	#tag Event
		Sub CellAction(row as Integer, column as Integer)
		  log "cocoa.CellAction ("+Str(row)+", "+Str(column)+")"
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function CompareRows(cell1 as ListCellTV, cell2 as ListCellTV, row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  if column < 2 then
		    // default sorting for first two columns
		    
		    return false
		    
		  else
		    // custom sorting for 3rd and last col
		    
		    if column = 2 then
		      // Use "smart" sorting, which identifies numbers, so that "10" comes after "2"
		      const NSCaseInsensitiveSearch = 1
		      const NSLiteralSearch = 2
		      const NSBackwardsSearch = 4
		      const NSAnchoredSearch = 8
		      const NSNumericSearch = 64
		      const NSDiacriticInsensitiveSearch = 128
		      const NSWidthInsensitiveSearch = 256
		      const NSForcedOrderingSearch = 512
		      static options as Integer = NSCaseInsensitiveSearch or NSNumericSearch or NSDiacriticInsensitiveSearch
		      result = NSStringCompareMBS (cell1.Text, cell2.Text, options)
		    else
		      // Use "dumb" String sorting ( "10" comes before "2")
		      result = StrComp (me.Cell(row1, column), me.Cell(row2, column), 1)
		    end if
		    
		    return true
		    
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Sub DropObject(obj as DragItemTV, operationMask as Integer, aboveRow as Integer, draggingInfo as NSDraggingInfoMBS)
		  dim s() as String
		  do
		    if obj.TextAvailable then
		      s.Append "Text: "+obj.Text
		    end
		    if obj.FolderItemAvailable then
		      s.Append "FolderItem: "+obj.FolderItem.NativePath
		    end
		  loop until not obj.NextItem
		  
		  if s.Ubound < 0 then
		    MsgBox "Got something unknown dropped."
		  else
		    MsgBox "Received drop"+EndOfLine+EndOfLine+Join(s, EndOfLine)
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function DragRow(drag as DragItemTV, row as Integer, ByRef operationMask as Integer, ByRef thisAppOnly as Boolean) As Boolean
		  // Add all selected rows as items to the drag pasteboard
		  dim n as Integer = me.SelCount
		  while n > 0 and row < me.ListCount
		    if me.Selected(row) then
		      drag.Text = "Row " + Str(row) + ": " + me.List(row)
		      drag.RawData("Test") = Str(row)
		      drag.FolderItem = App.ExecutableFile.Parent.Parent.Parent ' just some file
		      n = n - 1
		      if n = 0 then exit
		      drag.AddItem(0,0,20,4)
		    end if
		    row = row + 1
		  wend
		  return true
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events xojoListbox
	#tag Event
		Sub Change()
		  'log "Change: "+Str(me.ListIndex) + " (" + Str(me.SelCount) + ")"
		End Sub
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  dim allSel() as String
		  for i as Integer = 0 to me.ListCount-1
		    if me.Selected (i) then
		      allSel.Append Str(i)
		    end if
		  next
		  MsgBox "You chose "+hitItem.Text+" on these rows:"+EndOfLine+Join(allSel, ", ")
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  if row >= me.ListCount then return false
		  
		  dim p as Pair = me.CellTag (row, column)
		  if p <> nil then
		    g.ForeColor = p.Left
		    g.FillRect 0, 0, g.Width, g.Height
		    return true
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  dim p as Pair = me.CellTag (row, column)
		  if p <> nil then
		    g.ForeColor = p.Right
		    g.DrawString me.Cell(row, column), 10, 13
		    return true
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Function SortColumn(column As Integer) As Boolean
		  log "xojo.SortColumn "+Str(column)
		End Function
	#tag EndEvent
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  log "xojo.CellClick ("+Str(row)+", "+Str(column)+", "+Str(x)+", "+Str(y)+"), isCMM: "+Str(IsContextualClick)
		  return mCellClickResult
		End Function
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  base.Append new MenuItem ("Item 1", 1)
		  base.Append new MenuItem ("Item 2", 2)
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Sub EnableMenuItems()
		  log "xojo.EnableMenuItems"
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  log "MouseDown ("+Str(x) + ", " + Str(y) + ")"
		End Function
	#tag EndEvent
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  log "xojo.CellAction ("+Str(row)+", "+Str(column)+")"
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  dim s() as String
		  do
		    if obj.TextAvailable then
		      s.Append "Text: "+obj.Text
		    end
		    if obj.FolderItemAvailable then
		      s.Append "FolderItem: "+obj.FolderItem.NativePath
		    end
		  loop until not obj.NextItem
		  
		  if s.Ubound < 0 then
		    MsgBox "Got something unknown dropped."
		  else
		    MsgBox "Received drop"+EndOfLine+EndOfLine+Join(s, EndOfLine)
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function DragRow(drag As DragItem, row As Integer) As Boolean
		  // Add all selected rows as items to the drag pasteboard
		  dim n as Integer = me.SelCount
		  while n > 0 and row < me.ListCount
		    if me.Selected(row) then
		      drag.Text = "Row " + Str(row) + ": " + me.List(row)
		      drag.RawData("Test") = Str(row)
		      drag.FolderItem = App.ExecutableFile.Parent.Parent.Parent ' just some file
		      n = n - 1
		      if n = 0 then exit
		      drag.AddItem(0,0,20,4)
		    end if
		    row = row + 1
		  wend
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  for row as integer = 0 to StaticListCount-1
		    me.AddRow Format(row, "#.0")
		    for col as Integer = 1 to me.ColumnCount-1
		      if col = 1 or col = 2 then
		        // 2nd and 3rd columns get random values for sort testing
		        me.Cell (row, col) = Chr(col+65)+Str(Rnd*30,"#")
		      else
		        me.Cell (row, col) = Chr(col+65)+Str(row)
		      end if
		    next
		  next
		  
		  for row as Integer = 1 to 8
		    me.CellAlignmentOffset (row, 1) = row * 4
		  next
		  
		  me.CellAlignment (1, 0) = ListBox.AlignLeft
		  me.CellAlignment (2, 0) = ListBox.AlignCenter
		  me.CellAlignment (3, 0) = ListBox.AlignRight
		  me.CellAlignment (4, 0) = ListBox.AlignDecimal
		  me.Cell (1, 0) = "AlignLeft"
		  me.Cell (2, 0) = "AlignCenter"
		  me.Cell (3, 0) = "AlignRight"
		  me.Cell (4, 0) = "AlignDecimal"
		  
		  me.ColumnAlignment (2) = ListBox.AlignCenter
		  
		  me.Column(0).MinWidthActual = 40
		  me.Column(1).MinWidthActual = 60
		  me.Column(2).MinWidthActual = 30
		  me.Column(4).MinWidthActual = 10
		  
		  me.ColumnType(0) = ListBox.TypeEditable
		  me.CellType(1,1) = ListBox.TypeCheckbox
		  me.CellType(1,2) = ListBox.TypeCheckbox
		  me.CellType(2,1) = ListBox.TypeCheckbox
		  me.CellType(2,2) = ListBox.TypeCheckbox
		  me.CellType(3,1) = ListBox.TypeEditable
		  me.CellType(4,1) = ListBox.TypeEditable
		  me.Cell(1,1) = me.Cell(1,1) + " TypeCheckbox"
		  me.Cell(1,2) = me.Cell(1,2) + " TypeCheckbox"
		  me.Cell(2,1) = me.Cell(2,1) + " TypeCheckbox"
		  me.Cell(2,2) = me.Cell(2,2) + " TypeCheckbox"
		  me.Cell(3,1) = me.Cell(3,1) + " TypeEditable"
		  me.Cell(4,1) = me.Cell(4,1) + " TypeEditable"
		  
		  me.RowPicture(6) = mSampleImage
		  me.CellType(6,0) = ListBox.TypeEditable
		  me.Cell(6,0) = "RowPicture, TypeEditable"
		  
		  for row as Integer = 2 to 4
		    me.CellTag(row, 1) = &cFFFE2500 : &cF4004500 ' let's use the CellTag to specify their background and text colors
		    me.Cell(row,1) = me.Cell(row,1) + " BgColor TextColor"
		  next
		  
		  me.AcceptRawDataDrop ("Test")
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  if column < 2 then
		    // default sorting for first two columns
		    
		    return false
		    
		  else
		    // custom sorting for 3rd and last col
		    
		    if column = 2 then
		      // Use "smart" sorting, which identifies numbers, so that "10" comes after "2"
		      const NSCaseInsensitiveSearch = 1
		      const NSLiteralSearch = 2
		      const NSBackwardsSearch = 4
		      const NSAnchoredSearch = 8
		      const NSNumericSearch = 64
		      const NSDiacriticInsensitiveSearch = 128
		      const NSWidthInsensitiveSearch = 256
		      const NSForcedOrderingSearch = 512
		      static options as Integer = NSCaseInsensitiveSearch or NSNumericSearch or NSDiacriticInsensitiveSearch
		      result = NSStringCompareMBS (me.Cell(row1, column), me.Cell(row2, column), options)
		    else
		      // Use "dumb" String sorting ( "10" comes before "2")
		      result = StrComp (me.Cell(row1, column), me.Cell(row2, column), 1)
		    end if
		    
		    return true
		    
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  dim txt as String
		  
		  'dim o as Variant = self.Focus
		  'if o = nil then
		  'txt = "No focus"
		  'elseif o = xojoListbox then
		  'txt = "Xojo ListBox has focus"
		  'elseif o = cocoaListbox then
		  'txt = "MBS TableView has focus"
		  'else
		  'txt = "Unknown focus"
		  'end if
		  
		  'txt = txt + _
		  '", w: " + Str(cocoaListbox.TableView.bounds.Width,"#") + _
		  '" / " + Str (cocoaListbox.ScrollView.contentSize.Width) + _
		  '" / " + Str (cocoaListbox.ScrollView.visibleRect.Width)
		  
		  // show current row/col
		  dim row, col, x, y as Integer
		  if self.MouseY >= xojoListbox.Top and self.MouseY < xojoListbox.Top + xojoListbox.Height then
		    x = self.MouseX - xojoListbox.Left
		    y = self.MouseY - xojoListbox.Top
		    row = xojoListbox.RowFromXY (x,y)
		    col = xojoListbox.ColumnFromXY (x,y)
		    txt = "In row "+Str(row)+" col "+Str(col)
		  elseif self.MouseY >= cocoaListbox.Top and self.MouseY < cocoaListbox.Top + cocoaListbox.Height then
		    x = self.MouseX - cocoaListbox.Left
		    y = self.MouseY - cocoaListbox.Top
		    row = cocoaListbox.RowFromXY (x,y)
		    col = cocoaListbox.ColumnFromXY (x,y)
		    txt = "In row "+Str(row)+" col "+Str(col)
		  end if
		  
		  // show column widths
		  dim s1(), s2() as String, tw as Double
		  for i as Integer = 0 to cocoaListbox.ColumnCount-1
		    s1.Append cocoaListbox.Column(i).WidthExpression
		    dim w as Double = cocoaListbox.Column(i).WidthActual
		    s2.Append Str(w)
		    tw = tw + w
		  next
		  dim lbw as Double = cocoaListbox.ScrollView.frameWidth - cocoaListbox.ScrollView.verticalScroller.frame.Width - cocoaListbox.ColumnCount * cocoaListbox.TableView.intercellSpacing.width
		  txt = txt + " [" + Join (s1, ", ") + "] / [" + Join (s2, ", ") + "] = " + Str(tw) + " (" + Str (lbw) + ")"
		  
		  Label1.Text = txt.Trim
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  for row as Integer = 0 to cocoaListbox.ListCount-1
		    cocoaListbox.Selected(row) = not cocoaListbox.Selected(row)
		  next
		  
		  for row as Integer = 0 to xojoListbox.ListCount-1
		    xojoListbox.Selected(row) = not xojoListbox.Selected(row)
		  next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton3
	#tag Event
		Sub Action()
		  cocoaListbox.RecalculateColumnWidths
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton5
	#tag Event
		Sub Action()
		  cocoaListbox.Sort
		  xojoListbox.Sort
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox1
	#tag Event
		Sub Action()
		  mCellClickResult = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox2
	#tag Event
		Sub Action()
		  cocoaListbox.HasHeading = me.Value
		  xojoListbox.HasHeading = me.Value
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.Value = cocoaListbox.HasHeading
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TextField1
	#tag Event
		Sub TextChange()
		  dim i as Integer = me.Text.Val
		  setSortedColumn.Enabled = i >= 1 and i <= cocoaListbox.ColumnCount
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events setSortedColumn
	#tag Event
		Sub Action()
		  dim i as Integer = TextField1.Text.Val
		  cocoaListbox.SortedColumn = i
		  xojoListbox.SortedColumn = i
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton6
	#tag Event
		Sub Action()
		  dim i as Integer = TextField1.Text.Val
		  cocoaListbox.PressHeader i
		  xojoListbox.PressHeader i
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  self.Width = self.Width + 1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton7
	#tag Event
		Sub Action()
		  self.Width = self.Width - 1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton4
	#tag Event
		Sub Action()
		  cocoaListbox.updateColumnWidthExpressions
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
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
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
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="300"
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
		InitialValue="False"
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
#tag EndViewBehavior
