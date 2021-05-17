#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  
		  dim db as new SQLDatabaseMBS
		  
		  // where is the library?
		  // you can place the database client library files where you want.
		  // example code just has some convenient location for testing.
		  
		  
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
		  
		  // or with file on disk
		  'db.SetFileOption SQLConnectionMBS.kOptionLibraryFirebird, SpecialFolder.UserHome.Child("libfbclient.dylib")
		  
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
		  
		  dim username as string = "xxx"
		  dim password as string = "xxx"
		  
		  db.DatabaseName = "Firebird:" + ConnectionString
		  db.UserName = username
		  db.Password = password
		  
		  if db.Connect then
		    
		    MsgBox "We are connected!"
		    
		    dim con as SQLConnectionMBS = db.Connection 
		    MsgBox "Server Version: "+con.ServerVersionString
		    
		    // Disconnect is optional
		    // autodisconnect will ocur in destructor if needed
		    
		  else
		    MsgBox db.ErrorMessage
		  end if
		  
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
