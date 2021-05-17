#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // use internal sqlite library
		  call InternalSQLiteLibraryMBS.Use
		  
		  
		  dim db as new SQLDatabaseMBS
		  
		  // where is the library?
		  Dim f As FolderItem = SpecialFolder.Desktop.Child("libduckdb.dylib")
		  db.SetFileOption(SQLConnectionMBS.kOptionLibraryDuckDB, f)
		  
		  // connect to database
		  // in this example it is SQLite,
		  // but can also be Sybase, Oracle, Informix, DB2, SQLServer, InterBase, MySQL, SQLBase and ODBC
		  
		  dim path as string
		  
		  if TargetMacOS then
		    path = "/tmp/test.ddb" // put the database in the temporary folder
		  else
		    path = "test.ddb" // for Windows and Linux in the current folder the application is inside.
		  end if
		  
		  db.DatabaseName = "DuckDB:"+path
		  
		  if db.Connect then 
		    
		    MsgBox "We are connected!"
		    
		    
		    // create table
		    db.SQLExecute "Create table Test(fid integer, fvarchar20 varchar(20), fblob blob)"
		    
		    // insert value
		    db.SQLExecute "Insert into Test(fid, fvarchar20) values (1, 'Hello World')"
		    
		    MsgBox("Table created, row inserted!")
		    
		    
		    Dim r As RecordSet = db.SQLSelect("SELECT fid, fvarchar20 FROM Test")
		    
		    Dim n As Integer = r.IdxField(1).IntegerValue
		    Dim s As String = r.IdxField(2).StringValue
		    
		    If n = 1 And s = "Hello World" then
		      MsgBox "Got values: okay"
		    Else
		      MsgBox "Got values: failed"
		    End If
		    
		  Else
		    MsgBox db.ErrorMessage
		  End If
		  
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
