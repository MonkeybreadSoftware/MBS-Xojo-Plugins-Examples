#tag Class
Protected Class ListBoxTVStaticOutlineDataSource
Implements ListBoxTVDataSource
	#tag Method, Flags = &h0
		Function AddFolder(rowItem as ListRowTV, txt as String) As Integer
		  return insertItem (StaticListFolderTV(rowItem), -1, new StaticListFolderTV (mOwner, mColumnCount), txt)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddRow(rowItem as ListRowTV, txt as String) As Integer
		  return insertItem (StaticListFolderTV(rowItem), -1, new StaticListRowTV (mOwner, mColumnCount), txt)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ownerRef as WeakRef)
		  mOwner = ownerRef
		  mDataRoot = new StaticListFolderTV (mOwner, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSource_Cell(rowItem as ListRowTV, column as Integer) As ListCellTV
		  dim res as ListCellTV = StaticListRowTV(rowItem).cells(column)
		  
		  if res is nil then
		    // This cell has not been accessed before - create it now
		    res = new ListCellTV
		    StaticListRowTV(rowItem).cells(column) = res
		  end if
		  
		  return res
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_CellDidUpdate(cell as ListCellTV, rowItem as ListRowTV, column as Integer, updatesText as Boolean, updatesChecked as Boolean)
		  // Nothing to do here - it exists for use with custom implementations of the ListBoxTVDataSource interface
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_CellWillUpdate(cell as ListCellTV, rowItem as ListRowTV, column as Integer, updatesText as Boolean, updatesChecked as Boolean)
		  // Nothing to do here - it exists for use with custom implementations of the ListBoxTVDataSource interface
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSource_ChildCount(rowItem as ListRowTV) As Integer
		  if rowItem = nil then rowItem = mDataRoot
		  return StaticListFolderTV(rowItem).children.Ubound+1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSource_ChildItem(rowItem as ListRowTV, index as Integer) As ListRowTV
		  if rowItem = nil then rowItem = mDataRoot
		  if index <= StaticListFolderTV(rowItem).children.Ubound then
		    return StaticListFolderTV(rowItem).children(index)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_Collapse(rowItem as ListRowTV)
		  #pragma DisableBackgroundTasks // so that this code remains atomic (otherwise, we'd have to use a Semaphore)
		  
		  invalidateRowsPast (rowItem)
		  
		  redim StaticListFolderTV(rowItem).children(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSource_CurrentRowCount() As Integer
		  enumerateRowsUpTo -1, nil
		  return mRowItems.Ubound + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_DeleteAllRows()
		  #pragma DisableBackgroundTasks // so that this code remains atomic (otherwise, we'd have to use a Semaphore)
		  
		  invalidateRowsStartingAt 0
		  redim mDataRoot.children(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_Expand(rowItem as ListRowTV)
		  invalidateRowsPast (rowItem)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSource_IsExpandable(rowItem as ListRowTV) As Boolean
		  return rowItem isA StaticListFolderTV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_MoveColumn(fromIdx as Integer, toIdx as Integer)
		  mDataRoot.MoveColumn fromIdx, toIdx
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_MoveRows(fromRows() as Integer, toAboveRow as Integer)
		  #pragma DisableBackgroundTasks // so that this code remains atomic (otherwise, we'd have to use a Semaphore)
		  
		  if fromRows.Ubound < 0 then return
		  
		  fromRows.Sort
		  dim firstAffectedRow as Integer = Min (fromRows(0), toAboveRow)
		  
		  dim items() as StaticListRowTV
		  for each row as Integer in fromRows
		    items.Append mRowItems(row).Right
		  next
		  
		  dim destParent as StaticListFolderTV = mRowItems(toAboveRow).Left
		  dim destItem as StaticListRowTV = mRowItems(toAboveRow).Right
		  dim destIndex as Integer = destParent.children.IndexOf (destItem)
		  
		  for each item as StaticListRowTV in items
		    dim itemParent as StaticListFolderTV = parentItem (item)
		    dim itemIndex as Integer = itemParent.children.IndexOf (item)
		    if itemParent = destParent then
		      if itemIndex < destIndex then
		        destIndex = destIndex - 1
		      end
		    end if
		    itemParent.children.Remove itemIndex
		    destParent.children.Insert destIndex, item
		    destIndex = destIndex + 1
		  next
		  
		  invalidateRowsStartingAt firstAffectedRow
		  
		  // Select the moved rows
		  dim firstItem as StaticListRowTV = items(0)
		  enumerateRowsUpTo -1, firstItem
		  dim destStartRow as Integer = firstItem.row
		  dim newRowNumbers() as Integer
		  for i as Integer = 0 to fromRows.Ubound
		    newRowNumbers.Append destStartRow + i
		  next
		  owner.SelectRows newRowNumbers
		  
		  #if DebugBuild
		    self._DebugCheck
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSource_RowItem(row as Integer) As ListRowTV
		  enumerateRowsUpTo (row, nil)
		  if row < 0 or row > mRowItems.Ubound then
		    return nil
		  end if
		  dim item as StaticListRowTV = mRowItems(row).Right
		  if item.row < 0 then
		    // Something went wrong internally.
		    // Let's check this in the debugger by repeating the operation:
		    break
		    enumerateRowsUpTo (row, nil)
		  end if
		  return item
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_SetColumnCount(colCount as Integer)
		  mColumnCount = colCount
		  
		  dim newUbound as Integer = colCount-1
		  mDataRoot.SetColumnUbound newUbound
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_SortRows()
		  #pragma DisableBackgroundTasks // so that the loop and redim remain atomic
		  
		  enumerateRowsUpTo -1, nil // enumerates all rows
		  
		  mDataRoot.Sort
		  
		  invalidateRowsStartingAt 0 // invalidates all rows
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub enumerateRowsUpTo(untilRow as Integer, untilItem as StaticListRowTV)
		  #pragma DisableBackgroundTasks // so that this code remains atomic (otherwise, we'd have to use a Semaphore)
		  
		  if untilRow >= 0 and mRowItems.Ubound >= untilRow then
		    return
		  end if
		  
		  dim parent as StaticListFolderTV
		  dim item as StaticListRowTV
		  
		  if mRowItems.Ubound < 0 then
		    parent = mDataRoot
		  else
		    dim p as Pair = mRowItems(mRowItems.Ubound)
		    parent = p.Left
		    item = p.Right
		    #if DebugBuild
		      if mRowItems.Ubound <> item.row then break ' this would mean we have a bug in the algorithm
		    #endif
		  end if
		  
		  do 
		    dim startIndex as Integer
		    if item <> nil then
		      startIndex = parent.children.IndexOf (item) + 1
		    end if
		    if parent.EnumerateRows (mRowItems, startIndex, untilRow, untilItem) then
		      return
		    end if
		    // continue with parent of last item in mRowItems
		    if parent = mDataRoot then
		      // we're through
		      exit
		    end if
		    dim row as Integer = parent.row
		    if row < 0 then break ' that would indicate a bug
		    item = parent
		    parent = mRowItems(row).Left
		  loop
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub fillUpToExactly(parent as StaticListFolderTV, prevItem as StaticListRowTV)
		  #pragma DisableBackgroundTasks // so that this code remains atomic (otherwise, we'd have to use a Semaphore)
		  
		  dim lastRow as Integer = mRowItems.Ubound
		  dim lastItem as StaticListRowTV
		  if lastRow >= 0 then
		    lastItem = mRowItems(lastRow).Right
		  end if
		  
		  if prevItem = mDataRoot then
		    // We're adding the first item at the root
		    invalidateRowsStartingAt 0
		    return
		  end
		  
		  if lastItem = prevItem then
		    // The perviously added item is the last child of this parent
		    return
		  end
		  
		  // The last item in mRowItems may still be the last item of the parent, but of a child of the parent,
		  // so let's check that, too
		  while lastRow >= 0
		    dim lastItemParent as StaticListFolderTV = mRowItems(lastRow).Left
		    if lastItemParent = parent then
		      return
		    end if
		    lastRow = lastItemParent.row
		  wend
		  
		  // invalidate items past the one we're going to add to mRowItems
		  if prevItem.row >= 0 then
		    invalidateRowsPast prevItem
		  end if
		  
		  // mRowItems needs to be filled up to this item
		  enumerateRowsUpTo (-1, prevItem)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function insertItem(parent as StaticListFolderTV, atIndex as Integer, newItem as StaticListRowTV, txt as String) As Integer
		  #pragma DisableBackgroundTasks // so that this code remains atomic (otherwise, we'd have to use a Semaphore)
		  
		  dim cell as ListCellTV = me.DataSource_Cell (newItem, 0) ' -> allocates the cell in the row object
		  cell.Text = txt
		  
		  if parent = nil then parent = mDataRoot
		  
		  // To keep mRowItems, our array of known row-to-item mappings, intact,
		  // we need to cut it down to the item/row that comes before the item we're
		  // adding now. That means we'll locate the previous item of this parent, and
		  // invalidate the items past it. We also need to advance mRowItems to that
		  // previous item in case it's not in the array, yet.
		  // Then we can add this new item to the mRowItems savely.
		  
		  dim prevItem as StaticListRowTV = parent.ChildAt (atIndex)
		  if prevItem = nil then
		    // The parent has no children yet -> the parent will thus be the previous item
		    prevItem = parent
		  end
		  
		  fillUpToExactly parent, prevItem
		  
		  mRowItems.Append parent : newItem
		  
		  dim row as Integer = mRowItems.Ubound
		  parent.children.Append newItem
		  newItem.row = row
		  
		  return row
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub invalidateRowsPast(rowItem as ListRowTV)
		  #pragma DisableBackgroundTasks // so that the loop and redim remain atomic
		  
		  dim newUbound as Integer = StaticListRowTV(rowItem).row
		  if rowItem <> mDataRoot then
		    if newUbound < 0 then
		      ' already invalidated
		      return
		    elseif newUbound > mRowItems.Ubound then
		      break ' should never happen
		      return
		    elseif newUbound = mRowItems.Ubound then
		      ' okay, no change
		      return
		    end if
		  end if
		  
		  ' invalidate all the items past newUbound
		  for i as Integer = newUbound+1 to mRowItems.Ubound
		    dim item as StaticListRowTV = mRowItems(i).Right
		    item.row = -1
		  next
		  redim mRowItems (newUbound)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub invalidateRowsStartingAt(row as Integer)
		  #pragma DisableBackgroundTasks // so that the loop and redim remain atomic
		  
		  dim newUbound as Integer = row - 1
		  
		  if newUbound < mRowItems.Ubound then
		    ' invalidate all the items past newUbound
		    for i as Integer = row to mRowItems.Ubound
		      dim item as StaticListRowTV = mRowItems(i).Right
		      item.row = -1
		    next
		    redim mRowItems (newUbound)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function owner() As ListBoxTV
		  return ListBoxTV (mOwner.Value)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function parentItem(rowItem as StaticListRowTV) As StaticListFolderTV
		  return mRowItems (rowItem.row).Left
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveRow(row as Integer, animOptions as Integer)
		  #pragma DisableBackgroundTasks // so that this code remains atomic (otherwise, we'd have to use a Semaphore)
		  
		  // update mRowItems to include the row
		  enumerateRowsUpTo row, nil
		  
		  // get the item we want to delete
		  dim item as StaticListRowTV = mRowItems (row).Right
		  dim parent as StaticListFolderTV = mRowItems (row).Left
		  dim indexInParent as Integer = parent.children.IndexOf (item)
		  
		  // remove it from the TableView
		  dim tv as NSOutlineViewMBS = owner.TableView
		  dim tvParent as NSOutlineViewItemMBS = parent
		  if tvParent = mDataRoot then tvParent = nil
		  tv.removeItemsAtIndexes NSIndexSetMBS.indexSetWithIndex (indexInParent), tvParent, animOptions
		  
		  // Invalidate mRowItems past the deleted item
		  invalidateRowsPast item
		  dim p as Pair = mRowItems.Pop
		  item = p.Right
		  item.row = -1
		  
		  // remove the item from the parent container
		  parent.children.Remove indexInParent
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub _DebugCheck()
		  // For debugging only.
		  // Checks the integrity of the data
		  
		  #if DebugBuild
		    
		    'dim row as Integer
		    'for each p as Pair in mRowItems
		    'dim item as StaticListRowTV = p.Right
		    'if item.row <> row then
		    'break
		    'return
		    'end if
		    'row = row + 1
		    'next
		    
		  #endif
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mColumnCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDataRoot As StaticListFolderTV
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			ListBoxTV
		#tag EndNote
		Private mOwner As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Pair (parent StaticListFolderTV : item as StaticListRowTV)
			
			This is our cache of known Rows and their Items. We need this to determine the next
			Row number and also to look up a RowItem's row number and parent.
			
			Only invalidateRowsPast() may redim this array to make sure the invalidated rows get their row set to -1!
		#tag EndNote
		Private mRowItems() As Pair
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
