#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  // Create Database Object
		  OrdersDB = New SQLDatabaseMBS
		  
		  // where is the library?
		  OrdersDB.SetFileOption SQLConnectionMBS.kOptionLibrarySQLite, getfolderitem("/usr/lib/libsqlite3.0.dylib", folderitem.PathTypeShell)
		  
		  dim file as FolderItem = FindFile("Orders.rsd")
		  
		  // Set Database File
		  
		  #if RBVersion >= 2013 then
		    // Xojo
		    OrdersDB.DatabaseName="sqlite:"+file.NativePath
		  #else
		    // Real Studio
		    OrdersDB.DatabaseName="sqlite:"+file.unixpathMBS
		  #endif
		  
		  
		  // Connect to the database
		  if OrdersDB.Connect() then
		    SampleReports.Show
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


	#tag Property, Flags = &h0
		OrdersDB As SQLDatabaseMBS
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
