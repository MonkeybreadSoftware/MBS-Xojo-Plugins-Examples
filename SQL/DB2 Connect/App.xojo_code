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
		    
		    
		    if TargetWin32 then
		      con.SetFileOption con.kOptionLibraryDB2, SpecialFolder.UserHome.Child("db2cli.dll")
		    elseif TargetLinux then
		      con.SetFileOption con.kOptionLibraryDB2, SpecialFolder.UserHome.Child("db2cli.so")
		    elseif TargetMachO then
		      con.SetFileOption con.kOptionLibraryDB2, SpecialFolder.UserHome.Child("db2cli.dylib")
		    else
		      MsgBox "Platform not supported."
		      quit
		    end if
		    
		    // connect to database
		    // in this example it is DB2,
		    // but can also be Sybase, Informix, MySQL
		    // SQLServer, InterBase, SQLBase and ODBC
		    
		    // e.g.
		    // Driver={IBM DB2 ODBC DRIVER};Database=urDataBase;Hostname=urServerAddress;Port=1234;Protocol=TCPIP;Uid=urUsername;Pwd=urPassword;
		    
		    // Please enter values for your server here:
		    dim ConnectionString as string = "xxx"
		    dim username as string = "xxx"
		    dim password as string = "xxx"
		    
		    con.Connect(ConnectionString, username, password, SQLConnectionMBS.kDB2Client)
		    
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
