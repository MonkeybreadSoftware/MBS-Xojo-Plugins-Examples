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
   Height          =   330
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
   Title           =   "unevenpoints"
   Visible         =   True
   Width           =   500
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  // Data points which more unevenly spaced in time
		  dim data0Y(-1) as double = array(62.0, 69, 53, 58, 84, 76, 49, 61, 64, 77, 79.0)
		  dim data0X(-1) as double 
		  data0X.Append CDXYChartMBS.chartTime(2007, 1, 1)
		  data0X.Append CDXYChartMBS.chartTime(2007, 1, 2)
		  data0X.Append CDXYChartMBS.chartTime(2007, 1, 5)
		  data0X.Append CDXYChartMBS.chartTime(2007, 1, 7)
		  data0X.Append CDXYChartMBS.chartTime(2007, 1, 10)
		  data0X.Append CDXYChartMBS.chartTime(2007, 1, 14)
		  data0X.Append CDXYChartMBS.chartTime(2007, 1, 17)
		  data0X.Append CDXYChartMBS.chartTime(2007, 1, 18)
		  data0X.Append CDXYChartMBS.chartTime(2007, 1, 19)
		  data0X.Append CDXYChartMBS.chartTime(2007, 1, 20)
		  data0X.Append CDXYChartMBS.chartTime(2007, 1, 21)
		  
		  // Data points which are evenly spaced in a certain time range
		  dim data1Y(-1) as double = array(36.0, 25, 28, 38, 20, 30, 27, 35, 65, 60, 40, 73, 62, 90, 75, 72)
		  
		  dim data1Start as double = CDXYChartMBS.chartTime(2007, 1, 1)
		  dim data1End as double = CDXYChartMBS.chartTime(2007, 1, 16)
		  
		  // Data points which are evenly spaced in another time range, in which the
		  // spacing is different from the above series
		  dim data2Y(-1) as double = array(25.0, 15, 30, 23, 32, 55, 45)
		  dim data2Start as double = CDXYChartMBS.chartTime(2007, 1, 9)
		  dim data2End as double = CDXYChartMBS.chartTime(2007, 1, 21)
		  
		  // Create a XYChart object of size 600 x 400 pixels. Use a vertical gradient
		  // color from light blue (99ccff) to white (ffffff) spanning the top 100 pixels
		  // as background. Set border to grey (888888). Use rounded corners. Enable soft
		  // drop shadow.
		  dim c as new CDXYChartMBS(600, 400)
		  c.setBackground(c.linearGradientColor(0, 0, 0, 100, &h99ccff, &hffffff), &h888888)
		  c.setRoundedFrame
		  c.setDropShadow
		  
		  // Add a title using 18 pts Times New Roman Bold Italic font. #Set top margin to
		  // 16 pixels.
		  c.addTitle("Product Line Order Backlog", "timesbi.ttf", 18).setMargin(0, 0, 16, 0)
		  
		  // Set the plotarea at (60, 80) and of 510 x 275 pixels in size. Use transparent
		  // border and dark grey (444444) dotted grid lines
		  dim plotArea as CDPlotAreaMBS = c.setPlotArea(60, 80, 510, 275, -1, -1, c.kTransparent, c.dashLineColor(&h444444, &h000101), -1)
		  
		  // Add a legend box where the top-center is anchored to the horizontal center of
		  // the plot area at y = 45. Use horizontal layout and 10 points Arial Bold font,
		  // and transparent background and border.
		  dim legendBox as CDLegendBoxMBS = c.addLegend(plotArea.getLeftX + plotArea.getWidth / 2, 45, false, "arialbd.ttf", 10)
		  legendBox.setAlignment(c.kTopCenter)
		  legendBox.setBackground(c.kTransparent, c.kTransparent)
		  
		  // Set x-axis tick density to 75 pixels and y-axis tick density to 30 pixels.
		  // ChartDirector auto-scaling will use this as the guidelines when putting ticks
		  // on the x-axis and y-axis.
		  c.yAxis.setTickDensity(30)
		  c.xAxis.setTickDensity(75)
		  
		  // Set all axes to transparent
		  c.xAxis.setColors(c.kTransparent)
		  c.yAxis.setColors(c.kTransparent)
		  
		  // Set the x-axis margins to 15 pixels, so that the horizontal grid lines can
		  // extend beyond the leftmost and rightmost vertical grid lines
		  c.xAxis.setMargin(15, 15)
		  
		  // Set axis label style to 8pts Arial Bold
		  call c.xAxis.setLabelStyle("arialbd.ttf", 8)
		  call c.yAxis.setLabelStyle("arialbd.ttf", 8)
		  call c.yAxis2.setLabelStyle("arialbd.ttf", 8)
		  
		  // Add axis title using 10pts Arial Bold Italic font
		  call c.yAxis.setTitle("Backlog in USD millions", "arialbi.ttf", 10)
		  
		  // Add the first data series
		  dim layer0 as CDLineLayerMBS = c.addLineLayer
		  layer0.addDataSet(data0Y, &hff0000, "Quantum Computer").setDataSymbol(c.kGlassSphere2Shape, 11)
		  layer0.setXData(data0X)
		  layer0.setLineWidth(3)
		  
		  // Add the second data series
		  dim layer1 as CDLineLayerMBS  = c.addLineLayer
		  layer1.addDataSet(data1Y, &h00ff00, "Atom Synthesizer").setDataSymbol(c.kGlassSphere2Shape, 11)
		  layer1.setXData(data1Start, data1End)
		  layer1.setLineWidth(3)
		  
		  // Add the third data series
		  dim layer2 as CDLineLayerMBS  = c.addLineLayer
		  layer2.addDataSet(data2Y, &hff6600, "Proton Cannon").setDataSymbol(c.kGlassSphere2Shape, 11)
		  layer2.setXData(data2Start, data2End)
		  layer2.setLineWidth(3)
		  
		  // Output the chart
		  Backdrop=c.makechartpicture
		  
		  
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
