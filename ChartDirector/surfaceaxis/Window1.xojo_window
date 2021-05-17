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
   Height          =   500
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
   Title           =   "surfaceaxis"
   Visible         =   True
   Width           =   760
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The x and y coordinates of the grid
		  dim dataX(-1) as double 
		  dataX.Append CDBaseChartMBS.chartTime(2008, 9, 1)
		  dataX.Append CDBaseChartMBS.chartTime(2008, 9, 2)
		  dataX.Append CDBaseChartMBS.chartTime(2008, 9, 3)
		  dataX.Append CDBaseChartMBS.chartTime(2008, 9, 4)
		  dataX.Append CDBaseChartMBS.chartTime(2008, 9, 5)
		  dataX.Append CDBaseChartMBS.chartTime(2008, 9, 6)
		  
		  dim dataY(-1) as string = array("Low", "Medium", "High")
		  
		  // The data series
		  dim lowData(-1) as double = array(24.0, 38, 33, 25, 28, 36)
		  dim mediumData(-1) as double = array(49.0, 42, 34, 47, 53, 50)
		  dim highData(-1) as double = array(44.0, 51, 38, 33, 47, 42)
		  
		  // Create a SurfaceChart object of size 760 x 500 pixels
		  dim c as new CDSurfaceChartMBS(760, 500)
		  
		  // Add a title to the chart using 18 points Arial font
		  call c.addTitle("Surface Chart Axis Types", "Arial", 18)
		  
		  // Set the center of the plot region at (385, 240), and set width x depth x
		  // height to 480 x 240 x 240 pixels
		  c.setPlotRegion(385, 240, 480, 240, 240)
		  
		  // Set the elevation and rotation angles to 30 and -10 degrees
		  c.setViewAngle(30, -10)
		  
		  dim dataz(-1) as double
		  dim count as integer
		  
		  count=UBound(lowData)
		  for i as integer=0 to count
		    dataz.Append lowData(i)
		  next
		  
		  count=UBound(mediumData)
		  for i as integer=0 to count
		    dataz.Append mediumData(i)
		  next
		  
		  count=UBound(highData)
		  for i as integer=0 to count
		    dataz.Append highData(i)
		  next
		  
		  dim data2(-1) as double
		  
		  // Set the data to use to plot the chart. As the y-data are text strings
		  // (enumerated), we will use an empty array for the y-coordinates. For the z data
		  // series, they are just the concatenation of the individual data series.
		  c.setData(dataX,data2,dataz) 
		  
		  // Set the y-axis labels
		  call c.yAxis.setLabels(dataY)
		  
		  // Set x-axis tick density to 75 pixels. ChartDirector auto-scaling will use this
		  // as the guideline when putting ticks on the x-axis.
		  c.xAxis.setTickDensity(75)
		  
		  // Spline interpolate data to a 80 x 40 grid for a smooth surface
		  c.setInterpolation(80, 40)
		  
		  // Set surface grid lines to semi-transparent black (cc000000).
		  c.setSurfaceAxisGrid(&hcc000000)
		  
		  // Set contour lines to the same color as the fill color at the contour level
		  call c.setContourColor(c.kSameAsMainColor)
		  
		  // Add a color axis (the legend) in which the top right corner is anchored at
		  // (95, 100). Set the length to 160 pixels and the labels on the left side.
		  dim cAxis as CDColorAxisMBS = c.setColorAxis(95, 100, c.kTopRight, 160, c.kLeft)
		  
		  // Add a bounding box with light grey (eeeeee) background and grey (888888)
		  // border.
		  cAxis.setBoundingBox(&heeeeee, &h888888)
		  
		  // Set label style to Arial bold for all axes
		  call c.xAxis.setLabelStyle("arialbd.ttf")
		  call c.yAxis.setLabelStyle("arialbd.ttf")
		  call c.zAxis.setLabelStyle("arialbd.ttf")
		  call c.colorAxis.setLabelStyle("arialbd.ttf")
		  
		  // Set the x, y and z axis titles using deep blue (000088) 15 points Arial font
		  call c.xAxis.setTitle("Date/Time Axis", "ariali.ttf", 15, &h000088)
		  call c.yAxis.setTitle("Label"+EndOfLine.unix+"Based"+EndOfLine.unix+"Axis", "ariali.ttf", 15, &h000088)
		  call c.zAxis.setTitle("Numeric Axis", "ariali.ttf", 15, &h000088)
		  
		  
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
