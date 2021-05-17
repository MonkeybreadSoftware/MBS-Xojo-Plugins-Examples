#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // use internal sqlite library
		  call InternalSQLiteLibraryMBS.Use
		  
		  
		  dim db as new SQLDatabaseMBS
		  
		  // where is the library?
		  'db.SetOption SQLConnectionMBS.kOptionLibrarySQLite, "/usr/lib/libsqlite3.0.dylib"
		  
		  // connect to database
		  // in this example it is SQLite,
		  // but can also be Sybase, Oracle, Informix, DB2, SQLServer, InterBase, MySQL, SQLBase and ODBC
		  
		  dim f as FolderItem = GetOpenFolderItem("")
		  if f <> nil then
		    
		    
		    #if RBVersion >= 2013 then
		      // Xojo
		      dim path as string = f.NativePath
		    #else
		      // Real Studio
		      dim path as string = f.UnixpathMBS
		    #endif
		    
		    // e.g. "xxx" or "aes128:xxx" or "aes256:xxx" or "rc4:xxx" depending on what you want to use
		    db.SQLiteEncryptionKey = "xxx"
		    db.DatabaseName = "sqlite:"+path
		    
		    if db.Connect then 
		      
		      // you need to change the query for your database
		      dim r as RecordSet = db.SQLSelect("Select Vorname, Nachname from Addresses")
		      
		      // fetch results row by row and print results
		      while not r.EOF
		        
		        dim Vorname as string = r.Field("Vorname").StringValue
		        dim Nachname as string = r.Field("Nachname").StringValue
		        
		        window1.Listbox1.AddRow Vorname, Nachname
		        
		        r.MoveNext
		      wend
		      
		      
		    end if
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
