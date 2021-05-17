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
   Height          =   380
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
   Title           =   "gradientbar"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The data for the bar chart
		  dim data(-1) as double = array(1350.0, 1600, 1950, 2300, 2700)
		  
		  // The labels for the bar chart
		  dim labels(-1) as string = array("2001", "2002", "2003", "2004", "2005")
		  
		  // The colors for the bars
		  dim colors(-1) as integer 
		  Colors.Append &hcc0000
		  Colors.Append &h66aaee
		  Colors.Append &heebb22
		  Colors.Append &hcccccc
		  Colors.Append &hcc88ff
		  
		  // Create a PieChart object of size 600 x 380 pixels.
		  dim c as new CDXYChartMBS(600, 380)
		  
		  // Use the white on black palette, which means the default text and line colors
		  // are white
		  c.setWhiteOnBlackColors
		  
		  // Use a vertical gradient color from blue (0000cc) to deep blue (000044) as
		  // background. Use rounded corners of 30 pixels radius for the top-left and
		  // bottom-right corners.
		  c.setBackground(c.linearGradientColor(0, 0, 0, c.getHeight, &h0000cc, &h000044))
		  c.setRoundedFrame(&hffffff, 30, 0, 30, 0)
		  
		  // Add a title using 18 pts Times New Roman Bold Italic font. Add 6 pixels top
		  // and bottom margins to the title.
		  dim title as CDTextBoxMBS = c.addTitle("Annual Revenue for Star Tech", "timesbi.ttf", 18)
		  title.setMargin(0, 0, 6, 6)
		  
		  // Add a separator line in white color just under the title
		  call c.addLine(20, title.getHeight, c.getWidth - 21, title.getHeight, &hffffff)
		  
		  // Tentatively set the plotarea at (70, 80) and of 480 x 240 pixels in size. Use
		  // transparent border and white grid lines
		  call c.setPlotArea(70, 80, 480, 240, -1, -1, CDXYChartMBS.kTransparent, &hffffff)
		  
		  // Swap the axis so that the bars are drawn horizontally
		  c.swapXY
		  
		  // Add a multi-color bar chart layer using the supplied data. Use bar gradient
		  // lighting with the light intensity from 0.75 to 2.0
		  call c.addBarLayer(data, colors).setBorderColor(CDXYChartMBS.kTransparent, CDXYChartMBS.barLighting(0.75, 2.0))
		  
		  // Set the labels on the x axis.
		  call c.xAxis.setLabels(labels)
		  
		  // Show the same scale on the left and right y-axes
		  c.syncYAxis
		  
		  // Set the bottom y-axis title using 10pt Arial Bold font
		  call c.yAxis.setTitle("USD (millions)", "arialbd.ttf", 10)
		  
		  // Set y-axes to transparent
		  c.yAxis.setColors(CDXYChartMBS.kTransparent)
		  c.yAxis2.setColors(CDXYChartMBS.kTransparent)
		  
		  // Disable ticks on the x-axis by setting the tick color to transparent
		  c.xAxis.setTickColor(CDXYChartMBS.kTransparent)
		  
		  // Set the label styles of all axes to 8pt Arial Bold font
		  call c.xAxis.setLabelStyle("arialbd.ttf", 8)
		  call c.yAxis.setLabelStyle("arialbd.ttf", 8)
		  call c.yAxis2.setLabelStyle("arialbd.ttf", 8)
		  
		  // Adjust the plot area size, such that the bounding box (inclusive of axes) is
		  // 30 pixels from the left edge, 25 pixels below the title, 50 pixels from the
		  // right edge, and 25 pixels from the bottom edge.
		  c.packPlotArea(30, title.getHeight + 25, c.getWidth - 50, c.getHeight - 25)
		  
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
