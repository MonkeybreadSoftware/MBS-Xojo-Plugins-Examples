#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim j as JavaConnectionMBS
		  dim d as JavaDatabaseMBS
		  dim r as JavaResultSetMBS
		  dim f as FolderItem=SpecialFolder.desktop.Child("sqlitejdbc-v056.jar")
		  
		  if not f.Exists then
		    MsgBox "Missing sqlite connector classes!"
		    Return
		  end if
		  
		  if TargetLinux then
		    // change path for your linux PC!
		    JavaVMMBS.SetLibraryPath("/home/cs/jre1.6.0_05/lib/i386/client/libjvm.so")
		  end if
		  
		  dim v as new JavaVMMBS(f)
		  d=new JavaDatabaseMBS(v,"org.sqlite.JDBC")
		  
		  j=d.getConnection("jdbc:sqlite:test.db")
		  
		  if j<>Nil then
		    // call j.prepareStatement("CREATE DATABASE JunkDB").execute
		    
		    j.MyExecuteSQL "DROP TABLE myTable"
		    j.MyExecuteSQL "CREATE TABLE myTable(test_id int, test_val char(15) not null, PRIMARY KEY (test_id))"
		    j.MyExecuteSQL "INSERT INTO myTable(test_id, test_val) VALUES(1,'One')"
		    j.MyExecuteSQL "INSERT INTO myTable(test_id, test_val) VALUES(2,'Two')"
		    j.MyExecuteSQL "INSERT INTO myTable(test_id, test_val) VALUES(3,'Three')"
		    j.MyExecuteSQL "INSERT INTO myTable(test_id, test_val) VALUES(4,'Four')"
		    j.MyExecuteSQLwithPreparedStatement "INSERT INTO myTable(test_id, test_val) VALUES(5,'Five')"
		    
		    // check second entry
		    r=j.MySelectSQLwithPreparedStatement("SELECT * from myTable")
		    
		    if r<>Nil then
		      MsgBox str(R.getInt("test_id"))+" "+r.getString("test_val")
		    else
		      MsgBox "r is nil"
		    end if
		    
		    r=nil
		    
		    // check all rows
		    r=j.MySelectSQL("SELECT * from myTable")
		    
		    if r<>Nil then
		      while r.NextRecord
		        MsgBox str(R.getInt("test_id"))+" "+r.getString("test_val")
		      wend
		    else
		      MsgBox "r is nil"
		    end if
		    
		    r=nil
		    MsgBox "OK"
		  else
		    MsgBox "not connected"
		  end if
		  
		  Exception e as JavaExceptionMBS
		    MsgBox e.message+" errorcode: "+str(e.ErrorNumber)
		    
		    
		End Sub
	#tag EndEvent


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
