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
   Height          =   600
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1985915489
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Map"
   Visible         =   True
   Width           =   700
   Begin MapKitViewControlMBS Map
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   498
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   14
      Visible         =   True
      Width           =   660
   End
   BeginSegmented SegmentedControl SegmentedControl1
      Enabled         =   True
      Height          =   24
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   146
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacControlStyle =   0
      Scope           =   0
      Segments        =   "Standard\n\nFalse\rSatellite\n\nFalse\rHybrid\n\nFalse"
      SelectionType   =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      Top             =   522
      Transparent     =   True
      Visible         =   True
      Width           =   236
   End
   Begin TextField addressTextField
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "Location"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   396
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   523
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   194
   End
   Begin PushButton SearchButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Search"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   600
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   524
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton PinButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Add Pin"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   229
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   557
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin TextField pinTitle
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "Pin Title"
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
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   556
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   197
   End
   Begin PushButton DemoButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Demo Pins"
      Default         =   False
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
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   524
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   114
   End
   Begin PushButton OverlayButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Add Overlay"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   479
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   557
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   103
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
      Left            =   321
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Radius"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   558
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   49
   End
   Begin TextField circleRadius
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
      Left            =   382
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "400"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   556
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   60
   End
   Begin UpDownArrows UpDownArrows1
      AcceptFocus     =   False
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   454
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   557
      Transparent     =   True
      Visible         =   True
      Width           =   13
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   500
      Scope           =   0
      TabPanelIndex   =   "0"
   End
   Begin PushButton RenderButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Render"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   594
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   557
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   86
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  init
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function AblageRemoveallOverlaysPins() As Boolean Handles AblageRemoveallOverlaysPins.Action
			
			
			for each v as Variant in circles
			mapview.removeOverlay v
			next
			
			for each v as Variant in pins
			mapview.removeAnnotation v
			next
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub addCircle()
		  dim centerCoordinate as CLLocationCoordinate2DMBS = map.view.centerCoordinate
		  dim radius as integer = cdbl(circleRadius.text) // meter
		  
		  dim circle as MKCircleMBS = MKCircleMBS.circleWithCenterCoordinate(centerCoordinate, radius)
		  
		  mapview.addOverlay circle
		  
		  circle.title = "Hello"
		  circles.Append circle
		  
		  
		  'dim overlays() as MKOverlayMBS = mapview.overlays
		  'Break
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addCustomOverlay()
		  Dim centerCoordinate As CLLocationCoordinate2DMBS = map.view.centerCoordinate
		  
		  Dim o As New myOverlay 
		  
		  // make it current view big
		  Dim m As MKMapRectMBS = mapview.visibleMapRect
		  
		  o.setBoundingMapRect m
		  o.SetCoordinate centerCoordinate
		  o.canReplaceMapContent = False // overlay, not replace
		  o.title = "MyOverlay"
		  
		  mapview.addOverlay o
		  
		  myOverlays.Append o // keep reference
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddPin()
		  
		  
		  dim pin as new MKPointAnnotationMBS
		  
		  pin.coordinate = mapView.centerCoordinate
		  pin.title = self.pinTitle.Text
		  pins.Append pin
		  mapView.addAnnotation pin
		  
		  'dim circle as MKCircleMBS = MKCircleMBS.circleWithCenterCoordinate(mapview.centerCoordinate, CDBl(circleRadius.Text))
		  'circles.append circle
		  'mapView.addOverlay circle
		  
		  
		  // or an polygon?
		  
		  'dim c as CLLocationCoordinate2DMBS = mapview.centerCoordinate
		  'dim coords() as CLLocationCoordinate2DMBS
		  '
		  '// put edge points a few meter away
		  'const d = 0.01
		  'dim c1 as new CLLocationCoordinate2DMBS(c.latitude+d, c.longitude+d)
		  'dim c2 as new CLLocationCoordinate2DMBS(c.latitude+d, c.longitude-d)
		  'dim c3 as new CLLocationCoordinate2DMBS(c.latitude-d, c.longitude-d)
		  'dim c4 as new CLLocationCoordinate2DMBS(c.latitude-d, c.longitude+d)
		  '
		  'coords.Append c1
		  'coords.Append c2
		  'coords.Append c3
		  'coords.Append c4
		  '
		  'dim poly as MKPolygonMBS = MKPolygonMBS.polygonWithCoordinates(coords)
		  '
		  'polygons.Append poly
		  'mapView.addOverlay poly
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addPinForIndex()
		  dim total as integer = pinNames.Ubound+1
		  dim index as integer = indexNumber
		  dim maxLatOffset as double = 0.01
		  dim maxLngOffset as double = 0.02
		  
		  dim name as string = pinNames(indexNumber)
		  
		  dim pin as new MKPointAnnotationMBS
		  
		  const PI = 3.14159265359
		  
		  dim pinCoord as CLLocationCoordinate2DMBS = mapview.centerCoordinate
		  dim latOffset as double = maxLatOffset * cos(2*PI * (index/total))
		  dim lngOffset as double = maxLngOffset * sin(2*PI * (index/total))
		  
		  pinCoord.latitude  = pinCoord.latitude  + latOffset
		  pinCoord.longitude = pinCoord.longitude + lngOffset
		  
		  pin.coordinate = pinCoord
		  pin.title = name
		  
		  pins.Append pin
		  
		  mapView.addAnnotation pin
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Demo()
		  indexNumber = 0
		  timer1.Mode = 2
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub init()
		  
		  pinNames = array("One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve")
		  
		  'mapview.showsUserLocation = true
		  
		  #if false then
		    // testing some things.
		    // please put breakpoint in events so you see results
		    
		    dim coordinate as new CLLocationCoordinate2DMBS
		    
		    coordinate.latitude = 49.8578255
		    coordinate.longitude = -97.16531639999999
		    
		    reverseGeocoder = new MKReverseGeocoderMBS(map, coordinate)
		    reverseGeocoder.start
		    
		    geocoderNoCoord = new MKGeocoderMBS(map, "777 Corydon Ave, Winnipeg MB")
		    geocoderNoCoord.start
		    
		    geocoderCoord = new MKGeocoderMBS(map, "1250 St. James St", coordinate)
		    geocoderCoord.start
		    
		    
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub searchAddress()
		  mapView.showAddress addressTextField.text
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetMapType(n as integer)
		  mapView.mapType  = n
		  
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Plugins needed
		
		MacFrameworks Main MacCocoa MacBase MacControls
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		circles() As MKCircleMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		coreLocationPins() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		geocoderCoord As CLGeocoderMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		geocoderNoCoord As CLGeocoderMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		indexNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		mapview As MKMapViewMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		menuItem As MyNSMenuItemMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		myOverlays() As myOverlay
	#tag EndProperty

	#tag Property, Flags = &h0
		pinNames() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Pins() As MKPointAnnotationMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		polygons() As MKPolygonMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		renderers() As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		reverseGeocoder As CLGeocoderMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events Map
	#tag Event
		Sub Open()
		  self.mapview = me.View
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub annotationViewDidChangeDragState(mapView as MKMapViewMBS, annotationView as MKAnnotationViewMBS, newState as integer, oldState as integer)
		  'dim pinAnnotation as MKAnnotationMBS = annotationView.annotation
		  '
		  '
		  'dim u as integer = UBound(pins)
		  'for i as integer = 0 to u
		  'if pins(i) = pinAnnotation then
		  '// found the pin.
		  'dim circle as MKCircleMBS = circles(i)
		  'mapView.removeOverlay circle
		  '
		  'if newState = MKAnnotationViewMBS.DragStateEnding or newState = MKAnnotationViewMBS.DragStateNone then
		  '
		  '// create a new circle view
		  'dim pinCircleRadius as Double = circle.radius
		  '
		  'circle = MKCircleMBS.circleWithCenterCoordinate(pinAnnotation.coordinate, pinCircleRadius)
		  'circles(i) = circle
		  'mapView.addOverlay circle
		  'end if
		  'end if
		  'next
		  '
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function rendererForOverlay(mapView as MKMapViewMBS, overlay as MKOverlayMBS) As MKOverlayRendererMBS
		  
		  if overlay isa myOverlay then
		    Dim m As New MyOverlayRenderer(overlay)
		    
		    renderers.append m // keep reference to Xojo object!
		    
		    Return m
		  End If
		  
		  
		  If overlay IsA MKCircleMBS Then
		    Dim c As MKCircleMBS = MKCircleMBS(overlay)
		    Dim m As New MKCircleRendererMBS(c)
		    
		    m.FillColor = NSColorMBS.colorWithCalibratedRGB(1,0,0,0.5)
		    renderers.Append m
		    Return m
		    
		  End If
		  
		End Function
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
		  setMapType itemIndex
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events addressTextField
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  if asc(key) = 3 or asc(key) = 13 then
		    searchAddress
		    Return true
		  end if
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events SearchButton
	#tag Event
		Sub Action()
		  searchAddress
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PinButton
	#tag Event
		Sub Action()
		  AddPin
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DemoButton
	#tag Event
		Sub Action()
		  demo
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events OverlayButton
	#tag Event
		Sub Action()
		  If Keyboard.AsyncOptionKey Then
		    addCustomOverlay
		  Else
		    addCircle
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UpDownArrows1
	#tag Event
		Sub Up()
		  dim n as integer = cdbl(circleRadius.Text)
		  n = n + 1
		  circleRadius.Text = cstr(n)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Down()
		  dim n as integer = cdbl(circleRadius.Text)
		  
		  if n>10 then
		    n = n - 1
		    circleRadius.Text = cstr(n)
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  self.addPinForIndex 
		  
		  indexNumber = indexNumber + 1
		  
		  if indexNumber > UBound(pinNames) then
		    me.Mode = 0
		  end if
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RenderButton
	#tag Event
		Sub Action()
		  dim options as new MKMapSnapshotOptionsMBS
		  
		  // set some options
		  'options.mapRect = mapview.visibleRect
		  options.mapType = mapview.mapType
		  options.region = mapview.region
		  options.showsPointsOfInterest = true
		  
		  dim snap as new MKMapSnapshotterMBS(options)
		  
		  
		  snap.Start 
		  
		  // just wait for it to finish loading... 
		  while snap.Loading
		    app.DoEvents 10
		  wend
		  
		  
		  // just get picture from snapshot
		  dim n as NSImageMBS = snap.Snapshot.Image
		  if n <> nil then
		    dim f as FolderItem = SpecialFolder.Desktop.Child("test.png")
		    dim b as BinaryStream = BinaryStream.Create(f, true)
		    
		    b.Write n.PNGRepresentation
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
	#tag ViewProperty
		Name="indexNumber"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
