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
   Height          =   300
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
   Title           =   "multisymbolline"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // In this example, the data points are unevenly spaced on the x-axis
		  dim dataY(-1) as double = array(4.7, 4.7, 6.6, 2.2, 4.7, 4.0, 4.0, 5.1, 4.5, 4.5, 6.8, 4.5, 4, 2.1, 3, 2.5, 2.5, 3.1)
		  dim dataX(-1) as double = array(CDXYChartMBS.chartTime(1999, 7, 1), CDXYChartMBS.chartTime(2000, 1, 1), CDXYChartMBS.chartTime(2000, 2, 1), CDXYChartMBS.chartTime(2000, 4, 1), CDXYChartMBS.chartTime(2000, 5, 8), CDXYChartMBS.chartTime(2000, 7, 5), CDXYChartMBS.chartTime(2001, 3, 5), CDXYChartMBS.chartTime(2001, 4, 7), CDXYChartMBS.chartTime(2001, 5, 9), CDXYChartMBS.chartTime(2002, 2, 4), CDXYChartMBS.chartTime(2002, 4, 4), CDXYChartMBS.chartTime(2002, 5, 8), CDXYChartMBS.chartTime(2002, 7, 7), CDXYChartMBS.chartTime(2002, 8, 30), CDXYChartMBS.chartTime(2003, 1, 2), CDXYChartMBS.chartTime(2003, 2, 16), CDXYChartMBS.chartTime(2003, 11, 6), CDXYChartMBS.chartTime(2004, 1, 4))
		  
		  // Data points are assigned different symbols based on point type
		  dim pointType(-1) as double = array(0, 1, 0, 1, 2, 1, 0, 0, 1, 1, 2, 2, 1, 0, 2, 1, 2, 0.0)
		  
		  // Create a XYChart object of size 600 x 300 pixels, with a light purple (ffccff)
		  // background, black border, 1 pixel 3D border effect and rounded corners.
		  dim c as new CDXYChartMBS(600, 300, &hffccff, &h000000, 1)
		  c.setRoundedFrame
		  
		  // Set the plotarea at (55, 58) and of size 520 x 195 pixels, with white (ffffff)
		  // background. Set horizontal and vertical grid lines to grey (cccccc).
		  call c.setPlotArea(55, 58, 520, 195, &hffffff, -1, -1, &hcccccc, &hcccccc)
		  
		  // Add a legend box at (55, 30) (top of the chart) with horizontal layout. Use 10
		  // pts Arial Bold Italic font. Set the background and border color to
		  // Transparent.
		  c.addLegend(55, 30, false, "arialbi.ttf", 10).setBackground(c.kTransparent)
		  
		  // Add a title box to the chart using 15 pts Times Bold Italic font. The text is
		  // white (ffffff) on a purple (400040) background, with soft lighting effect from
		  // the right side.
		  c.addTitle("Multi-Symbol Line Chart Demo", "timesbi.ttf", 15, &hffffff).setBackground(&h400040, -1, c.softLighting(c.kRight))
		  
		  // Set the y axis label format to display a percentage sign
		  c.yAxis.setLabelFormat("{value}%")
		  
		  // Set axis titles to use 9pt Arial Bold Italic font
		  call c.yAxis.setTitle("Axis Title Placeholder", "arialbi.ttf", 9)
		  call c.xAxis.setTitle("Axis Title Placeholder", "arialbi.ttf", 9)
		  
		  // Set axis labels to use Arial Bold font
		  call c.yAxis.setLabelStyle("arialbd.ttf")
		  call c.xAxis.setLabelStyle("arialbd.ttf")
		  
		  // We add the different data symbols using scatter layers. The scatter layers are
		  // added before the line layer to make sure the data symbols stay on top of the
		  // line layer.
		  
		  // We select the points with pointType = 0 (the non-selected points will be set
		  // to NoValue), and use yellow (ffff00) 15 pixels high 5 pointed star shape
		  // symbols for the points. (This example uses both x and y coordinates. For
		  // charts that have no x explicitly coordinates, use an empty array as dataX.)
		  
		  dim dataA(-1) as Double
		  dim dataB(-1) as Double
		  dim dataC(-1) as Double
		  dim i,count as integer
		  
		  count=UBound(dataY)
		  for i=0 to count
		    dim d as Double
		    dim p as integer
		    
		    d=dataY(i)
		    p=pointType(i)
		    
		    if p=0 then
		      dataA.append d
		    else
		      dataA.append c.kNoValue
		    end if
		    
		    if p=1 then
		      dataB.append d
		    else
		      dataB.append c.kNoValue
		    end if
		    
		    if p=2 then
		      dataC.append d
		    else
		      dataC.append c.kNoValue
		    end if
		    
		  next
		  
		  call c.addScatterLayer(dataX, dataA,"Point Type 0", c.StarShape(5), 15, &hffff00)
		  
		  // Similar to above, we select the points with pointType - 1 = 0 and use green
		  // (ff00) 13 pixels high six-sided polygon as symbols.
		  call c.addScatterLayer(dataX, dataB, "Point Type 1", c.PolygonShape(6), 13, &h00ff00)
		  
		  // Similar to above, we select the points with pointType - 2 = 0 and use red
		  // (ff0000) 13 pixels high X shape as symbols.
		  call c.addScatterLayer(dataX, dataC, "Point Type 2", c.Cross2Shape(), 13, &hff0000)
		  
		  // Finally, add a blue (0000ff) line layer with line width of 2 pixels
		  dim layer as CDLineLayerMBS
		  layer = c.addLineLayer(dataY, &h0000ff)
		  layer.setXData(dataX)
		  layer.setLineWidth(2)
		  
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
