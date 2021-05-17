#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  dim con as new SQLConnectionMBS
		  
		  try
		    
		    // where is the library?
		    con.SetFileOption con.kOptionLibraryMySQL, SpecialFolder.Desktop.Child("libmysqlclient.18.dylib")
		    
		    // connect to database
		    // in this example it is MySQL,
		    // but can also be Sybase, Informix, DB2
		    // SQLServer, InterBase, SQLBase and ODBC
		    
		    dim server as string = "192.168.4.17,4135@tools"
		    
		    con.Connect(server,"root","",SQLConnectionMBS.kMySQLClient)
		    
		    MsgBox "We are connected!"
		    
		    dim cmd as new SQLCommandMBS(con, "SELECT VERSION()") // create command object
		    
		    // Select from our test table
		    cmd.Execute
		    
		    // fetch results row by row and print results
		    if cmd.FetchNext then
		      
		      dim m as string = cmd.Field(1).asStringValue
		      MsgBox "Version: "+m
		    end if
		    
		    // Disconnect is optional
		    // autodisconnect will occur in destructor if needed
		    con.Disconnect
		    
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
