#tag Module
Protected Module Pref
	#tag Method, Flags = &h0
		Sub Init()
		  dic = new Dictionary
		  
		  // define in PrefFilename the name of the preferences file
		  
		  dim file as FolderItem = SpecialFolder.Preferences.Child(PrefFileName)
		  
		  #if RBVersion<2013 then
		    // in Real Studio
		    dim d as new REALSQLDatabase
		  #else
		    // in Xojo
		    dim d as new SQLiteDatabase
		  #endif
		  
		  if PrefPassword.len>0 then // you can put in PrefPassword a password for pref file
		    d.EncryptionKey = PrefPassword
		  end if
		  
		  d.DatabaseFile = file
		  
		  if file.Exists then
		    if d.Connect then
		      dbv = d
		      ReadTable
		    else
		      dim e as string = D.ErrorMessage
		      break
		    end if
		  else
		    if d.CreateDatabaseFile then
		      d.SQLExecute "CREATE TABLE Pref (Key VARCHAR UNIQUE, Value VARCHAR)"
		      if d.Error then
		        dim e as string = D.ErrorMessage
		        Break
		      end if
		      
		      d.Commit
		      dbv = d
		    else
		      dim e as string = D.ErrorMessage
		      break
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReadTable()
		  // values are cached in dictionary in memory for quick read access
		  
		  #if RBVersion<2013 then
		    dim db as REALSQLDatabase = dbv
		  #else
		    dim db as SQLiteDatabase = dbv
		  #endif
		  
		  
		  dim r as RecordSet = db.SQLSelect("SELECT Key,Value FROM Pref")
		  
		  if db.Error then
		    dim e as string = db.ErrorMessage
		    Break
		    Return
		  end if
		  
		  while not r.EOF
		    dim Key as string = r.IdxField(1).StringValue
		    dim Value as string = r.IdxField(2).StringValue
		    
		    dic.Value(key) = value
		    
		    r.MoveNext
		  wend
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(key as string) As Variant
		  // you can query values here
		  
		  Return dic.Lookup(key, nil)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(key as string, assigns value as variant)
		  // you can set value here
		  
		  #if RBVersion<2013 then
		    dim db as REALSQLDatabase = dbv
		  #else
		    dim db as SQLiteDatabase = dbv
		  #endif
		  
		  dim sql as string = "INSERT OR REPLACE INTO Pref (Key, Value) VALUES (?,?)"
		  
		  dim p as PreparedSQLStatement = db.Prepare(sql)
		  
		  #if RBVersion<2013 then
		    p.BindType(0, REALSQLPreparedStatement.SQLITE_TEXT)
		    p.BindType(1, REALSQLPreparedStatement.SQLITE_TEXT)
		  #else
		    p.BindType(0, SQLitePreparedStatement.SQLITE_TEXT)
		    p.BindType(1, SQLitePreparedStatement.SQLITE_TEXT)
		  #endif
		  
		  p.Bind(0, key)
		  p.Bind(1, value)
		  
		  p.SQLExecute
		  
		  if db.Error then
		    dim e as string = db.ErrorMessage
		    Break
		    Return
		  end if
		  
		  
		  
		  dic.Value(key) = value
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		#tag Note
			we store as variant, so you can build this with Real Studio, Xojo or even Realbasic...
			
		#tag EndNote
		Private dbv As Variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private dic As Dictionary
	#tag EndProperty


	#tag Constant, Name = PrefFilename, Type = String, Dynamic = False, Default = \"TestPref.db", Scope = Private
	#tag EndConstant

	#tag Constant, Name = PrefPassword, Type = String, Dynamic = False, Default = \"", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
