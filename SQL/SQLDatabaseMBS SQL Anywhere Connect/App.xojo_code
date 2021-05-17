#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim db as new SQLDatabaseMBS
		  
		  // where is the library? Change this to point to your libraries!
		  // windows: dbcapi.dll
		  // Mac OS X: libdbcapi.dylib
		  // Linux: libdbcapi.so
		  
		  dim file as FolderItem
		  
		  #if TargetWin32 then
		    file = getfolderitem("c:\SQLAnywhere/dbcapi.dll", folderitem.PathTypeShell)
		  #elseif TargetLinux then
		    file = getfolderitem("/SQLAnywhere/libdbcapi.so", folderitem.PathTypeShell)
		  #elseif TargetMachO then
		      file = getfolderitem("/Applications/SQLAnywhere12/System/lib32/libdbcapi.dylib", folderitem.PathTypeShell)
		  #else
		    ?
		  #endif
		  
		  // important to change folder to make sure the files are found.
		  dim folder as FolderItem = file.parent
		  call SQLGlobalsMBS.SetCurrentWorkingDirectory(folder)
		  db.SetFileOption db.kOptionLibrarySQLanywhere, file
		  
		  // connect to database
		  // in this example it is SQL Anywhere,
		  // but can also be Sybase, Oracle, ODBC, SQLite, Informix, DB2, SQLServer, InterBase, MySQL and SQLBase
		  
		  dim path as string = "host=192.168.1.11;dbn=demo;uid=dba;pwd=sql" // whatever path the ODBC driver needs
		  
		  db.UserName = ""
		  db.Password = ""
		  db.DatabaseName = "SQLAnywhere:"+path
		  
		  if db.Connect then 
		    
		    MsgBox "We are connected!"
		    
		    // Disconnect is optional
		    // autodisconnect will ocur in destructor if needed
		    db.close
		    
		    msgbox "We are disconnected!"
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
