#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Dim JDBCDriver as FolderItem = FindFile("JDBCDriver")
		  
		  // Folder JDBCDriver is scanned looking for JAR files
		  if JDBCDriver.Exists then
		    GetJarList(JDBCDriver)
		  end if
		  
		  // put in files like this:
		  // 
		  // + JDBCDriver
		  //   + SQLite
		  //       sqlite-jdbc-3.7.2.jar
		  //   + MSAccess
		  //       ucanaccess-2.0.9.5.jar
		  //       jackcess-2.1.0.jar
		  //       hsqldb.jar
		  //       commons-logging-1.1.1.jar
		  //       commons-lang-2.6.jar
		  
		  // build list of jars
		  Dim Libraries() as String
		  Dim Sep as String
		  
		  #If TargetMacOS Then
		    Sep = ":"
		  #Else
		    Sep = ";"
		  #EndIf
		  
		  For Each Element as FolderItem in JarList
		    dim path as string = Element.NativePathX
		    Libraries.Append path
		  Next
		  
		  // VM creation with all path of JAR files
		  
		  dim LibraryList as string = Join(Libraries, sep)
		  VM = New JavaVMMBS(LibraryList)
		  
		  // now you can use databases
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub GetJarList(Folder as FolderItem)
		  
		  For i as Integer = 1 To Folder.Count
		    dim item as FolderItem = folder.TrueItem(i)
		    
		    if item.Directory Then 
		      GetJarList(item)
		    elseif Right(Folder.Item(i).Name, 3) = "JAR" Then 
		      JarList.Append item
		    end if
		  Next
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		
		This is an example showing how to use JavaDatabaseMBS class with several JDBC drivers.
		
		based on work from Pietro Beccegato <pbeccegato@divcon.ch>
		
	#tag EndNote


	#tag Property, Flags = &h0
		JarList() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		VM As JavaVMMBS
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
