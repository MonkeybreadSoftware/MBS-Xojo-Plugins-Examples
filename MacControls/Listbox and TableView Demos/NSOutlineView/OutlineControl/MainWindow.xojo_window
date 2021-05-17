#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   411
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   332690377
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "NSTableViewMBS"
   Visible         =   True
   Width           =   577
   Begin HierarchicalMacListBox MyTableControl
      AcceptTabs      =   False
      allowsColumnReordering=   True
      allowsColumnResizing=   True
      allowsColumnSelection=   False
      allowsEmptySelection=   False
      allowsMultipleSelection=   True
      AutoDeactivate  =   True
      autohidesScrollers=   True
      Enabled         =   True
      hasHorizontalScroller=   True
      hasVerticalScroller=   True
      Height          =   349
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   14
      Transparent     =   True
      Visible         =   True
      Width           =   537
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Calls?"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   375
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   112
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   375
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   164
   End
End
#tag EndWindow

#tag WindowCode
	#tag Property, Flags = &h21
		Private mCallCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRootItem As DataNode
	#tag EndProperty


#tag EndWindowCode

#tag Events MyTableControl
	#tag Event
		Sub Open()
		  // Add two columns
		  dim col as new NSTableColumnMBS("First")
		  col.Width = 200
		  me.AddColumn col
		  col = new NSTableColumnMBS("Second")
		  col.Width = 120
		  me.AddColumn col
		  
		  // Set some options to make the list "prettier"
		  me.View.usesAlternatingRowBackgroundColors = true
		  me.View.gridStyleMask = NSTableViewMBS.NSTableViewSolidHorizontalGridLineMask+NSTableViewMBS.NSTableViewSolidVerticalGridLineMask
		  
		  // Specify the column that contains the "expand" icons. If we don't set this, we effectively get a flat list instead
		  dim cols() as NSTableColumnMBS = me.View.tableColumns()
		  me.View.outlineTableColumn = cols(0) ' use the first column
		  
		  // If we want to allow column resizing, this option should be set to avoid ugly visual effect while resizing
		  // (i.e. the vertical grid lines do not move nicely, then), or the gridlines should be not used.
		  me.View.autoresizesOutlineColumn = false
		  
		  // Set up our hierarchical data, which is a tree structure
		  mRootItem = new DataNode ("root")
		  for level1 as Integer = 1 to 30
		    dim node as new DataNode (Str(level1))
		    mRootItem.children.Append node
		    ' let's give each node a few children
		    for level2 as Integer = 1 to level1
		      dim node2 as new DataNode (node.text + " - " + Str(level2))
		      node.children.Append node2
		      ' let's give each of these nodes a few children as well
		      for level3 as Integer = 1 to 3 'Rnd*5
		        dim node3 as new DataNode (node.text + " - " + Str(level3))
		        node2.children.Append node3
		      next
		    next
		  next
		  me.Reload ' this forces the listbox to update (by calling Events such as childOfItem etc.)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function numberOfChildrenOfItem(item as NSOutlineViewItemMBS) As Integer
		  #pragma DisableBoundsChecking
		  #pragma DisableBackgroundTasks
		  #pragma StackOverflowChecking false
		  
		  'mCallCount = mCallCount + 1
		  dim node as DataNode
		  if item = nil then
		    node = mRootItem
		  else
		    node = DataNode(item)
		  end if
		  if node <> nil then
		    return node.children.Ubound+1
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Function childOfItem(index as Integer, item as NSOutlineViewItemMBS) As NSOutlineViewItemMBS
		  #pragma DisableBoundsChecking
		  #pragma DisableBackgroundTasks
		  #pragma StackOverflowChecking false
		  
		  'mCallCount = mCallCount + 1
		  dim node as DataNode
		  if item = nil then
		    node = mRootItem
		  else
		    node = DataNode(item)
		  end if
		  return node.children(index)
		End Function
	#tag EndEvent
	#tag Event
		Function isItemExpandable(item as NSOutlineViewItemMBS) As Boolean
		  #pragma DisableBoundsChecking
		  #pragma DisableBackgroundTasks
		  #pragma StackOverflowChecking false
		  
		  mCallCount = mCallCount + 1
		  dim node as DataNode
		  if item = nil then
		    node = mRootItem
		  else
		    node = DataNode(item)
		  end if
		  return node.children.Ubound >= 0
		End Function
	#tag EndEvent
	#tag Event
		Function objectValue(tableColumn as NSTableColumnMBS, item as NSOutlineViewItemMBS) As Variant
		  #pragma DisableBoundsChecking
		  #pragma DisableBackgroundTasks
		  #pragma StackOverflowChecking false
		  
		  'mCallCount = mCallCount + 1
		  dim node as DataNode
		  if item = nil then
		    node = mRootItem
		  else
		    node = DataNode(item)
		  end if
		  return node.text
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  Label1.Text = Str (mCallCount) + " (" + Str(MyTableControl.View.numberOfRows) + " rows)"
		  mCallCount = 0
		End Sub
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
