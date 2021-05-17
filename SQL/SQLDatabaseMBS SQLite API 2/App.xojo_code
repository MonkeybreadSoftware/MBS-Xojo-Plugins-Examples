#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // use internal sqlite library
		  call InternalSQLiteLibraryMBS.Use
		  
		  Dim db As New SQLDatabaseMBS
		  
		  // where is the library?
		  'db.Option(SQLConnectionMBS.kOptionLibrarySQLite) = "/usr/lib/libsqlite3.0.dylib"
		  
		  // connect to database
		  // in this example it is SQLite,
		  // but can also be Sybase, Oracle, Informix, DB2, SQLServer, InterBase, MySQL, SQLBase and ODBC
		  
		  dim path as string
		  
		  if TargetMacOS then
		    path = "/tmp/test.db" // put the database in the temporary folder
		  else
		    path = "test.db" // for Windows and Linux in the current folder the application is inside.
		  end if
		  
		  db.DatabaseName = "sqlite:"+path
		  db.RaiseExceptions = True // for older API functions to also raise exceptions
		  
		  db.Connect
		  
		  'MsgBox "We are connected!"
		  
		  
		  // create table
		  db.ExecuteSQL "CREATE TABLE IF NOT EXISTS test_tbl (fid integer, fvarchar20 varchar(20), fblob blob)"
		  
		  // insert value in SQL
		  db.BeginTransaction
		  db.ExecuteSQL "INSERT INTO test_tbl(fid, fvarchar20) VALUES (1, 'Some string')"
		  db.CommitTransaction
		  
		  // insert with prepared statement in SQL
		  db.ExecuteSQL("INSERT INTO test_tbl(fid, fvarchar20) VALUES (?,?)", 2, "Hello World")
		  
		  // insert with prepared statement
		  Dim p As SQLPreparedStatementMBS = db.Prepare("INSERT INTO test_tbl(fid, fvarchar20) VALUES (?,?)")
		  p.BindType(0, p.kTypeInt64)
		  p.BindType(1, p.kTypeString)
		  p.Bind(0, 3)
		  p.Bind(1, "Hallo Leute")
		  
		  p.ExecuteSQL
		  
		  // insert via database row
		  Dim d As New DatabaseRow
		  d.Column("fid").IntegerValue = 3
		  d.Column("fvarchar20").StringValue = "Testing"
		  
		  db.AddRow("test_tbl", d)
		  
		  Dim list As listbox = MainWindow.List
		  // query normally
		  Dim r1 As RowSet = db.SelectSQL("SELECT * FROM test_tbl")
		  While Not r1.AfterLastRow
		    
		    list.AddRow r1.Column("fid").StringValue, r1.Column("fvarchar20").StringValue
		    
		    r1.MoveToNextRow
		  Wend
		  
		  // query with parameter
		  Dim r2 As RowSet = db.SelectSQL("SELECT * FROM test_tbl WHERE fid > ?", -1)
		  While Not r2.AfterLastRow
		    
		    list.AddRow r2.Column("fid").StringValue, r2.Column("fvarchar20").StringValue
		    
		    r2.MoveToNextRow
		  Wend
		  
		  
		  
		  Exception se As SQLErrorExceptionMBS
		    MessageDialog.Show "SQL Error Exception: "+se.Message
		    
		  Exception de As DatabaseException
		    MessageDialog.Show "Database Exception: "+de.Message
		    
		    
		End Sub
	#tag EndEvent


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&L\xC3\xB6schen", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&L\xC3\xB6schen"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&L\xC3\xB6schen"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"Beenden", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Beenden"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
