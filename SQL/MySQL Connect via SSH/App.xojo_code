#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  dim con as new SQLConnectionMBS
		  
		  try
		    
		    sh = new MyShell
		    sh.Mode = 2
		    sh.password = "xxxxx"
		    sh.Execute "ssh ssh@macsw.de -L 3306:127.0.0.1:3306 -N"
		    
		    while not sh.PasswordSent 
		      app.YieldToNextThread
		      sh.Poll
		    wend
		    
		    MsgBox "password sent"
		    
		    // where is the library?
		    // you can place the database client library files where you want.
		    // example code just has some convenient location for testing.
		    
		    con.SetFileOption con.kOptionLibraryMySQL, SpecialFolder.UserHome.Child("libmysqlclient.dylib")
		    
		    // connect to database
		    // in this example it is MySQL,
		    // but can also be Sybase, Informix, DB2
		    // SQLServer, InterBase, SQLBase and ODBC
		    
		    dim server as string = "127.0.0.1,3306@test"
		    
		    con.Connect(server,"root","",SQLConnectionMBS.kMySQLClient)
		    
		    MsgBox "We are connected!"
		    
		    dim sql as string = "SELECT variable_value INTO @local_hostname FROM information_schema.global_variables WHERE variable_name = 'hostname';"
		    dim cmd as new SQLCommandMBS(con, sql)
		    
		    cmd.Execute
		    
		    if cmd.isResultSet and cmd.FetchNext then
		      MsgBox cmd.Field(1).asStringValue
		    end if
		    
		    
		    // Disconnect is optional
		    // autodisconnect will occur in destructor if needed
		    con.Disconnect
		    
		    msgbox "We are disconnected!"
		    
		  catch r as RuntimeException
		    MsgBox r.message
		    
		    // SAConnection::Rollback()
		    // can also throw an exception
		    // (if a network error for example),
		    // we will be ready
		    try
		      
		      // on error rollback changes
		      con.Rollback
		      
		    catch rr as runtimeexception
		      MsgBox rr.message
		    end try
		  end try
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		sh As MyShell
	#tag EndProperty


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
