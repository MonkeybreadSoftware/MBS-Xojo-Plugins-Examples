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
   Height          =   664
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   2145949695
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "MapKit Local Search"
   Visible         =   True
   Width           =   582
   Begin TextField SearchText
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "Search for"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   400
   End
   Begin Listbox SuggestionsList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
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
      Height          =   166
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Title	Subtitle"
      Italic          =   False
      Left            =   20
      LockBottom      =   False
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   54
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   542
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Listbox ResultList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
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
      Height          =   127
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Name	Coordinates"
      Italic          =   False
      Left            =   20
      LockBottom      =   False
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   232
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   542
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Label ErrorLabel
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
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   644
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   542
   End
   Begin CheckBox cbStartSearchWithReturnOnly
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Search on Return"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   445
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   21
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   117
   End
   Begin MapKitViewControlMBS Map
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   250
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   371
      Visible         =   True
      Width           =   542
   End
   BeginSegmented SegmentedControl SegmentedControl1
      Enabled         =   True
      Height          =   24
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacControlStyle =   0
      Scope           =   0
      Segments        =   "Standard\n\nFalse\rSatellite\n\nFalse\rHybrid\n\nFalse\rFlyover\n\nFalse"
      SelectionType   =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      Top             =   623
      Transparent     =   True
      Visible         =   True
      Width           =   377
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Completer = new MKLocalSearchCompleter
		  completer.SuggestionsList = SuggestionsList
		  Completer.ErrorLabel = ErrorLabel
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub SearchFor(SuggestedCompletedString as MKLocalSearchCompletionMBS)
		  If LocalSearch <> Nil Then
		    LocalSearch.cancel
		  end if
		  
		  Dim request As New MKLocalSearchRequestMBS( SuggestedCompletedString )
		  
		  
		  ' ResultList.DeleteAllRows
		  
		  LocalSearch = New MKLocalSearch(request)
		  LocalSearch.ResultList = ResultList
		  LocalSearch.Start
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Completer As MKLocalSearchCompleter
	#tag EndProperty

	#tag Property, Flags = &h0
		LocalSearch As MKLocalSearch
	#tag EndProperty

	#tag Property, Flags = &h0
		MapView As MKMapViewMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		StartSearchWithReturnKeyOnly As Boolean = false
	#tag EndProperty


#tag EndWindowCode

#tag Events SearchText
	#tag Event
		Sub TextChange()
		  
		  If StartSearchWithReturnKeyOnly Then 
		    
		    // only clear the ListBoxes the first time a key is pressed
		    // as they won't get filled again until a search is initiated
		    
		    If SuggestionsList.ListCount > 0 Then SuggestionsList.DeleteAllRows
		    If ResultList.ListCount > 0 Then ResultList.DeleteAllRows
		    
		  Else
		    
		    SuggestionsList.DeleteAllRows
		    ResultList.DeleteAllRows
		    
		    If Me.Text <> "" Then Completer.QueryFragment = Me.Text 
		    
		  End If
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  
		  If StartSearchWithReturnKeyOnly Then
		    
		    If Asc(key) = 3 Or Asc(key) = 13 Then  // return keys
		      Completer.QueryFragment = Me.Text 
		      Return True
		    End If
		    
		  End If
		  
		  
		  
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events SuggestionsList
	#tag Event
		Sub DoubleClick()
		  
		  If Me.ListIndex >=0 Then
		    
		    ResultList.DeleteAllRows
		    
		    Dim SuggestedCompletedString As MKLocalSearchCompletionMBS = Me.RowTag(Me.ListIndex)
		    
		    SearchFor( SuggestedCompletedString )
		    
		  end if
		  
		   
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ResultList
	#tag Event
		Sub DoubleClick()
		  
		  If Me.ListIndex >=0 Then
		    
		    // remove the old annotations
		    MapView.removeAnnotations( MapView.annotations )
		    
		    Dim mapItem As MKMapItemMBS = MKMapItemMBS( Me.RowTag( Me.ListIndex ) )
		    
		    if MapView <> nil then
		      
		      // a zoom factor of 17 seems the most appropriate to me 
		      MapView.setCenterCoordinate( mapItem.placemark.Coordinate, 17, True )
		      
		      // and as we have access to the coordinates we can stick a pin in it 
		      Dim pin As New MKPointAnnotationMBS
		      
		      pin.coordinate = mapItem.placemark.Coordinate
		      pin.title = mapItem.Name
		      
		      mapView.addAnnotation pin
		    End If
		    
		  End If
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cbStartSearchWithReturnOnly
	#tag Event
		Sub Action()
		  ' 
		  ' If Me.Value Then
		  ' 
		  ' SuggestionsList.DeleteAllRows
		  ' ResultList.DeleteAllRows
		  ' 
		  ' End If
		  
		  StartSearchWithReturnKeyOnly = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Map
	#tag Event
		Sub Open()
		  Self.mapview = Me.View
		  
		  Me.view.showsScale = True 
		  Me.view.showsZoomControls = True 
		  Me.view.ShowsCompass = True 
		  Me.view.showsPointsOfInterest = True
		  Me.view.showsBuildings = True
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SegmentedControl1
	#tag Event
		Sub Open()
		  me.Items(0).selected = true
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action(itemIndex as integer)
		  
		  
		  mapView.mapType = itemIndex
		  
		  If itemIndex = 3 Then // flyover
		    // addjust camera
		    
		    Dim mapCamera As MKMapCameraMBS = mapview.camera
		    
		    
		    mapCamera.pitch = 45
		    mapCamera.altitude = 500 // example altitude
		    mapCamera.heading = 45
		  End If
		  
		  
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
	#tag ViewProperty
		Name="StartSearchWithReturnKeyOnly"
		Visible=false
		Group="Behavior"
		InitialValue="false"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
