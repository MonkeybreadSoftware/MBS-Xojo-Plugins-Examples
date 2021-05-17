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
   Title           =   "bubblescale"
   Visible         =   True
   Width           =   450
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The XY points for the bubble chart. The bubble chart has independent bubble
		  // size on the X and Y direction.
		  dim dataX0(-1) as double = array(1000, 1500, 1700.0)
		  dim dataY0(-1) as double = array(25, 20, 65.0)
		  dim dataZX0(-1) as double = array(500, 200, 600.0)
		  dim dataZY0(-1) as double = array(15, 30, 20.0)
		  
		  dim dataX1(-1) as double = array(500, 1000, 1300.0)
		  dim dataY1(-1) as double = array(35, 50, 75.0)
		  dim dataZX1(-1) as double = array(800, 300, 500.0)
		  dim dataZY1(-1) as double = array(8, 27, 25.0)
		  
		  dim dataX2(-1) as double = array(150, 300.0)
		  dim dataY2(-1) as double = array(20, 60.0)
		  dim dataZX2(-1) as double = array(160, 400.0)
		  dim dataZY2(-1) as double = array(30, 20.0)
		  
		  // Create a XYChart object of size 450 x 420 pixels
		  dim c as new CDXYChartMBS(450, 420)
		  
		  // Set the plotarea at (55, 65) and of size 350 x 300 pixels, with a light grey
		  // border (&hc0c0c0). Turn on both horizontal and vertical grid lines with light
		  // grey color (&hc0c0c0)
		  call c.setPlotArea(55, 65, 350, 300, -1, -1, &hc0c0c0, &hc0c0c0, -1)
		  
		  // Add a legend box at (50, 30) (top of the chart) with horizontal layout. Use 12
		  // pts Times Bold Italic font. Set the background and border color to
		  // Transparent.
		  c.addLegend(50, 30, false, "timesbi.ttf", 12).setBackground(c.kTransparent)
		  
		  // Add a title to the chart using 18 pts Times Bold Itatic font.
		  call c.addTitle("Plasma Battery Comparison", "timesbi.ttf", 18)
		  
		  // Add titles to the axes using 12 pts Arial Bold Italic font
		  call c.yAxis.setTitle("Operating Current", "arialbi.ttf", 12)
		  call c.xAxis.setTitle("Operating Voltage", "arialbi.ttf", 12)
		  
		  // Set the axes line width to 3 pixels
		  c.xAxis.setWidth(3)
		  c.yAxis.setWidth(3)
		  
		  // Add (dataX0, dataY0) as a standard scatter layer, and also as a "bubble"
		  // scatter layer, using circles as symbols. The "bubble" scatter layer has symbol
		  // size modulated by (dataZX0, dataZY0) using the scale on the x and y axes.
		  call c.addScatterLayer(dataX0, dataY0, "Vendor A", c.kCircleSymbol, 9, &hff3333, &hff3333)
		  call c.addScatterLayer(dataX0, dataY0, "", c.kCircleSymbol, 9, &h80FF3333, &h80FF3333).setSymbolScale(dataZX0, c.kXAxisScale, dataZY0, c.kYAxisScale)
		  
		  // Add (dataX1, dataY1) as a standard scatter layer, and also as a "bubble"
		  // scatter layer, using squares as symbols. The "bubble" scatter layer has symbol
		  // size modulated by (dataZX1, dataZY1) using the scale on the x and y axes.
		  call c.addScatterLayer(dataX1, dataY1, "Vendor B", c.kSquareSymbol, 7, &h3333ff, &h3333ff)
		  call c.addScatterLayer(dataX1, dataY1, "", c.kSquareSymbol, 9, &h803333FF, &h803333FF).setSymbolScale(dataZX1, c.kXAxisScale, dataZY1, c.kYAxisScale)
		  
		  // Add (dataX2, dataY2) as a standard scatter layer, and also as a "bubble"
		  // scatter layer, using diamonds as symbols. The "bubble" scatter layer has
		  // symbol size modulated by (dataZX2, dataZY2) using the scale on the x and y
		  // axes.
		  call c.addScatterLayer(dataX2, dataY2, "Vendor C", c.kDiamondSymbol, 9, &h00ff00, &h00ff00)
		  call c.addScatterLayer(dataX2, dataY2, "", c.kDiamondSymbol, 9, &h8033FF33, &h8033FF33).setSymbolScale(dataZX2, CDXYChartMBS.kXAxisScale, dataZY2, c.kYAxisScale)
		  
		  
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
