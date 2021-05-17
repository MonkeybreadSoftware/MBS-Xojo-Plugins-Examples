#tag Class
Protected Class MyControl
Inherits Canvas
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  trackLineLegend x
		  
		  pic = c.makeChartPicture
		  
		  me.Invalidate
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  // The data for the bar chart
		  dim data0() as double = array(100.0, 125, 245, 147, 67)
		  dim data1() as double = array(85.0, 156, 179, 211, 123)
		  dim data2() as double = array(97.0, 87, 56, 267, 157)
		  dim labels() as string = array("Mon", "Tue", "Wed", "Thur", "Fri")
		  dim noOfPoints as integer = UBound(data0)+1
		  
		  // Create a XYChart object of size 540 x 375 pixels
		  c = new CDXYChartMBS(540, 375)
		  
		  // Add a title to the chart using 18 pts Times Bold Italic font
		  call c.addTitle("Average Weekly Network Load", "timesbi.ttf", 18)
		  
		  // Set the plotarea at (50, 55) and of 440 x 280 pixels in size. Use a vertical gradient color
		  // from light blue (f9f9ff) to blue (6666ff) as background. Set border and grid lines to white
		  // (ffffff).
		  call c.setPlotArea(50, 55, 440, 280, c.linearGradientColor(0, 55, 0, 335, &hf9f9ff, &h6666ff), -1, &hffffff, &hffffff)
		  
		  // Add a legend box at (50, 28) using horizontal layout. Use 10pts Arial Bold as font, with
		  // transparent background.
		  call c.addLegend(50, 28, false, "arialbd.ttf", 10).setBackground(CDBaseChartMBS.kTransparent)
		  
		  // Set the x axis labels
		  call c.xAxis.setLabels(labels)
		  
		  // Draw the ticks between label positions (instead of at label positions)
		  c.xAxis.setTickOffset(0.5)
		  
		  // Set axis label style to 8pts Arial Bold
		  call c.xAxis.setLabelStyle("arialbd.ttf", 8)
		  call c.yAxis.setLabelStyle("arialbd.ttf", 8)
		  
		  // Set axis line width to 2 pixels
		  c.xAxis.setWidth(2)
		  c.yAxis.setWidth(2)
		  
		  // Add axis title
		  call c.yAxis.setTitle("Throughput (MBytes Per Hour)")
		  
		  // Add a multi-bar layer with 3 data sets
		  dim layer as CDBarLayerMBS = c.addBarLayer(CDBaseChartMBS.kSide)
		  call layer.addDataSet(data0, &hff0000, "Server #1")
		  call layer.addDataSet(data1, &h00ff00, "Server #2")
		  call layer.addDataSet(data2, &hff8800, "Server #3")
		  
		  // Set bar border to transparent. Use glass lighting effect with light direction from left.
		  call layer.setBorderColor(CDBaseChartMBS.kTransparent, CDBaseChartMBS.glassEffect(CDBaseChartMBS.kNormalGlare, CDBaseChartMBS.kLeft))
		  
		  // Configure the bars within a group to touch each others (no gap)
		  layer.setBarGap(0.2, CDBaseChartMBS.kTouchBar)
		  
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
		Sub trackLineLegend(mouseX as integer)
		  // Clear the current dynamic layer and get the DrawArea object to draw on it.
		  dim d as CDDrawAreaMBS = c.initDynamicLayer
		  
		  // The plot area object
		  dim plotArea as CDPlotAreaMBS = c.getPlotArea
		  
		  
		  // check if we are outside the plotArea
		  if mousex<plotArea.getLeftX   then Return
		  if mousey<plotArea.getTopY    then Return
		  if mousex>plotArea.getRightX  then Return
		  if mousey>plotArea.getBottomY then Return
		  
		  // Get the data x-value that is nearest to the mouse
		  dim xValue as double = c.getNearestXValue(mouseX)
		  
		  // Compute the position of the box. This example assumes a label based x-axis, in which the
		  // labeling spacing is one x-axis unit. So the left and right sides of the box is 0.5 unit from
		  // the central x-value.
		  dim boxLeft as integer = c.getXCoor(xValue - 0.5)
		  dim boxRight as integer = c.getXCoor(xValue + 0.5)
		  dim boxTop as integer = plotArea.getTopY
		  dim boxBottom as integer = plotArea.getBottomY
		  
		  // Draw the track box
		  d.rect(boxLeft, boxTop, boxRight, boxBottom, &h000000, CDBaseChartMBS.kTransparent)
		  
		  // Container to hold the legend entries
		  dim legendEntries() as string
		  
		  // Iterate through all layers to build the legend array
		  dim u as integer = c.getLayerCount-1
		  for i as integer = 0 to u
		    dim layer as CDLayerMBS = c.getLayerByZ(i)
		    
		    // The data array index of the x-value
		    dim xIndex as integer = layer.getXIndexOf(xValue)
		    
		    // Iterate through all the data sets in the layer
		    dim uu as integer = layer.getDataSetCount-1
		    for j as integer = 0 to uu
		      dim dataSet as CDDataSetMBS = layer.getDataSetByZ(j)
		      
		      // Build the legend entry, consist of the legend icon, the name and the data value.
		      dim dataValue as double = dataSet.getValue(xIndex)
		      if ((dataValue <> CDBaseChartMBS.kNoValue) and (dataSet.getDataColor <> CDBaseChartMBS.kTransparent)) then
		        dim legendEntry as string
		        legendEntry = dataSet.getLegendIcon + " " + dataSet.getDataName + ": " + c.formatValue(dataValue, "{value|P4}")
		        legendEntries.Append legendEntry
		      end if
		    next
		  next
		  
		  // Create the legend by joining the legend entries
		  if UBound(legendEntries) >= 0 then
		    dim legend as string
		    legend = "<*block,bgColor=FFFFCC,edgeColor=000000,margin=5*><*font,underline=1*>" + c.xAxis.getFormattedLabel(xValue) + "<*/font*>"
		    for i as integer = UBound(legendEntries) downto 0
		      legend = legend + "<*br*>" + legendEntries(i)
		    next
		    legend = legend + "<*/*>"
		    
		    // Display the legend at the bottom-right side of the mouse cursor, and make sure the legend
		    // will not go outside the chart image.
		    dim t as CDTTFTextMBS = d.text(legend, "arialbd.ttf", 8)
		    t.draw(min(mouseX + 12, c.getWidth - t.getWidth), min(mouseY + 18, c.getHeight - t.getHeight), &h000000, CDBaseChartMBS.kTopLeft)
		    t.destroy
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Notes
		
		This sample program demonstrates a track cursor programmed with the following features:
		
		* A box that horizontally centers around the x data value nearest to the mouse cursor.
		* A floating legend box that moves with the mouse cursor, displaying the data values at the x data value nearest to the mouse cursor.
		
		The code first draws the chart. 
		We hide tracking if mouse is out of plotarea.
		The track cursor is configured to automatically hide itself when the mouse leaves the plot area.
		
		The trackBoxLegend method is the routine that draws the track cursor. Its key elements are:
		
		* To draw dynamic contents on the chart, the code obtains the DrawArea object for drawing on the dynamic layer of the chart using BaseChart.initDynamicLayer.
		* The nearest x data value is obtained using XYChart.getNearestXValue.
		* The code draws a rectangle that horizontally spans from (x - 0.5) to (x + 0.5) with DrawArea.rect. The +/- 0.5 offset is the suitable value to use for a label based x-axis (that is, for axis set up with Axis.setLabels or Axis.setLabels2). For this type of axis, the label distance is assumed to be 1 x-axis unit irrespective of what are the labels, so an offset of 0.5 refers to the middle position between two labels.
		* The code then iterates through all data sets in all layers to find all the data points at the nearest x data value. For each of these points, it formats a legend entry for the point, which consists of the data set icon (obtained using DataSet.getLegendIcon), data set name (obtained using DataSet.getDataName), and the data value (obtained using DataSet.getValue).
		* Finally, the code combines all the legend entries into a legend box and draws it near the mouse cursor using DrawArea.text.
		
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		c As CDXYChartMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		pic As picture
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
			Type="picture"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
