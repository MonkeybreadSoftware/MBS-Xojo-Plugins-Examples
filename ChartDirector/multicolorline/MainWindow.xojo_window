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
   Height          =   430
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
   Title           =   "Multi-Color Line Chart"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  CDBaseChartMBS.ScaleFactor = 2
		  
		  // Data points for the line chart
		  Dim dataX() As Double = Array(0.0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25)
		  Dim dataX_size As Integer = dataX.Ubound + 1
		  Dim dataY() As Double = Array(30.0, 28, 40, 55, 75, 68, 54, 60, 50, 62, 75, 65, 75, 89, 60, 55, 53, 35, 50, 66, 56, 48, 52, 65, 62, 70)
		  Dim dataY_size As Integer = dataY.Ubound + 1
		  
		  // The data point type. The color of the line segment will be based on the starting point type
		  // of the segment. In this example, we have 4 point types for 4 different colors. Note that for
		  // a line with N points, there will be (N - 1) line segments, so we only need (N - 1) values in
		  // the point type array.
		  Dim pointType() As Integer = Array(0, 0, 0, 1, 1, 0, 2, 3, 1, 1, 0, 0, 1, 1, 2, 2, 2, 3, 3, 2, 0, 1, 2, 3, 3)
		  Dim pointType_size As Integer = pointType.Ubound + 1
		  Dim colors() As Integer = Array( Ctype(&hff0000, Integer), &h0066ff, &hcc00cc, &h00cc00)
		  Dim colors_size As Integer = colors.Ubound + 1
		  Dim pointTypeLabels() As String = Array("Alpha", "Beta", "Gamma", "Delta")
		  
		  // Create a XYChart object of size 600 x 430 pixels
		  Dim c As New CDXYChartMBS(600, 430)
		  
		  // Set default text color to dark grey (&h333333)
		  c.setColor(CDBaseChartMBS.kTextColor, &h333333)
		  
		  // Add a title box using grey (&h555555) 20pt Arial font
		  Call c.addTitle("    Multi-Color Line Chart", "Arial", 20, &h555555)
		  
		  // Set the plotarea at (70, 70) and of size 500 x 300 pixels, with transparent background and
		  // border and light grey (&hcccccc) horizontal grid lines
		  Call c.setPlotArea(70, 70, 500, 300, CDBaseChartMBS.kTransparent, -1, CDBaseChartMBS.kTransparent, &hcccccc)
		  
		  // Add a legend box with horizontal layout above the plot area at (70, 35). Use 12pt Arial font,
		  // transparent background and border, and line style legend icon.
		  Dim b As CDLegendBoxMBS = c.addLegend(70, 35, False, "Arial", 12)
		  b.setBackground(CDBaseChartMBS.kTransparent, CDBaseChartMBS.kTransparent)
		  b.setLineStyleKey
		  
		  // Set axis label font to 12pt Arial
		  Call c.xAxis.setLabelStyle("Arial", 12)
		  call c.yAxis.setLabelStyle("Arial", 12)
		  
		  // Set the x and y axis stems to transparent, and the x-axis tick color to grey (&haaaaaa)
		  c.xAxis.setColors(CDBaseChartMBS.kTransparent, CDBaseChartMBS.kTextColor, CDBaseChartMBS.kTextColor, &haaaaaa)
		  c.yAxis.setColors(CDBaseChartMBS.kTransparent)
		  
		  // Set the major/minor tick lengths for the x-axis to 10 and 0.
		  c.xAxis.setTickLength(10, 0)
		  
		  // For the automatic axis labels, set the minimum spacing to 80/40 pixels for the x/y axis.
		  c.xAxis.setTickDensity(80)
		  c.yAxis.setTickDensity(40)
		  
		  // Add a title to the y axis using dark grey (&h555555) 14pt Arial font
		  Call c.xAxis.setTitle("X-Axis Title Placeholder", "Arial", 14, &h555555)
		  Call c.yAxis.setTitle("Y-Axis Title Placeholder", "Arial", 14, &h555555)
		  
		  // In ChartDirector, each line layer can only have one line color, so we use 4 line layers to
		  // draw the 4 different colors of line segments.
		  
		  // In general, the line segments for each color will not be continuous. In ChartDirector,
		  // non-continuous line segments can be achieved by inserting NoValue points. To allow for these
		  // extra points, we use a buffer twice the size of the original data arrays.
		  Dim lineX_size As Integer = dataX_size * 2
		  Dim lineX() As Double
		  Dim lineY_size As Integer = dataY_size * 2
		  Dim lineY() As Double
		  
		  Redim lineX(lineX_size-1)
		  Redim lineY(lineY_size-1) 
		  
		  
		  // Use a loop to create a line layer for each color
		  For i As Integer = 0 To colors_size-1
		    Dim n As Integer = 0
		    For j As Integer = 0 To dataX_size-1
		      // We include data points of the target type in the line layer.
		      If ((j < pointType_size) And (pointType(j) = i)) Then
		        lineX(n) = dataX(j)
		        lineY(n) = dataY(j)
		        n = n + 1
		      Elseif ((j > 0) And (pointType(j - 1) = i)) Then
		        // If the current point is not of the target, but the previous point is of the
		        // target type, we still need to include the current point in the line layer, as it
		        // takes two points to draw a line segment. We also need an extra NoValue point so
		        // that the current point will not join with the next point.
		        lineX(n) = dataX(j)
		        lineY(n) = dataY(j)
		        n = n + 1
		        lineX(n) = dataX(j)
		        lineY(n) = CDBaseChartMBS.kNoValue
		        n = n + 1
		      End If
		    Next
		    
		    // cut away empty space
		    Redim lineY(n-1)
		    Redim lineX(n-1)
		    
		    // Draw the layer that contains all segments of the target color
		    Dim layer As CDLineLayerMBS = c.addLineLayer(lineY, colors(i), pointTypeLabels(i))
		    layer.setXData(lineX)
		    layer.setLineWidth(2)
		  Next
		  
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
