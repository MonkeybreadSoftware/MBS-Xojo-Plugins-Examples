#tag MobileScreen
Begin MobileScreen Screen1
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   HasNavigationBar=   True
   LargeTitleDisplayMode=   2
   Left            =   0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   "&h00000000"
   Title           =   "CubeSQL prepared statement"
   Top             =   0
   Begin iOSMobileTable List
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowRefresh    =   False
      AllowSearch     =   False
      AutoLayout      =   List, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   List, 2, <Parent>, 2, False, +1.00, 4, 1, -0, , True
      AutoLayout      =   List, 3, TopLayoutGuide, 3, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   List, 4, BottomLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      ControlCount    =   0
      EditingEnabled  =   False
      EditingEnabled  =   False
      Enabled         =   True
      EstimatedRowHeight=   -1
      Format          =   0
      Height          =   503
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      SectionCount    =   0
      TintColor       =   ""
      Top             =   65
      Visible         =   True
      Width           =   320
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub Opening()
		  // use internal CubeSQL library
		  Call InternalCubeSQLLibraryMBS.Use
		  
		  
		  
		  Dim db As New SQLDatabaseMBS
		  
		  db.Option("APPNAME") = "Xojo Test"
		  db.Option("ConnectionTimeout") = "5" // 5 seconds timeout?
		  'db.Option("ConnectionEncryption") = "AES128" // or "AES192" or "AES256"
		  
		  // connect to database
		  // in this example it is CubeSQL,
		  // but can also be Sybase, Oracle, Informix, DB2, SQLServer, InterBase, MySQL, SQLBase and ODBC
		  
		  db.DatabaseName = "cubesql:localhost@mydatabase.sqlite"
		  db.UserName = "admin"
		  db.Password = "admin"
		  
		  db.RaiseExceptions = True // prefer exceptions over checking error
		  
		  If db.Connect Then 
		    
		    // CREATE TABLE "test" ("test" TEXT, first TEXT, last TEXT)
		    
		    // insert some data
		    Dim p1 As SQLPreparedStatementMBS = db.Prepare("INSERT INTO test (test, first, last) VALUES (:test, :first, :last)")
		    
		    p1.Bind("test", "Test")
		    p1.BindType("test", p1.kTypeString)
		    p1.Bind("first", "")
		    p1.BindType("first", p1.kTypeString)
		    p1.Bind("last", "Last")
		    p1.BindType("last", p1.kTypeString)
		    p1.SQLExecute
		    
		    // edit some data
		    Dim p2 As SQLPreparedStatementMBS = db.Prepare("UPDATE test SET first=:first WHERE RowID = 1")
		    
		    'p2.Bind("first", "")
		    p2.Bind("first", "Christian")
		    'p2.BindType("first", p.kTypeString)
		    p2.SQLExecuteMT
		    
		    
		    
		    db.CommitTransaction
		    
		    // Show data
		    Dim r As RowSet = db.SelectSQL("SELECT ROWID,test,first,last FROM test")
		    
		    While Not r.AfterLastRow
		      
		      List.AddRow r.ColumnAt(0).StringValue+" "+r.ColumnAt(1).StringValue+" "+r.ColumnAt(2).StringValue+" "+r.ColumnAt(3).StringValue
		      
		      r.MoveToNextRow
		    Wend
		    
		    // show version
		    'dim r as RecordSet = db.SQLSelect("select sqlite_version()")
		    '
		    'if r = nil or r.eof then
		    'MessageBox "Failed to query version."
		    'else
		    'MessageBox "Version: "+r.IdxField(1).StringValue
		    'end if
		    
		  End If
		  
		  Exception d As DatabaseException
		    MessageBox d.reason
		    
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag ViewBehavior
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
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
	#tag ViewProperty
		Name="BackButtonCaption"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasNavigationBar"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIcon"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LargeTitleDisplayMode"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="MobileScreen.LargeTitleDisplayModes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabBarVisible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TintColor"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="ColorGroup"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
