#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim f as FolderItem
		  
		  f=SpecialFolder.Desktop.Child("Picture Database.db")
		  
		  db=new REALSQLDatabase
		  db.DatabaseFile=f
		  
		  if f.Exists then
		    if db.Connect then
		      MainWindow.show
		    else
		      MsgBox "Failed to open database file"
		    end if
		  else
		    if db.CreateDatabaseFile then
		      db.SQLExecute "create table pictures (name varchar, pic blob)"
		      if db.Error then
		        MsgBox db.ErrorMessage
		        Return
		      end if
		      
		      mainwindow.show
		    else
		      MsgBox "Failed to create database file"
		    end if
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		DB As REALSQLDatabase
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
