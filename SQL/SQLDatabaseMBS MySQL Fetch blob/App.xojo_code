#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim db as new SQLDatabaseMBS
		  
		  // where is the library?
		  
		  // you can place the database client library files where you want.
		  // example code just has some convenient location for testing.
		  
		  
		  db.SetFileOption SQLConnectionMBS.kOptionLibraryMySQL, SpecialFolder.UserHome.Child("libmysqlclient.dylib")
		  
		  // connect to database
		  // in this example it is MySQL,
		  // but can also be Sybase, Informix, DB2, SQLServer, InterBase, Oracle, SQLite, SQLBase and ODBC
		  
		  
		  db.DatabaseName="mysql:xxx,3306@test"
		  db.UserName="xxx"
		  db.Password="xxx"
		  
		  if db.Connect then
		    
		    // we query pictures in a pictures database
		    dim r as RecordSet = db.SQLSelect("Select * from Pictures where Picture IS NOT NULL limit 10") // create command object
		    
		    // Select from our test table
		    
		    if r<>Nil then
		      
		      while not r.EOF
		        // fetch results row by row and print results
		        
		        dim p as string = r.field("Picture").StringValue
		        if lenb(p)>=0 then
		          // as this should be PNGs, we show them
		          
		          dim w as new window2
		          w.Backdrop = PNGStringToPictureMBS(p)
		          w.show
		        end if
		        
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
