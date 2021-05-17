#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim j as JavaConnectionMBS
		  dim d as JavaDatabaseMBS
		  dim r as JavaResultSetMBS
		  dim f as FolderItem=SpecialFolder.desktop.Child("sqlite-jdbc-3.8.11.2.jar")
		  
		  if not f.Exists then
		    MsgBox "Missing sqlite connector classes!"
		    Return
		  end if
		  
		  if TargetLinux then
		    // change path for your linux PC!
		    'JavaVMMBS.SetLibraryPath("/home/cs/jre1.6.0_05/lib/i386/client/libjvm.so")
		  end if
		  
		  dim v as new JavaVMMBS(f)
		  d=new JavaDatabaseMBS(v,"org.sqlite.JDBC")
		  
		  j=d.getConnection("jdbc:sqlite:/Users/cs/Desktop/test.sqlite")
		  
		  if j<>Nil then
		    r=j.MySelectSQLwithPreparedStatement("SELECT * from Documentation")
		    
		    // convert to JSON and measure
		    dim t1 as Double = Microseconds
		    dim jj as JSONMBS = ToJSON(r, j)
		    dim t2 as Double = Microseconds
		    
		    // write to file
		    dim dd as new date
		    dim ff as FolderItem = GetFolderItem("json "+dd.SQLDateTime.ReplaceAll(":", "-")+".txt")
		    dim t as TextOutputStream = TextOutputStream.Create(ff)
		    t.WriteLine jj.toString
		    t.WriteLine str((t2-t1)/1000000.0, "0.0")+ " seconds"
		    t.Close
		    
		    MsgBox "done."
		    
		    r=nil
		    
		    
		  else
		    MsgBox "not connected"
		  end if
		  
		  Exception e as JavaExceptionMBS
		    MsgBox e.message+" errorcode: "+str(e.ErrorNumber)
		    
		    
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function ToJSON(jrs as JavaResultSetMBS, con as JavaConnectionMBS) As JSONMBS
		  #pragma DisableBackgroundTasks true
		  
		  //This method receive a JavaResultSetMBS as input parameter and convert it
		  //into a JSONMBS object in which there's an array node called "Recordset"
		  //Each node of the "Recordset" rappresents a Record with its field name and value
		  
		  dim result as JSONMBS = JSONMBS.NewObjectNode
		  dim recordset as JSONMBS = JSONMBS.NewArrayNode
		  dim recordCount as Integer
		  dim columnCount as Integer
		  
		  if jrs<>Nil then
		    
		    dim db as JavaConnectionMBS = con
		    dim typeBIT as integer = db.typeBIT
		    dim typeDOUBLE as integer = db.typeDOUBLE
		    dim typeFLOAT as integer = db.typeFLOAT
		    dim typeINTEGER as integer = db.typeINTEGER
		    dim typeNULL as integer = db.typeNULL
		    dim typeREAL as integer = db.typeREAL
		    dim typeSMALLINT as integer = db.typeSMALLINT
		    dim typeTINYINT as integer = db.typeTINYINT
		    
		    //With getMetaData get the properties of recordset
		    dim jrsMetaData as JavaResultSetMetaDataMBS = jrs.getMetaData
		    columnCount = jrsMetaData.getColumnCount
		    
		    // get column types and names
		    dim columnTypes() as integer
		    dim columnNames() as string
		    
		    redim columnTypes(columnCount)
		    redim columnNames(columnCount)
		    
		    For c as Integer = 1 to columnCount
		      columnTypes(c) = jrsMetaData.getColumnType(c)
		      columnNames(c) = jrsMetaData.getColumnName(c)
		    Next
		    
		    //For each record into the recordset
		    while jrs.NextRecord
		      
		      //We increment the local variable "recordCount" to use it at the end
		      //of the records browsing cycle for the "RecordCount" node
		      recordCount = recordCount + 1
		      
		      //We create a node for the record
		      dim record as JSONMBS = JSONMBS.NewObjectNode
		      
		      For c as Integer = 1 to columnCount
		        
		        dim columnType as integer = columnTypes(c)
		        dim columnName as string = columnNames(c)
		        
		        select case columnType
		        case typeNULL
		          // null
		          dim sj as JSONMBS = JSONMBS.NewNullNode
		          record.AddItemToObject columnName, sj
		        case typeDOUBLE, typeFLOAT, typeREAL, typeINTEGER, typeTINYINT, typeSMALLINT
		          // double
		          dim v as double = jrs.getDouble(c)
		          dim sj as JSONMBS = JSONMBS.NewNumberNode(v)
		          record.AddItemToObject columnName, sj
		        case typeBIT
		          // boolean
		          dim v as Boolean = jrs.getBoolean(c)
		          dim sj as JSONMBS = JSONMBS.NewBoolNode(v)
		          record.AddItemToObject columnName, sj
		        else
		          // all others as string
		          dim v as string = jrs.getString(c)
		          dim sj as JSONMBS = JSONMBS.NewStringNode(v)
		          record.AddItemToObject columnName, sj
		        end Select
		      Next
		      
		      //We add the "record" node to the recordset array node
		      recordset.AddItemToArray(record)
		      
		    wend
		    
		    //We add the "recordset" node to the JSONMBS result
		    result.AddItemToObject "Recordset", recordset
		    
		  end if
		  
		  //We add the two nodes with column count and records count
		  result.AddItemToObject "ColumnCount", JSONMBS.NewNumberNode(columnCount)
		  result.AddItemToObject "RecordCount", JSONMBS.NewNumberNode(recordCount)
		  
		  Return result
		  
		  //Java Exception
		  Exception e as JavaExceptionMBS
		End Function
	#tag EndMethod


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
