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
   Height          =   220
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
   Title           =   "discontline"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  //===================================================================
		  //    For demo purpose, use random numbers as data for the chart
		  //===================================================================
		  
		  // Use a random table to create the data. The random table contains 4 cols x 31
		  // rows, using 9 as seed.
		  dim rantable as new CDRanTableMBS(9, 4, 31)
		  
		  // Set the 1st col to be the series 1, 2, 3, ....
		  rantable.setCol(0, 1, 1, 1)
		  
		  // Set the 2nd, 3rd and 4th col to be random number starting from 40, 50 and 60.
		  // The change between rows is set to -5 to 5. The minimum value of any cell is 0.
		  rantable.setCol(1, 40, -5, 5, 0)
		  rantable.setCol(2, 50, -5, 5, 0)
		  rantable.setCol(3, 60, -5, 5, 0)
		  
		  // Use the 1st col as the axis label
		  dim labels(-1) as string
		  
		  // Use the 2nd, 3rd and 4th columns for 3 lines
		  dim data0 as CDArrayMBS = rantable.getCol(1)
		  dim data1 as CDArrayMBS = rantable.getCol(2)
		  dim data2 as CDArrayMBS = rantable.getCol(3)
		  
		  // Simulate some data points have no data value
		  dim i,count as integer
		  dim dat0(-1) as Double
		  dim dat1(-1) as Double
		  dim dat2(-1) as Double
		  
		  count=data0.count-1
		  for i=0 to count
		    dat0.append data0.getvalue(i)
		    dat1.append data1.getvalue(i)
		    dat2.append data2.getvalue(i)
		    labels.append str(i+1)
		  next
		  
		  for i=1 to 29 step 7
		    dat0(i)=CDXYChartMBS.kNoValue
		    dat1(i)=CDXYChartMBS.kNoValue
		    dat2(i)=CDXYChartMBS.kNoValue
		  next
		  
		  //===================================================================
		  //    Now we have the data ready. Actually drawing the chart.
		  //===================================================================
		  
		  // Create a XYChart object of size 600 x 220 pixels
		  dim c as new CDXYChartMBS(600, 220)
		  
		  // Set the plot area at (100, 25) and of size 450 x 150 pixels. Enabled both
		  // vertical and horizontal grids by setting their colors to light grey (&hc0c0c0)
		  c.setPlotArea(100, 25, 450, 150).setGridColor(&hc0c0c0, &hc0c0c0)
		  
		  // Add a legend box (92, 0) (top of plot area) using horizontal layout. Use 8 pts
		  // Arial font. Disable bounding box (set border to transparent).
		  c.addLegend(92, 0, false, "", 8).setBackground(c.kTransparent)
		  
		  // Add a title to the y axis. Draw the title upright (font angle = 0)
		  c.yAxis.setTitle("Average"+EndOfLine.UNIX+"Utilization"+EndOfLine.UNIX+"(MBytes)").setFontAngle(0)
		  
		  // Use manually scaling of y axis from 0 to 100, with ticks every 10 units
		  c.yAxis.setLinearScale(0, 100, 10)
		  
		  // Set the labels on the x axis
		  call c.xAxis.setLabels(labels)
		  
		  // Set the title on the x axis
		  call c.xAxis.setTitle("Jun - 2001")
		  
		  // Add x axis (vertical) zones to indicate Saturdays and Sundays
		  for i=0 to 28 step 7
		    c.xAxis.addZone(i, i + 2, &hc0c0c0)
		  next
		  
		  // Add a line layer to the chart
		  dim layer as CDLineLayerMBS
		  layer = c.addLineLayer
		  
		  // Set the default line width to 2 pixels
		  layer.setLineWidth(2)
		  
		  // Add the three data sets to the line layer
		  call layer.addDataSet(dat0, &hcf4040, "Server #1")
		  call layer.addDataSet(dat1, &h40cf40, "Server #2")
		  call layer.addDataSet(dat2, &h4040cf, "Server #3")
		  
		  // Layout the chart to fix the y axis scaling. We can then use getXCoor and
		  // getYCoor to determine the position of custom objects.
		  c.layout
		  
		  // Add the "week n" custom text boxes at the top of the plot area.
		  for i=0 to 3
		    // Add the "week n" text box using 8 pt Arial font with top center alignment.
		    dim textbox as CDTextBoxMBS
		    
		    textbox = c.addText(layer.getXCoor(i * 7 + 2), 25, "Week "+str(i), "arialbd.ttf", 8, &h000000, c.kTopCenter)
		    
		    // Set the box width to cover five days
		    textbox.setSize(layer.getXCoor(i * 7 + 7) - layer.getXCoor(i * 7 + 2) + 1,0)
		    
		    // Set box background to pale yellow &hffff80, with a 1 pixel 3D border
		    textbox.setBackground(&hffff80, c.kTransparent, 1)
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
