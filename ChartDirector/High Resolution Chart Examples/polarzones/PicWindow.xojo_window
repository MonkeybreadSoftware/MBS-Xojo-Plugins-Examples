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
   Title           =   "polarzones"
   Visible         =   True
   Width           =   400
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  const f=3 // scale factor, 1 for screen and 4 or more for printing
		  
		  // The data for the chart
		  dim data(-1) as double = array(51, 15, 51, 40, 17, 87, 94, 21, 35, 88, 50, 60.0)
		  
		  // The labels for the chart
		  dim labels(-1) as string = array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec")
		  
		  // Create a PolarChart object of size 400 x 420 pixels
		  dim c as new CDPolarChartMBS(f*400, f*420)
		  
		  call c.angularAxis.setLabelStyle "",8*f
		  
		  // Set background color to a 2 pixel pattern color, with a black border and 1
		  // pixel 3D border effect
		  dim pattern1(1) as integer
		  pattern1(0)=&hffffff
		  pattern1(1)=&he0e0e0
		  c.setBackground(c.patternColor(pattern1, 2), 0, 1)
		  
		  // Add a title to the chart using 16 pts Arial Bold Italic font. The title text
		  // is white (&hffffff) on 2 pixel pattern background
		  dim pattern2(1) as integer
		  pattern2(0)=&h000000
		  pattern2(1)=&h000080
		  c.addTitle("Chemical Concentration", "arialbi.ttf", f*16, &hffffff).setBackground(c.patternColor(pattern2, f*2))
		  
		  // Set center of plot area at (200, 240) with radius 145 pixels. Set background
		  // color to blue (9999ff)
		  c.setPlotArea(f*200, f*240, f*145, &h9999ff)
		  
		  // Color the region between radius = 40 to 80 as green (99ff99)
		  c.radialAxis.addZone(40, 80, &h99ff99)
		  
		  // Color the region with radius > 80 as red (ff9999)
		  c.radialAxis.addZone(80, 999, &hff9999)
		  c.radialAxis.setLinearScale 0, 100,20
		  
		  // Set the grid style to circular grid
		  c.setGridStyle(false)
		  
		  // Set the radial axis label format
		  c.radialAxis.setLabelFormat("{value} ppm")
		  
		  // Use semi-transparent (40ffffff) label background so as not to block the data
		  c.radialAxis.setLabelStyle.setBackground(&h40ffffff, &h40000000)
		  
		  // Add a legend box at (200, 30) top center aligned, using 9 pts Arial Bold font.
		  // with a black border.
		  dim LegendBox as CDLegendBoxMBS
		  legendBox = c.addLegend(f*200, f*30, false, "arialbd.ttf", f*9)
		  legendBox.setAlignment(CDPolarChartMBS.kTopCenter)
		  
		  // Add legend keys to represent the red/green/blue zones
		  legendBox.addKey("Under-Absorp", &h9999ff)
		  legendBox.addKey("Normal", &h99ff99)
		  legendBox.addKey("Over-Absorp", &hff9999)
		  
		  // Add a blue (000080) spline line layer with line width set to 3 pixels and
		  // using yellow (ffff00) circles to represent the data points
		  dim layer as CDPolarSplineLineLayerMBS
		  layer = c.addSplineLineLayer(data, &h000080)
		  layer.setLineWidth(f*3)
		  layer.setDataSymbol(CDPolarChartMBS.kCircleShape, f*11, &hffff00)
		  
		  // Set the labels to the angular axis as spokes.
		  call c.angularAxis.setLabels(labels)
		  call c.radialAxis.setLabelStyle "",8*f
		  c.angularAxis.setLabelGap f*8
		  
		  // Output the chart
		  Backdrop=c.makeChartPicture
		  
		  Width=c.getWidth
		  Height=c.getHeight
		  
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
