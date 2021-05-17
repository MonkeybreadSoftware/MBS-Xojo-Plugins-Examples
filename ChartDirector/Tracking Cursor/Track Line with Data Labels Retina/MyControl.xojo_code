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
		  CDBaseChartMBS.ScaleFactor = 2
		  
		  // Data for the chart as 3 random data series
		  dim r as new CDRanSeriesMBS(127)
		  dim data0() as double = r.getSeries(100, 100, -15, 15)
		  dim data1() as double = r.getSeries(100, 150, -15, 15)
		  dim data2() as double = r.getSeries(100, 200, -15, 15)
		  dim timeStamps() as double = r.getDateSeries(100, CDBaseChartMBS.chartTime(2011, 1, 1), 86400, false)
		  
		  // Create a XYChart object of size 640 x 400 pixels
		  c = new CDXYChartMBS(640, 400)
		  
		  // Add a title to the chart using 18 pts Times New Roman Bold Italic font
		  call c.addTitle("    Product Line Global Revenue", "timesbi.ttf", 18)
		  
		  // Set the plotarea at (50, 55) with width 70 pixels less than chart width, and height 90 pixels
		  // less than chart height. Use a vertical gradient from light blue (f0f6ff) to sky blue (a0c0ff)
		  // as background. Set border to transparent and grid lines to white (ffffff).
		  call c.setPlotArea(50, 55, c.getWidth - 70, c.getHeight - 90, c.linearGradientColor(0, 55, 0, c.getHeight - 35, &hf0f6ff, &ha0c0ff), -1, CDBaseChartMBS.kTransparent, &hffffff, &hffffff)
		  
		  // Add a legend box at (50, 25) using horizontal layout. Use 10pts Arial Bold as font. Set the
		  // background and border color to Transparent.
		  c.addLegend(50, 25, false, "arialbd.ttf", 10).setBackground(CDBaseChartMBS.kTransparent)
		  
		  // Set axis label style to 8pts Arial Bold
		  call c.xAxis.setLabelStyle("arialbd.ttf", 8)
		  call c.yAxis.setLabelStyle("arialbd.ttf", 8)
		  
		  // Set the axis stem to transparent
		  c.xAxis.setColors(CDBaseChartMBS.kTransparent)
		  c.yAxis.setColors(CDBaseChartMBS.kTransparent)
		  
		  // Configure x-axis label format
		  call c.xAxis.setMultiFormat(CDBaseChartMBS.StartOfYearFilter, "{value|mm/yyyy} ", CDBaseChartMBS.StartOfMonthFilter, "{value|mm}")
		  
		  // Add axis title using 10pts Arial Bold Italic font
		  call c.yAxis.setTitle("USD millions", "arialbi.ttf", 10)
		  
		  // Add a line layer to the chart using a line width of 2 pixels.
		  dim layer as CDLineLayerMBS = c.addLineLayer
		  layer.setLineWidth(2)
		  
		  // Add 3 data series to the line layer
		  call layer.setXData(timeStamps)
		  call layer.addDataSet(data0, &hff3333, "Alpha")
		  call layer.addDataSet(data1, &h008800, "Beta")
		  call layer.addDataSet(data2, &h3333cc, "Gamma")
		  
		  // Assign the chart to the WinChartViewer
		  
		  pic = c.makeChartPicture
		  
		  
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
		  g.DrawPicture pic, 0, 0, g.Width, g.Height, 0, 0, pic.Width, pic.Height
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub trackLineLegend(mouseX as integer)
		  // Clear the current dynamic layer and get the DrawArea object to draw on it.
		  dim d as CDDrawAreaMBS = c.initDynamicLayer
		  
		  // The plot area object
		  dim plotArea AS CDPlotAreaMBS = c.getPlotArea
		  
		  
		  // check if we are outside the plotArea
		  if mousex<plotArea.getLeftX   then Return
		  if mousey<plotArea.getTopY    then Return
		  if mousex>plotArea.getRightX  then Return
		  if mousey>plotArea.getBottomY then Return
		  
		  // Get the data x-value that is nearest to the mouse, and find its pixel coordinate.
		  dim xValue as double = c.getNearestXValue(mouseX)
		  dim xCoor as integer = c.getXCoor(xValue)
		  
		  // Draw a vertical track line at the x-position
		  d.vline(plotArea.getTopY, plotArea.getBottomY, xCoor, d.dashLineColor(&h000000, &h0101))
		  
		  // Draw a label on the x-axis to show the track line position.
		  dim xlabel as string
		  xlabel = "<*font,bgColor=000000*> " + c.xAxis.getFormattedLabel(xValue, "mmm dd, yyyy") + " <*/font*>"
		  dim t as CDTTFTextMBS = d.text(xlabel, "arialbd.ttf", 8)
		  
		  // Restrict the x-pixel position of the label to make sure it stays inside the chart image.
		  dim xLabelPos as integer = max(0, min(xCoor - t.getWidth / 2, c.getWidth - t.getWidth))
		  t.draw(xLabelPos, plotArea.getBottomY + 6, &hffffff)
		  t.destroy
		  
		  // Iterate through all layers to draw the data labels
		  dim u as integer = c.getLayerCount-1
		  for i as integer = 0 to u
		    dim layer as CDLayerMBS = c.getLayerByZ(i)
		    
		    // The data array index of the x-value
		    dim xIndex as integer = layer.getXIndexOf(xValue)
		    
		    // Iterate through all the data sets in the layer
		    dim uu as integer = layer.getDataSetCount-1
		    for j as integer = 0 to uu
		      
		      dim dataSet as CDDataSetMBS = layer.getDataSetByZ(j)
		      dim dataSetName as string = dataSet.getDataName
		      
		      // Get the color, name and position of the data label
		      dim colorvalue as integer = dataSet.getDataColor
		      dim yCoor as integer = c.getYCoor(dataSet.getPosition(xIndex), dataSet.getUseYAxis)
		      
		      // Draw a track dot with a label next to it for visible data points in the plot area
		      if ((yCoor >= plotArea.getTopY) and (yCoor <= plotArea.getBottomY) and (colorvalue <> CDBaseChartMBS.kTransparent) and dataSetName.len>0) then
		        
		        d.circle(xCoor, yCoor, 4, 4, colorvalue, colorvalue)
		        
		        dim label as string
		        dim h as string = hex(colorvalue)
		        while h.len<6
		          h = "0" + h
		        wend
		        label = "<*font,bgColor=" + h + "*> " + c.formatValue(dataSet.getValue(xIndex), "{value|P4}") + " <*font*>"
		        t = d.text(label, "arialbd.ttf", 8)
		        
		        // Draw the label on the right side of the dot if the mouse is on the left side the
		        // chart, and vice versa. This ensures the label will not go outside the chart image.
		        if (xCoor <= (plotArea.getLeftX + plotArea.getRightX) / 2) then
		          t.draw(xCoor + 5, yCoor, &hffffff, CDBaseChartMBS.kLeft)
		        else
		          t.draw(xCoor - 5, yCoor, &hffffff, CDBaseChartMBS.kRight)
		          
		          t.destroy
		        end if
		      end if
		    next
		  next
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Notes
		
		This sample program demonstrates a track cursor programmed with the following features:
		
		* A vertical line that follows the mouse cursor on the plot area and snaps to the nearest x data value, with a label on the x-axis displaying that value.
		* Small dots that shows the data points at the nearest x data value.
		* Labels beside the small dots displaying the values of the data points.
		
		The code first draws the chart. 
		We hide tracking if mouse is out of plotarea.
		The track cursor is configured to automatically hide itself when the mouse leaves the plot area.
		
		The trackLineLabel method is the routine that draws the track cursor. Its key elements are:
		
		* To draw dynamic contents on the chart, the code obtains the DrawArea object for drawing on the dynamic layer of the chart using BaseChart.initDynamicLayer.
		* The nearest x data value is obtained using XYChart.getNearestXValue.
		* A vertical line is drawn at the nearest x data value using DrawArea.vline.
		* The x-axis label at the nearest x value is drawn using DrawArea.text.
		* The code then iterates through all data sets in all layers to find all the data points at the nearest x data value. For each of these points, it gets the point's y position using DataSet.getPosition, and draws a circular dot using DrawArea.circle. It also formats the point's data value (obtained using DataSet.getValue) and displays it next to the dot using DrawArea.text.
		
		
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
