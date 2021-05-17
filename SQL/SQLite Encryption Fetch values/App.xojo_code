#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // use internal sqlite library
		  call InternalSQLiteLibraryMBS.Use
		  
		  
		  
		  dim con as SQLConnectionMBS
		  dim cmd as SQLCommandMBS
		  
		  try
		    
		    con = new SQLConnectionMBS // connection object
		    
		    
		    // where is the library?
		    'con.SetFileOption con.kOptionLibrarySQLite, getfolderitem("/usr/lib/libsqlite3.0.dylib", folderitem.PathTypeShell)
		    
		    // connect to database
		    
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
		      con.SQLiteEncryptionKey = "xxx"
		      con.Connect(path,"","",SQLConnectionMBS.kSQLiteClient)
		      
		      // you need to change the query for your database
		      cmd = new SQLCommandMBS(con, "Select Vorname, Nachname from Addresses") // create command object
		      
		      // Select from our test table
		      cmd.Execute
		      
		      // fetch results row by row and print results
		      while cmd.FetchNext
		        
		        dim Vorname as string = cmd.Field("Vorname").asStringValue
		        dim Nachname as string = cmd.Field("Nachname").asStringValue
		        
		        window1.Listbox1.AddRow Vorname, Nachname
		        
		        
		      wend
		      
		      // commit changes on success
		      con.Commit
		      
		      MsgBox "Rows selected!"
		    end if
		    
		  catch r as SQLErrorExceptionMBS
		    // SAConnection::Rollback()
		    // can also throw an exception
		    // (if a network error for example),
		    // we will be ready
		    try
		      
		      // on error rollback changes
		      if con<>nil then
		        con.rollback
		      end if
		    catch x as SQLErrorExceptionMBS
		      // ignore
		    end try
		    
		    // show error message
		    MsgBox r.message
		    
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
