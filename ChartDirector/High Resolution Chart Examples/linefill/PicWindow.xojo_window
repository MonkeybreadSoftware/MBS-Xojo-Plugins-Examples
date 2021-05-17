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
   Height          =   450
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
   Title           =   "linefill"
   Visible         =   True
   Width           =   450
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  const f=3 // scale factor, 1 for screen and 4 or more for printing
		  
		  // The data for the line chart
		  dim data0(-1) as double = array(70.0, 73, 80, 90, 95, 93, 82, 77, 82, 101, 111, 115)
		  dim data1(-1) as double = array(90.0, 96, 89, 77, 82, 96, 109, 109, 99, 108, 96, 91)
		  dim data2(-1) as double = array(58.0, 34, 25, 49, 64, 10, 16, 40, 25, 49, 40, 22)
		  
		  // The labels for the line chart
		  dim labels(-1) as string = array("2008-01", "2008-02", "2008-03", "2008-04", "2008-05", "2008-06", "2008-07", "2008-08", "2008-09", "2008-10", "2008-11", "2008-12")
		  
		  // Create a XYChart object of size 450 x 450 pixels
		  dim c as new CDXYChartMBS(f*450, f*450)
		  
		  Width=f*450
		  Height=f*450
		  
		  // Add a title to the chart using 15 pts Arial Italic font.
		  dim title as CDTextBoxMBS = c.addTitle("Inter-line Coloring", "ariali.ttf", f*15)
		  
		  // Add a legend box where the top-center is anchored to the horizontal center of
		  // the chart, just under the title. Use horizontal layout and 10 points Arial
		  // Bold font, and transparent background and border. Use line style legend key.
		  dim legendBox as CDLegendBoxMBS = c.addLegend(c.getWidth / 2, title.getHeight, false, "arialbi.ttf", f*10)
		  legendBox.setBackground(CDXYChartMBS.kTransparent, CDXYChartMBS.kTransparent)
		  legendBox.setAlignment(CDXYChartMBS.kTopCenter)
		  legendBox.setLineStyleKey
		  
		  // Tentatively set the plotarea at (70, 65) and of (chart_width - 100) x
		  // (chart_height - 110) in size. Use light grey (c0c0c0) border and horizontal
		  // and vertical grid lines.
		  dim plotArea as CDPlotAreaMBS = c.setPlotArea(f*70, f*65, c.getWidth - f*100, c.getHeight - f*110, -1, -1, &hc0c0c0, &hc0c0c0, -1)
		  
		  plotArea.setGridWidth(f,f)
		  
		  // Add a title to the y axis using 12 pts Arial Bold Italic font
		  call c.yAxis.setTitle("Axis Title Placeholder", "arialbi.ttf", f*12)
		  
		  // Add a title to the x axis using 12 pts Arial Bold Italic font
		  call c.xAxis.setTitle("Axis Title Placeholder", "arialbi.ttf", f*12)
		  
		  // Set the axes line width to 3 pixels
		  c.xAxis.setWidth(f*3)
		  c.yAxis.setWidth(f*3)
		  c.yaxis.setlinearscale(0,130,10)
		  c.xaxis.setTickLength(f*3)
		  c.xaxis.setTickWidth(f)
		  c.yaxis.setTickLength(f*3)
		  c.yaxis.setTickWidth(f)
		  
		  
		  // Set the labels on the x axis.
		  call c.xAxis.setLabels(labels)
		  
		  // Use 8 points Arial rotated by 90 degrees as the x-axis label font
		  call c.xAxis.setLabelStyle("Arial", f*8, CDXYChartMBS.kTextColor, 90)
		  call c.yAxis.setLabelStyle("Arial", f*8)
		  
		  // Add a spline curve to the chart
		  dim layer0 as CDSplineLayerMBS = c.addSplineLayer(data0, &hff0000, "Data Set 0") 
		  layer0.setLineWidth(f*2)
		  
		  // Add a normal line to the chart
		  dim layer1 as CDLineLayerMBS = c.addLineLayer(data1, &h008800, "Data Set 1")
		  layer1.setLineWidth(f*2)
		  
		  // Color the region between the above spline curve and normal line. Use the
		  // semi-transparent red (80ff000000) if the spline curve is higher than the
		  // normal line, otherwise use semi-transparent green (80008800)
		  call c.addInterLineLayer(layer0.getLine, layer1.getLine, &h80ff0000, &h80008800)
		  
		  // Add another normal line to the chart
		  dim layer2 as CDLineLayerMBS = c.addLineLayer(data2, &h0000ff, "Data Set 2")
		  layer2.setLineWidth(f*2)
		  
		  // Add a horizontal mark line to the chart at y = 40
		  dim mark as CDMarkMBS = c.yAxis.addMark(40, -1, "Threshold","",f*8)
		  mark.setLineWidth(f*2)
		  
		  // Set the mark line to purple (880088) dash line. Use white (ffffff) for the
		  // mark label.
		  mark.setMarkColor(c.dashLineColor(&h880088), &hffffff)
		  
		  // Put the mark label at the left side of the mark, with a purple (880088)
		  // background.
		  mark.setAlignment(CDXYChartMBS.kLeft)
		  mark.setBackground(&h880088)
		  
		  // Color the region between the above normal line and mark line. Use the
		  // semi-transparent blue (800000ff) if the normal line is higher than the mark
		  // line, otherwise use semi-transparent purple (80880088)
		  call c.addInterLineLayer(layer2.getLine, mark.getLine, &h800000ff, &h80880088)
		  
		  // Layout the legend box, so we can get its height
		  call c.layoutLegend
		  
		  // Adjust the plot area size, such that the bounding box (inclusive of axes) is
		  // 10 pixels from the left edge, just under the legend box, 25 pixels from the
		  // right edge, and 10 pixels from the bottom edge.
		  c.packPlotArea(f*10, legendBox.getTopY + legendBox.getHeight, c.getWidth - f*25, c.getHeight - f*10)
		  
		  // After determining the exact plot area position, we may adjust the legend box
		  // and the title positions so that they are centered relative to the plot area
		  // (instead of the chart)
		  legendBox.setPos(plotArea.getLeftX + (plotArea.getWidth - legendBox.getWidth) / 2, legendBox.getTopY)
		  title.setPos(plotArea.getLeftX + (plotArea.getWidth - title.getWidth) / 2, title.getTopY)
		  
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
