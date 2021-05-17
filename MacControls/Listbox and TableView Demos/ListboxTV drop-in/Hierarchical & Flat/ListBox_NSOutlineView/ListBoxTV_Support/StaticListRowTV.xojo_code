#tag Class
Private Class StaticListRowTV
Inherits ListRowTV
	#tag Event
		Function Description() As String
		  '+++ temporarily disabled because it interferes with debugging during setup
		  '// Lets return all cells' values, comma-separated
		  'dim res() as String
		  'for each c as ListCellTV in cells
		  'dim s as String = c.text
		  'if s.Len > 20 then
		  's = s.Left(20)+"…"
		  'end
		  'res.Append s
		  'next
		  'return "#"+Str(row)+" ["+Join(res, ", ")+"]"
		End Function
	#tag EndEvent

	#tag Event
		Function valueForKey(key as string) As Variant
		  // This is only called when performing a sort using sort descriptors
		  // (see ListBoxTVDataSource.sortDescriptorsDidChange)
		  
		  if me isA StaticListFolderTV then
		    // we need to sort the children as well
		    StaticListFolderTV (me).Sort
		  end if
		  
		  dim col as Integer = owner.TableView.columnWithIdentifier(key)
		  dim cell as ListCellTV = cells(col)
		  cell._internalUse = me.row : col
		  return cell
		End Function
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor(ownerRef as WeakRef, columnCount as Integer)
		  mOwner = ownerRef
		  me.row = -1 // -> unknown
		  redim me.cells(columnCount-1)
		  super.Constructor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MoveColumn(fromIdx as Integer, toIdx as Integer)
		  dim c as ListCellTV = me.cells(fromIdx)
		  me.cells.Remove fromIdx
		  me.cells.Insert toIdx, c
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function owner() As ListBoxTV
		  return ListBoxTV (mOwner.Value)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetColumnUbound(ub as Integer)
		  redim me.cells(ub)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		cells() As ListCellTV
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			ListBoxTV
		#tag EndNote
		Private mOwner As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h0
		row As Integer
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
		#tag ViewProperty
			Name="row"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
