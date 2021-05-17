#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // now add that file to database
		  dim con as SQLConnectionMBS
		  dim cmd as SQLCommandMBS
		  
		  try
		    
		    con = new SQLConnectionMBS // connection object
		    
		    // where is the library?
		    // you can place the database client library files where you want.
		    // example code just has some convenient location for testing.
		    
		    
		    con.SetFileOption con.kOptionLibraryMySQL, SpecialFolder.UserHome.Child("libmysqlclient.dylib")
		    
		    cmd = new SQLCommandMBS(con, "Select fblob from test_tbl") // create command object
		    
		    // connect to database (mySQL in our example)
		    // server: 192.168.1.80
		    // port: 3306
		    // database: test
		    // name: root
		    // no password
		    con.Connect("192.168.1.80,3306@test","root","",SQLConnectionMBS.kMySQLClient)
		    // associate a command with connection
		    // connection can also be specified in SACommand constructor
		    
		    // Usage 1. Read whole BLob(s) into internal buffers
		    // Select BLob from our test table
		    cmd.Execute
		    // fetch results row by row and print results
		    
		    while cmd.FetchNext
		      // after fetching a row all Long/Lob fields are automatically read into internal buffers
		      // just like other data types
		      dim s as SQLStringMBS = cmd.Field("fblob").asBLob
		      MsgBox "Size of BLob is "+Str(s.BinaryLength)+" bytes"
		    wend
		    
		    // Usage 2. Read BLob in pieces providing user callback for BLob data processing
		    // Select blob from our test table
		    cmd.Execute
		    // do not automatically read this field into internal buffer (into corresponding SAField object)
		    // we will provide a consumer for BLob fetching after FetchNext
		    cmd.Field("fblob").LongOrLobReaderMode=SQLValueReadMBS.kLongOrLobReaderModeManual
		    
		    // fetch results row by row and print results
		    dim Filename as string
		    dim i as integer=0
		    
		    while cmd.FetchNext
		      
		      i=i+1
		      Filename="fblob"+str(i)+".bin"
		      
		      dim f as FolderItem=SpecialFolder.Desktop.Child(Filename)
		      dim d as new MyDataConsumer(f)
		      
		      // at that moment all fields are fetched except
		      // those that set for manual retrieving
		      // read them (fblob in our example) now
		      if not cmd.Field("fblob").isNull then
		        cmd.Field("fblob").ReadLongOrLob(d, 10*1024) // read 10 KB per block
		      end if
		    wend
		    
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
