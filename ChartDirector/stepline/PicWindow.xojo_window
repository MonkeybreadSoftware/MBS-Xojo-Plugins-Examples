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
   Height          =   300
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
   Title           =   "stepline"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The data for the chart
		  dim dataY0(-1) as double = array(4, 4.5, 5, 5.25, 5.75, 5.25, 5, 4.5, 4, 3, 2.5, 2.5)
		  dim dataX0(-1) as double = array(CDXYChartMBS.chartTime(1997, 1, 1), CDXYChartMBS.chartTime(1998, 6, 25), CDXYChartMBS.chartTime(1999, 9, 6), CDXYChartMBS.chartTime(2000, 2, 6), CDXYChartMBS.chartTime(2000, 9, 21), CDXYChartMBS.chartTime(2001, 3, 4), CDXYChartMBS.chartTime(2001, 6, 8), CDXYChartMBS.chartTime(2002, 2, 4), CDXYChartMBS.chartTime(2002, 5, 19), CDXYChartMBS.chartTime(2002, 8, 16), CDXYChartMBS.chartTime(2002, 12, 1), CDXYChartMBS.chartTime(2003, 1, 1))
		  
		  dim dataY1(-1) as double = array(7, 6.5, 6, 5, 6.5, 7, 6, 5.5, 5, 4, 3.5, 3.5)
		  dim dataX1(-1) as double = array(CDXYChartMBS.chartTime(1997, 1, 1), CDXYChartMBS.chartTime(1997, 7, 1), CDXYChartMBS.chartTime(1997, 12, 1), CDXYChartMBS.chartTime(1999, 1, 15), CDXYChartMBS.chartTime(1999, 6, 9), CDXYChartMBS.chartTime(2000, 3, 3), CDXYChartMBS.chartTime(2000, 8, 13), CDXYChartMBS.chartTime(2001, 5, 5), CDXYChartMBS.chartTime(2001, 9, 16), CDXYChartMBS.chartTime(2002, 3, 16), CDXYChartMBS.chartTime(2002, 6, 1), CDXYChartMBS.chartTime(2003, 1, 1))
		  
		  // Create a XYChart object of size 500 x 270 pixels, with a pale blue (e0e0ff)
		  // background, black border, 1 pixel 3D border effect and rounded corners
		  dim c as new CDXYChartMBS(600, 300, &he0e0ff, &h000000, 1)
		  c.setRoundedFrame
		  
		  // Set the plotarea at (55, 60) and of size 520 x 200 pixels, with white (ffffff)
		  // background. Set horizontal and vertical grid lines to grey (cccccc).
		  call c.setPlotArea(50, 60, 525, 200, &hffffff, -1, -1, &hcccccc, &hcccccc)
		  
		  // Add a legend box at (55, 32) (top of the chart) with horizontal layout. Use 9
		  // pts Arial Bold font. Set the background and border color to Transparent.
		  call c.addLegend(55, 32, false, "arialbd.ttf", 9).setBackground(c.kTransparent)
		  
		  // Add a title box to the chart using 15 pts Times Bold Italic font. The text is
		  // white (ffffff) on a deep blue (000088) background, with soft lighting effect
		  // from the right side.
		  c.addTitle("Long Term Interest Rates", "timesbi.ttf", 15, &hffffff).setBackground(&h000088, -1, c.softLighting(c.kRight))
		  
		  // Set the y axis label format to display a percentage sign
		  c.yAxis.setLabelFormat("{value}%")
		  
		  // Add a red (ff0000) step line layer to the chart and set the line width to 2
		  // pixels
		  dim layer0 as CDStepLineLayerMBS
		  layer0 = c.addStepLineLayer(dataY0, &hff0000, "Country AAA")
		  layer0.setXData(dataX0)
		  layer0.setLineWidth(2)
		  
		  // Add a blue (0000ff) step line layer to the chart and set the line width to 2
		  // pixels
		  dim layer1 as CDStepLineLayerMBS
		  layer1 = c.addStepLineLayer(dataY1, &h0000ff, "Country BBB")
		  layer1.setXData(dataX1)
		  layer1.setLineWidth(2)
		  
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
