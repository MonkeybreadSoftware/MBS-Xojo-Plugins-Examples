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
   Height          =   580
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1697791
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Surface Lines and Zones"
   Visible         =   True
   Width           =   680
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  CDBaseChartMBS.ScaleFactor = 2
		  
		  // The x and y coordinates of the grid
		  Dim dataX() As Double = Array(0.0, 1, 2, 3, 4, 5, 6, 7, 8)
		  Dim dataY() As Double = Array(0.0, 1, 2, 3, 4, 5, 6, 7, 8)
		  Dim dataX_size As Integer = dataX.Ubound + 1
		  Dim dataY_size As Integer = dataY.Ubound + 1
		  
		  // Use random numbers for the z values on the XY grid
		  Dim r As New CDRanSeriesMBS(11)
		  Dim dataZ() As Double = r.get2DSeries(dataX_size, dataY_size, 0.1, 1.9)
		  
		  // Create a SurfaceChart object of size 680 x 580 pixels
		  Dim c As New CDSurfaceChartMBS(680, 580)
		  
		  // Set the center of the plot region at (310, 280), and set width x depth x height to 320 x 320
		  // x 240 pixels
		  c.setPlotRegion(310, 280, 320, 320, 240)
		  
		  // Set the elevation and rotation angles to 30 and 45 degrees
		  c.setViewAngle(30, 45)
		  
		  // Set the data to use to plot the chart
		  c.setData(dataX, dataY, dataZ)
		  
		  // Spline interpolate data to a 80 x 80 grid for a smooth surface
		  c.setInterpolation(80, 80)
		  
		  // Use semi-transparent black (c0000000) for x and y major surface grid lines. Use dotted style
		  // for x and y minor surface grid lines.
		  Dim majorGridColor As Integer = &hc0000000
		  Dim minorGridColor As Integer = c.dashLineColor(majorGridColor, CDBaseChartMBS.kDotLine)
		  c.setSurfaceAxisGrid(majorGridColor, majorGridColor, minorGridColor, minorGridColor)
		  
		  // Add XY projection
		  c.addXYProjection
		  
		  // Set contour lines to semi-transparent white (&h7fffffff)
		  c.setContourColor(&h7fffffff)
		  
		  // Add a color axis (the legend) in which the left center is anchored at (620, 250). Set the
		  // length to 200 pixels and the labels on the right side.
		  Call c.setColorAxis(620, 250, CDBaseChartMBS.kLeft, 200, CDBaseChartMBS.kRight)
		  
		  // Set the x, y and z axis titles using 12 pt Arial Bold font
		  Call c.xAxis.setTitle("X Title<*br*>Placeholder", "Arial Bold", 12)
		  Call c.yAxis.setTitle("Y Title<*br*>Placeholder", "Arial Bold", 12)
		  Call c.zAxis.setTitle("Z Title Placeholder", "Arial Bold", 12)
		  
		  // set styles to adjust for 2x
		  Call c.xAxis.setLabelStyle
		  Call c.yAxis.setLabelStyle
		  Call c.zAxis.setLabelStyle
		  
		  
		  // Output the chart
		  pic = c.makeChartPicture
		  
		  // drawn in paint event
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If pic <> Nil Then
		    
		    // scale to window
		    g.DrawPicture pic, 0, 0, g.Width, g.Height, 0, 0, pic.Width, pic.Height
		    
		  End If
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		pic As Picture
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
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="pic"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior