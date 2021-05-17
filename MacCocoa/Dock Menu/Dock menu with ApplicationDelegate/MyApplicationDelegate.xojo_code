#tag Class
Protected Class MyApplicationDelegate
Inherits NSApplicationDelegateMBS
	#tag Event
		Function applicationDockMenu() As NSMenuMBS
		  
		  redim items(-1) // clear last menuitems
		  // we do keep menu item objects in an array, so the Real Studio object with the event handler stays alive.
		  
		  m=new NSMenuMBS
		  
		  dim a as new MyCocoaMenuItemMBS
		  a.CreateMenuItem "Top menu entry"
		  a.Enabled=true
		  a.Tag=1
		  items.Append a // so RB doesn't free the object.
		  m.AddItem a
		  
		  dim b as new MyCocoaMenuItemMBS
		  b.CreateSeparator
		  items.Append b
		  m.AddItem b
		  
		  dim c as new MyCocoaMenuItemMBS
		  c.CreateMenuItem "Middle menu entry"
		  c.Enabled=true
		  c.Tag=2
		  c.state=1
		  items.Append c
		  m.AddItem c
		  
		  dim d as new MyCocoaMenuItemMBS
		  d.CreateMenuItem "Bottom menu entry"
		  d.Enabled=false
		  d.tag=3
		  items.Append d
		  m.AddItem d
		  
		  dim e as new MyCocoaMenuItemMBS
		  e.CreateMenuItem "Greetings from Real Studio"
		  e.Enabled=true
		  e.tag=3
		  items.Append e
		  m.AddItem e
		  
		  return m
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h1
		Protected items(-1) As NSMenuItemMBS
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected m As NSMenuMBS
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
