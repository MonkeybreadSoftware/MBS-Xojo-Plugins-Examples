#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   600
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
   Title           =   "surface"
   Visible         =   True
   Width           =   720
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The x coordinates for the 2 scatter groups
		  dim dataX() as double
		  datax.Append CDBaseChartMBS.chartTime(2011, 9, 1)
		  datax.Append CDBaseChartMBS.chartTime(2011, 9, 2)
		  datax.Append CDBaseChartMBS.chartTime(2011, 9, 3)
		  datax.Append CDBaseChartMBS.chartTime(2011, 9, 4)
		  datax.Append CDBaseChartMBS.chartTime(2011, 9, 5)
		  datax.Append CDBaseChartMBS.chartTime(2011, 9, 6)
		  datax.Append CDBaseChartMBS.chartTime(2011, 9, 7)
		  datax.Append CDBaseChartMBS.chartTime(2011, 9, 8)
		  datax.Append CDBaseChartMBS.chartTime(2011, 9, 9)
		  datax.Append CDBaseChartMBS.chartTime(2011, 9, 10)
		  datax.Append CDBaseChartMBS.chartTime(2011, 9, 11)
		  
		  // The y and z coordinates for the first scatter group
		  dim dataY0() as double = array(0.4, 0.2, 0.5, 0.4, 0.7, 1.3, 1.1, 1.0, 0.6, 0.4, 0.5)
		  dim dataZ0() as double = array(43.0, 38, 33, 23.4, 28, 36, 34, 47, 53, 45, 40)
		  
		  // The y and z coordinates for the second scatter group
		  dim dataY1() as double = array(1.4, 1.0, 1.8, 1.9, 1.5, 1.0, 0.6, 0.7, 1.2, 1.7, 1.5)
		  dim dataZ1() as double = array(46.0, 41, 33, 37, 28, 29, 34, 37, 41, 52, 50)
		  
		  // Instead of displaying numeric values, labels are used for the y-axis
		  dim labelsY() as string = array("Low", "Medium", "High")
		  
		  // Create a ThreeDScatterChart object of size 760 x 520 pixels
		  dim c as new CDThreeDScatterChartMBS(760, 520)
		  
		  // Add a title to the chart using 18 points Arial font
		  call c.addTitle("3D Scatter Chart Axis Types", "arial.ttf", 18)
		  
		  // Set the center of the plot region at (385, 270), and set width x depth x
		  // height to 480 x 240 x 240 pixels
		  c.setPlotRegion(385, 270, 480, 240, 240)
		  
		  // Set the elevation and rotation angles to 30 and -10 degrees
		  c.setViewAngle(30, -10)
		  
		  // Add a legend box at (380, 40) with horizontal layout. Use 9 pts Arial Bold
		  // font.
		  dim b as CDLegendBoxMBS = c.addLegend(380, 40, false, "arialbd.ttf", 9)
		  b.setAlignment(c.kTopCenter)
		  b.setRoundedCorners
		  
		  // Add a scatter group to the chart using 13 pixels red (ff0000) glass sphere
		  // symbols, with dotted drop lines
		  dim g0 as cdThreeDScatterGroupMBS = c.addScatterGroup(dataX, dataY0, dataZ0, "Alpha Series", c.kGlassSphere2Shape, 13, &hff0000)
		  g0.setDropLine(c.dashLineColor(c.kSameAsMainColor, c.kDotLine))
		  
		  // Add a scatter group to the chart using 13 pixels blue (00cc00) cross symbols,
		  // with dotted drop lines
		  dim g1 as CDThreeDScatterGroupMBS = c.addScatterGroup(dataX, dataY1, dataZ1, "Beta Series", c.Cross2Shape, 13, &h00cc00)
		  g1.setDropLine(c.dashLineColor(c.kSameAsMainColor, c.kDotLine))
		  
		  // Set x-axis tick density to 50 pixels. ChartDirector auto-scaling will use this
		  // as the guideline when putting ticks on the x-axis.
		  c.xAxis.setTickDensity(50)
		  
		  // Set the y-axis labels
		  call c.yAxis.setLabels(labelsY)
		  
		  // Set label style to Arial bold for all axes
		  call c.xAxis.setLabelStyle("arialbd.ttf")
		  call c.yAxis.setLabelStyle("arialbd.ttf")
		  call c.zAxis.setLabelStyle("arialbd.ttf")
		  
		  // Set the x, y and z axis titles using deep blue (000088) 15 points Arial font
		  call c.xAxis.setTitle("Date/Time Axis", "ariali.ttf", 15, &c000088)
		  call c.yAxis.setTitle("Label\nBased\nAxis", "ariali.ttf", 15, &c000088)
		  call c.zAxis.setTitle("Numeric Axis", "ariali.ttf", 15, &c000088)
		  
		  // Output the chart
		  Backdrop=c.makechartPicture
		  
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
