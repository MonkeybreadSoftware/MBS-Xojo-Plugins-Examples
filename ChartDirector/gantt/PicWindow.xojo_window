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
   Height          =   280
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
   Title           =   "gantt"
   Visible         =   True
   Width           =   620
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // data for the gantt chart, representing the start date, end date and names for
		  // various activities
		  dim startDate(-1) as double = array(CDXYChartMBS.chartTime(2004, 8, 16), CDXYChartMBS.chartTime(2004, 8, 30), CDXYChartMBS.chartTime(2004, 9, 13), CDXYChartMBS.chartTime(2004, 9, 20), CDXYChartMBS.chartTime(2004, 9, 27), CDXYChartMBS.chartTime(2004,10, 4), CDXYChartMBS.chartTime(2004, 10, 25), CDXYChartMBS.chartTime(2004, 11, 1), CDXYChartMBS.chartTime(2004, 11,8))
		  dim endDate(-1) as double = array(CDXYChartMBS.chartTime(2004, 8, 30), CDXYChartMBS.chartTime(2004, 9, 13), CDXYChartMBS.chartTime(2004, 9, 27), CDXYChartMBS.chartTime(2004, 10, 4), CDXYChartMBS.chartTime(2004, 10, 11), CDXYChartMBS.chartTime(2004, 11, 8), CDXYChartMBS.chartTime(2004, 11, 8), CDXYChartMBS.chartTime(2004, 11, 22), CDXYChartMBS.chartTime(2004, 11, 22))
		  dim labels(-1) as string = array("Market Research", "Define Specifications", "Overall Archiecture", "Project Planning", "Detail Design", "Software Development", "Test Plan", "Testing and QA", "User Documentation")
		  
		  // Create a XYChart object of size 620 x 280 pixels. Set background color to
		  // light blue (ccccff), with 1 pixel 3D border effect.
		  dim c as new CDXYChartMBS(620, 280, &hccccff, &h000000, 1)
		  
		  // Add a title to the chart using 15 points Times Bold Itatic font, with white
		  // (ffffff) text on a deep blue (000080) background
		  c.addTitle("Simple Gantt Chart Demo", "timesbi.ttf", 15, &hffffff).setBackground(&h000080)
		  
		  // Set the plotarea at (140, 55) and of size 460 x 200 pixels. Use alternative
		  // white/grey background. Enable both horizontal and vertical grids by setting
		  // their colors to grey (c0c0c0). Set vertical major grid (represents month
		  // boundaries) 2 pixels in width
		  c.setPlotArea(140, 55, 460, 200, &hffffff, &heeeeee, CDXYChartMBS.kLineColor, &hc0c0c0, &hc0c0c0).setGridWidth(2, 1, 1, 1)
		  
		  // swap the x and y axes to create a horziontal box-whisker chart
		  c.swapXY
		  
		  // Set the y-axis scale to be date scale from Aug 16, 2004 to Nov 22, 2004, with
		  // ticks every 7 days (1 week)
		  call c.yAxis.setDateScale(c.chartTime(2004, 8, 16), c.chartTime(2004, 11, 22), 86400.0 * 7.0)
		  
		  // Set multi-style axis label formatting. Month labels are in Arial Bold font in
		  // "mmm d" format. Weekly labels just show the day of month and use minor tick
		  // (by using '-' as first character of format string).
		  c.yAxis.setMultiFormat(CDXYChartMBS.StartOfMonthFilter,"<*font=arialbd.ttf*>{value|mmm d}", CDXYChartMBS.StartOfDayFilter, "-{value|d}")
		  
		  
		  // Set the y-axis to shown on the top (right + swapXY = top)
		  c.setYAxisOnRight
		  
		  // Set the labels on the x axis
		  call c.xAxis.setLabels(labels)
		  
		  // Reverse the x-axis scale so that it points downwards.
		  c.xAxis.setReverse
		  
		  // Set the horizontal ticks and grid lines to be between the bars
		  c.xAxis.setTickOffset(0.5)
		  
		  // Add a green (33ff33) box-whisker layer showing the box only.
		  dim m1(-1), m2(-1), m3(-1) as Double
		  
		  call c.addBoxWhiskerLayer(startDate, endDate, m1, m2, m3, &h00cc00, CDXYChartMBS.kSameAsMainColor, CDXYChartMBS.kSameAsMainColor)
		  
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
