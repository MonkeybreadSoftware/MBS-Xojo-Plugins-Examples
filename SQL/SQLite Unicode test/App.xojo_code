#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // use internal sqlite library
		  call InternalSQLiteLibraryMBS.Use
		  
		  
		  dim file as FolderItem = SpecialFolder.Desktop.Child("test.db")
		  file.Delete
		  
		  WriteREALSQLDatabase
		  WriteSQLConnectionMBS
		  WriteSQLDatabaseMBS
		  
		  SelectSQLConnectionMBS
		  SelectSQLDatabaseMBS
		  SelectREALSQLDatabase
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getencodingName(s as string) As string
		  dim e as TextEncoding = s.Encoding
		  
		  if e = nil then Return "none"
		  
		  dim n as string = e.internetName
		  if n<>"" then Return n
		  
		  if e = encodings.UTF8 then 
		    Return "UTF-8"
		  elseif e = encodings.UTF16 then
		    Return "UTF-8"
		  else
		    Return "?"
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectREALSQLDatabase()
		  dim db as new REALSQLDatabase
		  
		  db.DatabaseFile = SpecialFolder.Desktop.Child("test.db")
		  
		  if db.Connect then
		    
		    // Select from our test table
		    dim r as RecordSet = db.SQLSelect("Select fid, fvarchar20, fAPI from Texts") // create command object
		    if db.Error or r = nil then
		      break
		      MsgBox db.ErrorMessage
		    end if
		    
		    // fetch results row by row and print results
		    while not r.EOF
		      
		      dim fid as integer = r.Field("fid").IntegerValue
		      dim fvarchar20 as string = r.Field("fvarchar20").StringValue
		      dim fAPI as string = r.Field("fAPI").StringValue
		      
		      
		      window1.List.AddRow str(fid)
		      window1.List.cell(window1.List.LastIndex,1)=fvarchar20
		      window1.List.cell(window1.List.LastIndex,2)=str(fvarchar20.lenb)
		      window1.List.cell(window1.List.LastIndex,3) = getencodingName(fvarchar20)
		      window1.List.cell(window1.List.LastIndex,4)=fAPI
		      window1.List.cell(window1.List.LastIndex,5)="REALSQLDatabase"
		      
		      r.MoveNext
		    wend
		    
		    
		  else
		    MsgBox "Failed to open database: "+db.ErrorMessage
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectSQLConnectionMBS()
		  dim con as SQLConnectionMBS
		  dim cmd as SQLCommandMBS
		  
		  try
		    
		    con = new SQLConnectionMBS // connection object
		    cmd = new SQLCommandMBS // create command object
		    
		    // where is the library?
		    
		    '#if TargetWin32 then
		    '// please put sqlite3.dll in same folder as exe
		    '#elseif TargetMacOS
		    'con.SetFileOption SQLConnectionMBS.kOptionLibrarySQLite, FindFile("/usr/lib/libsqlite3.dylib", folderitem.PathTypeShell)
		    '#elseif TargetLinux
		    'con.SetFileOption SQLConnectionMBS.kOptionLibrarySQLite, FindFile("/usr/lib/libsqlite3.so.0", folderitem.PathTypeShell)
		    '#else
		    'not supported
		    '#endif
		    
		    // connect to database
		    dim file as FolderItem = SpecialFolder.Desktop.Child("test.db")
		    dim path as string = file.ShellPath
		    
		    con.Connect(path,"","",SQLConnectionMBS.kSQLiteClient)
		    // associate a command with connection
		    // connection can also be specified in SACommand constructor
		    cmd.Connection=con
		    
		    
		    cmd = new SQLCommandMBS(con, "Select fid, fvarchar20, fAPI from Texts") // create command object
		    
		    // Select from our test table
		    cmd.Execute
		    
		    // fetch results row by row and print results
		    while cmd.FetchNext
		      
		      dim fid as integer = cmd.Field("fid").asLong
		      dim fvarchar20 as string = cmd.Field("fvarchar20").asStringValue
		      dim fAPI as string = cmd.Field("fAPI").asStringValue
		      
		      window1.List.AddRow str(fid)
		      window1.List.cell(window1.List.LastIndex,1)=fvarchar20
		      window1.List.cell(window1.List.LastIndex,2)=str(fvarchar20.lenb)
		      window1.List.cell(window1.List.LastIndex,3) = getencodingName(fvarchar20)
		      window1.List.cell(window1.List.LastIndex,4)=fAPI
		      window1.List.cell(window1.List.LastIndex,5)="SQLConnectionMBS"
		      
		      
		    wend
		    
		    
		    
		    // now fetch back
		    
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
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectSQLDatabaseMBS()
		  dim db as new SQLDatabaseMBS
		  
		  // where is the library?
		  '#if TargetWin32 then
		  '// please put sqlite3.dll in same folder as exe
		  '#elseif TargetMacOS
		  'db.SetFileOption SQLConnectionMBS.kOptionLibrarySQLite, FindFile("/usr/lib/libsqlite3.dylib", folderitem.PathTypeShell)
		  '#elseif TargetLinux
		  'db.SetFileOption SQLConnectionMBS.kOptionLibrarySQLite, FindFile("/usr/lib/libsqlite3.so.0", folderitem.PathTypeShell)
		  '#else
		  'not supported
		  '#endif
		  
		  // connect to database
		  // in this example it is SQLite,
		  // but can also be Sybase, Oracle, Informix, DB2, SQLServer, InterBase, MySQL, SQLBase and ODBC
		  
		  dim file as FolderItem = SpecialFolder.Desktop.Child("test.db")
		  dim path as string = file.ShellPath
		  
		  db.DatabaseName = "sqlite:"+path
		  
		  if db.Connect then
		    
		    // Select from our test table
		    dim r as RecordSet = db.SQLSelect("Select fid, fvarchar20, fAPI from Texts") // create command object
		    if db.Error or r = nil then
		      break
		      MsgBox db.ErrorMessage
		    end if
		    
		    // fetch results row by row and print results
		    while not r.EOF
		      
		      dim fid as integer = r.Field("fid").IntegerValue
		      dim fvarchar20 as string = r.Field("fvarchar20").StringValue
		      dim fAPI as string = r.Field("fAPI").StringValue
		      
		      
		      window1.List.AddRow str(fid)
		      window1.List.cell(window1.List.LastIndex,1)=fvarchar20
		      window1.List.cell(window1.List.LastIndex,2)=str(fvarchar20.lenb)
		      window1.List.cell(window1.List.LastIndex,3) = getencodingName(fvarchar20)
		      window1.List.cell(window1.List.LastIndex,4)=fAPI
		      window1.List.cell(window1.List.LastIndex,5)="SQLDatabaseMBS"
		      
		      r.MoveNext
		    wend
		    
		    
		  else
		    MsgBox "Failed to open database: "+db.ErrorMessage
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteREALSQLDatabase()
		  dim db as new REALSQLDatabase
		  
		  db.DatabaseFile = SpecialFolder.Desktop.Child("test.db")
		  
		  if db.CreateDatabaseFile then
		    
		    db.SQLExecute "Create table IF NOT EXISTS Texts(fid integer, fvarchar20 varchar(20), fAPI varchar)"
		    if db.Error then
		      break
		      MsgBox db.ErrorMessage
		    end if
		    
		    db.Commit
		    
		    // insert value
		    db.SQLExecute "Insert into Texts(fid, fvarchar20, fAPI) values (1, 'Hello World', 'REALSQLDatabase')"
		    if db.Error then
		      break
		      MsgBox db.ErrorMessage
		    end if
		    
		    db.Commit
		    
		    // insert value
		    db.SQLExecute "Insert into Texts(fid, fvarchar20, fAPI) values (1, 'Some text with umlauts: Glückwünsche', 'REALSQLDatabase')"
		    if db.Error then
		      break
		      MsgBox db.ErrorMessage
		    end if
		    
		    db.Commit
		    
		    // insert value
		    db.SQLExecute "Insert into Texts(fid, fvarchar20, fAPI) values (2, 'German special characters: äöü ÄÖÜ ß', 'REALSQLDatabase')"
		    if db.Error then
		      break
		      MsgBox db.ErrorMessage
		    end if
		    
		    db.Commit
		    
		    // insert value
		    db.SQLExecute "Insert into Texts(fid, fvarchar20, fAPI) values (3, 'French special characters: áéíóú àèìòù âêîôû çÇ ₣ «» Ææ', 'REALSQLDatabase')"
		    if db.Error then
		      break
		      MsgBox db.ErrorMessage
		    end if
		    
		    // commit changes on success
		    db.Commit
		    
		    
		    // Insert 2 rows
		    dim p as PreparedSQLStatement = db.Prepare("Insert into Texts(fid, fvarchar20, fAPI) values(:1, :2, :3)")
		    if P = NIL OR db.Error then
		      break
		      MsgBox db.ErrorMessage
		    end if
		    
		    // use first method of binding - param assignment
		    p.BindType(0, REALSQLPreparedStatement.SQLITE_INTEGER)
		    p.BindType(1, REALSQLPreparedStatement.SQLITE_TEXT)
		    p.BindType(2, REALSQLPreparedStatement.SQLITE_TEXT)
		    p.Bind(0, 4)
		    p.Bind(1, "你好") // Hello on Chinese
		    p.Bind(2, "REALSQLDatabase")
		    
		    // Insert first row
		    p.SQLExecute
		    if db.Error then
		      break
		      MsgBox db.ErrorMessage
		    end if
		    
		    // another record
		    'dim p as PreparedSQLStatement = db.Prepare("Insert into Texts(fid, fvarchar20) values(:1, :2)")
		    'p.BindType(0, REALSQLPreparedStatement.SQLITE_INTEGER)
		    'p.BindType(1, REALSQLPreparedStatement.SQLITE_TEXT)
		    'p.BindType(2, REALSQLPreparedStatement.SQLITE_TEXT)
		    p.Bind(0, 5)
		    p.Bind(1, "こんにちは") // Hello on Japanes
		    p.Bind(2, "REALSQLDatabase")
		    // Insert second row
		    p.SQLExecute
		    if db.Error then
		      break
		      MsgBox db.ErrorMessage
		    end if
		    
		    // commit changes on success
		    db.Commit
		    
		  else
		    MsgBox "Failed to open database: "+db.ErrorMessage
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteSQLConnectionMBS()
		  dim con as SQLConnectionMBS
		  dim cmd as SQLCommandMBS
		  
		  try
		    
		    con = new SQLConnectionMBS // connection object
		    cmd = new SQLCommandMBS // create command object
		    
		    
		    // where is the library?
		    
		    '#if TargetWin32 then
		    '// please put sqlite3.dll in same folder as exe
		    '#elseif TargetMacOS
		    'con.SetFileOption SQLConnectionMBS.kOptionLibrarySQLite, FindFile("/usr/lib/libsqlite3.dylib", folderitem.PathTypeShell)
		    '#elseif TargetLinux
		    'con.SetFileOption SQLConnectionMBS.kOptionLibrarySQLite, FindFile("/usr/lib/libsqlite3.so.0", folderitem.PathTypeShell)
		    '#else
		    'not supported
		    '#endif
		    
		    // connect to database
		    dim file as FolderItem = SpecialFolder.Desktop.Child("test.db")
		    dim path as string = file.ShellPath
		    
		    con.Connect(path,"","",SQLConnectionMBS.kSQLiteClient)
		    // associate a command with connection
		    // connection can also be specified in SACommand constructor
		    cmd.Connection=con
		    
		    // create table
		    cmd.setCommandText("Create table IF NOT EXISTS Texts(fid integer, fvarchar20 varchar(20), fAPI varchar)")
		    cmd.Execute
		    
		    // insert value
		    cmd.setCommandText("Insert into Texts(fid, fvarchar20, fAPI) values (1, 'Hello World', 'SQLConnectionMBS')")
		    cmd.Execute
		    
		    // insert value
		    cmd.setCommandText("Insert into Texts(fid, fvarchar20, fAPI) values (1, 'Some text with umlauts: Glückwünsche', 'SQLConnectionMBS')")
		    cmd.Execute
		    
		    // insert value
		    cmd.setCommandText("Insert into Texts(fid, fvarchar20, fAPI) values (2, 'German special characters: äöü ÄÖÜ ß', 'SQLConnectionMBS')")
		    cmd.Execute
		    
		    // insert value
		    cmd.setCommandText("Insert into Texts(fid, fvarchar20, fAPI) values (3, 'French special characters: áéíóú àèìòù âêîôû çÇ ₣ «» Ææ', 'SQLConnectionMBS')")
		    cmd.Execute
		    
		    // commit changes on success
		    con.Commit
		    
		    // Insert 2 rows
		    cmd.setCommandText("Insert into Texts(fid, fvarchar20, fAPI) values(:1, :2, :3)")
		    
		    // use first method of binding - param assignment
		    cmd.Param(1).setAsLong(4)
		    cmd.Param(2).setAsString(new SQLStringMBS("你好")) // Hello on Chinese
		    cmd.Param(3).setAsString("SQLConnectionMBS")
		    // Insert first row
		    cmd.Execute
		    
		    // another record
		    cmd.Param(1).setAsLong(5)
		    cmd.Param(2).setAsString("こんにちは") // Hello on Japanes
		    cmd.Param(3).setAsString("SQLConnectionMBS")
		    // Insert second row
		    cmd.Execute
		    
		    // commit changes on success
		    con.Commit
		    
		    
		    
		    // now fetch back
		    
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
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteSQLDatabaseMBS()
		  dim db as new SQLDatabaseMBS
		  
		  // where is the library?
		  '#if TargetWin32 then
		  '// please put sqlite3.dll in same folder as exe
		  '#elseif TargetMacOS
		  'db.SetFileOption SQLConnectionMBS.kOptionLibrarySQLite, FindFile("/usr/lib/libsqlite3.dylib", folderitem.PathTypeShell)
		  '#elseif TargetLinux
		  'db.SetFileOption SQLConnectionMBS.kOptionLibrarySQLite, FindFile("/usr/lib/libsqlite3.so.0", folderitem.PathTypeShell)
		  '#else
		  'not supported
		  '#endif
		  
		  // connect to database
		  // in this example it is SQLite,
		  // but can also be Sybase, Oracle, Informix, DB2, SQLServer, InterBase, MySQL, SQLBase and ODBC
		  
		  dim file as FolderItem = SpecialFolder.Desktop.Child("test.db")
		  dim path as string = file.ShellPath
		  
		  db.DatabaseName = "sqlite:"+path
		  
		  if db.Connect then
		    db.SQLExecute "Create table IF NOT EXISTS Texts(fid integer, fvarchar20 varchar(20), fAPI varchar)"
		    if db.Error then
		      break
		      MsgBox db.ErrorMessage
		    end if
		    
		    db.Commit
		    
		    // insert value
		    db.SQLExecute "Insert into Texts(fid, fvarchar20, fAPI) values (1, 'Hello World', 'SQLDatabaseMBS')"
		    if db.Error then
		      break
		      MsgBox db.ErrorMessage
		    end if
		    
		    db.Commit
		    
		    // insert value
		    db.SQLExecute "Insert into Texts(fid, fvarchar20, fAPI) values (1, 'Some text with umlauts: Glückwünsche', 'SQLDatabaseMBS')"
		    if db.Error then
		      break
		      MsgBox db.ErrorMessage
		    end if
		    
		    db.Commit
		    
		    // insert value
		    db.SQLExecute "Insert into Texts(fid, fvarchar20, fAPI) values (2, 'German special characters: äöü ÄÖÜ ß', 'SQLDatabaseMBS')"
		    if db.Error then
		      break
		      MsgBox db.ErrorMessage
		    end if
		    
		    db.Commit
		    
		    // insert value
		    db.SQLExecute "Insert into Texts(fid, fvarchar20, fAPI) values (3, 'French special characters: áéíóú àèìòù âêîôû çÇ ₣ «» Ææ', 'SQLDatabaseMBS')"
		    if db.Error then
		      break
		      MsgBox db.ErrorMessage
		    end if
		    
		    // commit changes on success
		    db.Commit
		    
		    
		    // Insert 2 rows
		    dim p as SQLPreparedStatementMBS = db.Prepare("Insert into Texts(fid, fvarchar20, fAPI) values(:1, :2, :3)")
		    if P = NIL OR db.Error then
		      break
		      MsgBox db.ErrorMessage
		    end if
		    
		    // use first method of binding - param assignment
		    p.BindType(0, p.kTypeLong)
		    p.BindType(1, p.kTypeString)
		    p.BindType(2, p.kTypeString)
		    p.Bind(0, 4)
		    p.Bind(1, "你好") // Hello on Chinese
		    p.Bind(2, "SQLDatabaseMBS")
		    
		    // Insert first row
		    p.SQLExecute
		    if db.Error then
		      break
		      MsgBox db.ErrorMessage
		    end if
		    
		    // another record
		    'dim p as PreparedSQLStatement = db.Prepare("Insert into Texts(fid, fvarchar20) values(:1, :2)")
		    'p.BindType(0, SQLPreparedStatementMBS.kTypeLong)
		    'p.BindType(1, SQLPreparedStatementMBS.kTypeString)
		    'p.BindType(2, SQLPreparedStatementMBS.kTypeString)
		    p.Bind(0, 5)
		    p.Bind(1, "こんにちは") // Hello on Japanes
		    'p.Bind(2, "SQLDatabaseMBS")
		    // Insert second row
		    p.SQLExecute
		    if db.Error then
		      break
		      MsgBox db.ErrorMessage
		    end if
		    
		    // commit changes on success
		    db.Commit
		    
		  else
		    MsgBox "Failed to open database: "+db.ErrorMessage
		  end if
		  
		End Sub
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
