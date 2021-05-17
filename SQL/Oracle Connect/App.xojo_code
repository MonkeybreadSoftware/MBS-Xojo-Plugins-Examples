#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  dim con as new SQLConnectionMBS
		  
		  try
		    
		    // where is the library?
		    
		    // you can place the database client library files where you want.
		    // example code just has some convenient location for testing.
		    
		    
		    // For Windows the file is "oci.dll", for Linux libclntsh.so and for Mac OS X libclntsh.dylib.
		    con.SetFileOption con.kOptionLibraryOracle, SpecialFolder.UserHome.Child("libclntsh.dylib.10.1")
		    
		    // connect to database
		    // in this example it is Oracle,
		    // but can also be Sybase, Informix, DB2, MySQL
		    // SQLServer, InterBase, SQLBase and ODBC
		    
		    dim server as string = ""
		    // The database name as it is specified in TNSNAMES.ORA file. 
		    // An additional information about Oracle connection string available with Oracle Instant Client FAQ (<hostname>[:<port>][/<service_name>] ).
		    
		    dim userID as string = "" 
		    // A string containing a user name to use when establishing the connection. If sUserID parameter is empty, we request Oracle external authentication.
		    
		    dim password as string = "" 
		    // A string containing a password to use when establishing the connection.
		    
		    
		    // The plugin requires OCI version 7.3 or higher. 
		    // The plugin tries to connect to Oracle using new OCI8 (Oracle 8 and higher) first.
		    // If it fails it tries to connect using OCI7. 
		    // If you want to use directly OCI7 or OCI8 API you should set "UseAPI" connection
		    // option before specifying Oracle client or connecting to database.
		    
		    con.Connect(server, userID, password, SQLConnectionMBS.kOracleClient)
		    
		    MsgBox "We are connected!"
		    
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
