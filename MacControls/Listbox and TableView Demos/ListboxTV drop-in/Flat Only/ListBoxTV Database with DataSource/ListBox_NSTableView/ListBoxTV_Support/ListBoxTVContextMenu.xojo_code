#tag Class
Protected Class ListBoxTVContextMenu
Inherits NSMenuMBS
	#tag Event
		Sub EnableMenuItems()
		  me.Clear
		  
		  dim row as Integer = owner._clickedRow
		  dim col as Integer = owner._clickedColumn
		  
		  if row < 0 then
		    // Click in Header
		    
		    // clickedColumn is always -1 in this case, so we need to calculate it manually
		    dim ev as NSEventMBS = NSApplicationMBS.sharedApplication.currentEvent
		    dim globalLocation as NSPointMBS = ev.locationInWindow
		    dim localLocation as NSPointMBS = owner.TableView.convertPointFromView (globalLocation, nil)
		    localLocation.Y = 0
		    col = owner.TableView.columnAtPoint (localLocation)
		    
		  else
		    // Click in row / cell
		    
		    if not owner.Selected (row) then
		      // deselect all others if the right-click was not inside the current selection - this is to avoid confusion for the user
		      owner.ListIndex = row
		    end if
		    
		  end if
		  
		  dim base as new MenuItem
		  if owner._constructContextualMenu (base, System.MouseX, System.MouseY, row, col, me) then
		    for i as Integer = 1 to base.Count
		      dim item as ListBoxTVContextMenuItem = new ListBoxTVContextMenuItem (me, base.Item(i-1))
		      mItems.Append item
		      super.addItem item
		    next
		  end if
		  mMenu = base
		  mRow = row
		  mCol = col
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Clear()
		  super.removeAllItems
		  redim mItems(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ownerRef as WeakRef)
		  super.Constructor
		  mOwner = ownerRef
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MenuItemAction(sender as ListBoxTVContextMenuItem)
		  dim item as MenuItem = sender.Item
		  owner._contextualMenuAction item, mRow, mCol
		  me.Clear
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function owner() As ListBoxTV
		  return ListBoxTV (mOwner.Value)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mCol As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mItems() As ListBoxTVContextMenuItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMenu As MenuItem
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			ListBoxTV
		#tag EndNote
		Private mOwner As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRow As Integer
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
