#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // use internal sqlite library
		  call InternalSQLiteLibraryMBS.Use
		  
		  
		  dim db as new SQLDatabaseMBS
		  
		  // where is the library?
		  'db.Option(SQLConnectionMBS.kOptionLibrarySQLite) = "/usr/lib/libsqlite3.0.dylib"
		  
		  // connect to database
		  // in this example it is SQLite,
		  // but can also be Sybase, Oracle, Informix, DB2, SQLServer, InterBase, MySQL, SQLBase and ODBC
		  
		  dim path as string
		  
		  if TargetMacOS then
		    path = "/tmp/test.db" // put the database in the temporary folder
		  else
		    path = "test.db" // for Windows and Linux in the current folder the application is inside.
		  end if
		  
		  db.DatabaseName = "sqlite:"+path
		  
		  if db.Connect then 
		    
		    'MsgBox "We are connected!"
		    
		    
		    // create table
		    db.SQLExecute "Create table if not exists BlobTest(ID integer PRIMARY KEY AUTOINCREMENT, name varchar(20), image blob)"
		    
		    if db.Error then
		      MsgBox "Error: "+db.ErrorMessage
		      Return
		    end if
		    
		    // insert blob
		    dim pic as Picture = LogoMBS
		    dim jpegData as string = pic.GetData(Picture.FormatJPEG, 80)
		    
		    dim sql as string = "Insert into BlobTest(name, image) values (:name, :image)"
		    dim p as SQLPreparedStatementMBS = db.Prepare(sql)
		    
		    p.Bind("name", "logo.jpg")
		    p.Bind("image", jpegData)
		    p.BindType("name", p.kTypeString)
		    p.BindType("image", p.kTypeBlob)
		    p.SQLExecute 
		    
		    if db.Error then
		      MsgBox "Error: "+db.ErrorMessage
		      Return
		    else
		      'MsgBox "Saved"
		    end if
		    
		    jpegData = ""
		    
		    // query
		    
		    dim r as RecordSet = db.SQLSelect("SELECT * FROM BlobTest")
		    
		    if db.Error then
		      MsgBox "Error: "+db.ErrorMessage
		      Return
		    end if
		    
		    while not r.EOF
		      dim Data as string = r.Field("image").StringValue
		      dim name as string = r.Field("name").StringValue
		      dim ID   as string = r.Field("id").StringValue
		      
		      dim w as new PicWindow
		      w.Backdrop = picture.FromData(data)
		      w.Title = name+" "+ID
		      w.show
		      
		      r.MoveNext
		    wend
		    
		    
		    
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
