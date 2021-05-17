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
		  // Data for the chart as 2 random data series
		  dim r as new CDRanSeriesMBS(127)
		  dim data0() as double = r.getSeries(180, 10, -1.5, 1.5)
		  dim data1() as double = r.getSeries(180, 150, -15, 15)
		  dim timeStamps() as double = r.getDateSeries(180, CDBaseChartMBS.chartTime(2011, 1, 1), 86400)
		  
		  // Create a XYChart object of size 670 x 400 pixels
		  c = new CDXYChartMBS(670, 400)
		  
		  // Add a title to the chart using 18 pts Times New Roman Bold Italic font
		  call c.addTitle("Plasma Stabilizer Energy Usage", "timesbi.ttf", 18)
		  
		  // Set the plotarea at (50, 55) with width 100 pixels less than chart width, and height 90 pixels
		  // less than chart height. Use a vertical gradient from light blue (f0f6ff) to sky blue (a0c0ff)
		  // as background. Set border to transparent and grid lines to white (ffffff).
		  call c.setPlotArea(50, 55, c.getWidth - 100, c.getHeight - 90, c.linearGradientColor(0, 55, 0, c.getHeight - 35, &hf0f6ff, &ha0c0ff), -1, CDBaseChartMBS.kTransparent, &hffffff, &hffffff)
		  
		  // Add a legend box at (50, 25) using horizontal layout. Use 10pts Arial Bold as font. Set the
		  // background and border color to Transparent.
		  call c.addLegend(50, 25, false, "arialbd.ttf", 10).setBackground(CDBaseChartMBS.kTransparent)
		  
		  // Set axis label style to 8pts Arial Bold
		  call c.xAxis.setLabelStyle("arialbd.ttf", 8)
		  call c.yAxis.setLabelStyle("arialbd.ttf", 8)
		  call c.yAxis2.setLabelStyle("arialbd.ttf", 8)
		  
		  // Set the axis stem to transparent
		  c.xAxis.setColors(CDBaseChartMBS.kTransparent)
		  call c.yAxis.setColors(CDBaseChartMBS.kTransparent)
		  call c.yAxis2.setColors(CDBaseChartMBS.kTransparent)
		  
		  // Configure x-axis label format
		  c.xAxis.setMultiFormat(CDBaseChartMBS.StartOfYearFilter, "{value|mm/yyyy} ", CDBaseChartMBS.StartOfMonthFilter, "{value|mm}")
		  
		  // Add axis title using 10pts Arial Bold Italic font
		  call c.yAxis.setTitle("Power Usage (Watt)", "arialbi.ttf", 10)
		  call c.yAxis2.setTitle("Effective Load (kg)", "arialbi.ttf", 10)
		  
		  // Add a line layer to the chart using a line width of 2 pixels.
		  dim layer as CDLineLayerMBS = c.addLineLayer
		  layer.setLineWidth(2)
		  
		  // Add 2 data series to the line layer
		  layer.setXData(timeStamps)
		  call layer.addDataSet(data0, &hcc0000, "Power Usage")
		  layer.addDataSet(data1, &h008800, "Effective Load").setUseYAxis
		  
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
		  
		  // Get the data x-value that is nearest to the mouse, and find its pixel coordinate.
		  dim xValue as double = c.getNearestXValue(mouseX)
		  dim xCoor as integer = c.getXCoor(xValue)
		  
		  // The vertical track line is drawn up to the highest data point (the point with smallest
		  // y-coordinate). We need to iterate all datasets in all layers to determine where it is.
		  dim minY as integer = plotArea.getBottomY
		  
		  // Iterate through all layers to find the highest data point
		  dim u as integer = c.getLayerCount-1
		  for i as integer = 0 to u
		    dim layer as CDLayerMBS = c.getLayerByZ(i)
		    
		    // The data array index of the x-value
		    dim xIndex as integer = layer.getXIndexOf(xValue)
		    
		    // Iterate through all the data sets in the layer
		    dim uu as integer = layer.getDataSetCount-1
		    for j as integer = 0 to uu
		      dim dataSet as CDDataSetMBS = layer.getDataSetByZ(j)
		      
		      dim dataPoint as double = dataSet.getPosition(xIndex)
		      if ((dataPoint <> CDBaseChartMBS.kNoValue) and (dataSet.getDataColor <> CDBaseChartMBS.kTransparent)) then
		        minY = min(minY, c.getYCoor(dataPoint, dataSet.getUseYAxis))
		      end if
		    next
		  next
		  
		  // Draw a vertical track line at the x-position up to the highest data point.
		  d.vline(max(minY, plotArea.getTopY), plotArea.getBottomY + 6, xCoor, d.dashLineColor(&h000000, &h0101))
		  
		  // Draw a label on the x-axis to show the track line position
		  dim xlabel as string
		  xlabel = "<*font,bgColor=000000*> " + c.xAxis.getFormattedLabel(xValue, "mmm dd, yyyy") + " <*/font*>"
		  dim t as CDTTFTextMBS = d.text(xlabel, "arialbd.ttf", 8)
		  t.draw(xCoor, plotArea.getBottomY + 6, &hffffff, CDBaseChartMBS.kTop)
		  t.destroy
		  
		  // Iterate through all layers to build the legend array
		  for i as integer = 0 to u
		    dim layer as CDLayerMBS = c.getLayerByZ(i)
		    
		    // The data array index of the x-value
		    dim xIndex  as integer = layer.getXIndexOf(xValue)
		    
		    // Iterate through all the data sets in the layer
		    dim uu as integer = layer.getDataSetCount-1
		    for j as integer = 0 to uu
		      dim dataSet as CDDataSetMBS = layer.getDataSetByZ(j)
		      
		      // The positional value, axis binding, pixel coordinate and color of the data point.
		      dim dataPoint as double = dataSet.getPosition(xIndex)
		      dim yAxis as CDAxisMBS = dataSet.getUseYAxis
		      dim yCoor as integer = c.getYCoor(dataPoint, yAxis)
		      dim colorvalue as integer = dataSet.getDataColor
		      
		      // Draw the axis label only for visible data points of named data sets
		      if ((dataPoint <> CDBaseChartMBS.kNoValue) and (colorvalue <> CDBaseChartMBS.kTransparent) and (yCoor >= plotArea.getTopY) and (yCoor <= plotArea.getBottomY)) then
		        // The axis label consists of 3 parts - a track dot for the data point, an axis label,
		        // and a line joining the track dot to the axis label.
		        
		        // Draw the line first. The end point of the line at the axis label side depends on
		        // whether the label is at the left or right side of the axis (that is, on whether the
		        // axis is on the left or right side of the plot area).
		        
		        dim n as integer = 4
		        if yAxis.getAlignment =CDBaseChartMBS.kLeft then
		          n = -4
		        end if
		        
		        dim xPos as integer = yAxis.getX + n
		        d.hline(xCoor, xPos, yCoor, d.dashLineColor(colorvalue, &h0101))
		        
		        // Draw the track dot
		        d.circle(xCoor, yCoor, 4, 4, colorvalue, colorvalue)
		        
		        // Draw the axis label. If the axis is on the left side of the plot area, the labels
		        // should right aligned to the axis, and vice versa.
		        dim axisLabel as string
		        dim h as string = hex(colorvalue)
		        while h.len<6 
		          h = "0" + h
		        wend
		        axisLabel = "<*font,bgColor=" + h+ "*> " + c.formatValue(dataPoint, "{value|P4}") + " <*/font*>"
		        t = d.text(axisLabel, "arialbd.ttf", 8)
		        
		        dim nn as integer = CDBaseChartMBS.kLeft
		        if yAxis.getAlignment = CDBaseChartMBS.kLeft then
		          nn = CDBaseChartMBS.kRight
		        end if
		        
		        t.draw(xPos, yCoor, &hffffff, nn)
		        t.destroy
		      end if
		    next
		  next
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Notes
		
		This sample program demonstrates a track cursor programmed with the following features:
		
		* Small dots that shows the data points at the nearest x data value from the mouse cursor.
		* A vertical line that connects the data points to the x-axis, with an x-axis label displaying the x value.
		* Horizontal lines that connect the data points to the y-axes, with y-axis labels displaying their values.
		
		The code first draws the chart. 
		We hide tracking if mouse is out of plotarea.
		The track cursor is configured to automatically hide itself when the mouse leaves the plot area.
		
		The trackLineAxis method is the routine that draws the track cursor. Its key elements are:
		
		* To draw dynamic contents on the chart, the code obtains the DrawArea object for drawing on the dynamic layer of the chart using BaseChart.initDynamicLayer.
		* The nearest x data value is obtained using XYChart.getNearestXValue.
		* The code iterates through all data sets in all layers to find the highest data point at the nearest x data value. It then draws a vertical line from that point to the x-axis using DrawArea.vline, and the corresponding x-axis label using DrawArea.text.
		* The code iterates through all data sets in all layers once more to find all the data points at the nearest x data value. For each of these points, it draws a horizontal line to connect the point to the y-axis using DrawArea.hline, draws the axis label using DrawArea.text, and draws a circular dot at the point using DrawArea.circle.
		
		
		
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
