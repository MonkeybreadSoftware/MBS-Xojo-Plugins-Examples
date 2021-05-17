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
   Height          =   350
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
   Title           =   "multistackbar"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The data for the bar chart
		  dim data0(-1) as double = array( 44, 55, 100.0)
		  dim data1(-1) as double = array( 97, 87, 167.0)
		  dim data2(-1) as double = array( 156, 78, 147.0)
		  dim data3(-1) as double = array( 125, 118, 211.0)
		  
		  // The labels for the bar chart. The labels contains embedded images as icons.
		  dim labels(-1) as string = array("<*img=service.png*><*br*>Service","<*img=software.png*><*br*>Software", "<*img=computer.png*><*br*>Hardware")
		  
		  // Create a XYChart object of size 600 x 350 pixels, using 0xe0e0ff as the
		  // background color, 0xccccff as the border color, with 1 pixel 3D border effect.
		  dim c as new CDXYChartMBS(600, 350, &he0e0ff, &hccccff, 1)
		  
		  // Add a title to the chart using 14 points Times Bold Itatic font and light blue
		  // (0x9999ff) as the background color
		  
		  dim t as new CDTextBoxMBS
		  t=c.addTitle("Business Results 2001 vs 2002", "timesbi.ttf", 14)
		  t.setBackground(&h9999ff)
		  
		  // Set the plotarea at (60, 45) and of size 500 x 210 pixels, using white
		  // (0xffffff) as the background
		  call c.setPlotArea(60, 45, 500, 210, &hffffff)
		  
		  // Swap the x and y axes to create a horizontal bar chart
		  c.swapXY
		  
		  // Add a title to the y axis using 11 pt Times Bold Italic as font
		  call c.yAxis.setTitle("Revenue (millions)", "timesbi.ttf", 11)
		  
		  // Set the labels on the x axis
		  call c.xAxis.setLabels labels
		  
		  // Disable x-axis ticks by setting the tick length to 0
		  call c.yAxis.setTickLength(0)
		  
		  // Add a stacked bar layer to the chart
		  dim layer as CDBarLayerMBS
		  layer = c.addBarLayer(c.kStack)
		  
		  // Add the first two data sets to the chart as a stacked bar group
		  call layer.addDataGroup("2001")
		  call layer.addDataSet(data0, &haaaaff,"Local")
		  call layer.addDataSet(data1, &h6666ff,"International")
		  
		  // Add the remaining data sets to the chart as another stacked bar group
		  call layer.addDataGroup("2002")
		  call layer.addDataSet(data2, &hffaaaa, "Local")
		  call layer.addDataSet(data3, &hff6666, "International")
		  
		  // Set the sub-bar gap to 0, so there is no gap between stacked bars with a group
		  layer.setBarGap(0.2, 0)
		  
		  // Set the bar border to transparent
		  layer.setBorderColor(c.kTransparent)
		  
		  // Set the aggregate label format
		  layer.setAggregateLabelFormat("Year {dataGroupName}"+EndOfLine.UNIX+"{value} millions")
		  
		  // Set the aggregate label font to 8 point Arial Bold Italic
		  call layer.setAggregateLabelStyle("arialbi.ttf", 8)
		  
		  // Reverse 20% space at the right during auto-scaling to allow space for the
		  // aggregate bar labels
		  c.yAxis.setAutoScale(0.2)
		  
		  // Add a legend box at (310, 300) using TopCenter alignment, with 2 column grid
		  // layout, and use 8 pts Arial Bold Italic as font
		  dim legendBox as CDLegendBoxMBS
		  legendBox = c.addLegend(310, 300, 2, "arialbi.ttf", 8)
		  legendBox.setAlignment(c.kTopCenter)
		  
		  // Set the format of the text displayed in the legend box
		  legendBox.setText("Year {dataGroupName} {dataSetName} Revenue")
		  
		  // Set the background and border of the legend box to transparent
		  legendBox.setBackground(c.kTransparent, c.kTransparent)
		  
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
