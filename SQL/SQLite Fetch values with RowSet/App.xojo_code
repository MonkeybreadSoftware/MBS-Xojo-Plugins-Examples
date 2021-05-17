#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // this example needs Xojo 2019r2 or newer!
		  
		  
		  // use internal sqlite library
		  call InternalSQLiteLibraryMBS.Use
		  
		  
		  
		  // reference SQLDatabaseMBS here, so linker includes the plugin needed for RecordSet
		  dim db as new SQLDatabaseMBS
		  
		  dim con as SQLConnectionMBS
		  dim cmd as SQLCommandMBS
		  
		  try
		    
		    con = new SQLConnectionMBS // connection object
		    
		    
		    // where is the library?
		    'con.Option(con.kOptionLibrarySQLite) = "/usr/lib/libsqlite3.0.dylib"
		    
		    // connect to database
		    
		    dim path as string
		    
		    if TargetMacOS then
		      path = "/tmp/test.db" // put the database in the temporary folder
		    else
		      path = "test.db" // for Windows and Linux in the current folder the application is inside.
		    end if
		    
		    con.Connect(path,"","",SQLConnectionMBS.kSQLiteClient)
		    
		    cmd = new SQLCommandMBS(con, "Select fid, fvarchar20 from test_tbl") // create command object
		    
		    // Select from our test table
		    cmd.Execute
		    
		    // now get as RowSet and process
		    Dim r As RowSet = cmd.AsRowSet
		    
		    While Not r.AfterLastRow
		      Dim fid As Integer = r.Column("fid").IntegerValue
		      Dim fvarchar20 As String = r.Column("fvarchar20").StringValue
		      
		      window1.Listbox1.AddRow str(fid)
		      window1.Listbox1.cell(window1.Listbox1.LastIndex,1) = fvarchar20
		      
		      r.MoveToNextRow
		    wend
		    
		    // commit changes on success
		    con.Commit
		    
		    MsgBox "Rows selected!"
		    
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
