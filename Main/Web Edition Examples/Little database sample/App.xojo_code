#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Sub Open()
		  db = new REALSQLDatabase
		  
		  db.DatabaseFile = SpecialFolder.desktop.Child("registrations.db")
		  
		  if db.DatabaseFile.Exists then
		    
		    if db.Connect then
		      print "Connected to database."
		      // ok
		    else
		      System.DebugLog "Failed to connect to database."
		      quit
		    end if
		    
		  else
		    
		    if db.CreateDatabaseFile then
		      print "Created database."
		      
		      db.SQLExecute "CREATE TABLE Users (Firstname varchar, Lastname varchar, Email varchar)"
		      db.Commit
		      
		    else
		      System.DebugLog "Failed to create database."
		      quit
		    end if
		    
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		db As REALSQLDatabase
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
