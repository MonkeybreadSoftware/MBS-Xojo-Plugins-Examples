#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim con as new SQLConnectionMBS
		  
		  try
		    
		    // where is the library?
		    con.SetFileOption con.kOptionLibraryPostgreSQL, FindFile("libpq.dylib")
		    
		    // connect to database
		    
		    con.Connect("127.0.0.1,5432@TestDB","name","pass",SQLConnectionMBS.kPostgreSQLClient)
		    
		    dim api as SQLAPIMBS = con.NativeAPI
		    if api isa PostgreSQLAPIMBS then
		      dim s as PostgreSQLAPIMBS = PostgreSQLAPIMBS(api)
		      
		      MsgBox s.User
		      
		      // x=s.RecordCount(command)
		    end if
		    
		    
		    // Disconnect is optional
		    // autodisconnect will ocur in destructor if needed
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


	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod


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
