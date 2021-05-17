#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // use internal CubeSQL library
		  call InternalCubeSQLLibraryMBS.Use
		  
		  
		  
		  dim db as new SQLDatabaseMBS
		  
		  db.Option("APPNAME") = "Xojo Test"
		  db.Option("ConnectionTimeout") = "5" // 5 seconds timeout?
		  'db.Option("ConnectionEncryption") = "AES128" // or "AES192" or "AES256"
		  
		  // connect to database
		  // in this example it is CubeSQL,
		  // but can also be Sybase, Oracle, Informix, DB2, SQLServer, InterBase, MySQL, SQLBase and ODBC
		  
		  db.DatabaseName = "cubesql:localhost@mydatabase.sqlite"
		  db.UserName = "admin"
		  db.Password = "admin"
		  
		  db.RaiseExceptions = true // prefer exceptions over checking error
		  
		  if db.Connect then 
		    
		    // CREATE TABLE "test" ("test" TEXT, first TEXT, last TEXT)
		    
		    // insert some data
		    dim p1 as SQLPreparedStatementMBS = db.Prepare("INSERT INTO test (test, first, last) VALUES (:test, :first, :last)")
		    
		    p1.Bind("test", "Test")
		    p1.BindType("test", p1.kTypeString)
		    p1.Bind("first", "")
		    p1.BindType("first", p1.kTypeString)
		    p1.Bind("last", "Last")
		    p1.BindType("last", p1.kTypeString)
		    p1.SQLExecute
		    
		    // edit some data
		    dim p2 as SQLPreparedStatementMBS = db.Prepare("UPDATE test SET first=:first WHERE RowID = 1")
		    
		    'p2.Bind("first", "")
		    p2.Bind("first", "Christian")
		    'p2.BindType("first", p.kTypeString)
		    p2.SQLExecuteMT
		    
		    
		    
		    db.Commit
		    
		    // Show data
		    dim r as RecordSet = db.SQLSelect("SELECT ROWID,test,first,last FROM test")
		    
		    while not r.EOF
		      
		      window1.List.AddRow r.IdxField(1).StringValue, r.IdxField(2).StringValue, r.IdxField(3).StringValue, r.IdxField(4).StringValue
		      
		      r.MoveNext
		    wend
		    
		    // show version
		    'dim r as RecordSet = db.SQLSelect("select sqlite_version()")
		    '
		    'if r = nil or r.eof then
		    'MsgBox "Failed to query version."
		    'else
		    'MsgBox "Version: "+r.IdxField(1).StringValue
		    'end if
		    
		  else
		    MsgBox db.ErrorMessage
		  end if
		  
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
