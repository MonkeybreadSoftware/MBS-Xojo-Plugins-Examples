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
   Title           =   "Keychain"
   Top             =   0
   Begin MobileButton mbAdd
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   mbAdd, 9, <Parent>, 9, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   mbAdd, 7, , 0, False, +1.00, 4, 1, 178, , True
      AutoLayout      =   mbAdd, 3, <Parent>, 3, False, +1.00, 4, 1, 121, , True
      AutoLayout      =   mbAdd, 8, , 0, False, +1.00, 4, 1, 30, , True
      Caption         =   "Add Password"
      CaptionColor    =   &c007AFF00
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   71
      LockedInPosition=   False
      Scope           =   2
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   ""
      Top             =   121
      Visible         =   True
      Width           =   178
   End
   Begin MobileButton mbGet
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   mbGet, 7, , 0, False, +1.00, 4, 1, 178, , True
      AutoLayout      =   mbGet, 9, <Parent>, 9, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   mbGet, 3, <Parent>, 3, False, +1.00, 4, 1, 255, , True
      AutoLayout      =   mbGet, 8, , 0, False, +1.00, 4, 1, 30, , True
      Caption         =   "Get Password"
      CaptionColor    =   &c007AFF00
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   71
      LockedInPosition=   False
      Scope           =   2
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   ""
      Top             =   255
      Visible         =   True
      Width           =   178
   End
   Begin MobileButton mbUpdate
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   mbUpdate, 9, <Parent>, 9, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   mbUpdate, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   mbUpdate, 3, mbAdd, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      AutoLayout      =   mbUpdate, 7, , 0, False, +1.00, 4, 1, 178, , True
      Caption         =   "Update Password"
      CaptionColor    =   &c007AFF00
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   71
      LockedInPosition=   False
      Scope           =   2
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   ""
      Top             =   159
      Visible         =   True
      Width           =   178
   End
   Begin MobileButton mbDelete
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   mbDelete, 9, <Parent>, 9, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   mbDelete, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   mbDelete, 3, mbUpdate, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      AutoLayout      =   mbDelete, 7, , 0, False, +1.00, 4, 1, 178, , True
      Caption         =   "Delete Password"
      CaptionColor    =   &c007AFF00
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   71
      LockedInPosition=   False
      Scope           =   2
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   ""
      Top             =   197
      Visible         =   True
      Width           =   178
   End
   Begin MobileLabel Label1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   Label1, 1, <Parent>, 1, False, +1.00, 4, 1, 8, , True
      AutoLayout      =   Label1, 7, , 0, False, +1.00, 4, 1, 302, , True
      AutoLayout      =   Label1, 4, <Parent>, 4, False, +1.00, 4, 1, -*kStdGapCtlToViewV, , True
      AutoLayout      =   Label1, 8, , 0, False, +1.00, 4, 1, 83, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   83
      Left            =   8
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   2
      Text            =   "Please run on device. \nDoes not work in simulator!"
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   ""
      Top             =   465
      Visible         =   True
      Width           =   302
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub Opening()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub AddPassword()
		  Dim storePasswordDictionary As Dictionary
		  Dim theResult As Variant
		  Dim passwordData As MemoryBlock
		  Dim password, keychainErrorString As String
		  Dim keychainErrorNumber As Integer
		  
		  
		  password = DateTime.Now.SQLDateTime
		  passwordData = password.ConvertEncoding( Encodings.UTF8 )
		  
		  storePasswordDictionary = New Dictionary
		  storePasswordDictionary.value( KeychainManagerMBS.kSecAttrService ) = "de.monkeybreadsoftware.test"
		  'storePasswordDictionary.value( KeychainManagerMBS.kSecAttrAccessGroup ) = "H6CE6NC936.de.monkeybreadsoftware.test"
		  storePasswordDictionary.value( KeychainManagerMBS.kSecAttrAccount ) = "testuser"
		  storePasswordDictionary.value( KeychainManagerMBS.kSecValueData ) = passwordData
		  storePasswordDictionary.value( KeychainManagerMBS.kSecClass ) = KeychainManagerMBS.kSecClassGenericPassword
		  storePasswordDictionary.Value( KeychainManagerMBS.kSecAttrDescription ) = "Secret staff login"
		  storePasswordDictionary.Value( KeychainManagerMBS.kSecAttrLabel ) = "MySecret"
		  storePasswordDictionary.Value( KeychainManagerMBS.kSecAttrAccessible ) = KeychainManagerMBS.kSecAttrAccessibleAfterFirstUnlock
		  
		  // kSecAttrAccessible and kSecAttrAccessControl don't work together
		  
		  If KeychainManagerMBS.AddItem( storePasswordDictionary, theResult ) Then
		    MessageBox( "Added password" )
		  Else
		    keychainErrorNumber = KeychainManagerMBS.LastError
		    keychainErrorString = KeychainManagerMBS.ErrorMessageString( keychainErrorNumber )
		    MessageBox( "Error adding password: "+keychainErrorNumber.ToString+" "+keychainErrorString )
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DeletePassword()
		  Dim storePasswordDictionary As Dictionary
		  Dim keychainErrorString As String
		  Dim keychainErrorNumber As Integer
		  
		  
		  Dim queryDictionary As New Dictionary
		  queryDictionary.value( KeychainManagerMBS.kSecClass ) = KeychainManagerMBS.kSecClassGenericPassword
		  queryDictionary.value( KeychainManagerMBS.kSecAttrService ) = "de.monkeybreadsoftware.test"
		  'queryDictionary.value( KeychainManagerMBS.kSecAttrAccessGroup ) = "H6CE6NC936.de.monkeybreadsoftware.test"
		  queryDictionary.value( KeychainManagerMBS.kSecAttrAccount ) = "testuser"
		  
		  If KeychainManagerMBS.DeleteItem( queryDictionary ) Then
		    MessageBox( "Deleted password" )
		  Else
		    keychainErrorNumber = KeychainManagerMBS.LastError
		    keychainErrorString = KeychainManagerMBS.ErrorMessageString( keychainErrorNumber )
		    MessageBox( "Error deleting password: "+keychainErrorNumber.ToString+" "+keychainErrorString )
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GetPassword()
		  Dim queryDictionary As Dictionary
		  Dim passwordData As MemoryBlock
		  Dim password, keychainErrorString As String
		  Dim keychainErrorNumber As Integer
		  
		  // Build query
		  queryDictionary = New Dictionary
		  queryDictionary.value( KeychainManagerMBS.kSecClass ) = KeychainManagerMBS.kSecClassGenericPassword
		  'queryDictionary.value( KeychainManagerMBS.kSecAttrAccessGroup ) = "H6CE6NC936.de.monkeybreadsoftware.test"
		  queryDictionary.Value( KeychainManagerMBS.kSecMatchLimit ) = KeychainManagerMBS.kSecMatchLimitOne
		  queryDictionary.value( KeychainManagerMBS.kSecAttrService ) = "de.monkeybreadsoftware.test"
		  queryDictionary.value( KeychainManagerMBS.kSecAttrAccount ) = "testuser"
		  
		  
		  // Fetch item from keychain
		  If KeychainManagerMBS.GetPassword( queryDictionary, passwordData ) Then
		    Dim data As String = passwordData
		    password = data.DefineEncoding( Encodings.UTF8 )
		    MessageBox( "Got password: "+password )
		  Else
		    keychainErrorNumber = KeychainManagerMBS.LastError
		    keychainErrorString = KeychainManagerMBS.ErrorMessageString( keychainErrorNumber )
		    
		    MessageBox( "Error getting password: "+keychainErrorNumber.ToString+" "+keychainErrorString )
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdatePassword()
		  Dim storePasswordDictionary As Dictionary
		  Dim passwordData As MemoryBlock
		  Dim password, keychainErrorString As String
		  Dim keychainErrorNumber As Integer
		  
		  password = DateTime.Now.SQLDateTime
		  passwordData = password.ConvertEncoding( Encodings.UTF8 )
		  
		  
		  Dim queryDictionary As New Dictionary
		  queryDictionary.value( KeychainManagerMBS.kSecClass ) = KeychainManagerMBS.kSecClassGenericPassword
		  queryDictionary.value( KeychainManagerMBS.kSecAttrService ) = "de.monkeybreadsoftware.test"
		  'queryDictionary.value( KeychainManagerMBS.kSecAttrAccessGroup ) = "H6CE6NC936.de.monkeybreadsoftware.test"
		  queryDictionary.value( KeychainManagerMBS.kSecAttrAccount ) = "testuser"
		  
		  storePasswordDictionary = New Dictionary
		  storePasswordDictionary.value( KeychainManagerMBS.kSecValueData ) = passwordData
		  
		  If KeychainManagerMBS.UpdateItem( queryDictionary, storePasswordDictionary ) Then
		    MessageBox( "Updated password" )
		  Else
		    keychainErrorNumber = KeychainManagerMBS.LastError
		    keychainErrorString = KeychainManagerMBS.ErrorMessageString( keychainErrorNumber )
		    MessageBox( "Error updating password: "+keychainErrorNumber.ToString+" "+keychainErrorString )
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private n As NSExceptionMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events mbAdd
	#tag Event
		Sub Pressed()
		  AddPassword
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events mbGet
	#tag Event
		Sub Pressed()
		  GetPassword
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events mbUpdate
	#tag Event
		Sub Pressed()
		  UpdatePassword
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events mbDelete
	#tag Event
		Sub Pressed()
		  DeletePassword
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
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
#tag EndViewBehavior
