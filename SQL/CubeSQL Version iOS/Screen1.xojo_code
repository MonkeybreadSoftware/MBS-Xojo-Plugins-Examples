#tag MobileScreen
Begin MobileScreen Screen1
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   HasNavigationBar=   True
   LargeTitleDisplayMode=   2
   Left            =   0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   "&h00000000"
   Title           =   "CubeSQL Version"
   Top             =   0
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub Opening()
		  // use internal CubeSQL library
		  Call InternalCubeSQLLibraryMBS.Use
		  
		  
		  
		  
		  Dim con As New SQLConnectionMBS
		  
		  
		  Try
		    
		    // connect to database
		    
		    // or use external DLL?
		    // con.Option("CUBESQL.LIBS") = "/Users/cs/Desktop/libcubesql.dylib"
		    con.Option("APPNAME") = "Xojo Test"
		    con.Option("ConnectionTimeout") = "5" // 5 seconds timeout?
		    'con.Option("ConnectionEncryption") = "AES128" // or "AES192" or "AES256"
		    
		    con.Connect("localhost@mydatabase.sqlite","admin","admin",SQLConnectionMBS.kCubeSQLClient)
		    
		    // create table
		    Dim cmd As New SQLCommandMBS
		    
		    cmd.Connection = con
		    cmd.setCommandText("select sqlite_version()",cmd.kCommandTypeSQLStatement)
		    cmd.Execute
		    
		    If cmd.FetchNext then
		      MessageBox "Version: "+cmd.Field(1).asStringValue
		    End If
		    
		    
		    // Disconnect is optional
		    // autodisconnect will ocur in destructor if needed
		    con.Disconnect
		    
		  Catch r As RuntimeException
		    MessageBox r.message
		    
		    // SAConnection::Rollback()
		    // can also throw an exception
		    // (if a network error for example),
		    // we will be ready
		    Try
		      
		      // on error rollback changes
		      con.Rollback
		      
		    Catch rr As runtimeexception
		      MessageBox rr.message
		    End Try
		  End Try
		  
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag ViewBehavior
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
	#tag ViewProperty
		Name="BackButtonCaption"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasNavigationBar"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIcon"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LargeTitleDisplayMode"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="MobileScreen.LargeTitleDisplayModes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabBarVisible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TintColor"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="ColorGroup"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
