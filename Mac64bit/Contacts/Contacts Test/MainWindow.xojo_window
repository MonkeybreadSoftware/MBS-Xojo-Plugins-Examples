#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   381198335
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "ContactsTest"
   Visible         =   True
   Width           =   600
   Begin Listbox Listbox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   328
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Create Contact"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   360
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   116
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  m = new MyContactStore
		  
		  ShowAuthorization
		  
		  m.requestAccessForEntityType m.CNEntityTypeContacts
		  
		  ShowContacts
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Log(s as string)
		  listbox1.AddRow s
		  listbox1.ScrollPosition = listbox1.ListCount
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowAuthorization()
		  dim x as integer = m.authorizationStatusForEntityType(m.CNEntityTypeContacts)
		  
		  Select case x
		  case m.CNAuthorizationStatusAuthorized
		    log "Authorization status: Authorized"
		  case m.CNAuthorizationStatusDenied
		    log "Authorization status: Denied"
		  case m.CNAuthorizationStatusNotDetermined
		    log "Authorization status: Not Determined"
		  case m.CNAuthorizationStatusRestricted
		    log "Authorization status: Restricted"
		  else
		    log "Authorization status: "+str(x)
		    break
		  end Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowContacts()
		  dim keys() as CNKeyDescriptorMBS
		  dim f as new CNContactFetchRequestMBS(keys)
		  
		  dim e as NSErrorMBS
		  dim contacts() as CNContactMBS = m.ContactsWithFetchRequest(f, e)
		  
		  if e <> nil then
		    log "Error fetching contacts: "+e.LocalizedDescription
		  end if
		  
		  log str(UBound(contacts)+1)+" contacts found."
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		m As MyContactStore
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  dim ContactStore as CNContactStoreMBS = m
		  dim logo as Picture = LogoMBS
		  dim LogoData as MemoryBlock = logo.GetData(logo.FormatPNG)
		  
		  dim d as new NSDateComponentsMBS
		  
		  d.year = 2010
		  d.month = 3
		  d.day = 15
		  
		  
		  dim c as new CNMutableContactMBS
		  
		  c.givenName = "Bob"
		  c.familyName = "Miller"
		  c.birthday = d
		  c.contactType = c.CNContactTypeOrganization
		  c.jobTitle = "CEO"
		  c.nickname = "the Boss"
		  c.organizationName = "Great Software LLC"
		  c.note = "loves strawberry cake"
		  c.departmentName = "Executive"
		  c.imageData = LogoData
		  
		  // email
		  dim emails() as CNLabeledValueMBS
		  dim email as new CNLabeledValueMBS(CNLabeledValueMBS.CNLabelWork, "bob@greatsoftware.com")
		  emails.Append email
		  c.setEmailAddresses emails
		  
		  // URL
		  dim URLs() as CNLabeledValueMBS
		  dim URL as new CNLabeledValueMBS(CNLabeledValueMBS.CNLabelURLAddressHomePage, "http://www.greatsoftware.com")
		  URLs.Append URL
		  c.setURLAddresses URLs
		  
		  // Social profiles
		  dim SocialProfiles() as CNLabeledValueMBS
		  dim profile as new CNSocialProfileMBS("http://www.facebook.com", "test", "", CNSocialProfileMBS.CNSocialProfileServiceFacebook)
		  dim SocialProfile as new CNLabeledValueMBS(CNLabeledValueMBS.CNLabelHome, Profile)
		  SocialProfiles.Append SocialProfile
		  c.setSocialProfiles SocialProfiles
		  
		  // Instant Message Addresses
		  dim InstantMessageAddresses() as CNLabeledValueMBS
		  dim InstantMessageAddr as new CNInstantMessageAddressMBS("test", CNInstantMessageAddressMBS.CNInstantMessageServiceFacebook)
		  dim InstantMessageAddresse as new CNLabeledValueMBS(CNLabeledValueMBS.CNLabelHome, InstantMessageAddr)
		  InstantMessageAddresses.Append InstantMessageAddresse
		  c.setInstantMessageAddresses InstantMessageAddresses
		  
		  // Postal Addresses
		  dim PostalAddresses() as CNLabeledValueMBS
		  dim address as new CNMutablePostalAddressMBS
		  address.City = "TestCity"
		  address.PostalCode = "12345"
		  address.Street = "Test Avenue 123"
		  address.State = "NY"
		  address.ISOCountryCode = "US"
		  address.Country = "United States of America"
		  dim PostalAddress as new CNLabeledValueMBS(CNLabeledValueMBS.CNLabelHome, address)
		  PostalAddresses.Append PostalAddress
		  c.setPostalAddresses PostalAddresses
		  
		  // phone
		  dim phonenumbers() as CNLabeledValueMBS
		  dim phonen as new CNPhoneNumberMBS("123456789")
		  dim phone as new CNLabeledValueMBS(CNLabeledValueMBS.CNLabelWork, phonen)
		  phonenumbers.Append phone
		  c.setPhoneNumbers phonenumbers
		  
		  // save
		  dim sr as new CNSaveRequestMBS
		  
		  dim ContainerIdentifier as string = ContactStore.defaultContainerIdentifier
		  sr.addContact c, ContainerIdentifier
		  
		  dim e as NSErrorMBS
		  if ContactStore.executeSaveRequest(sr, e) then
		    MsgBox "Saved"
		  else
		    MsgBox "Failed to save contact"+EndOfLine+EndOfLine+e.localizedDescription
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
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
		InitialValue="True"
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
