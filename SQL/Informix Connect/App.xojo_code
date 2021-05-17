#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  dim con as new SQLConnectionMBS
		  
		  try
		    
		    // where is the library?
		    
		    // For Windows the file is "ICLIT09B.dll", for Linux libifcli.so and for Mac OS X libifcli.dylib.
		    con.Option(con.kOptionLibraryInformix) = "ICLIT09B.DLL"
		    
		    // connect to database
		    // in this example it is Informix,
		    // but can also be SQLite, Sybase, Oracle, DB2, MySQL, SQLServer, InterBase, SQLBase and ODBC
		    
		    dim server as string = ""
		    // the connection string
		    
		    dim userID as string = "" 
		    // A string containing a user name to use when establishing the connection.
		    
		    dim password as string = "" 
		    // A string containing a password to use when establishing the connection.
		    
		    
		    con.Connect(server, userID, password, SQLConnectionMBS.kInformixClient)
		    
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
