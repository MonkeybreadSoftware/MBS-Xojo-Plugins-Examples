#tag Class
Protected Class DynamicListBoxTVDataSource
Implements ListBoxTVDataSource
	#tag Method, Flags = &h0
		Sub Constructor(origDataSource as ListBoxTVDataSource, rowCount as Integer)
		  mOrigDataSource = origDataSource
		  mRowCount = rowCount
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSource_Cell(row as Integer, column as Integer) As ListCellTV
		  if row = 0 and column = mColumnCount-1 or row >= mOrigDataSource.DataSource_RowCount then
		    //
		    // This demonstrates how to deliver cell values on-demand, i.e. only once the cell is
		    // getting displayed.
		    //
		    // For instance, if you have 10000 rows, you don't have to call AddRow that many times
		    // initially, but instead only have to return that number from the DynamicNumberOfRows
		    // Event. Then, if the user displays or scrolls the list, this event gets called just for the
		    // cells that are visible.
		    //
		    // Usually, you would either implement this and the DynamicNumberOfRows event,
		    // or you'd use AddRow to preset the cell vaules.
		    //
		    // In this demo, though, we mix both: In the Open event, we preset 20 rows
		    // using AddRow, and in DynamicNumberOfRows we return 30 rows, so that rows 20-29
		    // are not preset. Instead, we deliver them dynamically from here.
		    //
		    // We also override one of the preset cells, i.e. the last column of the first row.
		    //
		    
		    dim txt as String = "dyn "+Str(row) + "/" + Str(column)
		    return new ListCellTV (txt)
		    
		  else
		    
		    return mOrigDataSource.DataSource_Cell (row, column)
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_CellDidUpdate(row as Integer, column as Integer, cell as ListCellTV, updatesText as Boolean, updatesChecked as Boolean)
		  if row = 0 and column = mColumnCount-1 or row >= mOrigDataSource.DataSource_RowCount then
		    // These are our dynamic cells - we ignore changes here because this demo class does not support remembering edited values
		  else
		    mOrigDataSource.DataSource_CellDidUpdate row, column, cell, updatesText, updatesChecked
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_CellWillUpdate(row as Integer, column as Integer, cell as ListCellTV, updatesText as Boolean, updatesChecked as Boolean)
		  if row = 0 and column = mColumnCount-1 or row >= mOrigDataSource.DataSource_RowCount then
		    // These are our dynamic cells - we ignore changes here because this demo class does not support remembering edited values
		  else
		    mOrigDataSource.DataSource_CellWillUpdate row, column, cell, updatesText, updatesChecked
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_DeleteAllRows()
		  mOrigDataSource.DataSource_DeleteAllRows
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_MoveColumn(fromIdx as Integer, toIdx as Integer)
		  mOrigDataSource.DataSource_MoveColumn fromIdx, toIdx
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_MoveRows(fromIdxs() as Integer, toAboveIdx as Integer)
		  if toAboveIdx > mOrigDataSource.DataSource_RowCount then
		    beep // These are our dynamic cells - we do not support dragging from or to them in this demo
		  else
		    // Also check the fromIdxs, removing those that are in our dynamic range
		    for i as Integer = fromIdxs.Ubound downTo 0
		      if fromIdxs(i) >= mOrigDataSource.DataSource_RowCount then
		        fromIdxs.Remove i
		      end if
		    next
		    if fromIdxs.Ubound < 0 then
		      beep // there are none left
		    else
		      mOrigDataSource.DataSource_MoveRows fromIdxs, toAboveIdx
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSource_RowCount() As Integer
		  return mRowCount
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSource_RowTag(row as Integer) As Variant
		  if row >= mOrigDataSource.DataSource_RowCount then
		    // We do not support RowTags for the dynamic rows in this demo
		  else
		    return mOrigDataSource.DataSource_RowTag(row)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_RowTag(row as Integer, assigns tag as Variant)
		  if row >= mOrigDataSource.DataSource_RowCount then
		    // We do not support RowTags for the dynamic rows in this demo
		  else
		    mOrigDataSource.DataSource_RowTag (row) = tag
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_SetColumnCount(colCount as Integer)
		  mColumnCount = colCount
		  mOrigDataSource.DataSource_SetColumnCount colCount
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_SortRows(sorters() as NSSortDescriptorMBS)
		  mOrigDataSource.DataSource_SortRows sorters
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mColumnCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOrigDataSource As ListBoxTVDataSource
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRowCount As Integer
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
			InitialValue="-2147483648"
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
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
