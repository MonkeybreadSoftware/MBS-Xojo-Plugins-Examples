#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // use built in library
		  call InternalSQLiteLibraryMBS.Use
		  
		  dim con as new SQLConnectionMBS
		  
		  
		  try
		    
		    // where is the library?
		    
		    '#if TargetWin32 then
		    'con.Option(con.kOptionLibrarySQLite) = "sqlite.dll"
		    '#elseif TargetLinux
		    'con.Option(con.kOptionLibrarySQLite) = "sqlite.so"
		    '#elseif TargetMachO then
		    'con.Option(con.kOptionLibrarySQLite) = "sqlite.dylib"
		    '#else
		    '?
		    '#endif
		    
		    
		    // connect to database
		    
		    dim path as string
		    
		    if TargetMacOS then
		      path = "/tmp/test.db" // put the database in the temporary folder
		    else
		      path = "test.db" // for Windows and Linux in the current folder the application is inside.
		    end if
		    
		    con.Connect(path,"","",SQLConnectionMBS.kSQLiteClient)
		    
		    
		    // create table
		    
		    con.SQLExecute "Create table if not exists BlobTest(ID integer PRIMARY KEY AUTOINCREMENT, name varchar(20), image blob)"
		    
		    
		    
		    // insert blob
		    dim pic as Picture = LogoMBS
		    
		    // we use MemoryBlock here to avoid conversion to string
		    'dim jpegData as string = pic.GetData(Picture.FormatJPEG, 80)
		    dim jpegData as MemoryBlock = pic.GetData(Picture.FormatJPEG, 80)
		    
		    dim sql as string = "Insert into BlobTest(name, image) values (:name, :image)"
		    dim cmd as new SQLCommandMBS(con, sql)
		    
		    cmd.Param("name").setAsString "logo.jpg"
		    cmd.Param("image").setAsBlob jpegData
		    cmd.Execute
		    
		    
		    // query
		    
		    cmd = new SQLCommandMBS(Con, "SELECT * FROM BlobTest")
		    
		    cmd.Execute
		    
		    
		    while cmd.FetchNext
		      dim Data as string = cmd.Field("image").asBLobString
		      dim name as string = cmd.Field("name").asStringValue
		      dim ID   as string = cmd.Field("id").asStringValue
		      
		      dim w as new PicWindow
		      w.Backdrop = picture.FromData(data)
		      w.Title = name+" "+ID
		      w.show
		      
		      
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
