#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  dim con as new SQLConnectionMBS
		  
		  
		  try
		    
		    // connect to database
		    
		    dim path as string
		    
		    if TargetMacOS then
		      path = "/tmp/test.duckdb" // put the database in the temporary folder
		    Else
		      path = "test.duckdb" // for Windows and Linux in the current folder the application is inside.
		    end if
		    
		    // set which DLL to use
		    con.SetFileOption con.kOptionLibraryDuckDB, SpecialFolder.Desktop.Child("libduckdb.dylib")
		    con.Client = SQLConnectionMBS.kDuckDBClient
		    
		    // connect
		    con.Connect(path,"","", SQLConnectionMBS.kDuckDBClient)
		    
		    Dim cmd As New SQLCommandMBS(con, "PRAGMA version;")
		    
		    cmd.Execute
		    
		    If cmd.FetchNext Then
		      MsgBox "Version: " + cmd.Field(1).asStringValue
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
