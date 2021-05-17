#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim con as SQLConnectionMBS
		  dim cmd as SQLCommandMBS
		  
		  try
		    
		    con = new SQLConnectionMBS // connection object
		    
		    
		    // where is the library?
		    
		    // you can place the database client library files where you want.
		    // example code just has some convenient location for testing.
		    
		    
		    con.SetFileOption con.kOptionLibraryMySQL, SpecialFolder.UserHome.Child("libmysqlclient.dylib")
		    
		    
		    cmd = new SQLCommandMBS // create command object
		    
		    // connect to database (mySQL in our example)
		    // server: 192.168.1.80
		    // port: 3306
		    // database: test
		    // name: root
		    // no password
		    con.Connect("192.168.1.80,3306@test","root","",SQLConnectionMBS.kMySQLClient)
		    // associate a command with connection
		    // connection can also be specified in SACommand constructor
		    cmd.Connection=con
		    
		    
		    // Insert 2 rows
		    cmd.setCommandText("Insert into test_tbl(fid, fvarchar20) values(:1, :2)")
		    
		    // use first method of binding - param assignment
		    cmd.Param(1).setAsLong(2)
		    cmd.Param(2).setAsString(new SQLStringMBS("Some string (2)"))
		    // Insert first row
		    cmd.Execute
		    
		    // another record
		    cmd.Param(1).setAsLong(3)
		    cmd.Param(2).setAsString("Some string (3)")
		    // Insert second row
		    cmd.Execute
		    
		    // commit changes on success
		    con.Commit
		    
		    MsgBox "Input parameters bound, rows inserted!"
		    
		    
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
