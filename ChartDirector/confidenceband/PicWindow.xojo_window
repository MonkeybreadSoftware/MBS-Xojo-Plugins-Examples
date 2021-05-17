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
   Height          =   420
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
   Title           =   "confidenceband"
   Visible         =   True
   Width           =   450
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  // The XY data of the first data series
		  dim dataX(-1) as double = array(50, 55, 37, 24, 42, 49, 63, 72, 83, 59.0)
		  dim dataY(-1) as double = array(3.6, 2.8, 2.5, 2.3, 3.8, 3.0, 3.8, 5.0, 6.0, 3.3)
		  
		  // Create a XYChart object of size 450 x 420 pixels
		  Dim c as new CDXYChartMBS(450, 420)
		  
		  // Set the plotarea at (55, 65) and of size 350 x 300 pixels, with white
		  // background and a light grey border (&hc0c0c0). Turn on both horizontal and
		  // vertical grid lines with light grey color (&hc0c0c0)
		  call c.setPlotArea(55, 65, 350, 300, &hffffff, -1, &hc0c0c0, &hc0c0c0, -1)
		  
		  // Add a title to the chart using 18 point Times Bold Itatic font.
		  call c.addTitle("Server Performance", "timesbi.ttf", 18)
		  
		  // Add a title to the y axis using 12 pts Arial Bold Italic font
		  call c.yAxis.setTitle("Response Time (sec)", "arialbi.ttf", 12)
		  
		  // Set the y axis line width to 3 pixels
		  c.yAxis.setWidth(3)
		  
		  // Set the y axis label format to show 1 decimal point
		  c.yAxis.setLabelFormat("{value|1}")
		  
		  // Add a title to the x axis using 12 pts Arial Bold Italic font
		  call c.xAxis.setTitle("Server Load (TPS)", "arialbi.ttf", 12)
		  
		  // Set the x axis line width to 3 pixels
		  c.xAxis.setWidth(3)
		  
		  // Add a scatter layer using (dataX, dataY)
		  call c.addScatterLayer(dataX, dataY, "", c.kDiamondSymbol,11, &h008000)
		  
		  // Add a trend line layer for (dataX, dataY)
		  dim trendLayer as CDTrendLayerMBS
		  TrendLayer = c.addTrendLayer(dataX, dataY, &h008000)
		  
		  // Set the line width to 3 pixels
		  trendLayer.setLineWidth(3)
		  
		  // Add a 95% confidence band for the line
		  trendLayer.addConfidenceBand(0.95, &h806666FF)
		  
		  // Add a 95% confidence band (prediction band) for the points
		  trendLayer.addPredictionBand(0.95, &h8066FF66)
		  
		  // Add a legend box at (50, 30) (top of the chart) with horizontal layout. Use 10
		  // pts Arial Bold Italic font. Set the background and border color to
		  // Transparent.
		  dim legendBox as CDLegendBoxMBS
		  legendBox = c.addLegend(50, 30, false, "arialbi.ttf", 10)
		  legendBox.setBackground(c.kTransparent)
		  
		  // Add entries to the legend box
		  legendBox.addKey("95% Line Confidence", &h806666FF)
		  legendBox.addKey("95% Point Confidence", &h8066FF66)
		  
		  // Display the trend line parameters as a text table formatted using CDML
		  dim buffer as string
		  buffer="<*block*>Slope"+EndOfLine.UNIX+"Intercept"+EndOfLine.UNIX+"Correlation"+EndOfLine.UNIX+_
		  "Std Error<*/*>   <*block*>"+str(trendLayer.getSlope)+" sec/tps"+EndOfLine.UNIX+str(trendLayer.getIntercept)+" sec"+EndOfLine.UNIX+str(trendLayer.getCorrelation)+EndOfLine.UNIX+str(trendLayer.getStdError)+" sec<*/*>"
		  
		  dim textbox as CDTextBoxMBS
		  textbox = c.addText(56, 65, buffer, "arialbd.ttf", 8)
		  
		  // Set the background of the text box to light grey, with a black border, and 1
		  // pixel 3D border
		  textbox.setBackground(&hc0c0c0, 0, 1)
		  
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
