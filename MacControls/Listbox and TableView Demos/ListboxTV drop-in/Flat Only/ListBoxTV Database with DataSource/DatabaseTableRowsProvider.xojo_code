#tag Class
Protected Class DatabaseTableRowsProvider
Implements ListBoxTVDataSource
	#tag Method, Flags = &h0
		Sub Constructor(db as Database, tableName as String)
		  mDatabase = db
		  mTableName = tableName
		  mLastFetchedRowNumber = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSource_Cell(row as Integer, column as Integer) As ListCellTV
		  // Return the row's column of the DB table
		  
		  dim rowValues() as String
		  
		  // Let's do a little caching to avoid fetching the same row multiple times
		  if row = mLastFetchedRowNumber then
		    rowValues = mLastFetchedRowValues
		  else
		    mLastFetchedRowNumber = row
		    dim rs as RecordSet = mDatabase.SQLSelect ("SELECT * FROM ["+mTableName+"] LIMIT 1 OFFSET "+Str(row))
		    if rs = nil or rs.EOF then
		      redim mLastFetchedRowValues(-1)
		      return nil
		    end if
		    for i as Integer = 1 to rs.FieldCount
		      rowValues.Append rs.IdxField(i)
		    next
		    mLastFetchedRowValues = rowValues
		  end if
		  
		  return new ListCellTV (rowValues (column))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_CellDidUpdate(row as Integer, column as Integer, cell as ListCellTV, updatesText as Boolean, updatesChecked as Boolean)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_CellWillUpdate(row as Integer, column as Integer, cell as ListCellTV, updatesText as Boolean, updatesChecked as Boolean)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_DeleteAllRows()
		  mLastFetchedRowNumber = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_MoveColumn(fromIdx as Integer, toIdx as Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_MoveRows(fromIdxs() as Integer, toAboveIdx as Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSource_RowCount() As Integer
		  // Return the row count of the table
		  
		  dim rs as RecordSet = mDatabase.SQLSelect ("SELECT COUNT(1) FROM ["+mTableName+"]")
		  
		  return rs.IdxField(1).IntegerValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSource_RowTag(row as Integer) As Variant
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_RowTag(row as Integer, assigns tag as Variant)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_SetColumnCount(colCount as Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_SortRows(sorters() as NSSortDescriptorMBS)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mDatabase As Database
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastFetchedRowNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastFetchedRowValues() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTableName As String
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
