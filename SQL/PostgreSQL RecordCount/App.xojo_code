#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  Dim db as new SQLConnectionMBS
		  dim server as string = "127.0.0.1,5432@TestDB"
		  dim cmdStr as string = "SELECT recordID FROM maintable"
		  
		  // where is the library?
		  // libpq.5.2.dylib or equiv
		  db.SetFileOption db.kOptionLibraryPostgreSQL, FindFIle("libpq.dylib")
		  
		  db.Connect(server, "pstys", "pw", SQLConnectionMBS.kPostgreSQLClient)
		  
		  if db.isConnected then
		    Dim cmd As New SQLCommandMBS(db, cmdStr)
		    
		    try
		      cmd.Execute
		      Dim n As Integer = cmd.PostgreSQLRowCount
		      
		      MsgBox "Cmd returned " + str(n) + " records and " + str(cmd.FieldCount) + " fields"
		      
		    catch r as RuntimeException
		      MsgBox r.message
		      
		    end try
		    
		    
		  else
		    MsgBox "The connection failed."
		  end if
		  
		  db.Disconnect
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
