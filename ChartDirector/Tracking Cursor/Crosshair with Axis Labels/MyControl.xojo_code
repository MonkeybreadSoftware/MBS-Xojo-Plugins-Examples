#tag Class
Protected Class MyControl
Inherits Canvas
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  crosshair x,y
		  
		  pic = c.makeChartPicture
		  
		  me.Invalidate
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  // The XY data of the first data series
		  dim dataX() as double = array(50.0, 55, 37, 24, 42, 49, 63, 72, 83, 59)
		  dim dataY() as double = array(3.6, 2.8, 2.5, 2.3, 3.8, 3.0, 3.8, 5.0, 6.0, 3.3)
		  dim noOfPoints as integer = UBound(dataX)+1
		  
		  // Create a XYChart object of size 520 x 490 pixels
		  c = new CDXYChartMBS(520, 490)
		  
		  // Set the plotarea at (60, 40) and of size 450 x 400 pixels, with white background and a light
		  // grey border (&hc0c0c0). Turn on both horizontal and vertical grid lines with light grey color
		  // (&hc0c0c0)
		  call c.setPlotArea(60, 40, 450, 400, &hffffff, -1, &hc0c0c0, &hc0c0c0, -1)
		  
		  // Add a title to the chart using 18 point Times Bold Itatic font.
		  call c.addTitle("      Chemical X Thermal Conductivity", "timesbi.ttf", 18)
		  
		  // Add titles to the axes using 12 pts Arial Bold Italic font
		  call c.yAxis.setTitle("Thermal Conductivity (W/K)", "arialbi.ttf", 12)
		  call c.xAxis.setTitle("Concentration (g/liter)", "arialbi.ttf", 12)
		  
		  // Set the axes line width to 3 pixels
		  c.yAxis.setWidth(3)
		  c.xAxis.setWidth(3)
		  
		  // Add a scatter layer using (dataX, dataY)
		  dim scatterLayer as CDScatterLayerMBS = c.addScatterLayer(dataX, dataY, "", c.kGlassSphereShape, 13, &hcc0000)
		  
		  // Tooltip for the scatter layer
		  scatterLayer.setHTMLImageMap("", "", "title='Concentration: {x} g/liter, Conductivity: {value} W/K'")
		  
		  // Add a trend line layer for (dataX, dataY)
		  dim trendLayer as CDTrendLayerMBS = c.addTrendLayer(dataX, dataY, &hcc0000)
		  
		  // Set the line width to 3 pixels
		  trendLayer.setLineWidth(3)
		  
		  // Add a 95% confidence band for the line
		  trendLayer.addConfidenceBand(0.95, &h806666ff)
		  
		  // Add a 95% confidence band (prediction band) for the points
		  trendLayer.addPredictionBand(0.95, &h8066ff66)
		  
		  // Tool tip for the trend layer
		  trendLayer.setHTMLImageMap("", "", "title='Trend Line: y = {slope|P4} x + {intercept|P4}'")
		  
		  // Add a legend box at (60, 35) (top of the chart) with horizontal layout. Use 10 pts Arial Bold
		  // Italic font. Set the background and border color to Transparent and use line style legend
		  // icons.
		  dim legendBox as CDLegendBoxMBS = c.addLegend(60, 35, false, "arialbi.ttf", 9)
		  legendBox.setBackground(c.kTransparent)
		  legendBox.setLineStyleKey(true)
		  
		  // Add entries to the legend box
		  legendBox.addKey("95% Line Confidence", &h806666ff)
		  legendBox.addKey("95% Point Confidence", &h8066ff66)
		  
		  dim trendLegend as string
		  trendLegend = "Trend Line: y = " + c.formatValue(trendLayer.getSlope, "{value|4}") + " x = " + c.formatValue(trendLayer.getIntercept, "{value|4}")
		  legendBox.addKey(trendLegend, &hcc0000, 3)
		  
		  
		  // Include tool tip for the chart
		  'viewer.setImageMap(c.getHTMLImageMap(""))
		  
		  pic = c.makeChartPicture
		  me.Invalidate
		  
		  
		  
		  
		  // fix some properties if set wrong in IDE
		  
		  me.DoubleBuffer = false
		  me.EraseBackground = false
		  
		  #if RBVersion >= 2013.0 then
		    me.Transparent = False
		  #endif
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  if pic <> nil then
		    g.DrawPicture pic, 0, 0
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub crosshair(MouseX as integer, MouseY as integer)
		  // Clear the current dynamic layer and get the DrawArea object to draw on it.
		  dim d as CDDrawAreaMBS = c.initDynamicLayer
		  
		  // The plot area object
		  dim plotArea as CDPlotAreaMBS = c.getPlotArea
		  
		  // check if we are outside the plotArea
		  if mousex<plotArea.getLeftX   then Return
		  if mousey<plotArea.getTopY    then Return
		  if mousex>plotArea.getRightX  then Return
		  if mousey>plotArea.getBottomY then Return
		  
		  // Draw a vertical line and a horizontal line as the cross hair
		  d.vline(plotArea.getTopY, plotArea.getBottomY, mouseX, d.dashLineColor(&h000000, &h0101))
		  d.hline(plotArea.getLeftX, plotArea.getRightX, mouseY, d.dashLineColor(&h000000, &h0101))
		  
		  // Draw y-axis label
		  dim ylabel as string
		  ylabel = "<*block,bgColor=FFFFDD,margin=3,edgeColor=000000*>" + c.formatValue(c.getYValue(mouseY, c.yAxis), "{value|P4}") + "<*/*>"
		  
		  dim t as CDTTFTextMBS = d.text(ylabel, "arialbd.ttf", 8)
		  t.draw(plotArea.getLeftX - 5, mouseY, &h000000, c.kRight)
		  t.destroy
		  
		  // Draw x-axis label
		  dim xlabel as string
		  xlabel = "<*block,bgColor=FFFFDD,margin=3,edgeColor=000000*>" + c.formatValue(c.getXValue(mouseX), "{value|P4}") + "<*/*>"
		  
		  t = d.text(xlabel, "arialbd.ttf", 8)
		  t.draw(mouseX, plotArea.getBottomY + 5, &h000000, c.kTop)
		  t.destroy
		End Sub
	#tag EndMethod


	#tag Note, Name = Notes
		
		This sample program demonstrates a track cursor programmed as a crosshair cursor with axis labels.
		
		The code first draws the chart. 
		We hide tracking if mouse is out of plotarea.
		The track cursor is configured to automatically hide itself when the mouse leaves the plot area.
		
		The crossHair method is the routine that draws the track cursor. Its key elements are:
		
		* To draw dynamic contents on the chart, the code obtains the DrawArea object for drawing on the dynamic layer of the chart using BaseChart.initDynamicLayer.
		* The code draws a vertical line (using DrawArea.vline) and a horizontal line (using DrawArea.hline) at the mouse cursor position. This creates the crosshair.
		* The code also draws x and y axis labels using DrawArea.text.
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		c As CDXYChartMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		pic As Picture
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
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
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
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
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group=""
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="pic"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
