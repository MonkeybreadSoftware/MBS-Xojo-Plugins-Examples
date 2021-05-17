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
   Title           =   "Map of XDC conference locations"
   Visible         =   True
   Width           =   700
   Begin MapKitViewControlMBS Map
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   566
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
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  GetXojoIcon
		  
		  
		  mapview.showsUserLocation = True
		  
		  
		  Add "Austin, USA" // 2006, 2007, 2008, 2015
		  Add "Orlando, USA" // 2012, 2013
		  Add "Las Vegas, USA" // 2014
		  Add "Houston, USA" // 2016
		  Add "Denver, USA" // 2018
		  Add "Miami, USA" // 2019
		  Add "Nashville, USA" // 2020
		  
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Add(address as string)
		  
		  // find the address via geocoder
		  
		  Dim c As New CLGeocoderMBS
		  Dim h As New CLGeocodeCompletionHandlerMBS
		  
		  AddHandler h.Completed, AddressOf geocodeAddressStringCompleted
		  
		  dim tag as Variant
		  c.geocodeAddressString(address, h, tag)
		  
		  geocoders.Append c
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub geocodeAddressStringCompleted(handler as CLGeocodeCompletionHandlerMBS, geocoder as CLGeocoderMBS, placemarks() as CLPlacemarkMBS, error as NSErrorMBS, tag as variant)
		  // we got something, so show on map
		  
		  If placemarks.Ubound >= 0 Then
		    
		    Dim placemark As CLPlacemarkMBS = placemarks(0)
		    Dim location As CLLocationMBS = placemark.location
		    
		    Dim pin As New MKPointAnnotation
		    
		    pin.placemark = placemark
		    pin.coordinate = New CLLocationCoordinate2DMBS(location.Latitude, location.Longitude)
		    pin.title = placemark.name
		    pins.Append pin
		    mapView.addAnnotation pin
		    
		    
		  Else
		    Break
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetXojoIcon()
		  // find Xojo app and take the icon
		  
		  Dim runningApplications() As NSRunningApplicationMBS = NSRunningApplicationMBS.runningApplicationsWithBundleIdentifier("com.xojo.xojo")
		  If runningApplications.Ubound >= 0 Then
		    Dim runningApplication As NSRunningApplicationMBS = runningApplications(0)
		    
		    Dim url As String = runningApplication.BundleURL
		    Dim file As New FolderItem(url, FolderItem.PathTypeURL)
		    
		    icon = NSWorkspaceMBS.iconForFile(file)
		    icon.setSize 32, 32
		    
		  Else
		    Break // xojo not running
		    
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Plugins needed
		
		MacFrameworks Main MacCocoa MacBase MacControls
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		geocoders() As CLGeocoderMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		icon As NSImageMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		mapview As MKMapViewMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		pins() As MKPointAnnotation
	#tag EndProperty

	#tag Property, Flags = &h0
		renderers() As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		reverseGeocoder As CLGeocoderMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		views() As MKAnnotationViewMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events Map
	#tag Event
		Sub Open()
		  Self.mapview = Me.View
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function viewForAnnotation(mapView as MKMapViewMBS, annotation as MKAnnotationMBS) As MKAnnotationViewMBS
		  For Each pin As MKPointAnnotation In pins
		    
		    If pin = annotation Then
		      // found
		      
		      Dim view As New MKAnnotationViewMBS(annotation, "test")
		      
		      view.draggable = False
		      view.image = icon
		      
		      views.Append view
		      return view
		      
		    End If
		  Next
		  
		  
		  Break // not found?
		  
		  
		  
		End Function
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
