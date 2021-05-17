#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   220
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   2101945758
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "xzonecolor"
   Visible         =   True
   Width           =   550
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  dim i, count as integer
		  
		  // The data for the chart
		  dim data(-1) as double = array(50, 55, 47, 34, 42, 49, 63, 62, 73, 59, 56, 50, 64, 60, 67, 67, 58, 59, 73, 77, 84, 82, 80, 84, 89.0)
		  
		  // The error data representing the error band around the data points
		  dim errData(-1) as double = array(5, 6, 5.1, 6.5, 6.6, 8, 5.4, 5.1, 4.6, 5.0, 5.2, 6.0, 4.9, 5.6, 4.8, 6.2, 7.4, 7.1, 6.5, 9.6, 12.1, 15.3, 18.5, 20.9, 24.1)
		  
		  // The timestamps for the data
		  dim labels(-1) as double = array( CDXYChartMBS.chartTime(2001, 1, 1), CDXYChartMBS.chartTime(2001, 2, 1), CDXYChartMBS.chartTime(2001, 3, 1), CDXYChartMBS.chartTime(2001, 4, 1), CDXYChartMBS.chartTime(2001, 5, 1), CDXYChartMBS.chartTime(2001, 6, 1),  CDXYChartMBS.chartTime(2001, 7, 1), CDXYChartMBS.chartTime(2001, 8, 1), CDXYChartMBS.chartTime(2001, 9, 1), CDXYChartMBS.chartTime(2001, 10, 1), CDXYChartMBS.chartTime(2001, 11, 1), CDXYChartMBS.chartTime(2001, 12, 1), CDXYChartMBS.chartTime(2002, 1, 1), CDXYChartMBS.chartTime(2002, 2, 1), CDXYChartMBS.chartTime(2002, 3, 1), CDXYChartMBS.chartTime(2002, 4, 1), CDXYChartMBS.chartTime(2002, 5, 1), CDXYChartMBS.chartTime(2002, 6, 1), CDXYChartMBS.chartTime(2002, 7, 1), CDXYChartMBS.chartTime(2002, 8, 1), CDXYChartMBS.chartTime(2002, 9, 1), CDXYChartMBS.chartTime(2002, 10, 1), CDXYChartMBS.chartTime(2002, 11, 1), CDXYChartMBS.chartTime(2002, 12, 1), CDXYChartMBS.chartTime(2003, 1, 1))
		  
		  // Create a XYChart object of size 550 x 220 pixels
		  dim c as new CDXYChartMBS(550, 220)
		  
		  // Set the plot area at (50, 10) and of size 480 x 180 pixels. Enabled both
		  // vertical and horizontal grids by setting their colors to light grey (cccccc)
		  c.setPlotArea(50, 10, 480, 180).setGridColor(&hcccccc, &hcccccc)
		  
		  // Add a legend box (50, 10) (top of plot area) using horizontal layout. Use 8
		  // pts Arial font. Disable bounding box (set border to transparent).
		  dim legendbox as CDLegendBoxMBS
		  legendBox = c.addLegend(50, 10, false, "", 8)
		  legendBox.setBackground(CDXYChartMBS.kTransparent)
		  
		  // Add keys to the legend box to explain the color zones
		  legendBox.addKey("Historical", &h9999ff)
		  legendBox.addKey("Forecast", &hff9966)
		  
		  // Add a title to the y axis.
		  call c.yAxis.setTitle("Energy Consumption")
		  
		  // Set the labels on the x axis
		  call c.xAxis.setLabels(labels)
		  
		  // Set multi-style axis label formatting. Use Arial Bold font for yearly labels
		  // and display them as "yyyy". Use default font for monthly labels and display
		  // them as "mmm". Replace some labels with minor ticks to ensure the labels are
		  // at least 3 units apart.
		  c.xAxis.setMultiFormat(CDXYChartMBS.StartOfYearFilter, "<*font=arialbd.ttf*>{value|yyyy}", CDXYChartMBS.StartOfMonthFilter, "{value|mmm}", 3)
		  
		  // Add a line layer to the chart
		  dim layer as CDLineLayerMBS
		  layer = c.addLineLayer
		  
		  // Create the color to draw the data line. The line is blue (&h333399) to the
		  // left of x = 18, and become a red (&hd04040) dash line to the right of x = 18.
		  dim lineColor as integer
		  lineColor = layer.xZoneColor(18, &h333399, c.dashLineColor(&hd04040, CDXYChartMBS.kDashLine))
		  
		  // Add the data line
		  call layer.addDataSet(data, lineColor)
		  
		  // Create the color to draw the err zone. The color is semi-transparent blue
		  // (&h809999ff) to the left of x = 18, and become semi-transparent red
		  // (&h80ff9966) to the right of x = 18.
		  dim errColor as integer
		  errColor = layer.xZoneColor(18, &h809999FF, &h80FF9966)
		  
		  // Add the upper border of the err zone
		  dim udata(-1) as Double
		  count=UBound(data)
		  for i=0 to count
		    udata.Append data(i)+errData(i)
		  next
		  
		  call layer.addDataSet(udata, errColor)
		  
		  // Add the lower border of the err zone
		  dim ldata(-1) as Double
		  count=UBound(data)
		  for i=0 to count
		    ldata.Append data(i)-errData(i)
		  next
		  
		  call layer.addDataSet(ldata, errColor)
		  
		  // Set the default line width to 2 pixels
		  layer.setLineWidth(2)
		  
		  // Color the region between the err zone lines
		  call c.addInterLineLayer(layer.getLine(1), layer.getLine(2), errColor)
		  
		  // output the chart
		  Backdrop=c.makeChartPicture
		  
		End Sub
	#tag EndEvent


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
