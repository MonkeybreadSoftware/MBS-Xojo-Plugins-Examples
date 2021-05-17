#tag Window
Begin Window DatabaseBrowserWin
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   False
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   479
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   879562751
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Untitled"
   Visible         =   True
   Width           =   670
   Begin ListBoxTV dbRowsList
      AcceptTabs      =   False
      allowsColumnReordering=   False
      allowsColumnResizing=   False
      allowsColumnSelection=   False
      allowsEmptySelection=   False
      allowsMultipleSelection=   False
      AutoDeactivate  =   True
      AutoHideScrollBars=   True
      autohidesScrollers=   False
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DefaultRowHeight=   0
      Enabled         =   False
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      hasHorizontalScroller=   False
      hasVerticalScroller=   False
      Height          =   400
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      IntercellSpacing=   0
      Left            =   220
      ListCount       =   0
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaintainColumnWidths=   False
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   True
      ScrollbarVertical=   True
      ScrollPosition  =   0
      SelectionType   =   0
      SortedColumn    =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   59
      Transparent     =   True
      UseContextualClickEvent=   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   430
      _suppressReload =   False
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   46
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "This example browses a database table, requesting only the rows that are currently visible.\r\rTo open a database, drop an Sqlite database file into this window."
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   8
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   630
   End
   Begin ListBoxTV dbTablesList
      AcceptTabs      =   False
      allowsColumnReordering=   False
      allowsColumnResizing=   False
      allowsColumnSelection=   False
      allowsEmptySelection=   False
      allowsMultipleSelection=   False
      AutoDeactivate  =   True
      AutoHideScrollBars=   True
      autohidesScrollers=   False
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DefaultRowHeight=   0
      Enabled         =   False
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   2
      GridLinesVertical=   2
      HasHeading      =   True
      hasHorizontalScroller=   False
      hasVerticalScroller=   False
      Height          =   400
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Table"
      IntercellSpacing=   0
      Left            =   20
      ListCount       =   0
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaintainColumnWidths=   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   True
      ScrollbarVertical=   True
      ScrollPosition  =   0
      SelectionType   =   0
      SortedColumn    =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      Top             =   59
      Transparent     =   True
      UseContextualClickEvent=   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   180
      _suppressReload =   False
   End
   Begin Label rowsInfoLbl
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
      Left            =   220
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   459
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   430
   End
   Begin Label tablesInfoLbl
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
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   459
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   180
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  if obj.FolderItemAvailable and obj.FolderItem <> nil then
		    openDatabase obj.FolderItem
		  else
		    beep
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  me.AcceptFileDrop DBFileTypes.All
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub openDatabase(dbFile as FolderItem)
		  dim db as new REALSQLDatabase
		  
		  db.DatabaseFile = dbFile
		  
		  if not db.Connect then
		    MsgBox "Can't open this db file"
		    return
		  end if
		  
		  //
		  // We have a DB - set up the left listbox to display the table names
		  //
		  
		  mDatabase = db
		  
		  dbTablesList.DataSource = new DatabaseTablesProvider (db)
		  
		  dbTablesList.Enabled = true
		  
		  tablesInfoLbl.Text = Str (dbTablesList.ListCount) + " tables"
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mDatabase As Database
	#tag EndProperty


#tag EndWindowCode

#tag Events dbTablesList
	#tag Event
		Sub Change()
		  // A DB Table has been selected - load its rows into the other listbox
		  
		  if me.ListIndex >= 0 then
		    dim tableName as String = me.List (me.ListIndex)
		    
		    // Fetch the column names from the database table and set up the Listbox columns accordingly
		    dim rs as RecordSet = mDatabase.FieldSchema ("["+tableName+"]")
		    if rs = nil or rs.RecordCount = 0 then
		      // Oops - something went wrong
		      MsgBox "Can't load that table"
		    else
		      
		      // Set up the columns in the listbox
		      dbRowsList.ColumnCount = rs.RecordCount
		      dim col as Integer
		      while not rs.EOF
		        dbRowsList.Heading(col) = rs.Field("ColumnName")
		        dbRowsList.Column(col).MinWidthActual = 60
		        rs.MoveNext
		        col = col + 1
		      wend
		      
		      // Set up the Datasource that'll provide the row contents
		      dbRowsList.DataSource = new DatabaseTableRowsProvider (mDatabase, tableName)
		      dbRowsList.Enabled = true
		      
		      rowsInfoLbl.Text = Str (dbRowsList.ListCount) + " rows"
		      
		      return ' we're done
		    end if
		  end if
		  
		  // We should only get here if the rows table setup failed
		  
		  dbRowsList.ColumnCount = 0
		  dbRowsList.DataSource = nil
		  dbRowsList.Enabled = false
		  rowsInfoLbl.Text = ""
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
