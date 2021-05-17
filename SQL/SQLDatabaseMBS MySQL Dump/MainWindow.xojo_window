#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1246892004
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "MySQL Dump"
   Visible         =   True
   Width           =   600
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   125
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "This app connects to MySQL database and queries all databases with all tables and writes them to text files. Please add your login credentials in code."
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   455
   End
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   3
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   332
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Database	Table	Records"
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   48
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Thread Thread1
      DebugIdentifier =   ""
      Index           =   -2147483648
      LockedInPosition=   False
      Priority        =   5
      Scope           =   "0"
      StackSize       =   0
      TabPanelIndex   =   "0"
      ThreadID        =   0
      ThreadState     =   ""
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   1000
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
   Begin BevelButton StartButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "Start"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   "0"
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   93
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  folder = SpecialFolder.Desktop.Child("Dump")
		  folder.CreateAsFolder
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub FetchDatabase(DatabaseName as string)
		  db.SQLExecute "use "+DatabaseName
		  
		  dim TablesRecordSet as RecordSet = db.SQLSelect("show tables") // create command object
		  
		  while not TablesRecordSet.EOF
		    // fetch results row by row and print results
		    
		    dim TableName as string = TablesRecordSet.IdxField(1).StringValue
		    
		    FetchTable DatabaseName, TableName
		    
		    TablesRecordSet.MoveNext
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FetchDatabases()
		  dim DatabasesRecordSet as RecordSet = db.SQLSelect("show databases") // create command object
		  
		  while not DatabasesRecordSet.EOF
		    // fetch results row by row and print results
		    
		    dim DatabaseName as string = DatabasesRecordSet.Field("Database").StringValue
		    
		    FetchDatabase DatabaseName
		    
		    DatabasesRecordSet.MoveNext
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FetchTable(DatabaseName as string, TableName as string)
		  dim file as FolderItem = folder.Child(DatabaseName+" "+TableName)
		  dim out as TextOutputStream = TextOutputStream.Create(file)
		  dim tab as string = encodings.UTF8.Chr(9)
		  
		  dim r as RecordSet = db.SQLSelectMT("select * from "+TableName) // create command object
		  
		  dim names() as string
		  dim isBlob(0) as Boolean
		  dim c as integer = r.FieldCount
		  for i as integer = 1 to c
		    dim f as DatabaseField = r.IdxField(i)
		    
		    names.Append f.Name
		    
		  next
		  
		  out.WriteLineUTF8 Join(names, tab)
		  
		  dim n as integer = 0
		  
		  while not r.EOF
		    // fetch results row by row and print results
		    
		    dim parts() as string
		    for i as integer = 1 to c
		      dim f as DatabaseField = r.IdxField(i)
		      dim s as string = f.StringValue
		      
		      if s.Encoding = nil then
		        parts.Append "Blob "+str(lenb(s))+" bytes."
		      else
		        parts.Append s
		      end if
		    next
		    
		    out.WriteLineUTF8 Join(parts, tab)
		    n = n + 1
		    
		    r.MoveNext
		  wend
		  
		  ForListbox.Append DatabaseName
		  ForListbox.Append TableName
		  ForListbox.Append str(n)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Run()
		  db = new SQLDatabaseMBS
		  
		  // where is the library?
		  // you can place the database client library files where you want.
		  // example code just has some convenient location for testing.
		  
		  #if TargetMachO then
		    db.SetFileOption SQLConnectionMBS.kOptionLibraryMySQL, SpecialFolder.UserHome.Child("libmysqlclient.18.dylib")
		  #elseif TargetWin32 then
		    db.SetFileOption SQLConnectionMBS.kOptionLibraryMySQL, SpecialFolder.UserHome.Child("libmysql.dll")
		  #else
		    Break // todo?
		  #endif
		  
		  // connect to database
		  // in this example it is MySQL,
		  // but can also be Sybase, Informix, DB2, SQLServer, InterBase, Oracle, SQLite, SQLBase and ODBC
		  
		  db.DatabaseName="mysql:12.34.56.78@test"
		  db.UserName="xxx"
		  db.Password="xxx"
		  db.RaiseExceptions = true // lets get exceptions to show errors
		  
		  if db.Connect then
		    db.Scrollable = true
		    
		    FetchDatabases
		    
		  end if
		  
		  Exception r as SQLErrorExceptionMBS
		    GotException = r
		    
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		db As SQLDatabaseMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		folder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		ForListbox() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		GotException As SQLErrorExceptionMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events Thread1
	#tag Event
		Sub Run()
		  self.run
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  while UBound(ForListbox)>=2
		    
		    List.AddRow ForListbox(0), ForListbox(1), ForListbox(2)
		    
		    ForListbox.Remove 0
		    ForListbox.Remove 0
		    ForListbox.Remove 0
		    List.ScrollPosition = List.ListCount
		  wend
		  
		  
		  if GotException<>Nil then
		    dim e as SQLErrorExceptionMBS = GotException
		    GotException = nil
		    
		    MsgBox e.Message
		  end if
		  
		  
		  if Thread1.State = Thread.NotRunning then
		    // done
		    Title = "MySQL Dump: "+str(List.ListCount)+" tables."
		    me.Mode = 0
		    StartButton.Enabled = true
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StartButton
	#tag Event
		Sub Action()
		  List.DeleteAllRows
		  Title = "MySQL Dump..."
		  me.Enabled = false
		  Thread1.run
		  timer1.Mode = 2
		  
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
