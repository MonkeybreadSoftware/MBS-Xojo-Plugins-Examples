#tag Class
Class ListColumnTV
Inherits NSTableColumnMBS
	#tag Method, Flags = &h1000
		Sub Constructor(ownerRef as WeakRef, colNum as Integer)
		  mOwner = ownerRef
		  mColumnIndex = colNum
		  
		  static lastID as Integer
		  lastID = lastID + 1
		  dim id as String = Str(lastID,"#") '  Since columns can be reordered, id can't identify the column index, but only ColumnIndex can.
		  super.Constructor (id)
		  
		  const NSCaseInsensitiveSearch = 1
		  const NSLiteralSearch = 2
		  const NSBackwardsSearch = 4
		  const NSAnchoredSearch = 8
		  const NSNumericSearch = 64 ' -> smart sort where numbers get ordered properly
		  const NSDiacriticInsensitiveSearch = 128
		  const NSWidthInsensitiveSearch = 256
		  const NSForcedOrderingSearch = 512
		  
		  // Set up default sort handling, for when the ListboxTV.SortColumn and ListboxTV.CompareRows events are not used
		  dim opts as Integer = NSCaseInsensitiveSearch + NSDiacriticInsensitiveSearch + NSNumericSearch
		  
		  // Install the primary and secondary sort descriptors
		  dim sorter as NSSortDescriptorMBS = NSSortDescriptorMBS.sortDescriptorWithKeyWithCompare ("", true, opts) ' this sorter is used when the CompareRows() event returns false
		  mSortHandler = new ListRowComparator (mOwner, me, sorter) ' this is our internal sorter that invokes CompareRows() and falls back to the above sorter
		  me.sortDescriptorPrototype = mSortHandler
		  
		  // Set some UI options
		  dim cell as NSCellMBS = me.headerCell
		  cell.wraps = false
		  cell.lineBreakMode = NSParagraphStyleMBS.NSLineBreakByTruncatingTail
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EffectiveType(row as Integer) As Integer
		  dim myCell as ListCellTV = owner._cell(row, ColumnIndex)
		  dim t as Integer = myCell.Type
		  if t = ListBox.TypeDefault then
		    return me.Type
		  else
		    return t
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function owner() As ListBoxTV
		  return ListBoxTV (mOwner.Value)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFontAndSize(fontName as String, size as Double = 0)
		  if fontName = "" or fontName = "System" or fontName = "SmallSystem" then
		    me.headerCell.font = NSFontMBS.systemFontOfSize (size)
		  else
		    me.headerCell.font = NSFontMBS.fontWithName (fontName, size)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub _updateOwnIndex()
		  mColumnIndex = me.tableView.columnWithIdentifier (me.identifier)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mAlignment
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if mAlignment <> value then
			    mAlignment = value
			    owner._needsReload()
			  end if
			End Set
		#tag EndSetter
		Alignment As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mAlignmentOffset
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if mAlignmentOffset <> value then
			    mAlignmentOffset = value
			    owner._needsReload()
			  end if
			End Set
		#tag EndSetter
		AlignmentOffset As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mColumnIndex
			End Get
		#tag EndGetter
		ColumnIndex As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mAlignment As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAlignmentOffset As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Round (me.maxWidth)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mMaxWidthExpr = Str(value,"#")
			  owner._needsReload(true)
			  me.maxWidth = value
			End Set
		#tag EndSetter
		MaxWidthActual As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mMaxWidthExpr
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mMaxWidthExpr = value
			  owner._needsReload(true, true)
			End Set
		#tag EndSetter
		MaxWidthExpression As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mColumnIndex As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Round (me.minWidth)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mMinWidthExpr = Str(value,"#")
			  owner._needsReload(true)
			  me.minWidth = value
			End Set
		#tag EndSetter
		MinWidthActual As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mMinWidthExpr
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mMinWidthExpr = value
			  owner._needsReload(true, true)
			End Set
		#tag EndSetter
		MinWidthExpression As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mMaxWidthExpr As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMinWidthExpr As String
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			ListBoxTV
		#tag EndNote
		Private mOwner As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSortDirection As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSortHandler As NSSortDescriptorMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWidthExpr As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mSortDirection
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if mSortDirection <> value then
			    mSortDirection = value
			    owner._needsReload()
			  end if
			End Set
		#tag EndSetter
		SortDirection As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		#tag Note
			You may set this to anything you like - if the user drags the column to another position, this Tag will move along.
		#tag EndNote
		Tag As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		Type As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return me.Resizable
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  me.Resizable = value
			End Set
		#tag EndSetter
		UserResizable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Round (me.width)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWidthExpr = Str(value,"#")
			  owner._needsReload(true)
			  me.width = value
			End Set
		#tag EndSetter
		WidthActual As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mWidthExpr
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWidthExpr = value
			  owner._needsReload(true, true)
			End Set
		#tag EndSetter
		WidthExpression As String
	#tag EndComputedProperty


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
		#tag ViewProperty
			Name="WidthExpression"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinWidthActual"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="WidthActual"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="UserResizable"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaxWidthActual"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Alignment"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AlignmentOffset"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinWidthExpression"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaxWidthExpression"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SortDirection"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Type"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
