#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim db as new SQLDatabaseMBS
		  
		  db.Option("OLEDBProvider") = "SQLNCLI" // SQLNCLI for SQL Server 2005, SQLNCLI10 for newer version.
		  
		  // connect to database
		  // in this example it is MySQL,
		  // but can also be Sybase, Informix, DB2, SQLServer, InterBase, Oracle, SQLite, SQLBase and ODBC
		  
		  db.DatabaseName="SQLServer:PcName\SqlServerInstanceName@DatabaseName"
		  db.UserName=""
		  db.Password=""
		  
		  if db.Connect then
		    
		    dim r as RecordSet = db.SQLSelect("Select fid, fvarchar20 from test_tbl") 
		    
		    // Select from our test table
		    
		    if r<>Nil then
		      
		      while not r.EOF
		        // fetch results row by row and print results
		        
		        dim fid as integer = r.Field("fid").IntegerValue
		        dim fvarchar20 as string = r.Field("fvarchar20").StringValue
		        
		        window1.Listbox1.AddRow str(fid)
		        window1.Listbox1.cell(window1.Listbox1.LastIndex,1)=fvarchar20
		        
		        r.MoveNext
		      wend
		    end if
		    
		  else
		    MsgBox db.ErrorMessage
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
