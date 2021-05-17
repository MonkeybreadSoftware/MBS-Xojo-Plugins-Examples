#tag MobileScreen
Begin MobileScreen msEventKitDemo
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   HasNavigationBar=   True
   LargeTitleDisplayMode=   2
   Left            =   0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   0
   Title           =   "EventKit demo"
   Top             =   0
   Begin MobileButton mbGetCalendars
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   mbGetCalendars, 9, <Parent>, 9, False, +1.00, 4, 1, 1, , True
      AutoLayout      =   mbGetCalendars, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   mbGetCalendars, 3, <Parent>, 10, False, +1.00, 4, 1, -40, , True
      AutoLayout      =   mbGetCalendars, 7, , 0, False, +1.00, 4, 1, 125, , True
      Caption         =   "Get Calendars"
      CaptionColor    =   &c007AFF00
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   98
      LockedInPosition=   False
      Scope           =   2
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   ""
      Top             =   244
      Visible         =   True
      Width           =   125
   End
   Begin MobileButton mbGetEvents
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   mbGetEvents, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   mbGetEvents, 1, mbGetCalendars, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   mbGetEvents, 3, mbGetCalendars, 4, False, +1.00, 4, 1, 20, , True
      AutoLayout      =   mbGetEvents, 7, , 0, False, +1.00, 4, 1, 125, , True
      Caption         =   "Get Events"
      CaptionColor    =   &c007AFF00
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   98
      LockedInPosition=   False
      Scope           =   2
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   ""
      Top             =   294
      Visible         =   True
      Width           =   125
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub Opening()
		  EventKit.getEventStore
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events mbGetCalendars
	#tag Event
		Sub Pressed()
		  dim calendars() as EKCalendarMBS
		  dim msgBox as New MobileMessageBox
		  
		  if not EventKit.bEventPermissionGranted = True then
		    msgBox.Title = "You must give the app access to calendar events to be able to get the calendars on this device."
		    msgBox.Show
		    Return
		  end if
		  
		  calendars = EventKit.EventStore.calendarsForEntityType( EKEventStoreMBS.kEntityTypeEvent )
		  
		  msgBox.Title = calendars.LastIndex.ToString + " calendars found"
		  msgBox.Buttons = Array( "OK" )
		  msgBox.Show
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events mbGetEvents
	#tag Event
		Sub Pressed()
		  dim msgBox as New MobileMessageBox
		  dim iCalEvents() as EKEventMBS
		  dim thePredicate as NSPredicateMBS
		  dim dateStart, dateEnd as DateTime
		  dim theInterval as DateInterval
		  
		  if not EventKit.bEventPermissionGranted = True then
		    msgBox.Title = "You must give the app access to calendar events to be able to get the events on this device."
		    msgBox.Show
		    Return
		  end if
		  
		  dateStart = New DateTime( DateTime.Now.Year, DateTime.Now.Month, 1, 0, 0, 0, 0, TimeZone.Current )
		  theInterval = New DateInterval( 0, 1, 0, 0, 0, -1 )
		  dateEnd = dateStart + theInterval
		  
		  // Have to ask for events finishing the day after the one we're after or all-day events on the last day don't get included
		  thePredicate = EventKit.EventStore.predicateForEvents( dateStart, dateEnd )
		  iCalEvents = EventKit.EventStore.eventsMatchingPredicate( thePredicate )
		  
		  msgBox.Title = iCalEvents.LastIndex.ToString + " events found for this month"
		  msgBox.Buttons = Array( "OK" )
		  msgBox.Show
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
