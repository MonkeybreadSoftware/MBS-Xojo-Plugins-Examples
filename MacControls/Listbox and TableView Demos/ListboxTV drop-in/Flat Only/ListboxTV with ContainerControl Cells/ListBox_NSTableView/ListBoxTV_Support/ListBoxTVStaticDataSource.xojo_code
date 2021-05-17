#tag Class
Protected Class ListBoxTVStaticDataSource
Implements ListBoxTVDataSource
	#tag Method, Flags = &h0
		Sub AddRow(txt as String)
		  dim row as new ListRowTV (mOwner, mColumnCount, mRows.Ubound+1)
		  mRows.Append row
		  
		  dim cell as ListCellTV = me.DataSource_Cell (mRows.Ubound, 0) ' -> allocates the cell in the row object
		  cell.Text = txt
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ownerRef as WeakRef)
		  mOwner = ownerRef
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSource_Cell(row as Integer, column as Integer) As ListCellTV
		  dim cells() as ListCellTV = mRows(row).cells
		  dim res as ListCellTV = cells(column)
		  
		  if res is nil then
		    // This cell has not been accessed before - create it now
		    res = new ListCellTV ()
		    cells(column) = res
		  end if
		  
		  return res
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_CellDidUpdate(row as Integer, column as Integer, cell as ListCellTV, updatesText as Boolean, updatesChecked as Boolean)
		  // Nothing to do here - it exists for use with custom implementations of the ListBoxTVDataSource interface
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_CellWillUpdate(row as Integer, column as Integer, cell as ListCellTV, updatesText as Boolean, updatesChecked as Boolean)
		  // Nothing to do here - it exists for use with custom implementations of the ListBoxTVDataSource interface
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_DeleteAllRows()
		  redim mRows(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_MoveColumn(fromIdx as Integer, toIdx as Integer)
		  for each row as ListRowTV in mRows
		    row.MoveColumn fromIdx, toIdx
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_MoveRows(fromIdxs() as Integer, toAboveIdx as Integer)
		  dim oldIndexOffset, newIndexOffset, firstAffected, lastAffected as Integer
		  
		  fromIdxs.Sort
		  
		  firstAffected = toAboveIdx
		  lastAffected = toAboveIdx
		  
		  for each oldIndex as Integer in fromIdxs
		    dim fromIdx, toIdx as Integer
		    if oldIndex < toAboveIdx then
		      if oldIndex < firstAffected then firstAffected = oldIndex
		      fromIdx = oldIndex + oldIndexOffset
		      toIdx = toAboveIdx - 1
		      oldIndexOffset = oldIndexOffset - 1
		    else
		      if oldIndex > lastAffected then lastAffected = oldIndex
		      fromIdx = oldIndex
		      toIdx = toAboveIdx + newIndexOffset
		      newIndexOffset = newIndexOffset + 1
		    end
		    dim row as ListRowTV = mRows(fromIdx)
		    mRows.Remove fromIdx
		    mRows.Insert toIdx, row
		  next
		  
		  if lastAffected > mRows.Ubound then lastAffected = mRows.Ubound
		  
		  for row as Integer = firstAffected to lastAffected
		    mRows(row).row = row
		  next
		  
		  owner._needsReload
		  owner.DeselectAll
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSource_RowCount() As Integer
		  return mRows.Ubound+1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSource_RowTag(row as Integer) As Variant
		  return mRows(row).tag
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_RowTag(row as Integer, assigns tag as Variant)
		  mRows(row).tag = tag
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_SetColumnCount(colCount as Integer)
		  mColumnCount = colCount
		  
		  dim newUbound as Integer = colCount-1
		  
		  for each row as ListRowTV in mRows
		    dim cells() as ListCellTV = row.cells
		    redim cells(newUbound)
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_SortRows(sorters() as NSSortDescriptorMBS)
		  dim newRows() as KeyValueCodingMBS = KeyValueCodingMBS.sortedArrayUsingDescriptors (mRows, sorters)
		  for i as Integer = 0 to newRows.Ubound
		    dim row as ListRowTV = ListRowTV(newRows(i))
		    row.row = i
		    mRows(i) = row
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function owner() As ListBoxTV
		  return ListBoxTV (mOwner.Value)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mColumnCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			ListBoxTV
		#tag EndNote
		Private mOwner As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRows() As ListRowTV
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
