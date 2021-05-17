#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   677359785
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Ohne Titel"
   Visible         =   True
   Width           =   600
   Begin NSOutlineControlMBS List
      AcceptTabs      =   False
      allowsColumnReordering=   True
      allowsColumnResizing=   True
      allowsColumnSelection=   False
      allowsEmptySelection=   True
      allowsMultipleSelection=   False
      AutoDeactivate  =   True
      autohidesScrollers=   True
      Enabled         =   True
      hasHorizontalScroller=   False
      hasVerticalScroller=   True
      Height          =   366
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   14
      Transparent     =   True
      Visible         =   True
      Width           =   560
   End
End
#tag EndWindow

#tag WindowCode
	#tag Property, Flags = &h0
		Columns() As NSTableColumnMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		RootItem As ListItem
	#tag EndProperty

	#tag Property, Flags = &h0
		View As NSOutlineViewMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events List
	#tag Event
		Function childOfItem(index as Integer, item as NSOutlineViewItemMBS) As NSOutlineViewItemMBS
		  
		  dim node as ListItem
		  if item = nil then
		    node = RootItem
		  else
		    node = ListItem(item)
		  end if
		  return node.children(index)
		End Function
	#tag EndEvent
	#tag Event
		Function isItemExpandable(item as NSOutlineViewItemMBS) As Boolean
		  dim node as ListItem
		  if item = nil then
		    node = RootItem
		  else
		    node = ListItem(item)
		  end if
		  return node.children.Ubound >= 0
		End Function
	#tag EndEvent
	#tag Event
		Function numberOfChildrenOfItem(item as NSOutlineViewItemMBS) As Integer
		  dim node as ListItem
		  if item = nil then
		    node = RootItem
		  else
		    node = ListItem(item)
		  end if
		  if node <> nil then
		    return node.children.Ubound+1
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  View = me.view
		  if View = nil then
		    Break // not initialized?
		  end if
		  
		  // Add two columns
		  dim col1 as new NSTableColumnMBS("First")
		  dim col2 as new NSTableColumnMBS("Second")
		  col1.Width = 200
		  col2.Width = 120
		  
		  columns.Append col1
		  columns.Append col2
		  me.View.addTableColumn col1
		  me.View.addTableColumn col2
		  
		  // Set some options to make the list "prettier"
		  me.View.usesAlternatingRowBackgroundColors = true
		  me.View.gridStyleMask = NSTableViewMBS.NSTableViewSolidHorizontalGridLineMask + NSTableViewMBS.NSTableViewSolidVerticalGridLineMask
		  
		  // Specify the column that contains the "expand" icons. If we don't set this, we effectively get a flat list instead
		  dim cols() as NSTableColumnMBS = me.View.tableColumns()
		  me.View.outlineTableColumn = col1 ' use the first column
		  
		  // If we want to allow column resizing, this option should be set to avoid ugly visual effect while resizing
		  // (i.e. the vertical grid lines do not move nicely, then), or the gridlines should be not used.
		  me.View.autoresizesOutlineColumn = false
		  
		  // Set up our hierarchical data, which is a tree structure
		  RootItem = new ListItem
		  
		  dim d1 as new ListItem("People")
		  dim p1 as new ListItem("Antoine", 3453)
		  dim p2 as new ListItem("Bob", 53345)
		  dim p3 as new ListItem("Christoph", 457546)
		  dim p4 as new ListItem("Dagmar", 46575)
		  d1.Append p1
		  d1.Append p2
		  d1.Append p3
		  d1.Append p4
		  RootItem.Append d1
		  
		  
		  dim d2 as new ListItem("Cities")
		  dim c1 as new ListItem("London", 2435)
		  dim c2 as new ListItem("Munich", 436)
		  dim c3 as new ListItem("New York", 54325)
		  dim c4 as new ListItem("Oldenburg", 674756)
		  d2.Append c1
		  d2.Append c2
		  d2.Append c3
		  d2.Append c4
		  RootItem.Append d2
		  
		  // this forces the listbox to update (by calling Events such as childOfItem etc.)
		  me.View.reloadData 
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function objectValue(tableColumn as NSTableColumnMBS, item as NSOutlineViewItemMBS) As Variant
		  dim node as ListItem
		  if item = nil then
		    node = RootItem
		  else
		    node = ListItem(item)
		  end if
		  
		  dim colIndex as integer = Columns.IndexOf(tableColumn)
		  
		  return node.Values(colIndex)
		End Function
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
