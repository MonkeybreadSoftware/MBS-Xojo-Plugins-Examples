#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  dim db as new SQLDatabaseMBS
		  
		  try
		    
		    // where is the library?
		    
		    if TargetWin32 then
		      db.Option(db.kOptionLibraryFirebird) = "gds32.dll;fbclient.dll"
		    elseif TargetLinux then
		      db.Option(db.kOptionLibraryFirebird) = "libgds.so:libfbclient.so"
		    elseif TargetMachO then
		      db.Option(db.kOptionLibraryFirebird) = "libgds.dylib:libfbclient.dylib"
		    else
		      MsgBox "Platform not supported."
		      quit
		    end if
		    
		    // connect to database
		    // in this example it is Firebird/InterBase,
		    // but can also be Sybase, Informix, DB2, MySQL
		    // SQLServer, SQLBase and ODBC
		    
		    // Read more here: http://www.sqlapi.com/ServerSpecific/InterBase.html
		    
		    // Please enter values for your server here:
		    dim ConnectionString as string = "xxx"
		    
		    // For local databases, this can be a file name.
		    // To connect to a database on a remote server using TCP/IP the syntax is <server name>:<filename>.
		    // To connect to a database on a remote server using NetBEUI, the syntax is \\<server name>\<filename>.
		    // To connect to a database on a remote server using SPX, the syntax is <server name>@<filename>.
		    
		    db.DatabaseName = "firebird:"+ConnectionString
		    db.UserName = "xxx"
		    db.Password = "xxx"
		    
		    if db.Connect then
		      
		      MsgBox "We are connected!"
		      
		      // Disconnect is optional
		      // autodisconnect will occur in destructor if needed
		    else
		      MsgBox "Failed to connect: "+db.ErrorMessage
		    end if
		    
		  catch r as RuntimeException
		    MsgBox r.message
		    
		    // SAConnection::Rollback()
		    // can also throw an exception
		    // (if a network error for example),
		    // we will be ready
		    try
		      
		      // on error rollback changes
		      db.Rollback
		      
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
