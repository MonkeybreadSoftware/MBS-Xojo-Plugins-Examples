#tag Class
Protected Class ListBoxTVContextMenuItem
Inherits NSMenuItemMBS
	#tag Event
		Sub Action()
		  owner.MenuItemAction (me)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor(menu as ListBoxTVContextMenu, item as MenuItem)
		  super.Constructor (item.Text, "")
		  mOwner = new WeakRef (menu)
		  me.Item = item
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function owner() As ListBoxTVContextMenu
		  return ListBoxTVContextMenu (mOwner.Value)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Item As MenuItem
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			ListBoxTVContextMenu
		#tag EndNote
		Private mOwner As WeakRef
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
