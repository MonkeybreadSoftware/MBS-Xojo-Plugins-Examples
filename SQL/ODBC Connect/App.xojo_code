#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim con as new SQLConnectionMBS
		  
		  
		  try
		    
		    // where is the library?
		    if TargetMachO then
		      // change to your libraries path
		      'con.SetFileOption con.kOptionLibraryODBC, FindFile("odbc.dylib", folderitem.PathTypeShell)
		    elseif TargetWin32 then
		      // use default
		    elseif TargetLinux then
		      // change to your libraries path
		      con.Option(con.kOptionLibraryODBC) = "odbc.so"
		    end if
		    
		    // connect to database
		    
		    // whatever connection string your ODBC server has
		    dim connectionString as string = "Driver={xxx};Server=localhost;Database=myDataBase;" 
		    
		    const UserName = "test"
		    const Password = "test"
		    
		    con.Connect(connectionString, UserName, Password, SQLConnectionMBS.kODBCClient)
		    
		    MsgBox "We are connected!"
		    
		    // Disconnect is optional
		    // autodisconnect will ocur in destructor if needed
		    con.Disconnect
		    
		    msgbox "We are disconnected!"
		    
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
