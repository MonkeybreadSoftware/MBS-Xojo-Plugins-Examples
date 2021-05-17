#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  
		  dim db as new SQLDatabaseMBS
		  
		  // where is the library?
		  db.SetFileOption SQLConnectionMBS.kOptionLibraryPostgreSQL, FindFile("libpq.5.1.dylib")
		  
		  // connect to database
		  // in this example it is Postr,
		  // but can also be Sybase, Oracle, Informix, DB2
		  // SQLServer, InterBase, SQLBase and ODBC
		  
		  db.DatabaseName="PostgreSQL:127.0.0.1,5432@TestDB"
		  db.UserName="root"
		  db.Password=""
		  
		  if db.Connect then
		    
		    MsgBox "We are connected!"
		    
		    dim con as SQLConnectionMBS = db.Connection
		    MsgBox "Server Version: "+con.ServerVersionString
		    
		    // Disconnect is optional
		    // autodisconnect will ocur in destructor if needed
		    
		  else
		    MsgBox db.ErrorMessage
		  end if
		  
		  
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
