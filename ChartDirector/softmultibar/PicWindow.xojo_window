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
   Height          =   375
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
   Title           =   "softmultibar"
   Visible         =   True
   Width           =   540
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The data for the bar chart
		  dim data0(-1) as double = array(100, 125, 245, 147, 67.0)
		  dim data1(-1) as double = array(85, 156, 179, 211, 123.0)
		  dim data2(-1) as double = array(97, 87, 56, 267, 157.0)
		  
		  // The labels for the bar chart
		  dim labels(-1) as string = array("Mon", "Tue", "Wed", "Thu", "Fri")
		  
		  // Create a XYChart object of size 540 x 375 pixels
		  dim c as new CDXYChartMBS(540, 375)
		  
		  // Add a title to the chart using 18 pts Times Bold Italic font
		  call c.addTitle("Average Weekly Network Load", "timesbi.ttf", 18)
		  
		  // Set the plotarea at (50, 55) and of 440 x 280 pixels in size. Use a vertical
		  // gradient color from light red (ffdddd) to dark red (880000) as background. Set
		  // border and grid lines to white (ffffff).
		  call c.setPlotArea(50, 55, 440, 280, c.linearGradientColor(0, 55, 0, 335, &hffdddd, &h880000), -1, &hffffff, &hffffff)
		  
		  // Add a legend box at (50, 25) using horizontal layout. Use 10pts Arial Bold as
		  // font, with transparent background.
		  dim l as CDLegendBoxMBS
		  l=c.addLegend(50, 25, false, "arialbd.ttf", 10)
		  l.setBackground(c.kTransparent)
		  
		  // Set the x axis labels
		  call c.xAxis.setLabels(labels)
		  
		  // Draw the ticks between label positions (instead of at label positions)
		  c.xAxis.setTickOffset(0.5)
		  
		  // Set axis label style to 8pts Arial Bold
		  call c.xAxis.setLabelStyle("arialbd.ttf", 8)
		  call c.yAxis.setLabelStyle("arialbd.ttf", 8)
		  
		  // Set axis line width to 2 pixels
		  c.xAxis.setWidth(2)
		  c.yAxis.setWidth(2)
		  
		  // Add axis title
		  call c.yAxis.setTitle("Throughput (MBytes Per Hour)")
		  
		  // Add a multi-bar layer with 3 data sets and 4 pixels 3D depth
		  dim layer as CDBarLayerMBS
		  layer = c.addBarLayer(c.kSide, 4)
		  call layer.addDataSet(data0, &hffff00, "Server #1")
		  call layer.addDataSet(data1, &h00ff00, "Server #2")
		  call layer.addDataSet(data2, &h9999ff, "Server #3")
		  
		  // Set bar border to transparent. Use soft lighting effect with light direction
		  // from top.
		  layer.setBorderColor(c.kTransparent, c.softLighting(c.kTop))
		  
		  // Configure the bars within a group to touch each others (no gap)
		  layer.setBarGap(0.2, c.kTouchBar)
		  
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
