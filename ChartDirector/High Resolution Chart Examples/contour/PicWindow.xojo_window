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
   Title           =   "contour"
   Visible         =   True
   Width           =   600
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
		  // using the formula z = x * sin(y) + y * sin(x).
		  dim dataZ(21*21-1) as double
		  
		  for yIndex as integer = 0 to UBound(datay)
		    dim y as double = dataY(yIndex)
		    for xIndex as integer = 0 to UBound(datay)
		      dim x as double = dataX(xIndex)
		      dataZ(yIndex * 21 + xIndex) = x * sin(y) + y * sin(x)
		    next
		  next
		  
		  // Create a XYChart object of size 600 x 500 pixels
		  dim c as new CDXYChartMBS(f*600, f*500)
		  
		  // Add a title to the chart using 15 points Arial Bold Italic font
		  call c.addTitle("z = x * sin(y) + y * sin(x)      ", "arialbi.ttf", f*15)
		  
		  c.xAxis.setTickWidth f
		  c.xAxis.setTickLength f*4
		  c.yAxis.setTickWidth f
		  c.yAxis.setTickLength f*4
		  
		  // Set the plotarea at (75, 40) and of size 400 x 400 pixels. Use
		  // semi-transparent black (80000000) dotted lines for both horizontal and
		  // vertical grid lines
		  dim p as CDPlotAreaMBS= c.setPlotArea(f*75, f*40, f*400, f*400, -1, -1, -1, c.dashLineColor(&h80000000, CDXYChartMBS.kDotLine), -1)
		  
		  p.setGridWidth(f,f)
		  
		  // Set x-axis and y-axis title using 12 points Arial Bold Italic font
		  call c.xAxis.setTitle("X-Axis Title Place Holder", "arialbi.ttf", f*12)
		  call c.yAxis.setTitle("Y-Axis Title Place Holder", "arialbi.ttf", f*12)
		  
		  // Set x-axis and y-axis labels to use Arial Bold font
		  call c.xAxis.setLabelStyle("arialbd.ttf",f*8)
		  call c.yAxis.setLabelStyle("arialbd.ttf",f*8)
		  
		  // When auto-scaling, use tick spacing of 40 pixels as a guideline
		  c.yAxis.setTickDensity(f*40)
		  c.xAxis.setTickDensity(f*40)
		  
		  
		  // Add a contour layer using the given data
		  dim layer as CDContourLayerMBS = c.addContourLayer(dataX,dataY,dataZ)
		  
		  // Move the grid lines in front of the contour layer
		  c.getPlotArea.moveGridBefore(layer)
		  
		  // Add a color axis (the legend) in which the top left corner is anchored at
		  // (505, 40). Set the length to 400 pixels and the labels on the right side.
		  dim cAxis as CDColorAxisMBS = layer.setColorAxis(f*505, f*40, CDXYChartMBS.kTopLeft, f*400, CDXYChartMBS.kRight)
		  cAxis.setTickWidth(f)
		  cAxis.setWidth(f*10)
		  
		  // Add a title to the color axis using 12 points Arial Bold Italic font
		  call cAxis.setTitle("Color Legend Title Place Holder", "arialbi.ttf", f*12)
		  
		  // Set color axis labels to use Arial Bold font
		  call cAxis.setLabelStyle("arialbd.ttf",f*8)
		  
		  // Output the chart
		  Backdrop=c.makeChartPicture
		  
		  Width=f*600
		  Height=f* 500
		  
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
