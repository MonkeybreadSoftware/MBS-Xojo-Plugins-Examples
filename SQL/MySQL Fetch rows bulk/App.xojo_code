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
		    
		    
		    cmd = new SQLCommandMBS // create command object
		    
		    // connect to database (mySQL in our example)
		    // server: 192.168.1.80
		    // port: 3306
		    // database: test
		    // name: root
		    // no password
		    con.Connect("192.168.1.80,3306@test","root","",SQLConnectionMBS.kMySQLClient)
		    // associate a command with connection
		    // connection can also be specified in SACommand constructor
		    
		    cmd.Connection=con
		    
		    // Create and Insert test table
		    if HaveSampleData(cmd)=False then
		      CreateSampleData(cmd, 200000)
		      con.Commit
		    end if
		    
		    dim start, finish as integer
		    
		    MsgBox "Reading data without bulk support (default)..."
		    start=ticks
		    cmd.setCommandText "Select * from TEST_BULK"
		    cmd.Execute
		    
		    while cmd.FetchNext  // go over all rows
		    wend
		    
		    finish=ticks
		    
		    MsgBox "Time in seconds: "+str((finish-start)/60.0)+" seconds."
		    
		    dim nBulkSize as integer = 1000
		    
		    msgbox "Reading data with bulk support (Size="+str(nBulkSize)+")..."
		    
		    start=ticks
		    cmd.setCommandText "Select * from TEST_BULK"
		    cmd.Option("PreFetchRows") = str(nBulkSize)
		    cmd.Execute
		    while cmd.FetchNext  // go over all rows
		    wend
		    
		    finish=ticks
		    
		    MsgBox "Time in seconds: "+str((finish-start)/60.0)+" seconds."
		    
		    
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
		Sub CreateSampleData(cmd as SQLCommandMBS, nRows as integer)
		  MsgBox "Creating test table..."
		  
		  cmd.setCommandText("CREATE TABLE TEST_BULK (FINTEGER INTEGER NOT NULL, FVARCHAR20 VARCHAR(20), PRIMARY KEY (FINTEGER))")
		  
		  cmd.Execute
		  
		  MsgBox "Populating test table (rows="+str(nrows)+")..."
		  
		  cmd.setCommandText "BEGIN"
		  cmd.Execute
		  
		  
		  cmd.setCommandText("Insert into TEST_BULK (FINTEGER, FVARCHAR20) values (:1, :2)")
		  
		  for i as integer = 1 to nRows
		    
		    cmd.Param(1).setAsLong i
		    cmd.Param(2).setAsString "VC"+str(i)
		    
		    cmd.Execute
		    
		    
		  next
		  
		  cmd.setCommandText "COMMIT"
		  cmd.Execute
		  
		  MsgBox str(nRows)+" inserted."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HaveSampleData(cmd as SQLCommandMBS) As Boolean
		  try
		    
		    cmd.setCommandText "Select * from TEST_BULK"
		    cmd.Execute
		    
		    if cmd.FetchNext then
		      Return true
		    end if
		    
		  catch s as SQLErrorExceptionMBS
		    
		    Return false // no table TEST_BULK
		    
		  end try
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
