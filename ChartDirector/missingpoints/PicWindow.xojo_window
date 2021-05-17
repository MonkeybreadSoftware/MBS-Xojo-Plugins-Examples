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
   Height          =   360
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
   Title           =   "missingpoints"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The data for the chart
		  dim data0(-1) as double = array(42.0, 49, CDXYChartMBS.kNoValue, 38, 64, 56, 29, 41, 44, 57)
		  dim data1(-1) as double = array(65.0, 75, 47, 34, 42, 49, 73, CDXYChartMBS.kNoValue, 90, 69, 66, 78)
		  dim data2(-1) as double = array(CDXYChartMBS.kNoValue, CDXYChartMBS.kNoValue, 25, 28, 38, 20, 22, CDXYChartMBS.kNoValue, 25, 33, 30, 24)
		  dim labels(-1) as string = array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
		  
		  // Create a XYChart object of size 600 x 360 pixels. Set background color to
		  // brushed silver, with a 2 pixel 3D border. Use rounded corners.
		  dim c as new CDXYChartMBS(600, 360, CDXYChartMBS.brushedSilverColor, CDXYChartMBS.kTransparent, 2)
		  c.setRoundedFrame
		  
		  // Add a title using 18 pts Times New Roman Bold Italic font. #Set top/bottom
		  // margins to 6 pixels.
		  dim title as CDTextBoxMBS = c.addTitle("Product Line Global Revenue", "timesbi.ttf", 18)
		  title.setMargin(0, 0, 6, 6)
		  
		  // Add a separator line just under the title
		  call c.addLine(10, title.getHeight, c.getWidth - 11, title.getHeight, CDXYChartMBS.kLineColor)
		  
		  // Add a legend box where the top-center is anchored to the horizontal center of
		  // the chart, just under the title. Use horizontal layout and 10 points Arial
		  // Bold font, and transparent background and border.
		  dim legendBox as CDLegendBoxMBS = c.addLegend(c.getWidth / 2, title.getHeight, false, "arialbd.ttf", 10)
		  legendBox.setAlignment(CDXYChartMBS.kTopCenter)
		  legendBox.setBackground(CDXYChartMBS.kTransparent, CDXYChartMBS.kTransparent)
		  
		  // Tentatively set the plotarea at (70, 75) and of 460 x 240 pixels in size. Use
		  // transparent border and black (000000) grid lines
		  call c.setPlotArea(70, 75, 460, 240, -1, -1, CDXYChartMBS.kTransparent, &h000000, -1)
		  
		  // Set the x axis labels
		  call c.xAxis.setLabels(labels)
		  
		  // Show the same scale on the left and right y-axes
		  c.syncYAxis
		  
		  // Set y-axis tick density to 30 pixels. ChartDirector auto-scaling will use this
		  // as the guideline when putting ticks on the y-axis.
		  c.yAxis.setTickDensity(30)
		  
		  // Set all axes to transparent
		  c.xAxis.setColors(CDXYChartMBS.kTransparent)
		  c.yAxis.setColors(CDXYChartMBS.kTransparent)
		  c.yAxis2.setColors(CDXYChartMBS.kTransparent)
		  
		  // Set the x-axis margins to 15 pixels, so that the horizontal grid lines can
		  // extend beyond the leftmost and rightmost vertical grid lines
		  c.xAxis.setMargin(15, 15)
		  
		  // Set axis label style to 8pts Arial Bold
		  call c.xAxis.setLabelStyle("arialbd.ttf", 8)
		  call c.yAxis.setLabelStyle("arialbd.ttf", 8)
		  call c.yAxis2.setLabelStyle("arialbd.ttf", 8)
		  
		  // Add axis title using 10pts Arial Bold Italic font
		  call c.yAxis.setTitle("Revenue in USD millions", "arialbi.ttf", 10)
		  call c.yAxis2.setTitle("Revenue in USD millions", "arialbi.ttf", 10)
		  
		  // Add the first line. The missing data will be represented as gaps in the line
		  // (the default behaviour)
		  dim layer0 as CDLineLayerMBS = c.addLineLayer
		  layer0.addDataSet(data0, &hff0000, "Quantum Computer").setDataSymbol(CDXYChartMBS.kGlassSphere2Shape, 11)
		  layer0.setLineWidth(3)
		  
		  // Add the second line. The missing data will be represented by using dash lines
		  // to bridge the gap
		  dim layer1 as CDLineLayerMBS = c.addLineLayer
		  layer1.addDataSet(data1, &h00ff00, "Atom Synthesizer").setDataSymbol(CDXYChartMBS.kGlassSphere2Shape, 11)
		  layer1.setLineWidth(3)
		  layer1.setGapColor(c.dashLineColor(&h00ff00))
		  
		  // Add the third line. The missing data will be ignored - just join the gap with
		  // the original line style.
		  dim layer2 as CDLineLayerMBS = c.addLineLayer
		  layer2.addDataSet(data2, &hff6600, "Proton Cannon").setDataSymbol(CDXYChartMBS.kGlassSphere2Shape, 11)
		  layer2.setLineWidth(3)
		  layer2.setGapColor(CDXYChartMBS.kSameAsMainColor)
		  
		  // layout the legend so we can get the height of the legend box
		  call c.layoutLegend
		  
		  // Adjust the plot area size, such that the bounding box (inclusive of axes) is
		  // 15 pixels from the left edge, just under the legend box, 16 pixels from the
		  // right edge, and 25 pixels from the bottom edge.
		  c.packPlotArea(15, legendBox.getTopY + legendBox.getHeight, c.getWidth - 16, c.getHeight - 25)
		  
		  Backdrop=c.MakeChartPicture
		  
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
