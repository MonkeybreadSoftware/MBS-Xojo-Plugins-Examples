#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // use internal CubeSQL library
		  Call InternalCubeSQLLibraryMBS.Use
		  
		  
		  
		  
		  dim con as new SQLConnectionMBS
		  
		  
		  try
		    
		    // connect to database
		    
		    // or use external DLL?
		    // con.Option("CUBESQL.LIBS") = "/Users/cs/Desktop/libcubesql.dylib"
		    con.Option("APPNAME") = "Xojo Test"
		    con.Option("ConnectionTimeout") = "5" // 5 seconds timeout?
		    'con.Option("ConnectionEncryption") = "AES128" // or "AES192" or "AES256"
		    
		    con.Connect("localhost@mydatabase.sqlite","admin","admin",SQLConnectionMBS.kCubeSQLClient)
		    
		    // create table
		    dim cmd as new SQLCommandMBS
		    
		    cmd.Connection = con
		    cmd.setCommandText("select sqlite_version()",cmd.kCommandTypeSQLStatement)
		    cmd.Execute
		    
		    while cmd.FetchNext
		      MsgBox "Version: "+cmd.Field(1).asStringValue
		    wend
		    
		    
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
