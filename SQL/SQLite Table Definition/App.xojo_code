#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // use internal sqlite library
		  call InternalSQLiteLibraryMBS.Use
		  
		  
		  dim con as new SQLConnectionMBS
		  
		  
		  try
		    
		    // where is the library?
		    'con.Option(con.kOptionLibrarySQLite) = "libsqlite3.0.dylib"
		    
		    
		    // connect to database
		    
		    dim path as string
		    
		    if TargetMacOS then
		      path = "/tmp/test.db" // put the database in the temporary folder
		    else
		      path = "test.db" // for Windows and Linux in the current folder the application is inside.
		    end if
		    
		    con.Connect(path,"","",SQLConnectionMBS.kSQLiteClient)
		    
		    // create table
		    con.SQLExecute "Create table test_tbl(fid integer PRIMARY KEY AUTOINCREMENT, fvarchar20 varchar(20), fblob blob)"
		    
		    
		    Dim DataType As String, CollationSequence As String, NotNull As Boolean, PrimaryKey As Boolean, AutoIncrement As Boolean
		    
		    Dim e As Integer = con.SQLiteTableColumnMetaData("", "test_tbl", "fid", DataType, CollationSequence, NotNull, PrimaryKey, AutoIncrement)
		    
		    if e = 0 then // ErrorOK
		      dim a as string
		      dim p as string
		      dim n as string
		      
		      if AutoIncrement then
		        a = "is auto incrementing."
		      else
		        a = "is not auto incrementing."
		      end if
		      
		      if NotNull then
		        n = "is not null"
		      else
		        n = "can be null"
		      end if
		      
		      if PrimaryKey then
		        p = "is primary key"
		      else
		        p = "is not a primary key"
		      end if
		      
		      MsgBox "FID field has data type "+DataType+", Collation Sequence "+CollationSequence+", "+n+", "+p+" and "+a
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
