#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  
		  dim db as new SQLDatabaseMBS
		  
		  db.Option("UseAPI") = "OLEDB"
		  DB.Option("SQLNCLI.LIBS") = "sqlsrv32.dll" // Library included in Windows Vista and newer
		  
		  // connect to database
		  // in this example it is Mirosoft SQL Server,
		  // but can also be Sybase, Informix, DB2
		  // Oracle, InterBase, SQLBase and ODBC
		  
		  // server format should be:
		  // PcName\SqlServerInstanceName@DatabaseName
		  
		  db.DatabaseName="SQLServer:WINDOWS7PC\SQLEXPRESS@test"
		  db.UserName=""
		  db.Password=""
		  db.RaiseExceptions = true
		  
		  if db.Connect then
		    // We are connected!
		    db.AutoCommit = db.kAutoCommitOff
		    db.Scrollable = false
		    
		    // show version of server
		    'dim con as SQLConnectionMBS = db.Connection
		    'MsgBox "Server Version: "+con.ServerVersionString
		    
		    // do a query
		    'dim r as RecordSet = db.SQLSelect("select * from TestTable")
		    'while not r.EOF
		    'MsgBox r.IdxField(1).StringValue
		    'r.MoveNext
		    'wend 
		    
		    // update a value
		    
		    'db.SQLExecute "UPDATE TestTable SET vorname='test' WHERE id=4"
		    
		    // insert something and query id of auto_increment 
		    
		    db.SQLExecute "INSERT INTO TestTable (vorname, nachname) VALUES ('Hello', 'World')"
		    dim r as RecordSet = db.SQLSelect("SELECT @@IDENTITY")
		    MsgBox r.IdxField(1).StringValue
		    
		    
		    // Disconnect is optional
		    // autodisconnect will ocur in destructor if needed
		    
		    MsgBox "OK"
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
