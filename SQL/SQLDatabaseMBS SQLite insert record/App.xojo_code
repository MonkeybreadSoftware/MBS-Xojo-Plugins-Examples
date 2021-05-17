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
		  
		  if TargetMacOS then
		    path = "/tmp/test.db" // put the database in the temporary folder
		  else
		    path = "test.db" // for Windows and Linux in the current folder the application is inside.
		  end if
		  
		  db.DatabaseName = "sqlite:"+path
		  
		  if db.Connect then 
		    
		    // insert value with SQL
		    'db.SQLExecute "Insert into test_tbl(fid, fvarchar20) values (1, 'Some string (1)')"
		    
		    dim d as new DatabaseRecord
		    
		    d.IntegerColumn("fid")=2
		    d.Column("fvarchar20")="test insert"
		    d.BlobColumn("fblob")="Just a test"
		    
		    db.InsertRecord("test_tbl", d)
		    
		    if db.Error then
		      MsgBox db.ErrorMessage
		    end if
		    
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
