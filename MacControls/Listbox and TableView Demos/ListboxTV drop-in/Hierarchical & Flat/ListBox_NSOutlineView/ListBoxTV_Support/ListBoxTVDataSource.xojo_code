#tag Interface
Interface ListBoxTVDataSource
	#tag Method, Flags = &h0
		Function DataSource_Cell(rowItem as ListRowTV, column as Integer) As ListCellTV
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_CellDidUpdate(cell as ListCellTV, rowItem as ListRowTV, column as Integer, updatesText as Boolean, updatesChecked as Boolean)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_CellWillUpdate(cell as ListCellTV, rowItem as ListRowTV, column as Integer, updatesText as Boolean, updatesChecked as Boolean)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSource_ChildCount(rowItem as ListRowTV) As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSource_ChildItem(rowItem as ListRowTV, index as Integer) As ListRowTV
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_Collapse(rowItem as ListRowTV)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSource_CurrentRowCount() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_DeleteAllRows()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_Expand(rowItem as ListRowTV)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSource_IsExpandable(rowItem as ListRowTV) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_MoveColumn(fromIdx as Integer, toIdx as Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_MoveRows(fromRows() as Integer, toAboveRow as Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSource_RowItem(row as Integer) As ListRowTV
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_SetColumnCount(colCount as Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource_SortRows()
		  
		End Sub
	#tag EndMethod


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
End Interface
#tag EndInterface
