#tag Interface
Interface ListBoxTVDataSource
	#tag Method, Flags = &h0
		Function DataSource_Cell(row as Integer, column as Integer) As ListCellTV
		  
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
