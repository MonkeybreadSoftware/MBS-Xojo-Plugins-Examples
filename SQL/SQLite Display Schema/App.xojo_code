#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // use internal sqlite library
		  call InternalSQLiteLibraryMBS.Use
		  
		  
		  
		  dim con as SQLConnectionMBS
		  dim cmd as SQLCommandMBS
		  
		  try
		    
		    con = new SQLConnectionMBS // connection object
		    cmd = new SQLCommandMBS // create command object
		    
		    
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
		    // associate a command with connection
		    // connection can also be specified in SACommand constructor
		    cmd.Connection=con
		    
		    // create table
		    cmd.setCommandText("Create table if not exists test_tbl(fid integer, fvarchar20 varchar(20), fblob blob)")
		    cmd.Execute
		    
		    // create table
		    cmd.setCommandText("Create table if not exists person(age integer, name varchar(30), nickname varchar(20))")
		    cmd.Execute
		    
		    // create table
		    cmd.setCommandText("Create table if not exists zipcodes(name varchar(20), zip varchar(9))")
		    cmd.Execute
		    
		    cmd.setCommandText("select * from sqlite_master")
		    cmd.Execute
		    
		    dim lines(-1) as string
		    if cmd.isResultSet then
		      while cmd.FetchNext
		        dim n as integer = cmd.FieldCount
		        dim fields(-1) as string
		        for i as integer = 1 to n
		          fields.Append cmd.Field(i).asStringValue
		          
		        next
		        lines.Append Join(fields,chr(9))
		      wend
		    end if
		    
		    MsgBox Join(lines,EndOfLine)
		    
		    // commit changes on success
		    con.Commit
		    
		    MsgBox("Table created, row inserted!")
		    
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
