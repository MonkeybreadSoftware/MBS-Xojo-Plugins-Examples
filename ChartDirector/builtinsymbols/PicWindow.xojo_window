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
   Height          =   400
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
   Title           =   "builtinsymbols"
   Visible         =   True
   Width           =   450
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // Some ChartDirector built-in symbols
		  dim symbols(-1) as integer
		  
		  symbols.append CDXYChartMBS.kCircleShape
		  symbols.append CDXYChartMBS.kGlassSphereShape
		  symbols.append CDXYChartMBS.kGlassSphere2Shape
		  symbols.append CDXYChartMBS.kSolidSphereShape
		  
		  symbols.append CDXYChartMBS.kSquareShape
		  symbols.append CDXYChartMBS.kDiamondShape
		  symbols.append CDXYChartMBS.kTriangleShape
		  symbols.append CDXYChartMBS.kRightTriangleShape
		  symbols.append CDXYChartMBS.kLeftTriangleShape
		  symbols.append CDXYChartMBS.kInvertedTriangleShape
		  
		  symbols.append CDXYChartMBS.StarShape(3)
		  symbols.append CDXYChartMBS.StarShape(4)
		  symbols.append CDXYChartMBS.StarShape(5)
		  symbols.append CDXYChartMBS.StarShape(6)
		  symbols.append CDXYChartMBS.StarShape(7)
		  symbols.append CDXYChartMBS.StarShape(8)
		  symbols.append CDXYChartMBS.StarShape(9)
		  symbols.append CDXYChartMBS.StarShape(10)
		  symbols.append CDXYChartMBS.PolygonShape(5)
		  symbols.append CDXYChartMBS.Polygon2Shape(5)
		  symbols.append CDXYChartMBS.PolygonShape(6)
		  symbols.append CDXYChartMBS.Polygon2Shape(6)
		  symbols.append CDXYChartMBS.PolygonShape(7)
		  symbols.append CDXYChartMBS.PolygonShape(8)
		  symbols.append CDXYChartMBS.CrossShape(0.1)
		  symbols.append CDXYChartMBS.CrossShape(0.2)
		  symbols.append CDXYChartMBS.CrossShape(0.3)
		  symbols.append CDXYChartMBS.CrossShape(0.4)
		  symbols.append CDXYChartMBS.CrossShape(0.5)
		  symbols.append CDXYChartMBS.CrossShape(0.6)
		  symbols.append CDXYChartMBS.CrossShape(0.7)
		  symbols.append CDXYChartMBS.Cross2Shape(0.1)
		  symbols.append CDXYChartMBS.Cross2Shape(0.2)
		  symbols.append CDXYChartMBS.Cross2Shape(0.3)
		  symbols.append CDXYChartMBS.Cross2Shape(0.4)
		  symbols.append CDXYChartMBS.Cross2Shape(0.5)
		  symbols.append CDXYChartMBS.Cross2Shape(0.6)
		  symbols.append CDXYChartMBS.Cross2Shape(0.7)
		  
		  
		  // Create a XYChart object of size 450 x 400 pixels
		  dim c as new CDXYChartMBS(450, 400)
		  
		  // Set the plotarea at (55, 40) and of size 350 x 300 pixels, with a light grey
		  // border (&hc0c0c0). Turn on both horizontal and vertical grid lines with light
		  // grey color (&hc0c0c0)
		  call c.setPlotArea(55, 40, 350, 300, -1, -1, &hc0c0c0, &hc0c0c0, -1)
		  
		  // Add a title to the chart using 18 pts Times Bold Itatic font.
		  call c.addTitle("Built-in Symbols", "timesbi.ttf", 18)
		  
		  // Set the axes line width to 3 pixels
		  c.xAxis.setWidth(3)
		  c.yAxis.setWidth(3)
		  
		  // Ensure the ticks are at least 1 unit part (integer ticks)
		  c.xAxis.setMinTickInc(1)
		  c.yAxis.setMinTickInc(1)
		  
		  // Add each symbol as a separate scatter layer.
		  dim i as integer
		  for i=0 to UBound(symbols)
		    
		    dim coor1(-1) as double = array(i mod 6 + 1.0)
		    dim coor2(-1) as double = array(i \ 6 + 1.0)
		    
		    call c.addScatterLayer(coor1, coor2, "", symbols(i), 15)
		    
		  next
		  
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
