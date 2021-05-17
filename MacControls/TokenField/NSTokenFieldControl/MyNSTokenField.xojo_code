#tag Class
Protected Class MyNSTokenField
Inherits NSTokenFieldControlMBS
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
		  dim id as string = representedObject
		  dim list as listbox = TestWindow.Listbox1
		  
		  dim u as integer = list.ListCount-1
		  for i as integer = 0 to u
		    if list.Cell(i,0) = id then
		      Return list.Cell(i,1)
		    end if
		  next
		  
		End Function
	#tag EndEvent

	#tag Event
		Function editingStringForRepresentedObject(representedObject as variant) As string
		  dim id as string = representedObject
		  dim list as listbox = TestWindow.Listbox1
		  
		  dim u as integer = list.ListCount-1
		  for i as integer = 0 to u
		    if list.Cell(i,0) = id then
		      Return list.Cell(i,2)
		    end if
		  next
		  
		End Function
	#tag EndEvent

	#tag Event
		Function hasMenuForRepresentedObject(representedObject as variant) As boolean
		  Return representedObject.IntegerValue = 1
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Function menuForRepresentedObject(representedObject as variant) As NSMenuMBS
		  if representedObject.IntegerValue = 1 then
		    
		    LastMenu = new NSMenuMBS
		    LastMenuItem = new MyNSMenuItemMBS
		    
		    LastMenuItem.CreateMenuItem "Hello World"
		    LastMenu.addItem LastMenuItem
		    
		    Return LastMenu
		  end if
		  
		End Function
	#tag EndEvent

	#tag Event
		Function representedObjectForEditingString(editingString as string) As variant
		  
		  dim list as listbox = TestWindow.Listbox1
		  
		  dim u as integer = list.ListCount-1
		  for i as integer = 0 to u
		    if list.Cell(i,1) = editingString or list.Cell(i,2) = editingString then
		      Return list.Cell(i,0)
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
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="65"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="20"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
