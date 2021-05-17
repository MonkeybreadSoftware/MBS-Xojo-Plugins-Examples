#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Close()
		  if SQLiteDB<>Nil then
		    SQLiteDB.Close
		  end if
		  
		  if j<>Nil then
		    j.close
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  dim f as FolderItem = FindFile("sqlitejdbc-v056.jar")
		  if not f.Exists then
		    MsgBox "Missing sqlite connector classes!"
		    Quit
		  end if
		  
		  dim file as FolderItem = FindFile("SQLite.rsd")
		  
		  v = new JavaVMMBS(f)
		  d = new JavaDatabaseMBS(v,"org.sqlite.JDBC")
		  
		  dim path as string
		  
		  #if RBVersion < 2013 then
		    path = file.UnixpathMBS
		  #else
		    path = file.NativePath
		  #endif
		  
		  j = d.getConnection("jdbc:sqlite:"+path)
		  
		  if j = Nil then
		    MsgBox "Cannot connect to sqlite Database"
		    Quit
		  end if
		  
		  SQLiteDB = New REALSQLDatabase // or SQLiteDatabase
		  SQLiteDB.databaseFile = file
		  if SQLiteDB.databaseFile.Exists then
		    if Not SQLiteDB.Connect then
		      MsgBox "Cannot connect to SQLite Database"
		      Quit
		    end if
		  else
		    MsgBox "Missing Database File!"
		    Quit
		  end
		  
		  Exception e as JavaExceptionMBS
		    MsgBox e.message+" errorcode: "+str(e.ErrorNumber)
		    
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


	#tag Property, Flags = &h0
		d As JavaDatabaseMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		j As JavaConnectionMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		SQLiteDB As REALSQLDatabase
	#tag EndProperty

	#tag Property, Flags = &h0
		v As JavaVMMBS
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
