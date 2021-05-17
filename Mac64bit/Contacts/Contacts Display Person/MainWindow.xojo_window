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
   Begin Listbox List
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
      Height          =   327
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
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
      Top             =   53
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
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
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Name:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   21
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin TextField namefield
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   132
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Peter"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   310
   End
   Begin PushButton SearchButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Search a person"
      Default         =   True
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   454
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   21
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   126
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  m = new MyContactStore
		  
		  ShowAuthorization
		  
		  m.requestAccessForEntityType m.CNEntityTypeContacts
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Address(p as CNPostalAddressMBS) As string
		  // create a list of text values with comma inbetween
		  
		  Dim texts() As String
		  
		  Dim Street As String = p.Street
		  If Street.Len > 0 Then
		    texts.Append street
		  end if
		  
		  
		  Dim PostalCode As String = p.PostalCode
		  Dim City As String = p.City
		  Dim PostalCodeCity() As String
		  
		  If PostalCode.Len > 0 Then // have a zip?
		    PostalCodeCity.Append PostalCode
		  End If
		  
		  If City.Len > 0 Then
		    PostalCodeCity.Append City
		  End If
		  
		  // join zip and city if we have at least one of them
		  If PostalCodeCity.Ubound >= 0 Then
		    texts.Append Join(PostalCodeCity, " ")
		  End If
		  
		  
		  Dim Country As String = p.Country
		  If Country.Len > 0 Then
		    texts.Append Country
		  End If
		  
		  
		  Return Join(texts, ", ")
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Log(s as string)
		  list.AddRow s
		  list.ScrollPosition = list.ListCount
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowAuthorization()
		  dim x as integer = m.authorizationStatusForEntityType(m.CNEntityTypeContacts)
		  
		  Select case x
		  case m.CNAuthorizationStatusAuthorized
		    log "Authorization status: Authorized"
		    SearchButton.Enabled = true
		  case m.CNAuthorizationStatusDenied
		    log "Authorization status: Denied"
		  case m.CNAuthorizationStatusNotDetermined
		    log "Authorization status: Not Determined"
		  case m.CNAuthorizationStatusRestricted
		    log "Authorization status: Restricted"
		    SearchButton.Enabled = true
		  else
		    log "Authorization status: "+str(x)
		    break
		  end Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub showValue(c as CNContactMBS, Key as string)
		  If key.Len = 0 Then Return
		  
		  if c.isKeyAvailable(key) then
		    
		    dim v as Variant = c.valueForKey(key)
		    dim l as string = c.localizedStringForKey(key)
		    if l = "" then
		      l = key
		    end if
		    
		    dim type as integer = v.Type
		    
		    Select case Type
		      
		    case Variant.TypeNil
		      // nothing to report
		      
		      #if RBVersion < 2013 then
		    case Variant.TypeInteger, Variant.TypeLong
		      #else
		    case Variant.TypeInt32, Variant.TypeInt64
		      #endif
		      
		      // just some number
		      List.AddRow l + ": " + v.StringValue
		      
		    case Variant.TypeString
		      
		      // just some text
		      dim t as string = v.StringValue
		      if t <> "" then
		        List.AddRow l + ": " + t
		      end if
		      
		    case Variant.TypeObject
		      
		      
		      If v IsA NSDateComponentsMBS Then
		        
		        Dim n As NSDateComponentsMBS = v
		        List.AddRow l + ": " + n.description
		      Elseif v IsA MemoryBlock then
		        // ignore image data
		        
		      Else
		        // something not handled?
		        Break
		      End If
		      
		    case Variant.TypeObject + Variant.TypeArray
		      
		      dim items() as string
		      dim values() as Object = v
		      if values.Ubound < 0 then Return // empty
		      
		      for each obj as Variant in values
		        
		        If obj IsA CNPhoneNumberMBS Then
		          Dim p As CNPhoneNumberMBS = obj
		          items.Append p.stringValue
		        Elseif obj IsA CNPostalAddressMBS Then
		          Dim p As CNPostalAddressMBS = obj
		          items.Append address(p)
		          
		        Elseif obj IsA CNLabeledValueMBS Then
		          Dim lv As CNLabeledValueMBS = obj
		          Dim va As Variant = lv.Value
		          Dim sa As String
		          
		          If va IsA CNPostalAddressMBS Then
		            Dim po As CNPostalAddressMBS = va
		            sa = address(po)
		          Elseif va IsA CNPhoneNumberMBS Then
		            Dim pn As CNPhoneNumberMBS = va
		            sa = pn.stringValue
		          Elseif va IsA CNInstantMessageAddressMBS Then
		            Dim im As CNInstantMessageAddressMBS = va
		            sa = im.service+": "+im.username
		          Elseif va IsA CNSocialProfileMBS Then
		            Dim sp As CNSocialProfileMBS = va
		            sa = sp.service+": "+sp.username
		          Elseif va IsA CNContactRelationMBS Then
		            Dim cr As CNContactRelationMBS = va
		            sa = cr.Name
		          Elseif va IsA NSDateComponentsMBS Then
		            Dim n As NSDateComponentsMBS = va
		            sa = n.description
		          Else
		            sa = va.StringValue
		          end if
		          
		          items.Append lv.localizedStringForLabel(lv.Label)+": "+sa
		          
		        else
		          
		          // something not handled?
		          Break
		          
		        end if
		        
		      next
		      List.AddRow l + ": " + Join(items, ", ")
		      
		    else
		      
		      // something not handled?
		      Break
		      
		    end Select
		    
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		m As MyContactStore
	#tag EndProperty


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub ExpandRow(row As Integer)
		  dim c as CNContactMBS = me.RowTag(row)
		  
		  if c = nil then 
		    break
		    return
		  end if
		  
		  // you could use properties directly
		  dim familyName as string = C.familyName
		  
		  // but we simply try generically all keys
		  showValue c, c.CNContactNamePrefixKey
		  showValue c, c.CNContactGivenNameKey
		  showValue c, c.CNContactMiddleNameKey
		  showValue c, c.CNContactFamilyNameKey
		  showValue c, c.CNContactPreviousFamilyNameKey
		  showValue c, c.CNContactNameSuffixKey
		  showValue c, c.CNContactNicknameKey
		  showValue c, c.CNContactPhoneticGivenNameKey
		  showValue c, c.CNContactPhoneticMiddleNameKey
		  showValue c, c.CNContactPhoneticFamilyNameKey
		  showValue c, c.CNContactOrganizationNameKey
		  showValue c, c.CNContactDepartmentNameKey
		  showValue c, c.CNContactJobTitleKey
		  showValue c, c.CNContactBirthdayKey
		  showValue c, c.CNContactNonGregorianBirthdayKey
		  showValue c, c.CNContactNoteKey
		  showValue c, c.CNContactImageDataKey
		  showValue c, c.CNContactThumbnailImageDataKey
		  showValue c, c.CNContactImageDataAvailableKey
		  showValue c, c.CNContactPhoneNumbersKey
		  showValue c, c.CNContactEmailAddressesKey
		  showValue c, c.CNContactPostalAddressesKey
		  showValue c, c.CNContactDatesKey
		  showValue c, c.CNContactUrlAddressesKey
		  showValue c, c.CNContactRelationsKey
		  showValue c, c.CNContactSocialProfilesKey
		  showValue c, c.CNContactInstantMessageAddressesKey
		  showValue c, c.CNContactIdentifierKey
		  showValue c, c.CNContactTypeKey
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SearchButton
	#tag Event
		Sub Action()
		  List.DeleteAllRows
		  
		  dim contacts() as CNContactMBS 
		  dim predicate as NSPredicateMBS
		  dim keysToFetch() as CNKeyDescriptorMBS
		  dim error as NSErrorMBS
		  
		  // we simply ask for all keys which the vcard would also use
		  keysToFetch.append CNContactVCardSerializationMBS.descriptorForRequiredKeys
		  'keysToFetch.Append CNContactMBS.CNContactOrganizationNameKey
		  
		  dim parts() as string = split(namefield.Text, " ")
		  
		  for each part as string in parts
		    
		    part = trim(part)
		    if part.len > 0 then
		      Dim p As NSPredicateMBS = CNContactMBS.predicateForContactsMatchingName(part)
		      If p = Nil Then
		        // failed?
		      Elseif predicate = Nil Then
		        // first one
		        predicate = p
		      else
		        // combine with AND
		        predicate = NSCompoundPredicateMBS.andPredicateWithSubpredicates(array(predicate, p))
		      end if
		    end if
		  next
		  
		  if true then
		    
		    // 1. unifiedContactsMatchingPredicate
		    contacts = m.unifiedContactsMatchingPredicate(predicate, keysToFetch, error)
		    
		  else
		    
		    // 2. ContactsWithFetchRequest
		    dim fr as new CNContactFetchRequestMBS(keysToFetch)
		    fr.predicate = predicate
		    fr.mutableObjects = false
		    fr.unifyResults = true
		    
		    contacts = m.ContactsWithFetchRequest(fr, error)
		    
		  end if
		  
		  List.AddRow str(contacts.Ubound+1)+" contacts found"
		  if error <> nil then
		    List.AddRow "Error: "+error.LocalizedDescription
		  end if
		  
		  dim formatter as new CNContactFormatterMBS
		  
		  for each contact as CNContactMBS in contacts
		    
		    List.AddFolder formatter.stringFromContact(contact)
		    List.RowTag(List.LastIndex) = contact
		    
		    
		  next
		  
		  // exapand first one
		  if list.listcount > 1 then
		    List.Expanded(1) = true
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
