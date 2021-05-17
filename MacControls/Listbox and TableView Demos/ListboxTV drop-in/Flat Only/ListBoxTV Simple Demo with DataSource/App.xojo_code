#tag Class
Protected Class App
Inherits Application
Implements ListBoxTVDataSource
	#tag Event
		Sub NewDocument()
		  Window1.lb.DataSource = me
		  Window1.Show
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function DataSource_Cell(row as Integer, column as Integer) As ListCellTV
		  // Part of the ListBoxTVDataSource interface.
		  
		  return new ListCellTV (Str(row) + "/" + Str(column))
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
		  
		  return 10
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


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
