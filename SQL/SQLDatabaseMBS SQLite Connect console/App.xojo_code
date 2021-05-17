#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  // use internal sqlite library
		  call InternalSQLiteLibraryMBS.Use
		  
		  
		  dim db as new SQLDatabaseMBS
		  
		  // where is the library?
		  'db.Option(SQLConnectionMBS.kOptionLibrarySQLite) = "/usr/lib/libsqlite3.0.dylib"
		  
		  // connect to database
		  // in this example it is SQLite,
		  // but can also be Sybase, Oracle, Informix, DB2, SQLServer, InterBase, MySQL, SQLBase and ODBC
		  
		  dim path as string
		  
		  if TargetMacOS then
		    path = "/tmp/test.db" // put the database in the temporary folder
		  else
		    path = "test.db" // for Windows and Linux in the current folder the application is inside.
		  end if
		  
		  db.DatabaseName = "sqlite:"+path
		  
		  if db.Connect then
		    
		    print "We are connected!"
		    
		    // Disconnect is optional
		    // autodisconnect will ocur in destructor if needed
		    db.close
		    
		    print "We are disconnected!"
		  end if
		  
		  Exception
		    
		    print db.ErrorMessage
		    
		    
		End Function
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
