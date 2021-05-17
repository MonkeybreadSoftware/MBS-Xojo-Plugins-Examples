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
   Title           =   "paramcurve"
   Visible         =   True
   Width           =   540
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The XY data of the first data series
		  dim dataX0(-1) as double = array(10.0, 35, 17, 4, 22, 29, 45, 52, 63, 39)
		  dim dataY0(-1) as double = array(2.0, 3.2, 2.7, 1.2, 2.8, 2.9, 3.1, 3.0, 2.3, 3.3)
		  
		  // The XY data of the second data series
		  dim dataX1(-1) as double = array(30.0, 35, 17, 4, 22, 59, 43, 52, 63, 39)
		  dim dataY1(-1) as double = array(1.0, 1.3, 0.7, 0.6, 0.8, 3.0, 1.8, 2.3, 3.4, 1.5)
		  
		  // The XY data of the third data series
		  dim dataX2(-1) as double = array(28.0, 35, 15, 10, 22, 60, 46, 64, 39)
		  dim dataY2(-1) as double = array(2.0, 2.2, 1.2, 0.4, 1.8, 2.7, 2.4, 2.8, 2.4)
		  
		  // Create a XYChart object of size 540 x 480 pixels
		  dim c as new CDXYChartMBS(540, 480)
		  
		  // Set the plotarea at (70, 65) and of size 400 x 350 pixels, with white
		  // background and a light grey border (&hc0c0c0). Turn on both horizontal and
		  // vertical grid lines with light grey color (&hc0c0c0)
		  call c.setPlotArea(70, 65, 400, 350, &hffffff, -1, &hc0c0c0, &hc0c0c0, -1)
		  
		  // Add a legend box with the top center point anchored at (270, 30). Use
		  // horizontal layout. Use 10 pts Arial Bold Italic font. Set the background and
		  // border color to Transparent.
		  dim legendBox as CDLegendBoxMBS = c.addLegend(270, 30, false, "arialbi.ttf", 10)
		  legendBox.setAlignment(c.kTopCenter)
		  legendBox.setBackground(c.kTransparent, c.kTransparent)
		  
		  // Add a title to the chart using 18 point Times Bold Itatic font.
		  call c.addTitle("Parametric Curve Fitting", "timesbi.ttf", 18)
		  
		  // Add titles to the axes using 12 pts Arial Bold Italic font
		  call c.yAxis.setTitle("Axis Title Placeholder", "arialbi.ttf", 12)
		  call c.xAxis.setTitle("Axis Title Placeholder", "arialbi.ttf", 12)
		  
		  // Set the axes line width to 3 pixels
		  c.yAxis.setWidth(3)
		  c.xAxis.setWidth(3)
		  
		  // Add a scatter layer using (dataX0, dataY0)
		  call c.addScatterLayer(dataX0, dataY0, "Polynomial", c.kGlassSphere2Shape, 11, &hff0000)
		  
		  // Add a degree 2 polynomial trend line layer for (dataX0, dataY0)
		  dim trend0 as CDTrendLayerMBS = c.addTrendLayer(dataX0,dataY0, &hff0000)
		  trend0.setLineWidth(3)
		  trend0.setRegressionType(c.PolynomialRegression(2))
		  
		  // Add a scatter layer for (dataX1, dataY1)
		  call c.addScatterLayer(dataX1, dataY1, "Exponential", c.kGlassSphere2Shape, 11, &h00aa00)
		  
		  // Add an exponential trend line layer for (dataX1, dataY1)
		  dim trend1 as CDTrendLayerMBS = c.addTrendLayer(dataX1, dataY1, &h00aa00)
		  trend1.setLineWidth(3)
		  trend1.setRegressionType(c.kExponentialRegression)
		  
		  // Add a scatter layer using (dataX2, dataY2)
		  call c.addScatterLayer(dataX2, dataY2, "Logarithmic", c.kGlassSphere2Shape, 11, &h0000ff)
		  
		  // Add a logarithmic trend line layer for (dataX2, dataY2)
		  dim trend2 as CDTrendLayerMBS = c.addTrendLayer(dataX2,dataY2,&h0000ff)
		  trend2.setLineWidth(3)
		  trend2.setRegressionType(c.kLogarithmicRegression)
		  
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
