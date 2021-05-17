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
   Title           =   "multiaxes"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // Data for the chart
		  dim Data0(-1) as double = array(1700, 3900, 2900, 3800, 4100, 4600, 2900, 4100, 4400, 5700, 5900, 5200, 3700, 3400, 5100, 5600, 5600, 6000, 7000, 7600, 6300, 6700, 7500, 6400, 8800.0)
		  dim Data1(-1) as double = array(500, 550, 670, 990, 820, 730, 800, 720, 730, 790, 860, 800, 840, 680, 740, 890, 680, 790, 730, 770, 840, 820, 800, 840, 670.0)
		  dim Data2(-1) as double = array(46, 68, 35, 33, 38, 20, 12, 18, 15, 23, 30, 24, 28, 15, 21, 26, 46, 42, 38, 25, 23, 32, 24, 20, 25.0)
		  dim Data3(-1) as double = array(0.84, 0.82, 0.82, 0.38, 0.25, 0.52, 0.54, 0.52, 0.38, 0.51, 0.46, 0.29, 0.5, 0.55, 0.47, 0.34, 0.52, 0.33, 0.21, 0.3, 0.25, 0.15, 0.18, 0.22, 0.14)
		  
		  // Labels for the chart
		  dim labels(-1) as string = array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24")
		  
		  // Create a XYChart object of size 600 x 300 pixels, with a grey (eeeeee)
		  // background, a black border, and 1 pixel 3D border effect
		  dim c as new CDXYChartMBS(600, 300, &heeeeee, &h000000, 1)
		  
		  // Add a title box to the chart using 15 pts Arial Bold Italic font, with blue
		  // (aaaaff) background
		  c.addTitle("Multiple Axes Demonstration", "arialbi.ttf", 15).setBackground(&haaaaff)
		  
		  // Set the plotarea at (100, 70) and of size 400 x 180 pixels, with white
		  // background. Turn on both horizontal and vertical grid lines with light grey
		  // color (cccccc)
		  c.setPlotArea(100, 70, 400, 180, &hffffff).setGridColor(&hcccccc, &hcccccc)
		  
		  // Add a legend box at (300, 70) (top center of the chart) with horizontal
		  // layout. Use 8 pts Arial Bold font. Set the background and border color to
		  // Transparent.
		  dim legendBox as CDLegendBoxMBS
		  legendBox = c.addLegend(300, 70, false, "arialbd.ttf", 8)
		  legendBox.setAlignment(CDXYChartMBS.kBottomCenter)
		  legendBox.setBackground(CDXYChartMBS.kTransparent, CDXYChartMBS.kTransparent)
		  
		  // Set the labels on the x axis.
		  call c.xAxis.setLabels(labels)
		  
		  // Display 1 out of 3 labels on the x-axis.
		  c.xAxis.setLabelStep(3)
		  
		  // Add a title to the x-axis
		  call c.xAxis.setTitle("Hour of Day")
		  
		  // Add a title on top of the primary (left) y axis.
		  c.yAxis.setTitle("Power"+endofline.unix+"(Watt)").setAlignment(CDXYChartMBS.kTopLeft2)
		  // Set the axis, label and title colors for the primary y axis to red (c00000) to
		  // match the first data set
		  c.yAxis.setColors(&hcc0000, &hcc0000, &hcc0000)
		  
		  // Add a title on top of the secondary (right) y axis.
		  c.yAxis2.setTitle("Load"+endofline.unix+"(Mbps)").setAlignment(CDXYChartMBS.kTopRight2)
		  // Set the axis, label and title colors for the secondary y axis to green
		  // (00800000) to match the second data set
		  c.yAxis2.setColors(&h008000, &h008000, &h008000)
		  
		  // Add the third y-axis at 50 pixels to the left of the plot area
		  dim leftaxis as CDAxisMBS
		  leftAxis = c.addAxis(CDXYChartMBS.kLeft, 50)
		  // Add a title on top of the third y axis.
		  call leftAxis.setTitle("Temp"+endofline.unix+"(C)").setAlignment(CDXYChartMBS.kTopLeft2)
		  // Set the axis, label and title colors for the third y axis to blue (0000cc) to
		  // match the third data set
		  leftAxis.setColors(&h0000cc, &h0000cc, &h0000cc)
		  
		  // Add the fouth y-axis at 50 pixels to the right of the plot area
		  dim rightaxis as CDAxisMBS
		  rightAxis = c.addAxis(CDXYChartMBS.kRight, 50)
		  // Add a title on top of the fourth y axis.
		  rightAxis.setTitle("Error"+endofline.unix+"(%)").setAlignment(CDXYChartMBS.kTopRight2)
		  // Set the axis, label and title colors for the fourth y axis to purple (880088)
		  // to match the fourth data set
		  rightAxis.setColors(&h880088, &h880088, &h880088)
		  
		  // Add a line layer to for the first data set using red (c00000) color, with a
		  // line width of 2 pixels
		  dim layer0 as CDLineLayerMBS
		  layer0 = c.addLineLayer(data0, &hcc0000, "Power")
		  layer0.setLineWidth(2)
		  
		  // Add a line layer to for the second data set using green (00c0000) color, with
		  // a line width of 2 pixels. Bind the layer to the secondary y-axis.
		  dim layer1 as CDLineLayerMBS
		  layer1 = c.addLineLayer(data1, &h008000, "Load")
		  layer1.setLineWidth(2)
		  layer1.setUseYAxis2
		  
		  // Add a line layer to for the third data set using blue (0000cc) color, with a
		  // line width of 2 pixels. Bind the layer to the third y-axis.
		  dim layer2 as CDLineLayerMBS
		  layer2 = c.addLineLayer(data2, &h0000cc, "Temperature")
		  layer2.setLineWidth(2)
		  layer2.setUseYAxis(leftAxis)
		  
		  // Add a line layer to for the fourth data set using purple (880088) color, with
		  // a line width of 2 pixels. Bind the layer to the fourth y-axis.
		  dim layer3 as CDLineLayerMBS
		  layer3 = c.addLineLayer(data3, &h880088, "Error Rate")
		  layer3.setLineWidth(2)
		  layer3.setUseYAxis(rightAxis)
		  
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
