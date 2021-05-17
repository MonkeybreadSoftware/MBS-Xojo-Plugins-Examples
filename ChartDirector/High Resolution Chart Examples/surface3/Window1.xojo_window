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
   Title           =   "surface3"
   Visible         =   True
   Width           =   720
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  const f=4 // scale factor, 1 for screen and 4 or more for printing
		  
		  // The x and y coordinates of the grid
		  dim dataX(-1) as double = array(-10.0, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
		  dim dataY(-1) as double = array(-10.0, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
		  
		  // The values at the grid points. In this example, we will compute the values
		  // using the formula z = Sin(x * x / 128 - y * y / 256 + 3) * Cos(x / 4 + 1 -
		  // Exp(y / 8))
		  dim dataZ(21*21-1) as double
		  
		  for yIndex as integer = 0 to UBound(datay)
		    dim y as double = dataY(yIndex)
		    for xIndex as integer = 0 to UBound(datax)
		      dim x as double = dataX(xIndex)
		      dataZ(yIndex * 21 + xIndex) = sin(x * x / 128 - y * y / 256 + 3) * cos(x / 4 + 1 - exp(y / 8))
		    next
		  next
		  
		  
		  // Create a SurfaceChart object of size 750 x 600 pixels
		  dim c as new CDSurfaceChartMBS(750, 600)
		  
		  // Add a title to the chart using 20 points Times New Roman Italic font
		  call c.addTitle("Surface Energy Density       ", "timesi.ttf", 20)
		  
		  // Set the center of the plot region at (380, 260), and set width x depth x
		  // height to 360 x 360 x 270 pixels
		  c.setPlotRegion(380, 260, 360, 360, 270)
		  
		  // Set the elevation and rotation angles to 30 and 210 degrees
		  c.setViewAngle(30, 210)
		  
		  // Set the perspective level to 60
		  c.setPerspective(60)
		  
		  // Set the data to use to plot the chart
		  c.setData(dataX, dataY, dataZ)
		  
		  // Spline interpolate data to a 80 x 80 grid for a smooth surface
		  c.setInterpolation(80, 80)
		  
		  // Use semi-transparent black (c0000000) for x and y major surface grid lines.
		  // Use dotted style for x and y minor surface grid lines.
		  dim majorGridColor as integer = &hc0000000
		  dim minorGridColor as integer = c.dashLineColor(majorGridColor, c.kDotLine)
		  c.setSurfaceAxisGrid(majorGridColor, majorGridColor, minorGridColor, minorGridColor)
		  
		  // Set contour lines to semi-transparent white (80ffffff)
		  c.setContourColor(&h80ffffff)
		  
		  // Add a color axis (the legend) in which the left center is anchored at (665,
		  // 280). Set the length to 200 pixels and the labels on the right side.
		  call c.setColorAxis(665, 280, c.kLeft, 200, c.kRight)
		  
		  // Set the x, y and z axis titles using 12 points Arial Bold font
		  call c.xAxis.setTitle("X Title"+EndOfLine.UNIX+"Placeholder", "arialbd.ttf", 12)
		  call c.yAxis.setTitle("Y Title"+EndOfLine.UNIX+"Placeholder", "arialbd.ttf", 12)
		  call c.zAxis.setTitle("Z Title"+EndOfLine.UNIX+"Placeholder", "arialbd.ttf", 12)
		  
		  
		  // Output the chart
		  Backdrop=c.makechartPicture
		  
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
