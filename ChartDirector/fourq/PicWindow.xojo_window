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
   Height          =   480
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
   Title           =   "fourq"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // XY points for the scatter chart
		  dim DataX0(-1) as double = array(10, 15, 6, -12, 14, -8, 13, -13, 16, 12, 10.5)
		  dim DataY0(-1) as double = array(130, 150, 80, 110, -110, -105, -130, 115, -170, 125, 125.0)
		  
		  dim DataX1(-1) as double = array(6, 7, -4, 3.5, 7, 8, -9, -10, -12, 11, 8.0)
		  dim DataY1(-1) as double = array(65, -40, -40, 45, -70, -80, 80, 10, -100, 105, 60.0)
		  
		  dim DataX2(-1) as double = array(-10, -12, 11, 8, 6, 12, -4, 3.5, 7, 8, -9.0)
		  dim DataY2(-1) as double = array(65, -80, -40, 45, -70, -80, 80, 90, -100, 105, 60.0)
		  
		  // Create a XYChart object of size 600 x 300 pixels, with a light blue (ccccff)
		  // background, a black border, and 1 pixel 3D border effect
		  dim c as new CDXYChartMBS(600, 480, &hccccff, &h000000, 1)
		  
		  // Add a title box to the chart using 16 pts Arial Bold Italic font, with white
		  // text on deep blue background
		  c.addTitle("Four Quadrant Chart Demonstration", "arialbi.ttf", 16, &hffffff).setBackground(&h000080)
		  
		  // Set the plotarea at (20, 60) and of size 560 x 360 pixels, with grey (808080)
		  // border, and light grey (c0c0c0) horizontal and vertical grid lines. Set 4
		  // quadrant coloring, where the colors of the quadrants alternate between lighter
		  // and deeper grey (dddddd/eeeeee)
		  c.setPlotArea(20, 60, 560, 360, -1, -1, &h808080, &hc0c0c0, &hc0c0c0).set4QBgColor(&hdddddd, &heeeeee, &hdddddd, &heeeeee)
		  
		  // Set 4 quadrant mode, with both x and y axes symetrical around the origin
		  c.setAxisAtOrigin(CDXYChartMBS.kXYAxisAtOrigin, CDXYChartMBS.kXAxisSymmetric + CDXYChartMBS.kYAxisSymmetric)
		  
		  // Add a legend box at (300, 460) (bottom center of the chart) with horizontal
		  // layout. Use 8 pts Arial Bold font.
		  dim LegendBox as CDLegendBoxMBS
		  legendBox = c.addLegend(300, 460, false, "arialbd.ttf", 8)
		  legendBox.setAlignment(CDXYChartMBS.kBottomCenter)
		  
		  // Set legend box background to light grey (dddddd) with a black border
		  legendBox.setBackground(&hdddddd, 0)
		  
		  // Set left/right margin to 20 pixels and top/bottom margin to 5 pixels
		  legendBox.setMargin(20, 20, 5, 5)
		  
		  // Add a titles to axes
		  call c.xAxis.setTitle("Alpha Index")
		  call c.yAxis.setTitle("Beta Index")
		  
		  // Set axes width to 2 pixels
		  c.xAxis.setWidth(2)
		  c.yAxis.setWidth(2)
		  
		  // Add scatter layer, using 15 pixels red (ff33333) X shape symbols
		  call c.addScatterLayer(dataX0, dataY0, "Group A", CDXYChartMBS.Cross2Shape, 15, &hff3333)
		  
		  // Add scatter layer, using 15 pixels green (33ff33) 6-sided polygon symbols
		  call c.addScatterLayer(dataX1, dataY1, "Group B", CDXYChartMBS.PolygonShape(6), 15, &h33ff33)
		  
		  // Add scatter layer, using 15 pixels blue (3333ff) triangle symbols
		  call c.addScatterLayer(dataX2, dataY2, "Group C", CDXYChartMBS.kTriangleSymbol, 15, &h3333ff)
		  
		  
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
