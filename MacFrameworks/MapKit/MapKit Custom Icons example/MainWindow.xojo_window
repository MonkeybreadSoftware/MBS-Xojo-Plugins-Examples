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
   Height          =   630
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1985915489
   MenuBarVisible  =   True
   MinHeight       =   400
   MinimizeButton  =   True
   MinWidth        =   500
   Placement       =   0
   Resizeable      =   True
   Title           =   "MapKit Custom Icon Example"
   Visible         =   True
   Width           =   700
   Begin MapKitViewControlMBS Map
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   558
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
   Begin PopupMenu popIconTypeSelection
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Red Pins\nGreen Pins\nPurple Pins\nCustom Icon\nCustom Icon with Number\nCluster with both Drivers and Cars"
      Italic          =   False
      Left            =   82
      ListIndex       =   3
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   590
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   204
   End
   Begin PopupMenu popShowLocationsFor
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Drivers\ncars\nboth"
      Italic          =   False
      Left            =   560
      ListIndex       =   2
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   590
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
   Begin Label aLabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   492
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "show:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   590
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   40
   End
   Begin Label aLabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Italic          =   False
      Left            =   30
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "use:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   590
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   40
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  Quit
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddAnnotationFor(address as string, annotationType as String)
		  
		  // find the address via geocoder
		  
		  Dim c As New CLGeocoderMBS
		  Dim h As New CLGeocodeCompletionHandlerMBS
		  
		  AddHandler h.Completed, AddressOf geocodeAddressStringCompleted
		  
		  ' Dim tag As Variant = annotationType
		  ' c.geocodeAddressString(address, h, tag)
		  
		  ' Dim tag As Variant = annotationType
		  c.geocodeAddressString(address, h, annotationType)
		  
		  ' geocoders.Append c  // ??? Is this needed ???
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddSampleAnnotations()
		  
		  AddAnnotationFor( "1 Bolton Street, Blockhouse Bay, Auckland", "Driver Annotation" ) 
		  AddAnnotationFor( "5 Bolton Street, Blockhouse Bay, Auckland", "Driver Annotation" )
		  AddAnnotationFor( "15 Bolton Street, Blockhouse Bay, Auckland", "Driver Annotation" )
		  AddAnnotationFor( "28 Bolton Street, Blockhouse Bay, Auckland", "Driver Annotation" ) 
		  
		  AddAnnotationFor( "2 Terry Street, Blockhouse Bay, Auckland", "Driver Annotation" )
		  AddAnnotationFor( "16 Terry Street, Blockhouse Bay, Auckland", "Driver Annotation" ) 
		  AddAnnotationFor( "33 Terry Street, Blockhouse Bay, Auckland", "Driver Annotation" ) 
		  AddAnnotationFor( "38 Terry Street, Blockhouse Bay, Auckland", "Driver Annotation" ) 
		  
		  
		  
		  AddAnnotationFor( "2 Bolton Street, Blockhouse Bay, Auckland", "Car Annotation" ) 
		  AddAnnotationFor( "17 Bolton Street, Blockhouse Bay, Auckland", "Car Annotation" ) 
		  AddAnnotationFor( "22 Bolton Street, Blockhouse Bay, Auckland", "Car Annotation" )
		  
		  AddAnnotationFor( "5 Terry Street, Blockhouse Bay, Auckland", "Car Annotation" )
		  AddAnnotationFor( "7 Terry Street, Blockhouse Bay, Auckland", "Car Annotation" )
		  AddAnnotationFor( "25 Terry Street, Blockhouse Bay, Auckland", "Car Annotation" ) 
		  AddAnnotationFor( "34 Terry Street, Blockhouse Bay, Auckland", "Car Annotation" ) 
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub geocodeAddressStringCompleted(handler as CLGeocodeCompletionHandlerMBS, geocoder as CLGeocoderMBS, placemarks() as CLPlacemarkMBS, error as NSErrorMBS, tag as variant)
		  
		  // we got something, so show on map
		  
		  If placemarks.Ubound >= 0 Then
		    
		    Dim placemark As CLPlacemarkMBS = placemarks(0)
		    Dim location As CLLocationMBS = placemark.location
		    
		    
		    Select Case Tag 
		      
		    Case "Driver Annotation"
		      
		      Dim newAnnotation As New DriverAnnotation
		      
		      newAnnotation.coordinate = New CLLocationCoordinate2DMBS(location.Latitude, location.Longitude)
		      newAnnotation.title = "Driver at"
		      newAnnotation.subtitle = placemark.name
		      
		      ListOfDriverAnnotations.Append newAnnotation
		      
		      mapView.addAnnotation newAnnotation
		      
		    Case "Car Annotation"
		      
		      Dim newAnnotation As New CarAnnotation
		      
		      newAnnotation.coordinate = New CLLocationCoordinate2DMBS(location.Latitude, location.Longitude)
		      newAnnotation.title = "Car at"
		      newAnnotation.subtitle = placemark.name
		      
		      ListOfCarAnnotations.Append newAnnotation
		      
		      mapView.addAnnotation newAnnotation
		      
		    End Select
		    
		    
		    
		    
		  Else
		    Break
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetViewForCustomAnnotation(annotation as MKAnnotationMBS, reuseIdentifier as string, clusteringIdentifier as String, image as NSImageMBS, displayPriority as Integer) As MKAnnotationViewMBS
		  // Uses different reuse identifiers for Cluster views with or without number
		  
		  // NOTE FOR VIEWS WITH NUMBERS: 
		  // with views having different numbers but the same reuse identifier
		  // you can't simply return a reusable view as it's number might be wrong
		  // but you need to customise the reusable view to ensure it shows the correct number
		  // 
		  // So you CAN'T do this:
		  //
		  // either a suitable annotation view is returned, or Nil
		  // so test for Nil:
		  //    if it is Nil then we create a new view to customise and return
		  //    if it is not Nil then we return the reuse view
		  //
		  // Dim view As MKAnnotationViewMBS = mapView.dequeueReusableAnnotationViewWithIdentifier( reuseIdentifier ) 
		  //
		  // If view <> Nil Then
		  //   Return view
		  // Else
		  //   view = New MKAnnotationViewMBS( annotation, reuseIdentifier )
		  // End If 
		  //
		  // but you need to do this:
		  
		  // create a variable of type AnnotationView and try to assign a view
		  //   with the same reuseIdentifier to it from the reuse pool of views
		  
		  Dim view As MKAnnotationViewMBS = mapView.dequeueReusableAnnotationViewWithIdentifier( reuseIdentifier ) 
		  
		  If view = Nil Then
		    view = New MKAnnotationViewMBS( annotation, reuseIdentifier )
		  End If 
		  
		  // cluster annotations should show the number of annotations that are in the cluster 
		  
		  Select Case reuseIdentifier 
		    
		  Case "Cars with Numbers" // that is a Car cluster 
		    
		    // get the number to draw from the subtitle 
		    Dim number As String = Replace( annotation.subtitle, "# of Cars: ", "" )
		    
		    Dim pic As New Picture( image.width, image.height )
		    
		    Dim g As Graphics = pic.Graphics
		    g.DrawPicture( CarsPNG, 0, 0 )
		    
		    g.ForeColor = &c76D6FF  // Color.Teal
		    g.Transparency = 20  // 0.0 (opaque) to 100.0 (fully transparent)
		    g.FillOval( 13, 10, 26, 26 )
		    
		    g.ForeColor = Color.Blue
		    g.TextSize = 18
		    g.Bold = True
		    g.Transparency = 0  // 0.0 (opaque) to 100.0 (fully transparent)
		    g.DrawString( number, 20, 30 )
		    
		    Dim img As New NSImageMBS( pic )
		    view.image = img 
		    
		    
		  Case "Drivers with Numbers"  // that is a Driver cluster 
		    
		    // get the number to draw from the subtitle 
		    Dim number As String = Replace( annotation.subtitle, "# of Drivers: ", "" )
		    
		    Dim pic As New Picture( image.width, image.height )
		    Dim g As Graphics = pic.Graphics
		    g.DrawPicture( SwallowClusterIconPNG, 0, 0 )
		    
		    g.ForeColor = Color.Yellow
		    g.Transparency = 20  // 0.0 (opaque) to 100.0 (fully transparent)
		    g.FillOval( 13, 10, 26, 26 )
		    
		    g.ForeColor = Color.Red  // Teal
		    g.TextSize = 18
		    g.Bold = True
		    g.Transparency = 0  // 0.0 (opaque) to 100.0 (fully transparent)
		    g.DrawString( number, 20, 30 )
		    
		    Dim img As New NSImageMBS( pic )
		    view.image = img 
		    
		    
		  Case "Drivers and Cars"
		    
		    Dim rg As New RegEx
		    Dim myMatch As RegExMatch
		    rg.SearchPattern = "# of Drivers: (\d*)\n# of Cars: (\d*)"
		    myMatch = rg.Search(annotation.subtitle)
		    
		    Dim NumberOfDrivers As Integer = Val( myMatch.SubExpressionString(1) )
		    Dim NumberOfCars As Integer = Val( myMatch.SubExpressionString(2) )
		    
		    Dim total As Integer =  NumberOfDrivers + NumberOfCars
		    Dim totalAsText As String = Str( total )
		    
		    Dim percent As Double = NumberOfDrivers / total 
		    
		    // create picture 
		    Dim pic As New Picture( 96, 96 )
		    Dim g As Graphics = pic.Graphics
		    
		    // Draw Bottom Circle
		    g.ForeColor = Colour.DarkBlue
		    g.FillOval 0, 0, g.width, g.height  
		    
		    // Draw percent done arc 
		    Dim a As New ArcShape
		    a.ArcAngle = 6.283 * percent
		    a.StartAngle = -1.5708
		    a.FillColor = Colour.Magenta
		    a.Height = 96 
		    a.Width = 96 
		    
		    g.DrawObject(a, g.Width/2, g.Height/2)
		    
		    // Draw top circle
		    g.ForeColor = Color.White
		    g.FillOval  18,18, 60,60  // 60 IS CIRCLE WIDTH!!!
		    
		    // Draw text 
		    g.ForeColor = Color.Black  
		    g.Bold = True
		    g.TextSize = 32
		    
		    // adjust text size if number does not fit in center circle
		    While g.StringWidth( totalAsText ) > 58
		      g.TextSize = g.TextSize - 1
		    Wend
		    
		    g.DrawString totalAsText, 48-(g.StringWidth(totalAsText)/2), 48 + g.TextHeight/3  // 32 29 22 17
		    
		    Dim clusterIcon As New NSImageMBS( pic )
		    clusterIcon.setSize 48, 48
		    
		    view.image = clusterIcon
		    
		  Else   // not a cluster annotation or a cluster without number 
		    view.image = image 
		    
		  End Select
		  
		  
		  // set the display priority 
		  view.displayPriority = displayPriority
		  
		  // set the collision mode 
		  view.collisionMode = 1
		  
		  // set up callout
		  view.canShowCallout = True
		  
		  // set up clustering
		  view.clusteringIdentifier = clusteringIdentifier
		  
		  // hook the annotation to the annotation view
		  view.annotation = annotation
		  
		  Return view
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetViewForPin(annotation as MKAnnotationMBS, reuseIdentifier as string, clusteringIdentifier as String, pinColour as String, displayPriority as Integer) As MKPinAnnotationViewMBS
		  
		  // without clustering nothing to do, but with clustering we need to customise a view 
		  
		  Dim viewForPin As New MKPinAnnotationViewMBS( annotation, reuseIdentifier )
		  
		  // set up display priority
		  viewForPin.displayPriority = displayPriority
		  
		  // set up collision mode 
		  viewForPin.collisionMode = 1  // circular
		  
		  // set up clustering
		  viewForPin.clusteringIdentifier = clusteringIdentifier
		  
		  // set up callout
		  viewForPin.canShowCallout = True
		  
		  If pinColour = "red" Then viewForPin.pinTintColor = MKPinAnnotationViewMBS.RedPinColor 
		  If pinColour = "green" Then viewForPin.pinTintColor = MKPinAnnotationViewMBS.GreenPinColor 
		  If pinColour = "purple" Then viewForPin.pinTintColor = MKPinAnnotationViewMBS.PurplePinColor 
		  
		  // hook the annotation to the view
		  viewForPin.annotation = annotation
		  
		  Return viewForPin
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateMap()
		  
		  // to prevent a race condition when the IconType selection changes
		  
		  mapIsUpdating = True 
		  
		  // otherwise we get the following when a callout is shown and you 
		  // change the IconType selection FROM or TO "Cluster with both Drivers and Cars":
		  //
		  //   A Cocoa NSInternalInconsistencyException was not handled: 
		  //     MKAnnotationView instances for cluster annotations cannot use 
		  //     a different clusteringIdentifier than its annotation.
		  
		  // Delete the map's annotations
		  
		  mapview.removeAnnotations( mapview.annotations )
		  
		  // add annotations depending on the user's settings
		  
		  Select Case popShowLocationsFor.Text
		    
		  Case "Drivers"
		    
		    mapview.addAnnotations( ListOfDriverAnnotations )
		    
		  Case "cars"
		    
		    mapview.addAnnotations( ListOfCarAnnotations )
		    
		  Case "both"
		    
		    mapview.addAnnotations( ListOfDriverAnnotations )
		    mapview.addAnnotations( ListOfCarAnnotations )
		    
		  End Select
		  
		  mapIsUpdating = False
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Read me
		Auckland, 10th of November 2020
		
		I hope I documented this example sufficiently for you to follow.
		
		A much more extensive description has been published in a series of articles 
		about using MapKit in Xojo with the help of the MBS MapKit plugin.
		
		The series started in xDev 17.5 and is still ongoing, with 
		the most relevant parts being in issues 18.5, 18.6, and 19.1
		
		I hope you find this example helpful.
		
		Markus Winter
	#tag EndNote


	#tag Property, Flags = &h0
		CarClusterIcon As NSImageMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		CarIcon As NSImageMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		DriverClusterIcon As NSImageMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		DriverIcon As NSImageMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		geocoders() As CLGeocoderMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		ListOfCarAnnotations() As CarAnnotation
	#tag EndProperty

	#tag Property, Flags = &h0
		ListOfDriverAnnotations() As DriverAnnotation
	#tag EndProperty

	#tag Property, Flags = &h0
		mapIsUpdating As boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		mapview As MKMapViewMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events Map
	#tag Event
		Sub Open()
		  mapview = Me.View
		  
		  mapview.showsScale = True
		  mapview.showsZoomControls = True
		  mapview.ShowsCompass = True
		  
		  mapview.showsUserLocation = True
		  
		  // create an NSImageMBS for the Driver icon
		  DriverIcon = New NSImageMBS( SwallowIconPNG )
		  DriverIcon.setSize 32, 32
		  
		  // create an NSImageMBS for the Driver cluster icon
		  DriverClusterIcon = New NSImageMBS( SwallowClusterIconPNG )
		  DriverClusterIcon.setSize 48, 48
		  
		  // create an NSImageMBS for the car icon
		  CarIcon = New NSImageMBS( CarPNG )
		  DriverIcon.setSize 32, 32
		  
		  // create an NSImageMBS for the Car cluster icon
		  CarClusterIcon = New NSImageMBS( CarsPNG )
		  CarClusterIcon.setSize 48, 48
		  
		  AddSampleAnnotations
		  
		  // set region for the map to show on startup
		  Dim coordinates As New CLLocationCoordinate2DMBS(-36.91849, 174.6986)
		  Dim span As New MKCoordinateSpanMBS( 0.1, 0.1 )
		  Dim region As New MKCoordinateRegionMBS( coordinates, span )
		  mapview.region = region
		  mapview.zoomLevel = 15
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function viewForAnnotation(mapView as MKMapViewMBS, annotation as MKAnnotationMBS) As MKAnnotationViewMBS
		  // to prevent a race condition when the IconType selection changes
		  // we need to stop this event while the map is being updated 
		  
		  If mapIsUpdating Then
		    Return Nil
		  End If
		  
		  // otherwise we get the following when a callout is shown and you 
		  // change the IconType selection FROM or TO "Cluster with both Drivers and Cars":
		  //
		  //   A Cocoa NSInternalInconsistencyException was not handled: 
		  //     MKAnnotationView instances for cluster annotations cannot use 
		  //     a different clusteringIdentifier than its annotation.
		  
		  
		  // let the OS handle user locations itself
		  
		  If annotation IsA MKUserLocationMBS Then
		    Return Nil
		  End If
		  
		  // IMPORTANT: THERE ARE ONLY THREE TYPES OF CUSTOM ANNOTATIONS ON THE MAP
		  //            (FOUR IF YOU ALLOW THE USER LOCATION TO BE SHOWN)
		  // • DriverAnnotation
		  // • CarAnnotation
		  // • ClusterAnnotation 
		  // ONLY their views differ depending on the selection, the annotations do not change
		  
		  
		  Select Case popIconTypeSelection.Text
		    
		  Case "Red Pins"
		    Return GetViewForPin( annotation, "Red Pin", "Red Pin", "red", 1000 )
		    
		  Case "Green Pins"
		    Return GetViewForPin( annotation, "Green Pin", "Green Pin", "green", 1000 )
		    
		  Case "Purple Pins"
		    Return GetViewForPin( annotation, "Purple Pin", "Purple Pin", "purple", 1000 )
		    
		    
		  Case "Custom Icon"  // as each type has a different icon the type of annotation becomes important
		    
		    Select Case True
		      
		    Case annotation IsA DriverAnnotation
		      Return GetViewForCustomAnnotation( annotation, "Driver", "Driver", DriverIcon, 1000 )
		      
		    Case annotation IsA CarAnnotation
		      Return GetViewForCustomAnnotation( annotation, "Car", "Car", CarIcon, 1000 )
		      
		    Case annotation IsA MKClusterAnnotationMBS  // we confer the type information via the title 
		      
		      Select Case annotation.title
		        
		      Case "Drivers"
		        Return GetViewForCustomAnnotation( annotation, "Drivers", "Driver", DriverClusterIcon, 1000 )
		        
		      Case "Cars"
		        Return GetViewForCustomAnnotation( annotation, "Cars", "Car", CarClusterIcon, 1000 )
		        
		      End Select
		      
		    End Select
		    
		    
		  Case "Custom Icon with Number"
		    
		    Select Case True
		      
		    Case annotation IsA DriverAnnotation
		      Return GetViewForCustomAnnotation( annotation, "Driver", "Driver", DriverIcon, 1000 )
		      
		    Case annotation IsA CarAnnotation
		      Return GetViewForCustomAnnotation( annotation, "Car", "Car", CarIcon, 1000 )
		      
		    Case annotation IsA MKClusterAnnotationMBS
		      
		      Select Case annotation.title
		        
		      Case "Drivers"
		        Return GetViewForCustomAnnotation( annotation, "Drivers with Numbers", "Driver", DriverClusterIcon, 1000 )
		        
		      Case "Cars"
		        Return GetViewForCustomAnnotation( annotation, "Cars with Numbers", "Car", CarClusterIcon, 1000 )
		        
		      End Select
		      
		    End Select
		    
		    
		  Case "Cluster with both Drivers and Cars"
		    
		    Select Case True
		      
		    Case annotation IsA DriverAnnotation
		      Return GetViewForCustomAnnotation( annotation, "Driver", "Cluster all", DriverIcon, 1000 )
		      
		    Case annotation IsA CarAnnotation
		      Return GetViewForCustomAnnotation( annotation, "Car", "Cluster all", CarIcon, 1000 )
		      
		    Case annotation IsA MKClusterAnnotationMBS
		      
		      Select Case annotation.title
		        
		      Case "Drivers & Cars"
		        Return GetViewForCustomAnnotation( annotation, "Drivers and Cars", "Cluster all", Nil, 1000 )
		        
		      End Select
		      
		    End Select
		    
		    
		  End Select
		  
		  
		  // other annotations that are not dealt with?
		  
		  #If DebugBuild Then
		    Break // annotation not found so check debugger what's going on!
		  #EndIf
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ClusterAnnotationForMemberAnnotations(mapView as MKMapViewMBS, memberAnnotations() as MKAnnotationMBS) As MKClusterAnnotationMBS
		  
		  // annotations that have fused (the memberAnnotations) are passed into the event 
		  // that creates and returns a new clusterAnnotation
		  
		  // we store in the title the information as to what type of annotations the cluster contains
		  
		  Dim clusterAnnotation As New MKClusterAnnotationMBS( memberAnnotations )
		  
		  Dim number As Integer = memberAnnotations.Ubound + 1
		  
		  Select Case popIconTypeSelection.Text
		    
		  Case "Cluster with both Drivers and Cars"
		    
		    Dim NumberOfDriversInCluster As Integer = 0
		    Dim NumberOfCarsInCluster As Integer = 0
		    
		    For Each Annotation As MKAnnotationMBS In memberAnnotations
		      If Annotation IsA DriverAnnotation Then NumberOfDriversInCluster = NumberOfDriversInCluster + 1
		      If Annotation IsA CarAnnotation Then NumberOfCarsInCluster = NumberOfCarsInCluster + 1
		    Next
		    
		    clusterAnnotation.Title = "Drivers & Cars"
		    clusterAnnotation.SubTitle = "# of Drivers: " + Str(NumberOfDriversInCluster) + EndOfLine + "# of Cars: " + Str(NumberOfCarsInCluster) 
		    
		    
		  Else
		    
		    Dim Annotation As MKAnnotationMBS = memberAnnotations(0)
		    
		    Select Case True
		      
		    Case Annotation IsA DriverAnnotation
		      
		      clusterAnnotation.Title = "Drivers"
		      clusterAnnotation.SubTitle = "# of Drivers: " + Str(number)
		      
		    Case Annotation IsA CarAnnotation
		      
		      clusterAnnotation.Title = "Cars"
		      clusterAnnotation.SubTitle = "# of Cars: " + Str(number) 
		      
		    End Select
		    
		  End Select
		  
		  
		  Return clusterAnnotation
		  
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events popIconTypeSelection
	#tag Event
		Sub Change()
		  
		  UpdateMap
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popShowLocationsFor
	#tag Event
		Sub Change()
		  
		  UpdateMap
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
		Name="mapIsUpdating"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
