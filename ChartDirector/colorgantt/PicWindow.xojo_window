#tag Window
Begin Window PicWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   325
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
   Title           =   "colorgantt"
   Visible         =   True
   Width           =   620
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The tasks for the gantt chart
		  dim labels(-1) as string = array ("Market Research", "Define Specifications", "Overall Archiecture", "Project Planning", "Detail Design", "Software Development", "Test Plan", "Testing and QA", "User Documentation")
		  
		  // The task index, start date, end date and color for each bar
		  dim taskNo(-1) as double = array(0, 0, 1, 2, 3, 4, 5, 6, 6, 7, 8, 8.0)
		  dim startDate(-1) as double = array(CDXYChartMBS.chartTime(2004, 8, 16), CDXYChartMBS.chartTime(2004, 10, 4), CDXYChartMBS.chartTime(2004, 8, 30), CDXYChartMBS.chartTime(2004, 9, 13), CDXYChartMBS.chartTime(2004, 9, 20), CDXYChartMBS.chartTime(2004, 9, 27), CDXYChartMBS.chartTime(2004, 10, 4), CDXYChartMBS.chartTime(2004, 10, 4), CDXYChartMBS.chartTime(2004, 10, 25), CDXYChartMBS.chartTime(2004, 11, 1), CDXYChartMBS.chartTime(2004, 10, 18), CDXYChartMBS.chartTime(2004, 11, 8))
		  dim endDate(-1) as double = array(CDXYChartMBS.chartTime(2004, 8, 30), CDXYChartMBS.chartTime(2004, 10, 18), CDXYChartMBS.chartTime(2004, 9, 13), CDXYChartMBS.chartTime(2004, 9, 27), CDXYChartMBS.chartTime(2004, 10, 4), CDXYChartMBS.chartTime(2004, 10, 11), CDXYChartMBS.chartTime(2004, 11, 8), CDXYChartMBS.chartTime(2004, 10, 18), CDXYChartMBS.chartTime(2004, 11, 8), CDXYChartMBS.chartTime(2004, 11, 22), CDXYChartMBS.chartTime(2004, 11, 1), CDXYChartMBS.chartTime(2004, 11, 22))
		  dim colors(-1) as integer
		  
		  colors.append &h00cc00
		  colors.append &h00cc00
		  colors.append &h00cc00
		  colors.append &h0000cc
		  colors.append &h0000cc
		  colors.append &hcc0000
		  colors.append &hcc0000
		  colors.append &h0000cc
		  colors.append &hcc0000
		  colors.append &hcc0000
		  colors.append &h00cc00
		  colors.append &hcc0000
		  
		  // Create a XYChart object of size 620 x 325 pixels. Set background color to
		  // light red (&hffcccc), with 1 pixel 3D border effect.
		  dim c as new CDXYChartMBS(620, 325, &hffcccc, &h000000, 1)
		  
		  // Add a title to the chart using 15 points Times Bold Itatic font, with white
		  // (ffffff) text on a dark red (800000) background
		  c.addTitle("Multi-Color Gantt Chart Demo", "timesbi.ttf", 15, &hffffff).setBackground(&h800000)
		  
		  // Set the plotarea at (140, 55) and of size 460 x 200 pixels. Use alternative
		  // white/grey background. Enable both horizontal and vertical grids by setting
		  // their colors to grey (c0c0c0). Set vertical major grid (represents month
		  // boundaries) 2 pixels in width
		  c.setPlotArea(140, 55, 460, 200, &hffffff, &heeeeee, CDXYChartMBS.kLineColor, &hc0c0c0, &hc0c0c0).setGridWidth(2, 1, 1, 1)
		  
		  // swap the x and y axes to create a horziontal box-whisker chart
		  c.swapXY
		  
		  // Set the y-axis scale to be date scale from Aug 16, 2004 to Nov 22, 2004, with
		  // ticks every 7 days (1 week)
		  c.yAxis.setDateScale(CDXYChartMBS.chartTime(2004, 8, 16), CDXYChartMBS.chartTime(2004, 11, 22), 86400 * 7)
		  
		  // Set multi-style axis label formatting. Month labels are in Arial Bold font in
		  // "mmm d" format. Weekly labels just show the day of month and use minor tick
		  // (by using '-' as first character of format string).
		  c.yAxis.setMultiFormat(CDXYChartMBS.StartOfMonthFilter, "<*font=arialbd.ttf*>{value|mmm d}", CDXYChartMBS.StartOfDayFilter, "-{value|d}")
		  
		  
		  // Set the y-axis to shown on the top (right + swapXY = top)
		  c.setYAxisOnRight
		  
		  // Set the labels on the x axis
		  call c.xAxis.setLabels(labels)
		  
		  // Reverse the x-axis scale so that it points downwards.
		  c.xAxis.setReverse
		  
		  // Set the horizontal ticks and grid lines to be between the bars
		  c.xAxis.setTickOffset(0.5)
		  
		  // Add some symbols to the chart to represent milestones. The symbols are added
		  // using scatter layers. We need to specify the task index, date, name, symbol
		  // shape, size and color.
		  dim coor1(-1) as Double = array(1.0)
		  dim date1(-1) as Double = array(CDXYChartMBS.chartTime(2004, 9, 13))
		  call c.addScatterLayer(coor1, date1, "Milestone 1", CDXYChartMBS.Cross2Shape, 13, &hffff00)
		  dim coor2(-1) as Double = array(3.0)
		  dim date2(-1) as Double = array(CDXYChartMBS.chartTime(2004, 10, 4))
		  call c.addScatterLayer(coor2, date2, "Milestone 2", CDXYChartMBS.StarShape(5), 15, &hff00ff)
		  dim coor3(-1) as Double = array(5.0)
		  dim date3(-1) as Double = array(CDXYChartMBS.chartTime(2004, 11, 8))
		  call c.addScatterLayer(coor3, date3, "Milestone 3", CDXYChartMBS.kTriangleSymbol, 13, &hff9933)
		  
		  // Add a multi-color box-whisker layer to represent the gantt bars
		  dim layer as CDBoxWhiskerLayerMBS
		  dim m1(-1) as Double
		  dim m2(-1) as Double
		  dim m3(-1) as Double
		  
		  layer = c.addBoxWhiskerLayer2(startDate, endDate, m1, m2, m3, colors)
		  layer.setXData(taskNo)
		  layer.setBorderColor(CDXYChartMBS.kSameAsMainColor)
		  
		  // Divide the plot area height ( = 200 in this chart) by the number of tasks to
		  // get the height of each slot. Use 80% of that as the bar height.
		  layer.setDataWidth(200 * 4 / 5 / 9)
		  
		  // Add a legend box at (140, 265) - bottom of the plot area. Use 8 pts Arial Bold
		  // as the font with auto-grid layout. Set the width to the same width as the plot
		  // area. Set the backgorund to grey (dddddd).
		  dim legendBox as CDLegendBoxMBS
		  legendBox = c.addLegend(140, 265, CDXYChartMBS.kAutoGrid, "arialbd.ttf", 8)
		  
		  legendBox.setWidth(461)
		  legendBox.setBackground(&hdddddd)
		  
		  // The keys for the scatter layers (milestone symbols) will automatically be
		  // added to the legend box. We just need to add keys to show the meanings of the
		  // bar colors.
		  legendBox.addKey("Market Team", &h00cc00)
		  legendBox.addKey("Planning Team", &h0000cc)
		  legendBox.addKey("Development Team", &hcc0000)
		  
		  // Output the chart
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
