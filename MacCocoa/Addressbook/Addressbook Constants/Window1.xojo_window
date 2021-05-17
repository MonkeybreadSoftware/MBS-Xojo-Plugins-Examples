#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   502
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   -1074324247
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Addressbook Constants"
   Visible         =   True
   Width           =   586
   Begin ListBox ListBox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   3
      ColumnsResizable=   True
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   489
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Name	Value	Localized"
      Italic          =   False
      Left            =   -1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   -1
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   588
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  
		  a=new ABAddressbookMBS
		  
		  Add a.kABAddressCityKey,"kABAddressCityKey"
		  Add a.kABAddressCountryCodeKey,"kABAddressCountryCodeKey"
		  Add a.kABAddressCountryKey,"kABAddressCountryKey"
		  Add a.kABAddressHomeLabel,"kABAddressHomeLabel"
		  Add a.kABAddressProperty,"kABAddressProperty"
		  Add a.kABAddressStateKey,"kABAddressStateKey"
		  Add a.kABAddressStreetKey,"kABAddressStreetKey"
		  Add a.kABAddressWorkLabel,"kABAddressWorkLabel"
		  Add a.kABAddressZIPKey,"kABAddressZIPKey"
		  Add a.kABAIMHomeLabel,"kABAIMHomeLabel"
		  Add a.kABAIMInstantProperty,"kABAIMInstantProperty"
		  Add a.kABAIMWorkLabel,"kABAIMWorkLabel"
		  Add a.kABAnniversaryLabel,"kABAnniversaryLabel"
		  Add a.kABAssistantLabel,"kABAssistantLabel"
		  Add a.kABBirthdayProperty,"kABBirthdayProperty"
		  Add a.kABBrotherLabel,"kABBrotherLabel"
		  Add a.kABCalendarURIsProperty,"kABCalendarURIsProperty"
		  Add a.kABChildLabel,"kABChildLabel"
		  Add a.kABCreationDateProperty,"kABCreationDateProperty"
		  Add a.kABDepartmentProperty,"kABDepartmentProperty"
		  Add a.kABEmailHomeLabel,"kABEmailHomeLabel"
		  Add a.kABEmailProperty,"kABEmailProperty"
		  Add a.kABEmailWorkLabel,"kABEmailWorkLabel"
		  Add a.kABFatherLabel,"kABFatherLabel"
		  Add a.kABFirstNamePhoneticProperty,"kABFirstNamePhoneticProperty"
		  Add a.kABFirstNameProperty,"kABFirstNameProperty"
		  Add a.kABFriendLabel,"kABFriendLabel"
		  Add a.kABGroupNameProperty,"kABGroupNameProperty"
		  Add a.kABHomeLabel,"kABHomeLabel"
		  Add a.kABHomePageLabel,"kABHomePageLabel"
		  Add a.kABHomePageProperty,"kABHomePageProperty"
		  Add a.kABICQHomeLabel,"kABICQHomeLabel"
		  Add a.kABICQInstantProperty,"kABICQInstantProperty"
		  Add a.kABICQWorkLabel,"kABICQWorkLabel"
		  Add a.kABJabberHomeLabel,"kABJabberHomeLabel"
		  Add a.kABJabberInstantProperty,"kABJabberInstantProperty"
		  Add a.kABJabberWorkLabel,"kABJabberWorkLabel"
		  Add a.kABJobTitleProperty,"kABJobTitleProperty"
		  Add a.kABLastNamePhoneticProperty,"kABLastNamePhoneticProperty"
		  Add a.kABLastNameProperty,"kABLastNameProperty"
		  Add a.kABMaidenNameProperty,"kABMaidenNameProperty"
		  Add a.kABManagerLabel,"kABManagerLabel"
		  Add a.kABMiddleNamePhoneticProperty,"kABMiddleNamePhoneticProperty"
		  Add a.kABMiddleNameProperty,"kABMiddleNameProperty"
		  Add a.kABModificationDateProperty,"kABModificationDateProperty"
		  Add a.kABMotherLabel,"kABMotherLabel"
		  Add a.kABMSNHomeLabel,"kABMSNHomeLabel"
		  Add a.kABMSNInstantProperty,"kABMSNInstantProperty"
		  Add a.kABMSNWorkLabel,"kABMSNWorkLabel"
		  Add a.kABNicknameProperty,"kABNicknameProperty"
		  Add a.kABNoteProperty,"kABNoteProperty"
		  Add a.kABOrganizationProperty,"kABOrganizationProperty"
		  Add a.kABOtherDatesProperty,"kABOtherDatesProperty"
		  Add a.kABOtherLabel,"kABOtherLabel"
		  Add a.kABParentLabel,"kABParentLabel"
		  Add a.kABPartnerLabel,"kABPartnerLabel"
		  Add a.kABPersonFlags,"kABPersonFlags"
		  Add a.kABPhoneHomeFAXLabel,"kABPhoneHomeFAXLabel"
		  Add a.kABPhoneHomeLabel,"kABPhoneHomeLabel"
		  Add a.kABPhoneMainLabel,"kABPhoneMainLabel"
		  Add a.kABPhoneMobileLabel,"kABPhoneMobileLabel"
		  Add a.kABPhonePagerLabel,"kABPhonePagerLabel"
		  Add a.kABPhoneProperty,"kABPhoneProperty"
		  Add a.kABPhoneWorkFAXLabel,"kABPhoneWorkFAXLabel"
		  Add a.kABPhoneWorkLabel,"kABPhoneWorkLabel"
		  Add a.kABRelatedNamesProperty,"kABRelatedNamesProperty"
		  Add a.kABSisterLabel,"kABSisterLabel"
		  Add a.kABSpouseLabel,"kABSpouseLabel"
		  Add a.kABSuffixProperty,"kABSuffixProperty"
		  Add a.kABTitleProperty,"kABTitleProperty"
		  Add a.kABUIDProperty,"kABUIDProperty"
		  Add a.kABURLsProperty,"kABURLsProperty"
		  Add a.kABWorkLabel,"kABWorkLabel"
		  Add a.kABYahooHomeLabel,"kABYahooHomeLabel"
		  Add a.kABYahooInstantProperty,"kABYahooInstantProperty"
		  Add a.kABYahooWorkLabel,"kABYahooWorkLabel"
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub Add(value as string,text as string)
		  ListBox1.AddRow text
		  ListBox1.Cell(ListBox1.LastIndex,1)=value
		  ListBox1.cell(ListBox1.LastIndex,2)=a.LocalizedPropertyOrLabel(value)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected a As ABAddressbookMBS
	#tag EndProperty


#tag EndWindowCode

#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
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
		Name="Interfaces"
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
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
