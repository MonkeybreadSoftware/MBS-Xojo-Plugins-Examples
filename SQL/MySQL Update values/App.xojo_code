#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  // create a test file
		  dim f as FolderItem = SpecialFolder.Temporary.Child("logo.jpg")
		  MsgBox f.NativePath
		  if not f.Exists then
		    dim p as Picture = LogoMBS(500)
		    f.SaveAsJPEG p
		  end if
		  
		  // now add that file to database
		  dim con as SQLConnectionMBS
		  dim cmd as SQLCommandMBS
		  
		  try
		    
		    con = new SQLConnectionMBS // connection object
		    
		    
		    // where is the library?
		    
		    // you can place the database client library files where you want.
		    // example code just has some convenient location for testing.
		    
		    
		    con.SetFileOption con.kOptionLibraryMySQL, SpecialFolder.UserHome.Child("libmysqlclient.dylib")
		    
		    
		    cmd = new SQLCommandMBS(con, "Update test_tbl set fblob = :fblob where fid =:1") // create command object
		    
		    // connect to database (mySQL in our example)
		    // server: 192.168.1.80
		    // port: 3306
		    // database: test
		    // name: root
		    // no password
		    con.Connect("192.168.1.80,3306@test","root","",SQLConnectionMBS.kMySQLClient)
		    // associate a command with connection
		    // connection can also be specified in SACommand constructor
		    
		    // use first method of Long(Lob) binding - as a whole
		    cmd.Param(1).setAsLong(1)    // fid
		    cmd.Param("fblob").setAsBLob(ReadWholeFile(f))
		    // update first row
		    
		    cmd.Execute
		    
		    // use second method of binding - user defined data provider
		    dim data as new MyDataProvider(f)
		    
		    cmd.Param(1).setAsLong(2)
		    cmd.Param("fblob").setAsBLob(data, 10*1024) // our provider to provide blob data from file, 10 K chunks
		    
		    // update second row
		    cmd.Execute    // at that moment Library will call user callback when needed
		    
		    // commit changes on success
		    con.Commit
		    
		    MsgBox "Blob parameter bound, rows updated!"
		    
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


	#tag Method, Flags = &h0
		Function ReadWholeFile(f as FolderItem) As string
		  dim b as BinaryStream
		  
		  b=f.OpenAsBinaryFile
		  
		  if b=nil then
		    MsgBox "Failed to open file!"
		    Return ""
		  end if
		  
		  dim s as string = B.Read(b.Length)
		  
		  Return s
		  
		  
		  
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
