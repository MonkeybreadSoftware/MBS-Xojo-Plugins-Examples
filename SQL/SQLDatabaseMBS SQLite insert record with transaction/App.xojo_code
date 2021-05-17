#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // use internal sqlite library
		  call InternalSQLiteLibraryMBS.Use
		  
		  
		  dim db as new SQLDatabaseMBS
		  
		  // where is the library?
		  'db.Option(SQLConnectionMBS.kOptionLibrarySQLite) = "/usr/lib/libsqlite3.0.dylib"
		  
		  // connect to database
		  // in this example it is SQLite,
		  // but can also be Sybase, Oracle, Informix, DB2, SQLServer, InterBase, MySQL, SQLBase and ODBC
		  
		  dim path as string
		  
		  If TargetMacOS Then
		    path = "/tmp/test.db" // put the database in the temporary folder
		  else
		    path = "test.db" // for Windows and Linux in the current folder the application is inside.
		  end if
		  
		  db.DatabaseName = "sqlite:"+path
		  
		  If db.Connect Then 
		    db.RaiseExceptions = True
		    
		    
		    // turn of the auto commit
		    db.AutoCommit = db.kAutoCommitOff
		    
		    // insert value with SQL
		    db.SQLExecute "Insert into test_tbl(fid, fvarchar20) values (1, 'Some string (1)')"
		    db.Commit
		    
		    db.SQLExecute "Insert into test_tbl(fid, fvarchar20) values (2, 'Some string (2)')"
		    db.SQLExecute "Insert into test_tbl(fid, fvarchar20) values (3, 'Some string (3)')"
		    db.Commit
		    
		    db.SQLExecute "Insert into test_tbl(fid, fvarchar20) values (4, 'Some string (4)')"
		    db.SQLExecute "Insert into test_tbl(fid, fvarchar20) values (5, 'Some string (5)')"
		    db.Rollback
		    
		    db.SQLExecute "Insert into test_tbl(fid, fvarchar20) values (6, 'Some string (6)')"
		    db.SQLExecute "Insert into test_tbl(fid, fvarchar20) values (7, 'Some string (7)')"
		    db.Commit
		    
		    // now look in database and 4/5 are not there!
		    
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
