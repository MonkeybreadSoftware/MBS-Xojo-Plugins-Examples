#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  
		  dim db as new SQLDatabaseMBS
		  
		  db.Option("OLEDBProvider") = "SQLNCLI" // SQLNCLI for SQL Server 2005, SQLNCLI10 for newer version.
		  
		  // connect to database
		  // in this example it is Oracle,
		  // but can also be Sybase, Informix, DB2
		  // SQLServer, InterBase, SQLBase and ODBC
		  
		  // server format should be:
		  // PcName\SqlServerInstanceName@DatabaseName
		  
		  db.DatabaseName="SQLServer:PcName\SqlServerInstanceName@DatabaseName"
		  db.UserName="xxx"
		  db.Password="yyy"
		  
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
