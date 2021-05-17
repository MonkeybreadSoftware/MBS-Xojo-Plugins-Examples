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
   Height          =   460
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
   Title           =   "polarscatter"
   Visible         =   True
   Width           =   460
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The data for the chart
		  dim data0(-1) as double = array(43, 89, 76, 64, 48, 18, 92, 68, 44, 79, 71, 85.0)
		  dim angles0(-1) as double = array(45, 96, 169, 258, 15, 30, 330, 260, 60, 75, 110, 140.0)
		  
		  dim data1(-1) as double = array(50, 91, 26, 29, 80, 53, 62, 87, 19, 40.0)
		  dim angles1(-1) as double = array(230, 210, 240, 310, 179, 250, 244, 199, 89, 160.0)
		  
		  dim data2(-1) as double = array(88, 65, 76, 49, 80, 53.0)
		  dim angles2(-1) as double = array(340, 310, 340, 210, 30, 300.0)
		  
		  // The labels on the angular axis (spokes)
		  dim labels(-1) as string = array("North", "North"+endofline.unix+"East", "East", "South"+endofline.unix+"East", "South", "South"+endofline.unix+"West", "West", "North"+endofline.unix+"West")
		  
		  // Create a PolarChart object of size 460 x 460 pixels
		  dim c as new CDPolarChartMBS(460, 460)
		  
		  // Add a title to the chart at the top left corner using 15pts Arial Bold Italic
		  // font
		  call c.addTitle(CDPolarChartMBS.kTopLeft, "<*underline=2*>Plants in Wonderland", "arialbi.ttf",15)
		  
		  // Set center of plot area at (230, 240) with radius 180 pixels
		  c.setPlotArea(230, 240, 180)
		  
		  // Use alternative light grey/dark grey sector background color
		  c.setPlotAreaBg(&hdddddd, &heeeeee, false)
		  
		  // Set the grid style to circular grid
		  c.setGridStyle(false)
		  
		  // Add a legend box at the top right corner of the chart using 9 pts Arial Bold
		  // font
		  c.addLegend(459, 0, true, "arialbd.ttf", 9).setAlignment(CDPolarChartMBS.kTopRight)
		  
		  // Set angular axis as 0 - 360, either 8 spokes
		  c.angularAxis.setLinearScale(0, 360, labels)
		  
		  // Set the radial axis label format
		  c.radialAxis.setLabelFormat("{value} km")
		  
		  // Add a blue (&hff) polar line layer to the chart using (data0, angle0)
		  dim layer0 as CDPolarLineLayerMBS
		  layer0 = c.addLineLayer(data0, &h0000ff, "Immortal Weed")
		  layer0.setAngles(angles0)
		  
		  layer0.setLineWidth(0)
		  layer0.setDataSymbol(CDPolarChartMBS.kTriangleSymbol, 11)
		  
		  // Add a red (&hff0000) polar line layer to the chart using (data1, angles1)
		  dim layer1 as CDPolarLineLayerMBS
		  layer1 = c.addLineLayer(data1, &hff0000, "Precious Flower")
		  layer1.setAngles(angles1)
		  
		  // Disable the line by setting its width to 0, so only the symbols are visible
		  layer1.setLineWidth(0)
		  
		  // Use a 11 pixel diamond data point symbol
		  layer1.setDataSymbol(CDPolarChartMBS.kDiamondSymbol, 11)
		  
		  // Add a green (&h00ff00) polar line layer to the chart using (data2, angles2)
		  dim layer2 as CDPolarLineLayerMBS
		  layer2 = c.addLineLayer(data2, &h00ff00, "Magical Tree")
		  layer2.setAngles(angles2)
		  
		  // Disable the line by setting its width to 0, so only the symbols are visible
		  layer2.setLineWidth(0)
		  
		  // Use a 9 pixel square data point symbol
		  layer2.setDataSymbol(CDPolarChartMBS.kSquareSymbol, 9)
		  
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
