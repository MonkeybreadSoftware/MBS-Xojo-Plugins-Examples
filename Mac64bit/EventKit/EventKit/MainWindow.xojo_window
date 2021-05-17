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
   MenuBar         =   1264490495
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "EventKit"
   Visible         =   True
   Width           =   600
   Begin PushButton RequestAccessButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Request Access"
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   130
   End
   Begin PushButton EventsButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Events this month"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   268
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin PushButton NewEventButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Add new event"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   268
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin PushButton NewReminderButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Add new reminder"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   430
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   5
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
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   296
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Calendar	Title	Location	Start	End"
      Italic          =   False
      Left            =   20
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
      ShowDropIndicator=   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   84
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton RemindersButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Reminders this month"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   430
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  #if TargetMacOS and Target64Bit then
		    EventStore = new MyEventStore
		    
		    
		  #else
		    MsgBox "This example is for Xojo 2015r3 with 64-bit app."
		  #endif
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub GotPermissions(entityType as Integer, granted as Boolean)
		  if entityType = EventStore.kEntityTypeEvent then
		    
		    NewEventButton.Enabled = granted
		    EventsButton.Enabled = granted
		    
		  end if
		  
		  if entityType = EventStore.kEntityTypeReminder then
		    NewReminderButton.Enabled = granted
		    RemindersButton.Enabled = granted
		    
		  end if
		  
		  
		  RequestAccessButton.Enabled = not granted
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub updateEvents()
		  List.DeleteAllRows
		  
		  dim startdate as new date
		  
		  startdate.Day = 1
		  startdate.Hour = 0
		  startdate.Minute = 0
		  startdate.Second = 0
		  
		  dim EndDate as new date(startdate)
		  EndDate.Month = EndDate.Month + 1
		  EndDate.Second = EndDate.Second -1 // move to last day
		  
		  'MsgBox startdate.SQLDateTime+" "+EndDate.SQLDateTime
		  
		  dim p as NSPredicateMBS = EventStore.predicateForEvents(startDate, endDate)
		  dim events() as EKEventMBS = EventStore.eventsMatchingPredicate(p)
		  
		  for each e as EKEventMBS in events
		    List.addrow e.calendar.title, e.title, e.location, e.startDate.SQLDateTime, e.endDate.SQLDateTime
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub updateReminders()
		  dim startdate as new date
		  
		  startdate.Day = 1
		  startdate.Hour = 0
		  startdate.Minute = 0
		  startdate.Second = 0
		  
		  dim EndDate as new date(startdate)
		  EndDate.Month = EndDate.Month + 1
		  EndDate.Second = EndDate.Second -1 // move to last day
		  
		  dim Predicate as NSPredicateMBS = EventStore.predicateForIncompleteRemindersWithDueDate(startdate, EndDate)
		  FetchRequest = EventStore.fetchRemindersMatchingPredicate(Predicate)
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		EventStore As MyEventStore
	#tag EndProperty

	#tag Property, Flags = &h0
		FetchRequest As Variant
	#tag EndProperty


#tag EndWindowCode

#tag Events RequestAccessButton
	#tag Event
		Sub Action()
		  me.Enabled = False
		  
		  EventStore.requestAccessToEntityType EventStore.kEntityTypeEvent
		  EventStore.requestAccessToEntityType EventStore.kEntityTypeReminder
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EventsButton
	#tag Event
		Sub Action()
		  updateEvents
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NewEventButton
	#tag Event
		Sub Action()
		  dim r as new EKEventMBS(EventStore)
		  
		  r.calendar = EventStore.defaultCalendarForNewEvents
		  r.title = "Testing EventKit"
		  r.location = "At my Mac"
		  r.startDate = new date
		  
		  dim ed as new date
		  ed.Hour = ed.Hour + 1
		  r.endDate = ed
		  r.notes = "just a test"
		  
		  dim e as NSErrorMBS
		  if EventStore.saveEvent(r, eventstore.kSpanThisEvent, true, e) then
		    MsgBox "OK"
		  else
		    MsgBox "Failed: "+e.LocalizedDescription
		  end if
		  
		  
		  Exception n as NSExceptionMBS
		    MsgBox n.message
		    
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NewReminderButton
	#tag Event
		Sub Action()
		  
		  if EventStore.authorizationStatusForEntityType(EventStore.kEntityTypeReminder) = eventstore.kAuthorizationStatusNotDetermined then
		    // ask?
		    EventStore.requestAccessToEntityType EventStore.kEntityTypeReminder
		    return
		  end if
		  
		  
		  dim r as new EKReminderMBS(EventStore)
		  
		  r.calendar = EventStore.defaultCalendarForNewReminders
		  r.priority = r.kPriorityMedium
		  r.title = "Test"
		  r.location = "At home"
		  
		  dim c as new NSDateComponentsMBS
		  dim d as new date
		  
		  c.hour   = d.Hour+1
		  c.minute = d.Minute
		  c.second = d.Second
		  c.year   = d.Year
		  c.month  = d.month
		  c.day    = d.day
		  'c.calendar = NSCalendarMBS.currentCalendar
		  c.Print
		  r.dueDateComponents = c
		  
		  dim e as NSErrorMBS
		  if EventStore.saveReminder(r, true, e) then
		    MsgBox "OK"
		  else
		    MsgBox "Failed: "+e.LocalizedDescription
		  end if
		  
		  Exception n as NSExceptionMBS
		    MsgBox n.message
		    
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events List
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  MsgBox me.Cell(row, column)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events RemindersButton
	#tag Event
		Sub Action()
		  updateReminders
		  
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
