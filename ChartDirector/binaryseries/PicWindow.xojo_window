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
   Height          =   180
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
   Title           =   "binaryseries"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The data for the chart
		  dim dataY(-1) as double = array(1.0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1)
		  dim dataX(-1) as double = array(CDBaseChartMBS.chartTime(2008, 7, 1, 0, 0, 0), CDBaseChartMBS.chartTime(2008, 7, 1, 2, 17, 2), CDBaseChartMBS.chartTime(2008, 7, 1, 8, 5, 30), CDBaseChartMBS.chartTime(2008, 7, 1, 10, 54, 10), CDBaseChartMBS.chartTime(2008, 7, 1, 15, 40, 0), CDBaseChartMBS.chartTime(2008, 7, 1, 18, 22, 20), CDBaseChartMBS.chartTime(2008, 7, 1, 22, 17, 14), CDBaseChartMBS.chartTime(2008, 7, 2, 2, 55, 50), CDBaseChartMBS.chartTime(2008, 7, 2, 8, 17, 14), CDBaseChartMBS.chartTime(2008, 7, 2, 11, 55, 50), CDBaseChartMBS.chartTime(2008, 7, 2, 13, 17, 14), CDBaseChartMBS.chartTime(2008, 7, 2, 17, 55, 50), CDBaseChartMBS.chartTime(2008, 7, 2, 20, 17, 14), CDBaseChartMBS.chartTime(2008, 7, 3, 0, 0, 0))
		  
		  // In this example, we only use position 1, 3, 5 for the data series. Positions
		  // 0, 2, 4, 6 are empty and serve as gaps.
		  dim labels(-1) as string = array("", "ON Only Filling", "", "<*font,color=cc2200*>ON<*/font*> / <*font,color=00aa22*>OFF<*/font*> Filling", "", "Logic Line", "")
		  
		  // Create a XYChart object of size 600 x 180 pixels
		  dim c as new CDXYChartMBS(600, 180)
		  
		  // Add a title to the chart using 10 points Arial Bold font. Set top/bottom
		  // margins to 12 pixels.
		  dim title as CDTextBoxMBS = c.addTitle("Binary Data Series Demonstration", "arialbd.ttf",10)
		  
		  // Tentatively set the plotarea at (100, 30) and of size 470 x 120 pixels. Use
		  // transparent border. Use grey (888888) solid line and light grey (ccccc) dotted
		  // line as major and minor vertical grid lines.
		  call c.setPlotArea(100, 30, 470, 120, -1, -1, CDBaseChartMBS.kTransparent).setGridColor( CDBaseChartMBS.kTransparent, &h888888, CDBaseChartMBS.kTransparent, c.dashLineColor(&hcccccc, CDBaseChartMBS.kDotLine))
		  
		  // Set axes to transparent
		  call c.xAxis.setColors(CDBaseChartMBS.kTransparent)
		  call c.yAxis.setColors(CDBaseChartMBS.kTransparent)
		  
		  // Set the y axis labels
		  call c.yAxis.setLabels(labels)
		  
		  // Set y-axis label style to 8pts Arial Bold
		  call c.yAxis.setLabelStyle("arialbd.ttf", 8)
		  
		  // Set x-axis major and minor tick density to 50 and 5 pixels. ChartDirector
		  // auto-scaling will use this as the guideline when putting ticks on the x-axis.
		  c.xAxis.setTickDensity(50, 5)
		  
		  // Use "<*font=Arial Bold*>{value|mmm dd)" for the first label of an hour, and
		  // "{value|hh:nn)" for all other labels.
		  c.xAxis.setMultiFormat(CDBaseChartMBS.StartOfDayFilter, "<*font=Arial Bold*>{value|mmm dd}", CDBaseChartMBS.AllPassFilter, "{value|hh:nn}")
		  
		  
		  //
		  // A Logic Line can be achieved using a StepLineLayer in ChartDirector
		  //
		  
		  // Shift the data by 4.5, so instead of 0 - 1, it is now 4.5 to 5.5, or fluctuate
		  // around the y = 5 (Logic Line label) position.
		  dim shiftedLine0(-1) as double
		  for each v as double in datay
		    shiftedLine0.Append v+4.5
		  next
		  
		  // Add step lines using the original and the reversed data
		  dim layer0 as CDStepLineLayerMBS = c.addStepLineLayer(shiftedLine0, 255)
		  layer0.setXData(dataX)
		  
		  //
		  // To perform ON/OFF filling, we draw the logic line, and its reverse, and fill
		  // the region in between
		  //
		  
		  // Shift the data by 2.5, so instead of 0 - 1, it is now 2.5 to 3.5, or fluctuate
		  // around the y = 3 (ON/OFF Filing label) position.
		  dim shiftedLine1(-1) as double
		  for each v as double in datay
		    shiftedLine1.Append v+2.5
		  next
		  
		  // Reverse the data, so the 0 becomes 1 and 1 becomes 0, and shift it as well.
		  dim reverseShiftedLine1(-1) as double
		  for each v as double in datay
		    reverseShiftedLine1.Append -v+3.5
		  next
		  
		  // Add step lines using the original and the reversed data
		  dim layer1 as CDStepLineLayerMBS = c.addStepLineLayer(shiftedLine1, CDBaseChartMBS.kTransparent)
		  call layer1.addDataSet(reverseShiftedLine1, CDBaseChartMBS.kTransparent)
		  layer1.setXData(dataX)
		  
		  // Fill the region between the two step lines with green (00aa22) or red
		  // (cc2200), depending on whether the original or the reserve is higher.
		  call c.addInterLineLayer(layer1.getLine(0), layer1.getLine(1), &h00aa22, &hcc2200)
		  
		  //
		  // The ON Only filling is the same as ON/OFF filling, except the OFF filling
		  // color is transparent
		  //
		  
		  // Shift the data by 0.5, so instead of 0 - 1, it is now 0.5 to 1.5, or fluctuate
		  // around the y = 1 (ON Only Filing label) position.
		  
		  dim shiftedLine2(-1) as double
		  for each v as double in datay
		    shiftedLine2.Append v+0.5
		  next
		  // Reverse the data, so the 0 becomes 1 and 1 becomes 0, and shift it as well.
		  
		  dim reverseShiftedLine2(-1) as double
		  for each v as double in datay
		    reverseShiftedLine2.Append -v+1.5
		  next
		  // Add step lines using the original and the reversed data
		  dim layer2 as CDStepLineLayerMBS = c.addStepLineLayer(shiftedLine2, CDBaseChartMBS.kTransparent)
		  call layer2.addDataSet(reverseShiftedLine2, CDBaseChartMBS.kTransparent)
		  layer2.setXData(dataX)
		  
		  // Fill the region between the two step lines with green (00aa22) or transparent,
		  // depending on whether the original or the reserve is higher.
		  call c.addInterLineLayer(layer2.getLine(0), layer2.getLine(1), &h00aa22, CDBaseChartMBS.kTransparent)
		  
		  // Adjust the plot area size, such that the bounding box (inclusive of axes) is
		  // 10 pixels from the left edge, 10 pixels  below the title, 30 pixels from the
		  // right edge, and 10 pixels above the bottom edge.
		  c.packPlotArea(10, title.getHeight + 10, c.getWidth - 30, c.getHeight - 10)
		  
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
