#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  dim con as new SQLConnectionMBS
		  
		  try
		    
		    // where is the library?
		    
		    // optionally pass paths to databases...
		    #if false // targetWindows then 
		      con.SetFileOption(con.kOptionLibrarySybaseComn, GetFolderItem("libsybcomn.dll"))
		      con.SetFileOption(con.kOptionLibrarySybaseCS,   GetFolderItem("libsybcs.dll"))
		      con.SetFileOption(con.kOptionLibrarySybaseCT,   GetFolderItem("libsybct.dll"))
		      con.SetFileOption(con.kOptionLibrarySybaseIntl, GetFolderItem("libsybintl.dll"))
		      con.SetFileOption(con.kOptionLibrarySybaseTCL,  GetFolderItem("libsybtcl.dll"))
		      
		    #endif
		    
		    // connect to database
		    // in this example it is Sybase,
		    // but can also be Firebird/InterBase, Informix, DB2, MySQL
		    // SQLServer, SQLBase and ODBC
		    
		    // Read more here: http://www.sqlapi.com/ServerSpecific/Sybase.html
		    
		    // Please enter values for your server here:
		    dim ConnectionString as string = "server@database"
		    
		    // One of the following formats:
		    
		    // "" or "@" - empty string or '@' character, connects to a default database on a default server.
		    // <database name> or @ <database name>- connects to a database with the specified name on your default server.
		    // <server name>@- connects to a default database on the specified server.
		    // <server name>@<database name> - connects to a database with the specified name on the specified server.
		    
		    dim username as string = "xxx"
		    dim password as string = "xxx"
		    
		    con.Connect(ConnectionString, username, password, SQLConnectionMBS.kSybaseClient)
		    
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
