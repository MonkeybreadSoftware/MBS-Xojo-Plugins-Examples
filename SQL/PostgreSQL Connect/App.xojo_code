#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  
		  dim con as new SQLConnectionMBS
		  dim cmd as new SQLCommandMBS
		  
		  con.SetFileOption con.kOptionLibraryPostgreSQL, FindFile("libpq.5.1.dylib")
		  
		  dim server as string = "127.0.0.1,5432@TestDB"
		  
		  con.Connect(server, "test","", SQLConnectionMBS.kPostgreSQLClient)
		  
		  cmd.Connection = con
		  cmd.setCommandText("select * from pg_database")
		  cmd.Execute
		  
		  while cmd.FetchNext
		    msgbox cmd.Field("datname").asStringValue
		  wend
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
