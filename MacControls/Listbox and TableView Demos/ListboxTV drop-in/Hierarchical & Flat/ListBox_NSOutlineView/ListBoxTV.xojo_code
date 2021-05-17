#tag Class
Class ListBoxTV
Inherits NSOutlineControlMBS
	#tag Event
		Function acceptDrop(info as NSDraggingInfoMBS, item as NSOutlineViewItemMBS, index as Integer) As Boolean
		  // Finishes the drop
		  // item is the parent item, and index the child's position where to insert the dropped items
		  
		  dim pb as NSPasteboardMBS = info.draggingPasteboard
		  dim operationMask as Integer = info.draggingSourceOperationMask
		  
		  dim row as Integer
		  
		  if index >= 0 then
		    // -> drag between rows
		    dim childItem as NSOutlineViewItemMBS
		    childItem = mTableView.child (index, item)
		    if childItem = nil then
		      // index is past the last child of the parent item -> append to end of children
		      row = mTableView.rowForItem (item) + 1 + mTableView.numberOfChildrenOfItem (item)
		    else
		      row = mTableView.rowForItem (childItem)
		    end if
		  else
		    // -> drag onto a row
		    row = mTableView.rowForItem (item)
		  end if
		  
		  dim done as Boolean
		  
		  // Handle "drag reorder"
		  if mEnableDragReorder and info.draggingSource = mTableView then
		    dim mb as MemoryBlock = pb.dataForType(DragReorderPBType)
		    if mb <> nil then
		      dim srcRows() as Integer
		      for i as Integer = 0 to mb.Size-1 step 4
		        srcRows.Append mb.Int32Value(i)
		      next
		      ListBoxTV(me).SelectRows srcRows ' makes sure the moved rows are selected because the DragReorderRows event expects that
		      if not RaiseEvent DragReorderRows (row, -1) then
		        mDataSource.DataSource_MoveRows (srcRows, row)
		        mTableView.reloadData // this call is needed as well, or the following redraw might keep showing wrong cell content
		        self._needsReload // so that every cell's WillDisplayCell event is called in case they moved
		      end if
		      done = true ' -> drop was successful
		    end if
		  end if
		  
		  if not done then
		    // Send it to the DropObject event handler
		    dim dragItems as new DragItemTV (pb)
		    RaiseEvent DropObject (dragItems, operationMask, row, info) ' we should pass "Action as Integer" here, but I don't know how that translation from the operationMask is supposed to be done.
		  end
		  
		  #if DebugBuild
		    self._DebugCheck
		  #endif
		  
		  return true
		End Function
	#tag EndEvent

	#tag Event
		Function childOfItem(index as Integer, item as NSOutlineViewItemMBS) As NSOutlineViewItemMBS
		  return mDataSource.DataSource_ChildItem (ListRowTV(item), index)
		End Function
	#tag EndEvent

	#tag Event
		Sub ColumnDidMove(notification as NSNotificationMBS, OldColumn as Integer, NewColumn as Integer)
		  mInsideHeaderDrag = false
		  mIgnoreTileEvents = false
		  
		  dim indexes() as Integer
		  for each col as ListColumnTV in mCols
		    col._updateOwnIndex
		    indexes.Append col.ColumnIndex
		  next
		  indexes.SortWith mCols
		  
		  mDataSource.DataSource_MoveColumn (oldColumn, newColumn)
		  
		  RaiseEvent ColumnsMoved(oldColumn, newColumn)
		End Sub
	#tag EndEvent

	#tag Event
		Sub ColumnDidResize(notification as NSNotificationMBS, tableColumn as NSTableColumnMBS, OldWidth as Double)
		  if mInsideHeaderDrag then
		    mInsideHeaderDrag = false
		    mIgnoreTileEvents = false
		    me.updateColumnWidthExpressions
		    // Does the cursor remain in "Resizing" state? This happens only with Real Studio 2012, however, but not with Xojo 2016.
		  end if
		  
		  if not mIgnoreTileEvents then
		    RaiseEvent ColumnsResized (ListColumnTV(tableColumn).ColumnIndex, oldWidth)
		  end
		End Sub
	#tag EndEvent

	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  '
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  '
		End Function
	#tag EndEvent

	#tag Event
		Function dataCell(tableColumn as NSTableColumnMBS, item as NSOutlineViewItemMBS) As NSCellMBS
		  if tableColumn = nil then
		    return nil
		  end if
		  
		  dim tcol as ListColumnTV = ListColumnTV(tableColumn)
		  dim col as Integer = tcol.ColumnIndex
		  dim myCell as ListCellTV = _cell(item, col)
		  
		  dim t as Integer = myCell.Type
		  
		  if t = ListBox.TypeCheckbox or (t = ListBox.TypeDefault and tcol.Type = ListBox.TypeCheckbox) then
		    // A checkbox cell
		    static bc as NSButtonCellMBS
		    if bc = nil then ' we only need to create this once
		      bc = new NSButtonCellMBS ("x")
		      declare sub setButtonType lib "Cocoa" selector "setButtonType:" (h as Integer, t as Integer)
		      setButtonType (bc.Handle, NSButtonMBS.NSSwitchButton)
		      bc.wraps = false
		      bc.lineBreakMode = NSParagraphStyleMBS.NSLineBreakByTruncatingTail
		    end if
		    return bc
		  end if
		  
		  // We return a custom NSTextFieldCell, in order to perform some custom painting in its drawWithFrame event handler.
		  // We are lazy and re-use the same cell, because we keep getting this event called for each drawn cell, sequentially.
		  static cc as ListBoxTV_Support.ListDrawCellHandler
		  if cc = nil then
		    cc = new ListBoxTV_Support.ListDrawCellHandler (mSelfRef)
		    cc.editable = true
		    cc.wraps = false
		    cc.lineBreakMode = NSParagraphStyleMBS.NSLineBreakByTruncatingTail
		  end if
		  return cc
		End Function
	#tag EndEvent

	#tag Event
		Sub didClickTableColumn(tableColumn as NSTableColumnMBS)
		  mInsideHeaderDrag = false
		  mIgnoreTileEvents = false
		  
		  dim column as Integer = ListColumnTV(tableColumn).ColumnIndex
		  
		  if RaiseEvent HeaderPressed (column) then
		    // handled
		    return
		  end if
		  
		  ListBoxTV(me).SortedColumn = column
		  
		  _sort
		End Sub
	#tag EndEvent

	#tag Event
		Sub didDragTableColumn(tableColumn as NSTableColumnMBS)
		  mInsideHeaderDrag = false
		  mIgnoreTileEvents = false
		End Sub
	#tag EndEvent

	#tag Event
		Sub didTile()
		  RaiseEvent didTile
		  
		  if not mIgnoreTileEvents then
		    if mMaintainColumnWidths then
		      _recalcColumnWidths()
		    end if
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Function DragEnter(obj As DragItem, action As Integer) As Boolean
		  '
		End Function
	#tag EndEvent

	#tag Event
		Sub DragExit(obj As DragItem, action As Integer)
		  '
		End Sub
	#tag EndEvent

	#tag Event
		Function DragOver(x As Integer, y As Integer, obj As DragItem, action As Integer) As Boolean
		  '
		End Function
	#tag EndEvent

	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  break ' this would be unexpected unless the user invoked AcceptDrop... on the Xojo control directly, circumventing our ListBoxTV functions.
		End Sub
	#tag EndEvent

	#tag Event
		Function isItemExpandable(item as NSOutlineViewItemMBS) As Boolean
		  if mTableView.indentationPerLevel = 0 then
		    ' non-hierarchical
		    return false
		  end
		  
		  return mDataSource.DataSource_IsExpandable (ListRowTV (item))
		End Function
	#tag EndEvent

	#tag Event
		Sub ItemDidCollapse(notification as NSNotificationMBS, item as NSOutlineViewItemMBS)
		  didCollapse ListRowTV(item)
		End Sub
	#tag EndEvent

	#tag Event
		Sub ItemDidExpand(notification as NSNotificationMBS, item as NSOutlineViewItemMBS)
		  expandEnd ListRowTV(item)
		End Sub
	#tag EndEvent

	#tag Event
		Sub ItemWillExpand(notification as NSNotificationMBS, item as NSOutlineViewItemMBS)
		  expandBegin ListRowTV(item)
		End Sub
	#tag EndEvent

	#tag Event
		Function MenuAction(HitItem as MenuItem) As Boolean
		  '
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(x as Integer, y as Integer, Modifiers as Integer) As Boolean
		  return handleMouseDown (x, y, modifiers)
		End Function
	#tag EndEvent

	#tag Event
		Sub mouseDownInHeaderOfTableColumn(tableColumn as NSTableColumnMBS)
		  if mMaintainColumnWidths then
		    mIgnoreTileEvents = true
		    mInsideHeaderDrag = true
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Function numberOfChildrenOfItem(item as NSOutlineViewItemMBS) As Integer
		  return mDataSource.DataSource_ChildCount (ListRowTV(item))
		End Function
	#tag EndEvent

	#tag Event
		Function objectValue(tableColumn as NSTableColumnMBS, item as NSOutlineViewItemMBS) As Variant
		  dim col as Integer = ListColumnTV(tableColumn).ColumnIndex
		  dim myCell as ListCellTV = _cell (item, col, true)
		  
		  dim t as Integer = myCell.Type
		  if t = ListBox.TypeCheckbox or (t = ListBox.TypeDefault and ListColumnTV(tableColumn).Type = ListBox.TypeCheckbox) then
		    // This is a checkbox - we return the Checkbox value, not its title text
		    return myCell.Checked
		  end
		  
		  return myCell.Text
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  me.setDelayedProperties()
		  me.setupFromInitialValue()
		  
		  mCurrentRootItem = nil
		  mLastAddedIndex = -1
		  
		  RaiseEvent Open()
		End Sub
	#tag EndEvent

	#tag Event
		Sub SelectionDidChange(notification as NSNotificationMBS)
		  mSelectionCache = mTableView.selectedRowIndexes()
		  
		  RaiseEvent Change()
		End Sub
	#tag EndEvent

	#tag Event
		Sub setObjectValue(tableColumn as NSTableColumnMBS, item as NSOutlineViewItemMBS, value as Variant)
		  dim col as Integer = ListColumnTV(tableColumn).ColumnIndex
		  dim row as Integer = mTableView.rowForItem (item)
		  dim myCell as ListCellTV = _cell (item, col)
		  
		  dim isCheckbox as Boolean
		  dim t as Integer = myCell.Type
		  if t = ListBox.TypeCheckbox or (t = ListBox.TypeDefault and ListColumnTV(tableColumn).Type = ListBox.TypeCheckbox) then
		    isCheckbox = true
		  end
		  
		  mDataSource.DataSource_CellWillUpdate (myCell, ListRowTV(item), col, not isCheckbox, isCheckbox)
		  
		  if isCheckbox then
		    myCell.Checked = value.BooleanValue
		  elseif value isA NSAttributedStringMBS then
		    myCell.Text = NSAttributedStringMBS(value).text
		  else
		    myCell.Text = value.StringValue
		  end
		  
		  mDataSource.DataSource_CellDidUpdate (myCell, ListRowTV(item), col, not isCheckbox, isCheckbox)
		  
		  RaiseEvent CellAction (row, col)
		End Sub
	#tag EndEvent

	#tag Event
		Function shouldEdit(tableColumn as NSTableColumnMBS, item as NSOutlineViewItemMBS) As Boolean
		  dim t as Integer = ListColumnTV(tableColumn).EffectiveType(item)
		  return t = ListBox.TypeEditable or t = ListBox.TypeCheckbox
		End Function
	#tag EndEvent

	#tag Event
		Function shouldReorderColumn(columnIndex as Integer, newColumnIndex as Integer) As Boolean
		  return not RaiseEvent DenyReorderColumn (columnIndex, newColumnIndex)
		End Function
	#tag EndEvent

	#tag Event
		Function validateDrop(info as NSDraggingInfoMBS, proposedItem as NSOutlineViewItemMBS, proposedChildIndex as Integer) As Integer
		  // Determines whether the current row is accepted as a drop target
		  if mEnableDragReorder then
		    dim operationMask as Integer = info.draggingSourceOperationMask
		    
		    // dragging a folder into one of its children is not allowed!
		    if info.draggingSource = mTableView then
		      dim pb as NSPasteboardMBS = info.draggingPasteboard
		      dim mb as MemoryBlock = pb.dataForType(DragReorderPBType)
		      if mb <> nil then
		        dim srcRows() as Integer
		        for i as Integer = 0 to mb.Size-1 step 4
		          srcRows.Append mb.Int32Value(i)
		        next
		        for each row as Integer in srcRows
		          dim item as NSOutlineViewItemMBS = _rowItemForRow(row)
		          if itemIsSameOrParentOf (item, proposedItem) then
		            // disallow this drop
		            operationMask = 0
		            exit
		          end if
		        next
		      end if
		    end if
		    
		    return operationMask
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Sub willDisplayCell(cell as NSCellMBS, tableColumn as NSTableColumnMBS, item as NSOutlineViewItemMBS)
		  #if Support_OSX_10_6
		    // We're using outdated NSCells instead of NSViews so that we can keep using this control in OSX 10.6.
		    // If you prefer to use custom NSViews (e.g. in order to add buttons, input fields, checkboxes or more labels),
		    // implement the ListBoxTV.view event - if there's code in that event, then this ListBoxTV.willDisplayCell won't
		    // be invoked, i.e. you end up with a modern NSView based TableView.
		    
		    dim col as Integer = ListColumnTV(tableColumn).ColumnIndex
		    dim myCell as ListCellTV = _cell (item, col)
		    dim tfc as NSTextFieldCellMBS
		    dim bc as NSButtonCellMBS
		    
		    if cell isA NSButtonCellMBS then
		      bc = NSButtonCellMBS(cell)
		    else
		      tfc = NSTextFieldCellMBS(cell)
		    end if
		    
		    // Preset font
		    if mTextFont <> "" and mTextFont <> "System" then
		      cell.font = NSFontMBS.fontWithName (mTextFont, mTextSize)
		    elseif mTextSize > 0 then
		      cell.font = NSFontMBS.systemFontOfSize (mTextSize)
		    end if
		    
		    dim row as Integer = myCell._internalUse.Left
		    if col <> myCell._internalUse.Right then break
		    
		    _suppressReload = true ' in case the event changes some properties
		    dim handled as Boolean = RaiseEvent WillDisplayCell (row, col, myCell, cell, tableColumn)
		    _suppressReload = false
		    
		    if not handled then
		      
		      // Button title
		      if bc <> nil then
		        bc.title = myCell.text
		      end if
		      
		      // Cell text color
		      if tfc <> nil then
		        if myCell.TextColor <> &c00000000 then
		          dim xc as Color = myCell.TextColor
		          dim c as NSColorMBS = NSColorMBS.colorWithCalibratedRGB (xc.Red/255, xc.Green/255, xc.Blue/255, 1-xc.Alpha/255)
		          tfc.textColor = c
		        else
		          tfc.textColor = nil
		        end if
		      end if
		      
		      // Cell background color
		      if myCell.BackgroundColor <> &cFFFFFFFF then
		        dim xc as Color = myCell.BackgroundColor
		        dim c as NSColorMBS = NSColorMBS.colorWithCalibratedRGB (xc.Red/255, xc.Green/255, xc.Blue/255, 1-xc.Alpha/255)
		        if bc <> nil then
		          bc.backgroundColor = c
		        else
		          tfc.backgroundColor = c
		          #if false ' we handle this in ListDrawCellHandler.drawWithFrame so that it also works with indented text
		            tfc.drawsBackground = true
		          #endif
		        end if
		      elseif bc <> nil then
		        bc.backgroundColor = nil
		      else
		        tfc.backgroundColor = nil
		        tfc.drawsBackground = false
		      end if
		      
		      // Cell text alignment
		      dim align as Integer
		      if myCell.alignment <> ListBox.AlignDefault then
		        align = myCell.alignment
		      else
		        align = ListColumnTV(tableColumn).Alignment
		      end if
		      select case align
		      case ListBox.AlignDefault
		        align = NSTextMBS.NSNaturalTextAlignment
		      case ListBox.AlignLeft
		        align = NSTextMBS.NSLeftTextAlignment
		      case ListBox.AlignRight
		        align = NSTextMBS.NSRightTextAlignment
		      case ListBox.AlignCenter
		        align = NSTextMBS.NSCenterTextAlignment
		      case ListBox.AlignDecimal
		        align = NSTextMBS.NSJustifiedTextAlignment
		      end select
		      cell.alignment = align
		      
		      // Cell text indentation and background drawing (handled by ListDrawCellHandler.drawWithFrame)
		      if tfc <> nil then
		        if tfc isA ListBoxTV_Support.ListDrawCellHandler then
		          ListBoxTV_Support.ListDrawCellHandler(tfc).cell = myCell
		        end if
		      else
		        ' unfortunately, we cannot indent checkbox cells
		      end if
		      
		    end if
		    
		  #endif
		End Sub
	#tag EndEvent

	#tag Event
		Function writeItems(items() as NSOutlineViewItemMBS, pasteboard as NSPasteboardMBS) As Boolean
		  dim didAdd as Boolean
		  
		  call pasteboard.clearContents
		  
		  dim rows() as Integer = rowsFromItems (items)
		  
		  if rows.Ubound < 0 then return false
		  
		  if mEnableDrag then
		    ListBoxTV(me).SelectRows rows ' makes sure the dragged rows are selected because the DragRow event expects that
		    dim drag as new DragItemTV (pasteboard)
		    dim operationMask as Integer = NSDraggingInfoMBS.NSDragOperationEvery // Xojo uses NSDragOperationEvery, Real Studio used NSDragOperationAll_Obsolete
		    dim locally as Boolean = false
		    if RaiseEvent DragRow (drag, rows(0), operationMask, locally) then
		      drag.FinishAddedItems
		      mTableView.setDraggingSourceOperationMask (operationMask, locally)
		      didAdd = true
		    end if
		  end if
		  
		  if mEnableDragReorder then
		    // Put the moved rows into a MemoryBlock and pass that as a private data item in the pasteboard
		    dim mb as new MemoryBlock (4 * (rows.Ubound+1))
		    for i as Integer = 0 to rows.Ubound
		      mb.Int32Value (4*i) = rows(i)
		    next
		    pasteboard.dataForType (DragReorderPBType) = mb
		    if not didAdd then
		      me.View.setDraggingSourceOperationMask (NSDraggingInfoMBS.NSDragOperationMove, true)
		    end
		    didAdd = true
		  end if
		  
		  return didAdd
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AcceptFileDrop(type As String)
		  mTableView.registerForDraggedTypes Array (NSPasteboardMBS.NSFilenamesPboardType, "public.file-url")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AcceptMacDataDrop(type As String)
		  me.AcceptRawDataDrop (type)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AcceptPictureDrop()
		  break ' missing (needs methods in DragItemTV, too)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AcceptRawDataDrop(type As String)
		  mTableView.registerForDraggedTypes Array (ListBoxTV_Support.convertOSType(type))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AcceptTextDrop()
		  mTableView.registerForDraggedTypes Array (NSPasteboardMBS.NSStringPboardType, NSPasteboardMBS.NSPasteboardTypeString)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddFolder(txt as String)
		  addItem txt, true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub addItem(txt as String, asFolder as Boolean)
		  if mDataSource isA ListBoxTV_Support.ListBoxTVStaticOutlineDataSource then
		    dim idx as Integer
		    if asFolder then
		      idx = ListBoxTV_Support.ListBoxTVStaticOutlineDataSource(mDataSource).AddFolder (mCurrentRootItem, txt)
		    else
		      idx = ListBoxTV_Support.ListBoxTVStaticOutlineDataSource(mDataSource).AddRow (mCurrentRootItem, txt)
		    end if
		    mLastAddedIndex = idx
		  else
		    break // If you have assigned your own DataSource, then you cannot use AddRow() as that makes little sense
		  end if
		  
		  _needsReload ' we reload lazily so that multiple calls to AddRow won't cause many reloads
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub addItems(items() as String)
		  dim col0 as String
		  if items.Ubound >= 0 then
		    col0 = items(0)
		  end if
		  addItem col0, false
		  if mDataSource isA ListBoxTV_Support.ListBoxTVStaticOutlineDataSource then
		    for column as Integer = 1 to items.Ubound
		      _cell(mLastAddedIndex,column).text = items(column)
		    next
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRow(items() as String)
		  addItems items
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRow(ParamArray items as String)
		  addItems items
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BeginUpdates()
		  mTableView.beginUpdates
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function calcColumnWidth(calcType as columnWidthCalcTypes, expr as String, totalWidth as Integer, colsLeft as Integer, extraSpace as Integer, ByRef asterisksInOut as Double, ByRef remainWidthInOut as Integer, ByRef widthOut as Integer) As columnWidthTypes
		  dim space as Double
		  
		  dim value as Double
		  dim type as columnWidthTypes = determineColumnWidthType (calcType, expr, value)
		  
		  if type = columnWidthTypes.absolute then
		    space = Round (value)
		  elseif type = columnWidthTypes.percentage then
		    space = Round (totalWidth * value / 100)
		  else
		    asterisksInOut = asterisksInOut + Max (1, value)
		  end if
		  
		  remainWidthInOut = remainWidthInOut - space
		  
		  if space > 0 then
		    // if this column occupies some space, the Cell will actually add some more pixels, which we need to remove from the remaining space
		    remainWidthInOut = remainWidthInOut - extraSpace
		    if remainWidthInOut < 0 and space > -remainWidthInOut then
		      space = space + remainWidthInOut
		      remainWidthInOut = 0
		    end if
		  end if
		  
		  widthOut = space
		  
		  return type
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Cell(row as Integer, column as Integer) As String
		  return _cell(row,column).text
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Cell(row as Integer, column as Integer, assigns v as String)
		  _cell(row,column).text = v
		  _needsReload()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CellAlignment(row as Integer, column as Integer) As Integer
		  dim cell as ListCellTV = _cell(row, column)
		  return cell.alignment
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CellAlignment(row as Integer, column as Integer, assigns v as Integer)
		  dim cell as ListCellTV = _cell(row, column)
		  if cell.alignment <> v then
		    cell.alignment = v
		    _needsReload()
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CellAlignmentOffset(row as Integer, column as Integer) As Integer
		  dim cell as ListCellTV = _cell(row, column)
		  return cell.Indentation
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CellAlignmentOffset(row as Integer, column as Integer, assigns v as Integer)
		  dim cell as ListCellTV = _cell(row, column)
		  if cell.Indentation <> v then
		    cell.Indentation = v
		    _needsReload()
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CellBold(row as Integer, column as Integer) As Boolean
		  return _cell(row, column).Bold
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CellBold(row as Integer, column as Integer, assigns v as Boolean)
		  if _cell(row, column).Bold <> v then
		    _cell(row, column).Bold = v
		    _needsReload()
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CellCheck(row as Integer, column as Integer) As Boolean
		  return _cell(row, column).Checked
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CellCheck(row as Integer, column as Integer, assigns v as Boolean)
		  if _cell(row, column).Checked <> v then
		    _cell(row, column).Checked = v
		    _needsReload()
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CellHelpTag(row as Integer, column as Integer) As String
		  return _cell(row, column).ToolTip
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CellHelpTag(row as Integer, column as Integer, assigns v as String)
		  _cell(row, column).ToolTip = v
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CellItalic(row as Integer, column as Integer) As Boolean
		  return _cell(row, column).Italic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CellItalic(row as Integer, column as Integer, assigns v as Boolean)
		  if _cell(row, column).Italic <> v then
		    _cell(row, column).Italic = v
		    _needsReload()
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CellStyle(row as Integer, column as Integer) As ListCellTV
		  return _cell(row,column)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CellTag(row as Integer, column as Integer) As Variant
		  return _cell(row,column).tag
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CellTag(row as Integer, column as Integer, assigns v as Variant)
		  _cell(row,column).tag = v
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CellType(row as Integer, column as Integer) As Integer
		  dim cell as ListCellTV = _cell(row, column)
		  return cell.Type
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CellType(row as Integer, column as Integer, assigns v as Integer)
		  dim cell as ListCellTV = _cell(row, column)
		  if cell.Type <> v then
		    cell.Type = v
		    _needsReload()
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub clearRowCache()
		  mPreviousCell = nil
		  mPreviousItem = nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Column(col as Integer) As ListColumnTV
		  return mCols(col)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColumnAlignment(column as Integer) As Integer
		  return mCols(column).Alignment
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ColumnAlignment(column as Integer, assigns v as Integer)
		  mCols(column).Alignment = v
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColumnAlignmentOffset(column as Integer) As Integer
		  return mCols(column).AlignmentOffset
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ColumnAlignmentOffset(column as Integer, assigns v as Integer)
		  mCols(column).AlignmentOffset = v
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColumnFromXY(x as Integer, y as Integer) As Integer
		  dim loc0 as new NSPointMBS (x, y)
		  dim loc as NSPointMBS = mTableView.convertPointFromView (loc0, me.ScrollView)
		  return mTableView.columnAtPoint (loc)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColumnSortDirection(column as Integer) As Integer
		  return mCols(column).SortDirection
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ColumnSortDirection(column as Integer, assigns dir as Integer)
		  mCols(column).SortDirection = dir
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColumnType(column as Integer) As Integer
		  return mCols(column).Type
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ColumnType(column as Integer, assigns v as Integer)
		  mCols(column).Type = v
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // We create a weak ref to ourselves so that we can pass that to our chiild classes instead of them creating more WeakRefs (this is a performance optimization)
		  mSelfRef = new WeakRef (me)
		  
		  // Our separate class for handling listbox content (can be replaced by user)
		  mDataSource = new ListBoxTV_Support.ListBoxTVStaticOutlineDataSource (mSelfRef)
		  
		  // Set up some local properties for cleaner access to some tableview properties
		  mTableView = me.View
		  mHeaderView = mTableView.headerView
		  
		  // Context Menu preparation for Cells
		  mContextMenu = new ListBoxTV_Support.ListBoxTVContextMenu (mSelfRef)
		  
		  // Context Menu preparation for the Header, see http://stackoverflow.com/a/3850215/43615
		  mTableView.headerView.menu = mContextMenu
		  
		  // Let's preset the columns to automatic resizing - can be overwritten by code in Open() event or later, or disabled by setting ColumnWidths to a non-empty string.
		  mDefaultColumnAutoresizingStyle = NSTableViewMBS.NSTableViewUniformColumnAutoresizingStyle
		  mTableView.columnAutoresizingStyle = mDefaultColumnAutoresizingStyle
		  
		  // We cache the selection for performance reasons (not sure if that's necessary, though)
		  mSelectionCache = NSIndexSetMBS.indexSet()
		  
		  mOrigIndentationPerLevel = mTableView.indentationPerLevel
		  mTableView.indentationPerLevel = 0 ' set this to zero for non-hierarchical lists
		  
		  mTableView.autoresizesOutlineColumn = false
		  
		  super.Constructor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteAllRows()
		  mDataSource.DataSource_DeleteAllRows
		  me.ScrollPosition = 0
		  mCurrentRootItem = nil
		  mLastAddedIndex = -1
		  
		  me.Reload() ' needs to reload without delay, or rowCount won't be inquired before a redraw may occur
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeselectAll()
		  mTableView.deselectAll
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function determineColumnWidthType(calcType as columnWidthCalcTypes, expr as String, ByRef value as Double) As columnWidthTypes
		  #pragma DisableBackgroundTasks
		  
		  expr = expr.Trim
		  
		  if expr = "" then
		    if calcType = columnWidthCalcTypes.actual then
		      value = 1
		      return columnWidthTypes.remain
		    elseif calcType = columnWidthCalcTypes.maximum then
		      value = 100
		      return columnWidthTypes.percentage
		    else
		      value = 0
		      return columnWidthTypes.absolute
		    end if
		  end if
		  
		  dim number as Double, pos as Integer
		  for pos = 1 to expr.Len
		    dim ch as Integer = expr.Mid(pos,1).Asc
		    if (ch < 48 or ch > 57) and ch <> 46 then
		      ' not a digit nor a period (.)
		      exit
		    end if
		  next
		  number = expr.Left(pos-1).Val
		  expr = expr.Mid(pos).Trim
		  if expr = "" then
		    ' absolute value
		    value = number
		    return columnWidthTypes.absolute
		  elseif expr = "%" then
		    ' percentage
		    value = number
		    return columnWidthTypes.percentage
		  else
		    ' remaining space
		    value = Max (1, number)
		    return columnWidthTypes.remain
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub didCollapse(rowItem as ListRowTV)
		  RaiseEvent CollapseRow (mTableView.rowForItem (rowItem))
		  
		  mDataSource.DataSource_Collapse (rowItem)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EndUpdates()
		  mTableView.endUpdates
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub expand(rowItem as ListRowTV)
		  if mTableView.isItemExpanded(rowItem) then
		    return
		  end if
		  
		  dim c as Integer = mExpandCounter
		  mTableView.expandItem rowItem, false
		  if c = mExpandCounter then
		    // Did not work - we need to reload the list first
		    if mExpanding then
		      // We have to postpone the Expand because we reloading the list during an expansion messes up the TableView' state
		      mPendingExpands.Append rowItem
		    else
		      _reloadNow
		      mTableView.expandItem rowItem, false
		      if c = mExpandCounter then
		        break ' something went wrong
		      end if
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub expandBegin(rowItem as ListRowTV)
		  mExpanding = true
		  mExpandCounter = mExpandCounter + 1
		  mExpandLevel.Append mCurrentRootItem
		  mCurrentRootItem = rowItem
		  dim currentRow as Integer = mTableView.rowForItem (rowItem)
		  mLastAddedIndex = currentRow
		  mDataSource.DataSource_Expand (rowItem)
		  RaiseEvent ExpandRow (currentRow)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Expanded(row as Integer) As Boolean
		  dim rowItem as ListRowTV = _rowItemForRow (row)
		  return mTableView.isItemExpanded (rowItem)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Expanded(row as Integer, assigns expand as Boolean)
		  dim rowItem as ListRowTV = _rowItemForRow (row)
		  if mTableView.isExpandable (rowItem) then
		    if expand then
		      expand rowItem
		    else
		      mTableView.collapseItem rowItem, false
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub expandEnd(rowItem as ListRowTV)
		  if rowItem <> mCurrentRootItem then
		    break ' huh?!
		  end if
		  mCurrentRootItem = mExpandLevel.Pop
		  mExpanding = false
		  
		  while mPendingExpands.Ubound >= 0
		    dim item as ListRowTV = mPendingExpands(0)
		    mPendingExpands.Remove 0
		    me.expand item
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function handleMouseDown(x as Integer, y as Integer, modifiers as Integer) As Boolean
		  if RaiseEvent MouseDown (x, y) then
		    return true
		  end
		  
		  #if Target64Bit
		    declare function frameOfCellAtColumn_Row lib "Cocoa" selector "frameOfCellAtColumn:row:" (o as Integer, col as Integer, row as Integer) as NSRect64
		  #else
		    declare function frameOfCellAtColumn_Row lib "Cocoa" selector "frameOfCellAtColumn:row:" (o as Integer, col as Integer, row as Integer) as NSRect32
		  #endif
		  
		  dim loc0 as new NSPointMBS (x, y)
		  dim loc as NSPointMBS = mTableView.convertPointFromView (loc0, me.ScrollView)
		  dim row as Integer = mTableView.rowAtPoint (loc)
		  dim col as Integer = mTableView.columnAtPoint (loc)
		  dim cellFrame as NSRectMBS = mTableView.frameOfCellAtColumnRow (col, row)
		  return RaiseEvent CellClick (row, col, loc.x - cellFrame.x, loc.y - cellFrame.y)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HeaderHeight() As Integer
		  return mTableView.headerView.frame.Height
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Heading(col as Integer) As String
		  return mCols(col).headerCell.stringValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Heading(col as Integer, assigns txt as String)
		  mCols(col).headerCell.stringValue = txt
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InvalidateCell(row as Integer, column as Integer)
		  // We're lazy and simply reload the entire view's cells.
		  // Ideally, we're determine the rect of the row/col and then call "setNeedsDisplayInRect:" instead.
		  _needsReload()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function itemIsSameOrParentOf(item as NSOutlineViewItemMBS, child as NSOutlineViewItemMBS) As Boolean
		  while child <> nil
		    if item = child then
		      return true
		    end if
		    child = mTableView.parentForItem (child)
		  wend
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function List(row as Integer) As String
		  return me.Cell (row, 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub List(row as Integer, assigns v as String)
		  me.Cell (row, 0) = v
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PressHeader(col as Integer)
		  // This method, contrary to just setting SortedColumn and calling Sort, should also depress the header, whereas SortedColumn should not. Doesn't work right yet, though
		  me.SortedColumn = col
		  me.Sort
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RecalculateColumnWidths()
		  // Call this after a column or the entire control got resized and you want to keep the "*" or "%" column widths re-applied
		  _recalcColumnWidths()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reload()
		  _reloadNow(nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveRow(row as Integer, animate as Boolean = false)
		  if mDataSource isA ListBoxTV_Support.ListBoxTVStaticOutlineDataSource then
		    dim animationOptions as Integer
		    if animate then
		      const NSTableViewAnimationEffectFade = 1
		      const NSTableViewAnimationSlideUp = 16
		      animationOptions = NSTableViewAnimationEffectFade or NSTableViewAnimationSlideUp
		    end if
		    mTableView.beginUpdates
		    ListBoxTV_Support.ListBoxTVStaticOutlineDataSource(mDataSource).RemoveRow (row, animationOptions)
		    mTableView.endUpdates
		    mLastAddedIndex = -1
		  else
		    break // If you have assigned your own DataSource, then you cannot use RemoveRow() as that makes little sense
		  end if
		  
		  _needsReload ' we reload lazily so that multiple calls to AddRow won't cause many reloads
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowForItem(rowItem as ListRowTV) As Integer
		  return mTableView.rowForItem (rowItem)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowFromXY(x as Integer, y as Integer) As Integer
		  dim loc0 as new NSPointMBS (x, y)
		  dim loc as NSPointMBS = mTableView.convertPointFromView (loc0, me.ScrollView)
		  return mTableView.rowAtPoint (loc)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowHeight() As Integer
		  return Round (mTableView.rowHeight)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowPicture(row as Integer) As Picture
		  return _cell(row,0).picture
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RowPicture(row as Integer, assigns pic as Picture)
		  _cell(row,0).picture = pic
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function rowsFromItems(items() as NSOutlineViewItemMBS) As Integer()
		  dim res() as Integer
		  for each item as NSOutlineViewItemMBS in items
		    dim row as Integer = mTableView.rowForItem (item)
		    res.Append row
		  next
		  return res
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowTag(row as Integer) As Variant
		  return ListRowTV(_rowItemForRow(row)).tag
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RowTag(row as Integer, assigns tag as Variant)
		  ListRowTV(_rowItemForRow(row)).tag = tag
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelCount() As Integer
		  return mSelectionCache.count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Selected(row as Integer) As Boolean
		  return mSelectionCache.containsIndex (row)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Selected(row as Integer, assigns sel as Boolean)
		  dim isSelected as Boolean = mSelectionCache.containsIndex (row)
		  if isSelected <> sel then
		    mSelectionCache = mSelectionCache.mutableCopy
		    if sel then
		      NSMutableIndexSetMBS(mSelectionCache).addIndex row
		    else
		      NSMutableIndexSetMBS(mSelectionCache).removeIndex row
		    end if
		    mTableView.selectRowIndexes mSelectionCache, false
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectedRows() As Integer()
		  return mSelectionCache.Values
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectRows(rows() as Integer)
		  dim set as new NSMutableIndexSetMBS
		  for each row as Integer in rows
		    set.addIndex row
		  next
		  mSelectionCache = set
		  mTableView.selectRowIndexes mSelectionCache, false
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub setDelayedProperties()
		  // Handle some delayed settings (appears to be necessary with Real Studio 2012 but not with Xojo 2016)
		  mHadOpenEvent = true
		  me.ColumnCount = mDelayedColumnCount
		  me.AutoHideScrollBars = mDelayedHideScrollers
		  me.ColumnsResizable = mDelayedColumnResizing
		  me.RequiresSelection = mDelayedRequiresSelection
		  me.ScrollbarHorizontal = mDelayedHorScroller
		  me.ScrollbarVertical = mDelayedVerScroller
		  me.SelectionType = mDelayedSelectionType
		  me.ColumnWidths = mDelayedColumnWidths
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub setupFromInitialValue()
		  dim rows() as String = ReplaceLineEndings(me.InitialValue, EndOfLine).Split(EndOfLine)
		  
		  if me.HasHeading and rows.Ubound >= 0 then
		    dim cols() as String = rows(0).Split(Chr(9))
		    for i as Integer = 0 to Min (cols.Ubound, me.ColumnCount-1)
		      me.Heading(i) = cols(i)
		    next
		    rows.Remove 0
		  end if
		  
		  for each row as String in rows
		    dim cols() as String = row.Split(Chr(9))
		    me.AddRow cols(0)
		    for i as Integer = 1 to Min (cols.Ubound, me.ColumnCount-1)
		      me.Cell(mLastAddedIndex, i) = cols(i)
		    next
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Sort()
		  _sort
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TableView() As NSOutlineViewMBS
		  return mTableView
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateColumnWidthExpressions()
		  // Takes the current column widths and adjusts the ListColumnTV.WidthExpression values accordingly
		  
		  _suppressReload = true
		  
		  dim colSpacing as Integer = mTableView.intercellSpacing.Width // extra space that every visible column occupies
		  
		  // Determine total width first
		  dim totalWidth as Integer
		  for col as Integer = 0 to mCols.Ubound
		    dim c as ListColumnTV = mCols(col)
		    dim w as Integer = Round (c.width)
		    if w > 0 then w = w + colSpacing
		    totalWidth = totalWidth + w
		  next
		  
		  // Now update the width expressions (absolute and percentage)
		  dim remainWidth as Integer = totalWidth
		  dim asteriskValues() as Double
		  dim lowestAsteriskWidth as Integer = totalWidth
		  for col as Integer = 0 to mCols.Ubound
		    dim c as ListColumnTV = mCols(col)
		    dim w as Integer = Round (c.width)
		    dim expr as String = mCols(col).WidthExpression
		    dim v as Double
		    dim t as columnWidthTypes = determineColumnWidthType (columnWidthCalcTypes.actual, expr, v)
		    if t = columnWidthTypes.absolute or (t = columnWidthTypes.remain and w = 0) then
		      c.WidthExpression = Str(w,"-#")
		      asteriskValues.Append 0
		      if w > 0 then w = w + colSpacing
		      remainWidth = remainWidth - w
		    elseif t = columnWidthTypes.percentage then
		      c.WidthExpression = ListBoxTV_Support.trimPeriod (Str (w / totalWidth * 100,"-#.#####")) + "%"
		      asteriskValues.Append 0
		      if w > 0 then w = w + colSpacing
		      remainWidth = remainWidth - w
		    else
		      asteriskValues.Append w
		      remainWidth = remainWidth - colSpacing
		      if w < lowestAsteriskWidth then lowestAsteriskWidth = w
		    end
		  next
		  
		  // Finally, update the asterisk width expressions
		  dim scale as Double = remainWidth / lowestAsteriskWidth // so that we don't have any asterisk values below 1
		  for col as Integer = 0 to mCols.Ubound
		    dim w as Integer = asteriskValues(col)
		    if w <> 0 then
		      dim c as ListColumnTV = mCols(col)
		      c.WidthExpression = ListBoxTV_Support.trimPeriod (Str (Max (1, w / remainWidth * scale),"-#.########")) + "*"
		    end if
		  next
		  
		  finally
		    _suppressReload = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function _cell(row as Integer, column as Integer, ignoreCache as Boolean = false) As ListCellTV
		  return _cell (_rowItemForRow (row), column, ignoreCache, row)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function _cell(rowItem as NSOutlineViewItemMBS, column as Integer, ignoreCache as Boolean = false, row as Integer = -1) As ListCellTV
		  if rowItem = nil then
		    return nil
		  end if
		  
		  if not ignoreCache then
		    if mPreviousCell <> nil and mPreviousItem = rowItem and mPreviousCell._internalUse.Right = column then
		      // Usually, we get three calls for the same cell in sequence - 1st from objectValue, 2nd from dataCellForTableColumn, 3rd from willDisplayCell
		      // We cache the cell here for performance reasons
		      return mPreviousCell
		    end if
		  end if
		  
		  if row < 0 then
		    if mPreviousItem = rowItem then
		      row = mPreviousItemRow
		    else
		      row = mTableView.rowForItem (rowItem)
		    end if
		    if row < 0 then break
		  end if
		  
		  dim cell as ListCellTV = mDataSource.DataSource_Cell (ListRowTV(rowItem), column)
		  
		  if cell = nil then
		    // create an empty one
		    cell = new ListCellTV ()
		  end if
		  
		  cell._internalUse = row : column
		  
		  mPreviousCell = cell
		  mPreviousItem = rowItem
		  mPreviousItemRow = row
		  
		  return cell
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function _cellBackgroundPaint(g As Graphics, row As Integer, column As Integer, textFrame as NSRectMBS, controlView as NSViewMBS) As Boolean
		  return RaiseEvent CellBackgroundPaint (g, row, column, textFrame, controlView)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function _cellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer, textFrame as NSRectMBS, controlView as NSViewMBS) As Boolean
		  return RaiseEvent CellTextPaint (g, row, column, x, y, textFrame, controlView)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function _clickedColumn() As Integer
		  return mTableView.clickedColumn
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function _clickedRow() As Integer
		  return mTableView.clickedRow
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function _compareRows(c1 as ListCellTV, c2 as ListCellTV, ByRef result as Integer) As Boolean
		  return RaiseEvent CompareRows (c1, c2, c1._internalUse.Left, c2._internalUse.Left, c1._internalUse.Right, result)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function _constructContextualMenu(base as MenuItem, x as Integer, y as Integer, row as Integer, column as Integer, menu as NSMenuMBS) As Boolean
		  dim res as Boolean
		  mSelectionCache = mTableView.selectedRowIndexes()
		  if row < 0 then
		    // Header click
		    res = RaiseEvent ConstructContextualMenuForHeader (base, x, y, column, menu)
		  else
		    // Cell click
		    res = RaiseEvent ConstructContextualMenu (base, x, y, row, column, menu)
		  end if
		  return res
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub _contextualMenuAction(hitItem as MenuItem, row as Integer, column as Integer)
		  call RaiseEvent ContextualMenuAction (hitItem, row, column)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub _DebugCheck()
		  // For debugging only.
		  // Checks the integrity of the data
		  
		  #if DebugBuild
		    if mDataSource isA ListBoxTV_Support.ListBoxTVStaticOutlineDataSource then
		      ListBoxTV_Support.ListBoxTVStaticOutlineDataSource(mDataSource)._DebugCheck
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function _hasFocus() As Boolean
		  return me.Window.Focus = me
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub _needsReload(needsRecalcColumnWidths as Boolean = false, enableXojoColumnWidths as Boolean = false)
		  if _suppressReload then
		    return
		  end if
		  
		  clearRowCache
		  
		  if needsRecalcColumnWidths then
		    // A column's WidthActual or WidthExpression was set
		    mColumnWidthsDirty = true
		  end if
		  
		  if enableXojoColumnWidths then
		    // This means a WidthExpression (or ColumnWidths) property was set. This means the user
		    // may want to use the dynamic width modifiers ("%" and "*") from Xojo instead of the default
		    // NSTableView's columnAutoresizingStyle modes.
		    mHasDynamicColumnWidths = true
		    mTableView.columnAutoresizingStyle = NSTableViewMBS.NSTableViewLastColumnOnlyAutoresizingStyle
		  end if
		  
		  if mReloadTimer = nil then
		    mReloadTimer = new Timer
		    AddHandler mReloadTimer.Action, AddressOf _reloadNow
		    mReloadTimer.Period = 0
		  end if
		  mReloadTimer.Mode = Timer.ModeSingle
		  mReloadTimer.Reset
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub _recalcColumnWidths()
		  #pragma DisableBackgroundTasks
		  
		  mColumnWidthsDirty = false
		  
		  mTableView.columnAutoresizingStyle = NSTableViewMBS.NSTableViewLastColumnOnlyAutoresizingStyle
		  
		  dim totalWidth as Integer = me.ScrollView.documentVisibleRect.Width
		  dim remainingWidth as Integer = totalWidth
		  dim remainingMinWidth as Integer = totalWidth
		  dim remainingMaxWidth as Integer = totalWidth
		  dim asteriskCount, asteriskCountMin, asteriskCountMax as Double, asteriskColumnCount as Integer
		  dim actualWidth(), minWidth(), maxWidth() as Integer
		  
		  dim colSpacing as Integer = mTableView.intercellSpacing.Width // extra space that every visible column occupies
		  
		  // first pass - determine the space occupied by non-asterisk columns
		  for col as Integer = 0 to mCols.Ubound
		    dim minW, maxW, actW as Integer, type as columnWidthTypes
		    type = calcColumnWidth (columnWidthCalcTypes.actual, mCols(col).WidthExpression, totalWidth, mCols.Ubound-col, colSpacing, asteriskCount, remainingWidth, actW)
		    call calcColumnWidth (columnWidthCalcTypes.minimum, mCols(col).MinWidthExpression, totalWidth, mCols.Ubound-col, colSpacing, asteriskCountMin, remainingMinWidth, minW)
		    call calcColumnWidth (columnWidthCalcTypes.maximum, mCols(col).MaxWidthExpression, totalWidth, mCols.Ubound-col, colSpacing, asteriskCountMax, remainingMaxWidth, maxW)
		    actualWidth.Append actW
		    minWidth.Append minW
		    maxWidth.Append maxW
		    if type = columnWidthTypes.remain then
		      asteriskColumnCount = asteriskColumnCount + 1
		    end
		    if type = columnWidthTypes.absolute and actW <= 0 and minW <= 0 then
		      // hide this column
		      if not mCols(col).Hidden then
		        mCols(col).Hidden = true
		      end if
		    else
		      // unhide this column
		      if mCols(col).Hidden then
		        mCols(col).Hidden = false
		      end if
		    end if
		  next
		  
		  // second pass - determine the space occupied by the remaining asterisk columns
		  if asteriskCount > 0 then
		    remainingWidth = Round (Max (0, remainingWidth - asteriskColumnCount * colSpacing))
		    dim asteriskWidth as Double = remainingWidth / asteriskCount
		    dim lastAsteriskCol as Integer = -1
		    for col as Integer = 0 to mCols.Ubound
		      if remainingWidth < 0 then remainingWidth = 0
		      dim value as Double
		      dim type as columnWidthTypes = determineColumnWidthType (columnWidthCalcTypes.actual, mCols(col).WidthExpression, value)
		      if type = columnWidthTypes.remain then
		        dim columnWidth as Double = Round (value * asteriskWidth)
		        actualWidth(col) = columnWidth
		        lastAsteriskCol = col
		        remainingWidth = remainingWidth - columnWidth
		        asteriskCount = asteriskCount - value
		        if asteriskCount <= 0 then exit
		      end if
		    next
		    if lastAsteriskCol >= 0 then
		      actualWidth(lastAsteriskCol) = actualWidth(lastAsteriskCol) + remainingWidth
		    end
		  end if
		  
		  // finally, set the actual widths in the table view
		  mIgnoreTileEvents = true
		  for col as Integer = 0 to mCols.Ubound
		    dim c as ListColumnTV = mCols(col)
		    c.minWidth = minWidth(col)
		    c.maxWidth = maxWidth(col)
		    c.width = actualWidth(col)
		  next
		  
		  RaiseEvent DidResizeCells()
		  
		  finally
		    mIgnoreTileEvents = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub _reloadNow(t as Timer = nil)
		  if mReloadTimer <> nil then mReloadTimer.Mode = Timer.ModeOff
		  
		  mIgnoreTileEvents = false
		  mInsideHeaderDrag = false
		  
		  if mColumnWidthsDirty then
		    mColumnWidthsDirty = false
		    if mHasDynamicColumnWidths then
		      // A column's WidthExpression had been set, so we want to re-adjust the columns accordingly, once
		      _recalcColumnWidths()
		    end if
		  end if
		  
		  mReloadCount = mReloadCount + 1
		  
		  clearRowCache
		  
		  mTableView.reloadData
		  
		  if not mMaintainColumnWidths then
		    mTableView.columnAutoresizingStyle = mDefaultColumnAutoresizingStyle
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function _rowItemForRow(row as Integer) As ListRowTV
		  dim rowItem as ListRowTV = mDataSource.DataSource_RowItem (row)
		  return rowItem
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function _selectedRow() As Integer
		  return mTableView.selectedRow
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub _sort()
		  dim sorters() as NSSortDescriptorMBS = mTableView.sortDescriptors
		  if sorters.Ubound < 0 then return
		  
		  dim firstSorter as NSSortDescriptorMBS = sorters(0)
		  
		  dim col as Integer = mTableView.columnWithIdentifier(firstSorter.key)
		  if RaiseEvent SortColumn (col) then
		    // user's event code handled the sorting
		    return
		  end if
		  
		  dim c as Integer = mReloadCount
		  mDataSource.DataSource_SortRows // shall use me.TableView.sortDescriptors
		  if c = mReloadCount then _reloadNow
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event CellAction(row as Integer, column as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CellBackgroundPaint(g As Graphics, row As Integer, column As Integer, textFrame as NSRectMBS, controlView as NSViewMBS) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer, textFrame as NSRectMBS, controlView as NSViewMBS) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Change()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CollapseRow(row As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ColumnsMoved(oldColumn as Integer, newColumn as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ColumnsResized(column as Integer, oldWidth as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CompareRows(cell1 as ListCellTV, cell2 as ListCellTV, row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer, clickedRow as Integer, clickedColumn as Integer, parentMenu as NSMenuMBS) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ConstructContextualMenuForHeader(base as MenuItem, x as Integer, y as Integer, clickedColumn as Integer, parentMenu as NSMenuMBS) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ContextualMenuAction(hitItem as MenuItem, clickedRow as Integer, clickedColumn as Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DenyReorderColumn(fromColumn as Integer, toColumn as Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidResizeCells()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event didTile()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DragReorderColumns(movedColumn as integer, insertColumn as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DragReorderRows(newPosition as Integer, parentRow as Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DragRow(drag as DragItemTV, row as Integer, ByRef operationMask as Integer, ByRef thisAppOnly as Boolean) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DropObject(obj as DragItemTV, operationMask as Integer, aboveRow as Integer, draggingInfo as NSDraggingInfoMBS)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ExpandRow(row as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event HeaderPressed(column as Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDown(x as Integer, y as Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SortColumn(column as Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event WillDisplayCell(row as Integer, column as Integer, cell as ListCellTV, textFieldCell as NSCellMBS, tableColumn as NSTableColumnMBS) As Boolean
	#tag EndHook


	#tag Note, Name = About
		This is a (nearly complete) replacement for Xojo's ListBox control, for Mac OS X.
		
		It requires MBS Plugins 17.1 (March 9, 2017 or later)
		
		Advantages over Xojo's ListBox:
		• Uses Apple's native NSTableView control, with its proper appearance, hence...
		• Looks better in a Mac app.
		• Column resizing works better (observing minimum widths and showing a horizontal scrollbar when necessary).
		• Support column reordering.
		• Supports right-clicks (CMM clicks) on the headers.
		• Correct handling of multiple selected rows, including right-clicks.
		• Offers more customization options (e.g., you get extra Events from the NSTableView).
		• ConstructContextualMenu works as it should (i.e. for right clicks and ctrl-clicks).
		• Faster.
		• Open Source.
		
		Disadvantages:
		• Mac-only.
		• No custom drawing in cells via ...Paint events (but you can instead use NSGraphicsMBS functions).
		• No support for Database Binding.
		• Limited grid line options.
		• A few functions where a -1 parameter designates ALL rows or columns do not work (leading to an OutOfRangeException).
		
		To use it, copy the entire "ListBox_NSOutlineView" folder into your project, then change the Super class of your ListBox controls
		to ListBoxTV, and see if your project still compiles and runs.
		
		If you're using the CellBackgroundPaint or CellTextPaint events, see if you're only using it to change the color or
		font of the cells and text. See the note "Handling CellBackgroundPaint and CellTextPaint" for a solution.
		
	#tag EndNote

	#tag Note, Name = Attn sortDescriptorsDidChange
		The sortDescriptorsDidChange event is not implemented here because we handle
		sorting in the tableView's didClickTableColumn event, which is called after this event.
		
	#tag EndNote

	#tag Note, Name = Authors and Copyright
		Initial author (Feb 2017): Thomas Tempelmann, tempelmann@gmail.com
		
		This code is free, i.e. no contributing author may claim rights (or copyright) on it.
		
		If you add new features, please send them back to Thomas for redistribution.
		Adding a test case for the new feature would be nice, too.
		
	#tag EndNote

	#tag Note, Name = Handling CellBackgroundPaint and CellTextPaint
		If you implement either of these events to draw custom text or images, they won't work, because the "g as Graphics" parameter will be nil
		(that's a limitation caused by Xojo Inc. because their Plugin API does not supply the needed code for making use of the Graphics class).
		If you only want to have a particular background or text color, you can instead preset them like this:
		
		  myListbox.CellStyle (row, col).TextColor = ...
		  myListbox.CellStyle (row, col).BackgroundColor = ...
		
	#tag EndNote

	#tag Note, Name = Handling contextual clicks (right click; ctrl-click)
		Since the Xojo ListBox's ConstructContextualMenu event does not handle right clicks (or ctrl-clicks)
		correctly with multiple selections, you may have tried to ignore the event and instead handle such
		clicks in the MouseDown event by checking "IsContextualClick". You may still do that.
		
		But if you plan to use the ConstructContextualMenu, you need to set the ListBoxTV's control's
		UseContextualClickEvent property to True, e.g. right in the Window layout editor for the control,
		so that ConstructContextualMenu gets called as desired.
		
		You should do that (i.e. set UseContextualClickEvent=true and use ConstructContextualMenu)
		over checking for IsContextualClick in the MouseDown event in order to have proper behavior,
		especially when you allow multi-selection in the Listbox.
		
	#tag EndNote

	#tag Note, Name = NSView vs. NSCell based TableView cells
		By default, the TableView is in NSCell mode, which works with a limited set of predefined layout choices.
		The code handling this layout is found in the ListBoxTV.willDisplayCell() event.
		
		Alternatively, you can supply your own layout by returning a custom NSViewMBS from the ListBoxTV.view()
		event. If the view() event is added, the willDisplayCell() event becomes unused automatically. So, if you
		experiment with returning an NSView and are not happy with it, you need to remove the view() event
		entirely again to revert to using the NSCell mode.
		
		As a simple example, here's how to put a button into every cell. Place the following code into the view() event:
		
		  dim button as new NSButtonMBS
		  button.Title = "Button"
		  return button
		
		To add multiple views, see the forum: https://forum.xojo.com/49354-listboxtv-mbs-plugins
		
	#tag EndNote

	#tag Note, Name = On-demand Cell values (custom DataSource)
		If you have a lot (thousands) of rows, the performance of Xojo's ListBox will notably decrease.
		
		With this ListBoxTV, you can prevent this.
		
		The solution is to not add your rows and cells beforehand, by using AddRow(), but instead just
		tell the Listbox how many rows you have. The TableView class will then show an adequate scrollbar
		for the entire number of rows, but will only ask you to provide the data for the rows and cells
		it currently shows in the window, which will be usually only a few dozen values. If the user
		scrolls the list, your code will then be asked again for only those new cells, and so on.
		
		To accomplish that, implement the ListBoxTVDataSource interface. Either implement them in a new
		class, or add them to your window or other class that you already maintain for your data.
		You do not need to add code for all its functions, which all begin with "DataSource_". Most of
		them you may leave empty, unless you want to support sorting, row dragging, column dragging or
		editing.
		
		Then set the listbox's DataSource property to your class that implements the ListBoxTVDataSource interface.
		
		The minimum you have to add code to are:
		
		• DataSource_ChildCount (rowItem as ListRowTV) as Integer
		
		Here you need to return the total number of rows you want to be able to show. If the list is
		hierarchical, then check the rowItem parameter - if it's nil, it means the root (top) level, so you'd
		return the number of rows at that level, otherwise the child count of the given ListRowTV node.
		
		• DataSource_ChildItem (rowItem as ListRowTV, index as Integer) as ListRowTV
		
		Here you need to return a ListRowTV object (or a subclass of it).
		Again, if rowItem is nil, you're at the root level. Otherwise, it's the node for one of your previously
		returned ListRowTV objects. This lets you build a tree of your hierarchical list.
		
		• DataSource_Cell (row as Integer, column as Integer) as ListCellTV
		
		This returns an object of type ListCellTV, which contains the Text property for the cell's display,
		as well as other properties such as Indentation, Alignment etc.
		
		If you want to keep it simple, return this:
		
		  return new ListCellTV ("here goes the cell's text")
		
		• DataSource_RowItem (row as Integer) as ListBoxTV
		
		This has to return the row item for the currently visible listbox row. This means you have to
		be able to tell which ListRowTV appears at which row. If you have a flat list, this is equal to
		calling DataSource_ChildItem(nil, row). For a hierarchical list, you need to iterate over all shown
		rows, counting the visible children, until you reach the row in question.
		
		Now, whenever you know the listbox needs to be refreshed, i.e. it should call your DataSource_ChildCount(),
		DataSource_ChildItem() and DataSource_Cell() functions again, call the listbox's Reload() function.
		
	#tag EndNote

	#tag Note, Name = To Do
		Not working, yet:
		
		• EnableDragReorder does not work right, yet:
		     DataSource_MoveRows can't distinguish whether one wants to insert into the last
		     row of a folder or into the row following the folder's end. To fix that, not the dest
		     row but the parent node and child index needs to be passed to it.
		• Row Insertion.
		• Font attributes (bold, italic) for entire list defaults and for individual cells.
		
		Anything else? Let me (TT) know!
		
	#tag EndNote

	#tag Note, Name = Version History
		Released Versions (oldest first)
		
		1 - (16 Mar 2017)
		
		• Fixes Sort operation.
		• Makes all DataSource functions atomic, by using "#pragma DisableBackgroundTasks".
		
		2 - (14 Aug 2018)
		
		• Fixes a bug in ListBoxTV.ListCount(), avoiding potentially outdated values.
		• Improvements to "row drag reorder" handling.
		• New methods BeginUpdates() and EndUpdates() for more efficient updating.
		• New: ListBoxTV.RemoveRow().
		• Custom sorting implemented.
		• Various bug fixes.
		• New Note in ListBoxTV about NSView vs NSCell based TableView cells.
		
		3 - (16 Aug 2018)
		
		• Should now work in 64 bit builds (by fixing NSRect struct usage)
		
		4 - (18 Aug 2018)
		
		• Fixes the vertical scrollbar gap no matter what the System Preferences "General" / "Show scroll bars" is set to.
		
		5 - (20 Aug 2018)
		
		• Fixes placement of the ContainerControl (in some circumstance, its original would get moved to negative offsets).
		• Can now add multiple columns in one AddRow() call.
		• Renames interface function DataSource_ItemCount() to DataSource_ChildCount().
		
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if not mHadOpenEvent then
			    return mDelayedHideScrollers
			  else
			    return me.autohidesScrollers
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if not mHadOpenEvent then
			    mDelayedHideScrollers = value
			  else
			    me.autohidesScrollers = value
			  end if
			End Set
		#tag EndSetter
		AutoHideScrollBars As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if not mHadOpenEvent then
			    return mDelayedColumnCount
			  else
			    return mCols.Ubound+1
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if not mHadOpenEvent then
			    mDelayedColumnCount = value
			  else
			    
			    if value < 1 then value = 1
			    
			    dim newUbound as Integer = value-1
			    
			    if newUbound = mCols.Ubound then
			      // no change
			      return
			    end if
			    
			    // Add columns
			    while newUbound > mCols.Ubound
			      dim c as new ListColumnTV (mSelfRef, mCols.Ubound+1)
			      mCols.Append c
			      c.title = Str(mCols.Ubound)
			      mTableView.addTableColumn c
			    wend
			    
			    // Remove columns
			    while mCols.Ubound > newUbound
			      mTableView.removeTableColumn (mCols.Pop)
			    wend
			    
			    // Make first column the one for the outline's expand control
			    dim cols() as NSTableColumnMBS =mTableView.tableColumns()
			    mTableView.outlineTableColumn = cols(0) ' use the first column
			    
			    mDataSource.DataSource_SetColumnCount value
			    
			    _needsReload
			    
			  end if
			End Set
		#tag EndSetter
		ColumnCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if not mHadOpenEvent then
			    return mDelayedColumnResizing
			  else
			    return me.allowsColumnResizing
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if not mHadOpenEvent then
			    mDelayedColumnResizing = value
			  else
			    me.allowsColumnResizing = value
			  end if
			End Set
		#tag EndSetter
		ColumnsResizable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if not mHadOpenEvent then
			    return mDelayedColumnWidths
			  else
			    dim res() as String
			    for each col as ListColumnTV in mCols
			      if mMaintainColumnWidths then
			        res.Append col.WidthExpression
			      else
			        res.Append Str (col.WidthActual,"-#")
			      end if
			    next
			    return Join (res, ",")
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if not mHadOpenEvent then
			    mDelayedColumnWidths = value
			  else
			    
			    dim w() as String
			    for each s as String in value.Split(",")
			      w.Append s
			    next
			    redim w(mCols.Ubound)
			    
			    if value = "" or w.Ubound <= 0 then
			      // User has not set any rules for the widths or has only one column - let's use the TableView's auto resizing
			      
			      mHasDynamicColumnWidths = false
			      mTableView.columnAutoresizingStyle = mDefaultColumnAutoresizingStyle
			      
			    else
			      // User has set explicit rules for the widths - use our own resizing implementation (see '_recalcColumnWidths')
			      
			      for i as Integer = 0 to mCols.Ubound
			        dim col as ListColumnTV = mCols(i)
			        col.WidthExpression = w(i)
			      next
			      
			    end if
			    
			  end if
			End Set
		#tag EndSetter
		ColumnWidths As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mDataSource
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value = nil then
			    value = new ListBoxTV_Support.ListBoxTVStaticOutlineDataSource (mSelfRef)
			  end if
			  
			  mDataSource = value
			  
			  mDataSource.DataSource_SetColumnCount mCols.Ubound+1
			  
			  me.Reload() ' needs to reload without delay, or rowCount won't be inquired before a redraw may occur
			End Set
		#tag EndSetter
		DataSource As ListBoxTVDataSource
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		DefaultRowHeight As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mEnableDrag
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mEnableDrag = value
			End Set
		#tag EndSetter
		EnableDrag As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mEnableDragReorder
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mEnableDragReorder = value
			  if value then
			    mTableView.registerForDraggedTypes Array ("private.EnableDragReorder")
			  end if
			End Set
		#tag EndSetter
		EnableDragReorder As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  const NSTableViewDashedHorizontalGridLineMask = 8
			  
			  dim v as Integer = me.TableView.gridStyleMask AND (NSTableViewMBS.NSTableViewSolidHorizontalGridLineMask or NSTableViewDashedHorizontalGridLineMask)
			  if (v AND NSTableViewDashedHorizontalGridLineMask) <> 0 then
			    return ListBox.BorderThinDotted
			  elseif v <> 0 then
			    return ListBox.BorderThinSolid
			  else
			    return ListBox.BorderNone
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  const NSTableViewDashedHorizontalGridLineMask = 8
			  
			  dim v as Integer
			  select case value
			  case ListBox.BorderDefault, ListBox.BorderNone
			    v = NSTableViewMBS.NSTableViewGridNone
			  case ListBox.BorderThinDotted
			    v = NSTableViewMBS.NSTableViewSolidHorizontalGridLineMask or NSTableViewDashedHorizontalGridLineMask
			  else
			    v = NSTableViewMBS.NSTableViewSolidHorizontalGridLineMask
			  end select
			  
			  me.TableView.gridStyleMask = (me.TableView.gridStyleMask AND NOT (NSTableViewMBS.NSTableViewSolidHorizontalGridLineMask or NSTableViewDashedHorizontalGridLineMask)) OR v
			End Set
		#tag EndSetter
		GridLinesHorizontal As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim v as Integer = me.TableView.gridStyleMask AND NSTableViewMBS.NSTableViewSolidVerticalGridLineMask
			  if v <> 0 then
			    return ListBox.BorderThinSolid
			  else
			    return ListBox.BorderNone
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  dim v as Integer
			  select case value
			  case ListBox.BorderDefault, ListBox.BorderNone
			    v = NSTableViewMBS.NSTableViewGridNone
			  else
			    v = NSTableViewMBS.NSTableViewSolidVerticalGridLineMask
			  end select
			  me.TableView.gridStyleMask = (me.TableView.gridStyleMask AND NOT NSTableViewMBS.NSTableViewSolidVerticalGridLineMask) OR v
			End Set
		#tag EndSetter
		GridLinesVertical As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mTableView.headerView <> nil
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value <> me.HasHeading then
			    if value then
			      mTableView.headerView = mHeaderView
			    else
			      mTableView.headerView = nil
			    end if
			  end if
			End Set
		#tag EndSetter
		HasHeading As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mTableView.indentationPerLevel <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value then
			    mTableView.indentationPerLevel = mOrigIndentationPerLevel
			  else
			    mTableView.indentationPerLevel = 0
			  end
			  _needsReload()
			End Set
		#tag EndSetter
		Hierarchical As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		InitialValue As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  dim ss as new NSSizeMBS
			  ss.Width = value
			  ss.Height = value
			  mTableView.intercellSpacing = ss
			End Set
		#tag EndSetter
		IntercellSpacing As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mLastAddedIndex
			End Get
		#tag EndGetter
		LastIndex As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mDataSource.DataSource_CurrentRowCount() ' do not call 'mTableView.numberOfRows', as it may not be up-to-date yet
			End Get
		#tag EndGetter
		ListCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if mSelectionCache.count = 0 then
			    return -1
			  else
			    return mSelectionCache.firstIndex
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value >= 0 and value < me.ListCount then
			    mTableView.selectRowIndexes (NSIndexSetMBS.indexSetWithIndex(value), false)
			  else
			    me.DeselectAll
			  end if
			End Set
		#tag EndSetter
		ListIndex As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			True: Emulate Xojo's algorithm to keep columns sized based on "%" and "*" values in ColumnWidths or Columns(n).WidthExpression.
			False: If ColumnWidths is set, the columns are adjusted once. After that, they are maintained by NSTableView's columnAutoresizingStyle property.
			
		#tag EndNote
		#tag Getter
			Get
			  return mMaintainColumnWidths
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mMaintainColumnWidths = value
			End Set
		#tag EndSetter
		MaintainColumnWidths As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCols() As ListColumnTV
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mColumnWidthsDirty As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mContextMenu As ListBoxTV_Support.ListBoxTVContextMenu
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCurrentRootItem As ListRowTV
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDataSource As ListBoxTVDataSource
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDebugState As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDefaultColumnAutoresizingStyle As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDelayedColumnCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDelayedColumnResizing As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDelayedColumnWidths As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDelayedHideScrollers As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDelayedHorScroller As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDelayedRequiresSelection As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDelayedSelectionType As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDelayedVerScroller As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEnableDrag As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEnableDragReorder As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mExpandCounter As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mExpanding As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mExpandLevel() As ListRowTV
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHadOpenEvent As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHasDynamicColumnWidths As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHeaderView As NSTableHeaderViewMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIgnoreTileEvents As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mInsideHeaderDrag As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastAddedIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMaintainColumnWidths As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOrigIndentationPerLevel As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPendingExpands() As ListRowTV
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPreviousCell As ListCellTV
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPreviousItem As Object
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPreviousItemRow As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mReloadCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mReloadTimer As Timer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectionCache As NSIndexSetMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectionType As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Points to itself. This is an optimization so that we don't have to create multiple WeakRefs in each child object
		#tag EndNote
		Private mSelfRef As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTableView As NSOutlineViewMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextFont As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextSize As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUseContextualClickEvent As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if not mHadOpenEvent then
			    return mDelayedRequiresSelection
			  else
			    return not me.allowsEmptySelection
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if not mHadOpenEvent then
			    mDelayedRequiresSelection = value
			  else
			    me.allowsEmptySelection = not value
			  end if
			End Set
		#tag EndSetter
		RequiresSelection As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if not mHadOpenEvent then
			    return mDelayedHorScroller
			  else
			    return me.hasHorizontalScroller
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if not mHadOpenEvent then
			    mDelayedHorScroller = value
			  else
			    me.hasHorizontalScroller = value
			  end if
			End Set
		#tag EndSetter
		ScrollbarHorizontal As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if not mHadOpenEvent then
			    return mDelayedVerScroller
			  else
			    return me.hasVerticalScroller
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if not mHadOpenEvent then
			    mDelayedVerScroller = value
			  else
			    me.hasVerticalScroller = value
			  end if
			End Set
		#tag EndSetter
		ScrollbarVertical As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  '
			End Set
		#tag EndSetter
		ScrollPosition As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if not mHadOpenEvent then
			    return mDelayedSelectionType
			  else
			    if mTableView.allowsMultipleSelection then
			      return 1
			    end if
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if not mHadOpenEvent then
			    mDelayedSelectionType = value
			  else
			    mTableView.allowsMultipleSelection = value <> 0
			  end if
			End Set
		#tag EndSetter
		SelectionType As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim sorters() as NSSortDescriptorMBS = mTableView.sortDescriptors()
			  if sorters.Ubound >= 0 then
			    dim firstSorter as NSSortDescriptorMBS = sorters(0)
			    return mTableView.columnWithIdentifier (firstSorter.key)
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // Note: This method should not depress the header, i.e. not indicate sorting, but it does currently. Not perfect, but should work for most cases.
			  
			  if not mHadOpenEvent then return
			  
			  // Re-arrange the existing sort descriptors so that the specified column comes first
			  dim sorters() as NSSortDescriptorMBS = mTableView.sortDescriptors()
			  for each sorter as NSSortDescriptorMBS in sorters
			    dim col as Integer = mTableView.columnWithIdentifier (sorter.key)
			    if col = value then
			      // found it
			      dim i as Integer = sorters.IndexOf (sorter)
			      if i <> 0 then
			        sorters.Remove i
			        sorters.Insert 0, sorter
			        mTableView.setSortDescriptors sorters
			      end if
			      return
			    end if
			  next
			  
			  // If there are no sort descriptors for our column, set it from our ListColumnTV
			  dim col as ListColumnTV = Column(value)
			  sorters.Insert 0, col.SortDescriptorPrototype
			  mTableView.setSortDescriptors sorters
			End Set
		#tag EndSetter
		SortedColumn As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mTextFont
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTextFont = value
			  _needsReload
			End Set
		#tag EndSetter
		TextFont As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mTextSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTextSize = value
			  _needsReload
			End Set
		#tag EndSetter
		TextSize As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Set this to True if you want to use the ContextualMenu events.
			
		#tag EndNote
		#tag Getter
			Get
			  return mUseContextualClickEvent
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mUseContextualClickEvent = value
			  if value then
			    mTableView.menu = mContextMenu
			  else
			    mTableView.menu = nil
			  end if
			End Set
		#tag EndSetter
		UseContextualClickEvent As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return me.ScrollView.focusRingType = NSScrollViewMBS.NSFocusRingTypeExterior
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value then
			    me.ScrollView.focusRingType = NSScrollViewMBS.NSFocusRingTypeExterior
			  else
			    me.ScrollView.focusRingType = NSScrollViewMBS.NSFocusRingTypeNone
			  end if
			End Set
		#tag EndSetter
		UseFocusRing As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		_suppressReload As Boolean
	#tag EndProperty


	#tag Constant, Name = DragReorderPBType, Type = String, Dynamic = False, Default = \"private.DragReorder", Scope = Private
	#tag EndConstant

	#tag Constant, Name = Support_OSX_10_6, Type = Boolean, Dynamic = False, Default = \"true", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Version, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant


	#tag Structure, Name = NSRect32, Flags = &h21, Attributes = \"StructureAlignment \x3D 1"
		x as Single
		  y as Single
		  w as Single
		h as Single
	#tag EndStructure

	#tag Structure, Name = NSRect64, Flags = &h21, Attributes = \"StructureAlignment \x3D 1"
		x as Double
		  y as Double
		  w as Double
		h as Double
	#tag EndStructure


	#tag Enum, Name = columnWidthCalcTypes, Type = Integer, Flags = &h21
		actual
		  minimum
		maximum
	#tag EndEnum

	#tag Enum, Name = columnWidthTypes, Type = Integer, Flags = &h21
		absolute
		  percentage
		remain
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Appearance"
			InitialValue="System"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLinesHorizontal"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - None"
				"1 - None"
				"2 - Dotted"
				"3 - Solid"
				"4 - Solid"
				"5 - Solid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLinesVertical"
			Visible=true
			Group="Appearance"
			InitialValue="3"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - None"
				"1 - None"
				"2 - Solid"
				"3 - Solid"
				"4 - Solid"
				"5 - Solid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultRowHeight"
			Visible=false
			Group="Appearance"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialValue"
			Visible=true
			Group="Initial State"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=false
			Group="Initial State"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hierarchical"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasHeading"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnCount"
			Visible=true
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnsResizable"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnWidths"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaintainColumnWidths"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectionType"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Single"
				"1 - Multiple"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequiresSelection"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SortedColumn"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDragReorder"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDrag"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ListIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ListCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseContextualClickEvent"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollbarVertical"
			Visible=true
			Group="Scrollbar"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollbarHorizontal"
			Visible=true
			Group="Scrollbar"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoHideScrollBars"
			Visible=true
			Group="Scrollbar"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollPosition"
			Visible=false
			Group="Scrollbar"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="hasHorizontalScroller"
			Visible=false
			Group="Scrollbar"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hasVerticalScroller"
			Visible=false
			Group="Scrollbar"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="autohidesScrollers"
			Visible=false
			Group="Scrollbar"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="allowsColumnReordering"
			Visible=true
			Group="Table"
			InitialValue="False"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="allowsColumnResizing"
			Visible=false
			Group="Table"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="allowsMultipleSelection"
			Visible=false
			Group="Table"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="allowsEmptySelection"
			Visible=false
			Group="Table"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="allowsColumnSelection"
			Visible=false
			Group="Table"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_suppressReload"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IntercellSpacing"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
