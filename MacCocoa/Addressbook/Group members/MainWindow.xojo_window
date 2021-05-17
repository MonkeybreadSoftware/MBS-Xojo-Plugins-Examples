#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   512
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   -1187931339
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Groups and Members"
   Visible         =   True
   Width           =   520
   Begin ListBox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   False
      ColumnWidths    =   "50%"
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
      Height          =   499
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Name	Email"
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
      UseFocusRing    =   True
      Visible         =   True
      Width           =   522
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  List.DeleteAllRows // remove references to objects before ABAddressBookMBS object is destroyed
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  a=new abAddressbookMBS
		  
		  dim ga() as ABGroupMBS = a.groups
		  
		  for each g as ABGroupMBS in ga 
		    AddGroup g
		  next
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddGroup(g as abgroupmbs)
		  dim name as string
		  
		  name=g.valueForProperty(a.kABGroupNameProperty)
		  
		  List.AddFolder name
		  List.celltag(List.LastIndex,0)=g
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddPerson(p as abpersonmbs)
		  dim name,email as string
		  dim emails as ABMultiValueMBS
		  
		  name=p.valueForProperty(a.kABFirstNameProperty)+" "+p.valueForProperty(a.kABLastNameProperty)
		  
		  if name = " " then
		    name = p.valueForProperty(a.kABOrganizationProperty)
		  end if
		  
		  List.AddRow name
		  List.celltag(List.LastIndex,0)=p
		  
		  emails=p.valueForProperty(a.kABEmailProperty)
		  if emails<>Nil then
		    email=emails.valueAtIndex(emails.indexForIdentifier(emails.primaryIdentifier))
		    List.cell(List.LastIndex,1)=email
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub search()
		  'dim s as ABGroupMBS
		  'dim p as ABPersonMBS
		  'dim pa as ABPersonArrayMBS
		  'dim i,c,l as integer
		  'dim m as ABMultiMBS
		  'dim id as CFStringMBS
		  'dim index as integer
		  'dim z,t as string
		  'dim tt as CFStringMBS
		  '
		  '// this time we let the Addressbook search for a matching email address
		  '
		  'list.deleteallrows
		  't=PopupMenu1.RowTag(PopupMenu1.ListIndex)
		  ''setstringEncoding t,0
		  'if t<>"" then
		  'tt=NewCFStringMBS(t)
		  's=a.Group(tt)
		  '
		  'if s<>nil then
		  'pa=s.AllMembers
		  'if pa<>nil then
		  'c=pa.count-1
		  'for i=0 to c
		  'p=pa.Person(i)
		  'if p<>nil then
		  't=st(p.GetValue(a.kabfirstNameProperty))+" "+st(p.getValue(a.kablastNameProperty))
		  ''msgBox str(len(T))+" "+str(lenb(t))+" "+t
		  ''setstringEncoding t,256 // Fix bug in RB 4.5b3
		  'list.addrow t
		  'l=list.lastIndex
		  'm=p.getmultiValue(a.kABEmailProperty)
		  'if m<>nil then
		  'id=m.PrimaryIdentifier
		  'if id<>Nil then
		  'index=m.IndexForIdentifier(id)
		  'list.cell(l,1)=st(m.Value(index))
		  'end if
		  'end if
		  'end if
		  'next
		  'else
		  'beep
		  'end if
		  'else
		  'beep
		  'end if
		  'else
		  'beep
		  'end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		a As abaddressbookMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub ExpandRow(row As Integer)
		  dim o as ABGroupMBS
		  
		  o=me.CellTag(row,0)
		  
		  if o<>Nil then
		    dim ga() as ABGroupMBS = o.subgroups
		    for each g as ABGroupMBS in ga
		      AddGroup g
		    next
		    
		    dim pa() as ABPersonMBS = o.members
		    for each p as ABPersonMBS in pa
		      AddPerson p
		    next
		    
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
