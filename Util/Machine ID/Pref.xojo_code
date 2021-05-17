#tag Module
Protected Module Pref
	#tag Method, Flags = &h1
		Protected Function CheckMachineID() As CheckMachineResult
		  // we use those 10 values
		  
		  dim MacAddress     as string = SystemInformationMBS.MACAddressString
		  dim MacModel       as string = SystemInformationMBS.MacModel
		  dim HardDiscSerial as string = SystemInformationMBS.HardDiscSerial
		  dim MacUUID        as string = SystemInformationMBS.MacUUID
		  dim WinProductKey  as string = SystemInformationMBS.WinProductKey
		  dim ComputerName   as string = SystemInformationMBS.ComputerName.trim
		  dim CPUBrandString as String = SystemInformationMBS.CPUBrandString
		  dim Platform       as string = GetPlatform
		  dim ProcessorCount as integer = SystemInformationMBS.ProcessorCount(SystemInformationMBS.kProcessorCountPhysical)
		  dim PhysicalRAM    as Int64 = round(SystemInformationMBS.PhysicalRAM)
		  
		  dim r as RecordSet = db.sqlSelect("SELECT * FROM Machines")
		  
		  if db.Error then
		    dim e as string = db.ErrorMessage
		    break // check in debugger
		    MsgBox e
		    return CheckMachineResult.Error
		  end if
		  
		  dim result as CheckMachineResult
		  dim add as Boolean = false
		  
		  
		  if r = nil or r.EOF then
		    // nothing in table, so add on first run
		    add = true
		    result = CheckMachineResult.FirstLaunch
		    
		  else
		    
		    // have records, so compare
		    
		    result = CheckMachineResult.NewMachine
		    
		    while not r.EOF
		      
		      dim rMacAddress     as string = r.Field("MacAddress").StringValue
		      dim rMacModel       as string = r.Field("MacModel").StringValue
		      dim rHardDiscSerial as string = r.Field("HardDiscSerial").StringValue
		      dim rMacUUID        as string = r.Field("MacUUID").StringValue
		      dim rWinProductKey  as string = r.Field("WinProductKey").StringValue
		      dim rComputerName   as string = r.Field("ComputerName").StringValue
		      dim rCPUBrandString as String = r.Field("CPUBrandString").StringValue
		      dim rPlatform       as string = r.Field("Platform").StringValue
		      dim rProcessorCount as integer = r.Field("ProcessorCount").IntegerValue
		      dim rPhysicalRAM    as Int64 = r.Field("PhysicalRAM").Int64Value
		      
		      dim MatchCount as integer
		      if rMacAddress = MacAddress then
		        MatchCount = MatchCount + 1
		      end if
		      if rMacModel = MacModel then
		        MatchCount = MatchCount + 1
		      end if
		      if rHardDiscSerial = HardDiscSerial then
		        MatchCount = MatchCount + 1
		      end if
		      if rMacUUID = MacUUID then
		        MatchCount = MatchCount + 1
		      end if
		      if rWinProductKey = WinProductKey then
		        MatchCount = MatchCount + 1
		      end if
		      if rComputerName = ComputerName then
		        MatchCount = MatchCount + 1
		      end if
		      if rCPUBrandString = CPUBrandString then
		        MatchCount = MatchCount + 1
		      end if
		      if rPlatform = Platform then
		        MatchCount = MatchCount + 1
		      end if
		      if rProcessorCount = ProcessorCount then
		        MatchCount = MatchCount + 1
		      end if
		      if rPhysicalRAM = PhysicalRAM then
		        MatchCount = MatchCount + 1
		      end if
		      
		      if MatchCount = 10 then
		        // all matched, so it's okay.
		        return CheckMachineResult.Accepted
		      elseif MatchCount = 9 then
		        // one changed, so lets update database, unless we find perfect match
		        add = true
		        result = CheckMachineResult.Accepted
		      end if
		      
		      
		      
		      r.MoveNext
		    wend
		    
		    
		    
		  end if
		  
		  
		  
		  
		  if add then
		    // add new configuration
		    
		    dim d as new DatabaseRecord
		    d.Column("MacAddress") = MacAddress
		    d.Column("MacModel") = MacModel
		    d.Column("HardDiscSerial") = HardDiscSerial
		    d.Column("MacUUID") = MacUUID
		    d.Column("WinProductKey") = WinProductKey
		    d.Column("CPUBrandString") = CPUBrandString
		    d.Column("ComputerName") = ComputerName
		    d.Column("MacUUID") = MacUUID
		    d.IntegerColumn("ProcessorCount") = ProcessorCount
		    d.Int64Column("PhysicalRAM") = PhysicalRAM
		    d.Column("Platform") = Platform
		    
		    db.InsertRecord("Machines", d)
		    
		    if db.Error then
		      dim e as string = db.ErrorMessage
		      break // check in debugger
		      MsgBox e
		      return CheckMachineResult.Error
		      
		    end if
		  end if
		  
		  
		  
		  return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetPlatform() As string
		  #if TargetWindows then
		    return "Windows"
		  #elseif TargetMacOS then
		    return "MacOS"
		  #elseif TargetIOS then
		    return "iOS"
		  #elseif TargetLinux then
		    return "Linux"
		  #else
		    ?
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init()
		  dic = new Dictionary
		  
		  // define in PrefFilename the name of the preferences file
		  
		  dim file as FolderItem = SpecialFolder.Preferences.Child(PrefFileName)
		  
		  #if RBVersion < 2013 then
		    // in Real Studio
		    dim d as new REALSQLDatabase
		  #else
		    // in Xojo
		    dim d as new SQLiteDatabase
		  #endif
		  
		  if PrefPassword.len > 0 then // you can put in PrefPassword a password for pref file
		    d.EncryptionKey = PrefPassword
		  end if
		  
		  d.DatabaseFile = file
		  
		  if file.Exists then
		    if d.Connect then
		      Pref.db = d
		      ReadTable
		    else
		      dim e as string = D.ErrorMessage
		      break
		    end if
		  else
		    if d.CreateDatabaseFile then
		      // table for preferences
		      d.SQLExecute "CREATE TABLE Pref (Key VARCHAR UNIQUE, Value VARCHAR)"
		      if d.Error then
		        dim e as string = D.ErrorMessage
		        Break
		      end if
		      
		      d.SQLExecute "CREATE TABLE Machines (ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, "+_
		      "MACAddress VARCHAR, MacModel VARCHAR, HardDiscSerial VARCHAR, MacUUID VARCHAR, "+_
		      "WinProductKey VARCHAR, ComputerName VARCHAR, CPUBrandString VARCHAR, Platform VARCHAR, "+_
		      "PhysicalRAM INTEGER, ProcessorCount INTEGER)"
		      if d.Error then
		        dim e as string = D.ErrorMessage
		        Break
		      end if
		      
		      d.Commit
		      Pref.db = d
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
		  
		  
		  dim r as RecordSet = db.SQLSelect("SELECT Key,Value FROM Pref")
		  
		  if db.Error then
		    dim e as string = db.ErrorMessage
		    Break // check in debugger
		    #Pragma Unused e
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

	#tag Method, Flags = &h1
		Protected Sub ResetMachineID()
		  // when new computer, ask customer for license key or activation
		  // than reset table here
		  // and call CheckMachineID again
		  
		  db.SQLExecute "DELETE FROM Machines"
		  
		  
		  if db.Error then
		    dim e as string = db.ErrorMessage
		    break // check in debugger
		    MsgBox e
		    
		  end if
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
		  
		  
		  dim sql as string = "INSERT OR REPLACE INTO Pref (Key, Value) VALUES (?,?)"
		  
		  dim p as PreparedSQLStatement = db.Prepare(sql)
		  
		  p.BindType(0, SQLitePreparedStatement.SQLITE_TEXT)
		  p.BindType(1, SQLitePreparedStatement.SQLITE_TEXT)
		  
		  p.Bind(0, key)
		  p.Bind(1, value)
		  
		  p.SQLExecute
		  
		  if db.Error then
		    dim e as string = db.ErrorMessage
		    Break // check in debugger
		    #Pragma Unused e
		    Return
		  end if
		  
		  
		  
		  dic.Value(key) = value
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		Machine ID v1.0
		
		This example is to show you how to make preferences based on a SQLite database.
		And to show how to do machine id for licsensing.
		
		We check 10 values for a machine.
		We do allow one to change between runs without doing license key or activation again.
		e.g. if user upgrades RAM or switches hard disk, we will still recognize the configuration
		
		
		You may want to fine tune this to your needs.
		
		
		© 2018 by Christian Schmitz
		
	#tag EndNote


	#tag Property, Flags = &h1
		Protected db As SQLiteDatabase
	#tag EndProperty

	#tag Property, Flags = &h21
		Private dic As Dictionary
	#tag EndProperty


	#tag Constant, Name = PrefFilename, Type = String, Dynamic = False, Default = \"MachineIDTestApp.db", Scope = Private
	#tag EndConstant

	#tag Constant, Name = PrefPassword, Type = String, Dynamic = False, Default = \"", Scope = Private
	#tag EndConstant


	#tag Enum, Name = CheckMachineResult, Type = Integer, Flags = &h0
		Unknown = 0
		  FirstLaunch
		  Accepted
		  NewMachine
		Error = -1
	#tag EndEnum


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
