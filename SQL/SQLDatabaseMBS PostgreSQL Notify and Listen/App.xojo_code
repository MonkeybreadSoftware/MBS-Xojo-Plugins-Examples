#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  
		  db = new mySQLDatabaseMBS
		  
		  // this is path for a Mac, your path will be different!
		  dim libPath as string = "/Library/PostgreSQL/9.1/lib/libpq.5.4.dylib"
		  
		  db.Option(db.kOptionLibraryPostgreSQL) = libPath
		  
		  
		  // connect to database
		  // in this example it is Postr,
		  // but can also be Sybase, Oracle, Informix, DB2
		  // SQLServer, InterBase, SQLBase and ODBC
		  
		  db.DatabaseName="PostgreSQL:127.0.0.1,5432@postgres"
		  db.UserName="postgres"
		  db.Password="xxx"
		  
		  if db.Connect then
		    
		    // tell server to send notifications to us
		    db.SQLExecute "LISTEN test;"
		    
		    
		    // listen for notifications
		    db.Listen
		    
		  else
		    MsgBox db.ErrorMessage
		    quit
		  end if
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		db As SQLDatabaseMBS
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
