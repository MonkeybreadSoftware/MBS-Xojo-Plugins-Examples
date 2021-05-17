#tag Class
Private Class StaticListFolderTV
Inherits StaticListRowTV
	#tag Method, Flags = &h0
		Function ChildAt(idx as integer) As StaticListRowTV
		  if children.Ubound >= 0 then
		    if idx < 0 or idx > children.Ubound then
		      ' last child
		      return children (children.Ubound)
		    else
		      return children (idx)
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EnumerateRows(rowItems() as Pair, startIndex as Integer, stopAtRow as Integer, stopAfterItem as StaticListRowTV) As Boolean
		  #pragma DisableBackgroundTasks // so that this code remains atomic (otherwise, we'd have to use a Semaphore)
		  
		  // Returns true if specified row or item has been reached
		  
		  for idx as Integer = startIndex to me.children.Ubound
		    dim child as StaticListRowTV = me.children(idx)
		    rowItems.Append me : child
		    child.row = rowItems.Ubound
		    if child isA StaticListFolderTV then
		      if StaticListFolderTV(child).EnumerateRows (rowItems, 0, stopAtRow, stopAfterItem) then
		        return true
		      end if
		    end if
		    if rowItems.Ubound = stopAtRow then
		      // Do not move this before the recursion call, or it'll cause errors.
		      // That's because enumerateRowsUpTo() starts with the next child, and therefore all this child's children need to have been enumerated already
		      return true
		    end if
		    if child = stopAfterItem then
		      return true
		    end if
		  next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastChild() As StaticListRowTV
		  if children.Ubound >= 0 then
		    return children (children.Ubound)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MoveColumn(fromIdx as Integer, toIdx as Integer)
		  #pragma DisableBackgroundTasks // so that this code remains atomic (otherwise, we'd have to use a Semaphore)
		  
		  super.MoveColumn fromIdx, toIdx
		  
		  for each child as StaticListRowTV in me.children
		    child.MoveColumn fromIdx, toIdx
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetColumnUbound(ub as Integer)
		  #pragma DisableBackgroundTasks // so that this code remains atomic (otherwise, we'd have to use a Semaphore)
		  
		  super.SetColumnUbound ub
		  
		  for each child as StaticListRowTV in me.children
		    child.SetColumnUbound ub
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Sort()
		  #pragma DisableBackgroundTasks // so that this code remains atomic (otherwise, we'd have to use a Semaphore)
		  
		  dim newRows() as NSOutlineViewItemMBS = NSOutlineViewItemMBS.sortedArrayUsingDescriptors (me.children, owner.TableView.sortDescriptors)
		  
		  for i as Integer = 0 to newRows.Ubound
		    dim row as StaticListRowTV = StaticListRowTV(newRows(i))
		    me.children(i) = row
		  next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		children() As StaticListRowTV
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
