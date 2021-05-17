#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // use internal sqlite library
		  Call InternalSQLiteLibraryMBS.Use
		  
		  
		  dim con as SQLConnectionMBS
		  dim cmd as SQLCommandMBS
		  
		  try
		    
		    con = new SQLConnectionMBS // connection object
		    
		    
		    // where is the library?
		    'con.Option(con.kOptionLibrarySQLite) = "/usr/lib/libsqlite3.0.dylib"
		    
		    // connect to database
		    dim path as string = ":memory:"
		    
		    con.Connect(path,"","",SQLConnectionMBS.kSQLiteClient)
		    // associate a command with connection
		    // connection can also be specified in SACommand constructor
		    'cmd.Connection=con
		    
		    // create table
		    cmd = New SQLCommandMBS
		    
		    cmd.Connection = con
		    cmd.setCommandText("select UPPER('äüöß')",cmd.kCommandTypeSQLStatement)
		    cmd.Execute
		    
		    while cmd.FetchNext
		      MsgBox "Upper: "+cmd.Field(1).asStringValue
		    wend
		    
		    
		    cmd.setCommandText("select 'Hällo' LIKE 'HÄ%' ",cmd.kCommandTypeSQLStatement)
		    cmd.Execute
		    
		    While cmd.FetchNext
		      MsgBox "Like: "+cmd.Field(1).asStringValue
		    Wend
		    
		    
		    cmd.setCommandText("select 'Hällo' REGEXP 'H(.*)' ",cmd.kCommandTypeSQLStatement)
		    cmd.Execute
		    
		    While cmd.FetchNext
		      MsgBox "RegEx: "+cmd.Field(1).asStringValue
		    Wend
		    
		    MsgBox "ICU loaded: "+Str(InternalSQLiteLibraryMBS.ICULoaded)+EndOfLine+_
		    "ICU used: "+str(InternalSQLiteLibraryMBS.ICUUsed)
		    
		    // commit changes on success
		    con.Commit
		    
		    
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
