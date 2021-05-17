#tag Class
Protected Class MyNSTokenFieldMBS
Inherits NSTokenFieldMBS
	#tag Event
		Sub Action()
		  // this event does nothing in NSTokenFieldMBS
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function completionsForSubstring(substring as string, tokenIndex as integer, byref selectedIndex as integer) As variant()
		  dim answers() as Variant
		  dim list as listbox = TestWindow.Listbox1
		  
		  dim u as integer = list.ListCount-1
		  for i as integer = 0 to u
		    if instr(list.Cell(i,1), substring)>0 or instr(list.Cell(i,2), substring)>0 then
		      answers.Append list.Cell(i,2)
		    end if
		  next
		  
		  Return answers
		  
		End Function
	#tag EndEvent

	#tag Event
		Function displayStringForRepresentedObject(representedObject as variant) As string
		  if representedObject isa DataClass then
		    dim id as DataClass = representedObject
		    Return id.item
		  end if
		  
		End Function
	#tag EndEvent

	#tag Event
		Function editingStringForRepresentedObject(representedObject as variant) As string
		  dim id as DataClass = representedObject
		  Return id.item
		  
		End Function
	#tag EndEvent

	#tag Event
		Function hasMenuForRepresentedObject(representedObject as variant) As boolean
		  if representedObject isa DataClass then
		    dim id as DataClass = representedObject
		    Return id.hasMenu
		  end if
		  
		End Function
	#tag EndEvent

	#tag Event
		Function menuForRepresentedObject(representedObject as variant) As NSMenuMBS
		  if representedObject isa DataClass then
		    dim d as DataClass = representedObject
		    if d.hasMenu then
		      
		      LastMenu = new NSMenuMBS
		      LastMenuItem = new MyNSMenuItemMBS
		      
		      LastMenuItem.CreateMenuItem "Hello World"
		      LastMenu.addItem LastMenuItem
		      
		      Return LastMenu
		    end if
		  end if
		  
		End Function
	#tag EndEvent

	#tag Event
		Function representedObjectForEditingString(editingString as string) As variant
		  
		  dim list as listbox = TestWindow.Listbox1
		  
		  dim u as integer = list.ListCount-1
		  for i as integer = 0 to u
		    if list.Cell(i,1) = editingString or list.Cell(i,2) = editingString then
		      Return list.RowTag(i)
		    end if
		  next
		  
		End Function
	#tag EndEvent

	#tag Event
		Function shouldAddObjects(tokens() as variant, index as Integer) As variant()
		  // add all
		  Return tokens
		  
		End Function
	#tag EndEvent

	#tag Event
		Function textShouldBeginEditing(fieldEditor as NSTextMBS) As boolean
		  // this event does nothing in NSTokenFieldMBS
		  
		End Function
	#tag EndEvent

	#tag Event
		Function textShouldEndEditing(fieldEditor as NSTextMBS) As boolean
		  // this event does nothing in NSTokenFieldMBS
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub tokenFieldAction()
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Function tokenFieldTextShouldBeginEditing(fieldEditor as NSTextMBS) As boolean
		  System.DebugLog CurrentMethodName
		  Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Function tokenFieldTextShouldEndEditing(fieldEditor as NSTextMBS) As boolean
		  System.DebugLog CurrentMethodName
		  
		  Return true
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		LastMenu As NSMenuMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		LastMenuItem As MyNSMenuItemMBS
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
