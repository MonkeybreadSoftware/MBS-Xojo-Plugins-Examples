#tag IOSView
Begin iosView MainView
   BackButtonTitle =   ""
   Compatibility   =   ""
   LargeTitleMode  =   2
   Left            =   0
   NavigationBarVisible=   False
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   ""
   Top             =   0
   Begin iOSTable myTable
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowRefresh    =   False
      AutoLayout      =   myTable, 1, <Parent>, 1, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   myTable, 2, <Parent>, 2, False, +1.00, 1, 1, -0, , True
      AutoLayout      =   myTable, 3, TopLayoutGuide, 3, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   myTable, 4, BottomLayoutGuide, 4, False, +1.00, 1, 1, 0, , True
      EditingEnabled  =   False
      EditingEnabled  =   False
      EstimatedRowHeight=   -1
      Format          =   1
      Height          =   548.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      SectionCount    =   0
      Top             =   20
      Visible         =   True
      Width           =   320.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  DataSource = new MyTableDataSource
		  
		  myTable.DataSource = DataSource
		  
		  // search for types
		  searchForServicesOfType "_test._tcp."
		  searchForServicesOfType "_smb._tcp."
		  searchForServicesOfType "_afpovertcp._tcp."
		  searchForServicesOfType "_printer._tcp."
		  searchForServicesOfType "_http._tcp."
		  searchForServicesOfType "_presence._tcp."
		  searchForServicesOfType "_whats-my-name._tcp."
		  searchForServicesOfType "_rfb._tcp."
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub searchForServicesOfType(type as text)
		  dim m as new ServiceBrowser
		  m.dataSource = DataSource
		  m.table = myTable
		  
		  // search for domains
		  m.searchForServicesOfType type
		  browsers.Append m
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected browsers() As ServiceBrowser
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected DataSource As MyTableDataSource
	#tag EndProperty


#tag EndWindowCode

#tag ViewBehavior
	#tag ViewProperty
		Name="TabIcon"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="iOSImage"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LargeTitleMode"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="LargeTitleDisplayModes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackButtonTitle"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Text"
		EditorType="MultiLineEditor"
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
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
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
		Name="NavigationBarVisible"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
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
		Name="TabTitle"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Text"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Text"
		EditorType="MultiLineEditor"
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
