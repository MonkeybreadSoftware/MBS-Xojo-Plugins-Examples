#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // use internal sqlite library
		  call InternalSQLiteLibraryMBS.Use
		  
		  
		  dim con as SQLConnectionMBS
		  dim cmd as SQLCommandMBS
		  
		  dim conBackup as SQLConnectionMBS
		  
		  try
		    
		    con = new SQLConnectionMBS // connection object
		    cmd = new SQLCommandMBS // create command object
		    
		    conBackup = new SQLConnectionMBS // connection object
		    
		    
		    // where is the library?
		    'con.Option(con.kOptionLibrarySQLite) = "/usr/lib/libsqlite3.0.dylib"
		    'conBackup.Option(con.kOptionLibrarySQLite) = "/usr/lib/libsqlite3.0.dylib"
		    
		    // connect to database
		    dim path as string
		    
		    if TargetMacOS then
		      path = "/tmp/test2.db" // put the database in the temporary folder
		    else
		      path = "test2.db" // for Windows and Linux in the current folder the application is inside.
		    end if
		    
		    con.Connect(path,"","",SQLConnectionMBS.kSQLiteClient)
		    // associate a command with connection
		    // connection can also be specified in SACommand constructor
		    cmd.Connection=con
		    
		    // create table
		    cmd.setCommandText("Create table test_tbl(fid integer, fvarchar20 varchar(20), fblob blob)")
		    cmd.Execute
		    
		    // insert value
		    cmd.setCommandText("Insert into test_tbl(fid, fvarchar20) values (1, 'Some string (1)')")
		    cmd.Execute
		    
		    // commit changes on success
		    con.Commit
		    
		    MsgBox("Table created, row inserted!")
		    
		    // now do backup
		    
		    if TargetMacOS then
		      path = "/tmp/testbackup.db" // put the database in the temporary folder
		    else
		      path = "testbackup.db" // for Windows and Linux in the current folder the application is inside.
		    end if
		    
		    // connect to new database
		    conBackup.Connect(path,"","",SQLConnectionMBS.kSQLiteClient)
		    
		    // run backup
		    
		    Dim b As SQLite3BackupMBS = con.SQLiteBackupInit(conBackup, "main", con, "main")
		    
		    if b<>nil then
		      While con.SQLiteBackupStep(b, 100) = 0 // kErrorOk
		        // show progress
		      wend
		      
		      If con.SQLiteBackupFinish(B) = 0 Then
		        MsgBox "backup okay"
		      end if
		    else
		      MsgBox "Failed to start backup."
		    end if
		    
		  catch r as SQLErrorExceptionMBS
		    // SAConnection::Rollback()
		    // can also throw an exception
		    // (if a network error for example),
		    // we will be ready
		    try
		      
		      // on error rollback changes
		      if con<>nil then
		        con.rollback
		      end if
		    catch x as SQLErrorExceptionMBS
		      // ignore
		    end try
		    
		    // show error message
		    MsgBox r.message
		    
		  end try
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
