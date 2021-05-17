#tag Class
Protected Class MyControl
Inherits Canvas
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  trackFinance x
		  pic = m.makeChartPicture
		  me.Invalidate
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  CDBaseChartMBS.ScaleFactor = 2
		  
		  // Create a finance chart demo containing 100 days of data
		  dim noOfDays as integer = 100
		  
		  // To compute moving averages starting from the first day, we need to get extra data points before
		  // the first day
		  dim extraDays as integer = 30
		  
		  // In this exammple, we use a random number generator utility to simulate the data. We set up the
		  // random table to create 6 cols x (noOfDays + extraDays) rows, using 9 as the seed.
		  dim rantable as new CDRanTableMBS(9, 6, noOfDays + extraDays)
		  
		  // Set the 1st col to be the timeStamp, starting from Sep 4, 2011, with each row representing one
		  // day, and counting week days only (jump over Sat and Sun)
		  rantable.setDateCol(0, CDBaseChartMBS.chartTime(2011, 9, 4), 86400, true)
		  
		  // Set the 2nd, 3rd, 4th and 5th columns to be high, low, open and close data. The open value
		  // starts from 100, and the daily change is random from -5 to 5.
		  rantable.setHLOCCols(1, 100, -5, 5)
		  
		  // Set the 6th column as the vol data from 5 to 25 million
		  rantable.setCol(5, 50000000, 250000000)
		  
		  // Now we read the data from the table into arrays
		  dim timeStamps(-1) as double = rantable.getCol(0).Values
		  dim highData(-1) as double = rantable.getCol(1).Values
		  dim lowData(-1) as double = rantable.getCol(2).Values
		  dim openData(-1) as double = rantable.getCol(3).Values
		  dim closeData(-1) as double = rantable.getCol(4).Values
		  dim volData(-1) as double = rantable.getCol(5).Values
		  
		  // Create a FinanceChart object of width 720 pixels
		  dim c as new CDFinanceChartMBS(720)
		  m = c
		  
		  // Add a title to the chart
		  call c.addTitle("Finance Chart Demonstration")
		  
		  // Disable default legend box, as we are using dynamic legend
		  call c.setLegendStyle("normal", 8, CDBaseChartMBS.kTransparent, CDBaseChartMBS.kTransparent)
		  
		  // Set the data into the finance chart object
		  c.setData(timeStamps, highData, lowData, openData, closeData, volData, extraDays)
		  
		  // Add the main chart with 240 pixels in height
		  dim main as CDXYChartMBS = c.addMainChart(240)
		  
		  // Add a 10 period simple moving average to the main chart, using brown color
		  call c.addSimpleMovingAvg(10, &h663300)
		  
		  // Add a 20 period simple moving average to the main chart, using purple color
		  call c.addSimpleMovingAvg(20, &h9900ff)
		  
		  // Add candlestick symbols to the main chart, using green/red for up/down days
		  call c.addCandleStick(&h00ff00, &hff0000)
		  
		  // Add 20 days bollinger band to the main chart, using light blue (9999ff) as the border and
		  // semi-transparent blue (c06666ff) as the fill color
		  call c.addBollingerBand(20, 2, &h9999ff, &hc06666ff)
		  
		  // Add a 75 pixels volume bars sub-chart to the bottom of the main chart, using green/red/grey for
		  // up/down/flat days
		  call c.addVolBars(75, &h99ff99, &hff9999, &h808080)
		  
		  // Append a 14-days RSI indicator chart (75 pixels high) after the main chart. The main RSI line
		  // is purple (800080). Set threshold region to +/- 20 (that is, RSI = 50 +/- 25). The upper/lower
		  // threshold regions will be filled with red (ff0000)/blue (0000ff).
		  call c.addRSI(75, 14, &h800080, 20, &hff0000, &h0000ff)
		  
		  // Append a MACD(26, 12) indicator chart (75 pixels high) after the main chart, using 9 days for
		  // computing divergence.
		  call c.addMACD(75, 26, 12, 9, &h0000ff, &hff00ff, &h008000)
		  
		  // Include track line with legend for the latest data values
		  dim xchart as CDXYChartMBS = CDXYChartMBS(c.getchart(0))
		  trackFinance xchart.getPlotArea.getRightX
		  
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
		Sub trackFinance(mouseX as integer)
		  // Clear the current dynamic layer and get the DrawArea object to draw on it.
		  dim d as CDDrawAreaMBS = m.initDynamicLayer
		  
		  // It is possible for a FinanceChart to be empty, so we need to check for it.
		  if m.getChartCount = 0 then
		    return
		  end if
		  
		  // Get the data x-value that is nearest to the mouse
		  dim xchart as CDXYChartMBS = CDXYChartMBS(m.getChart(0))
		  dim xValue as double = xchart.getNearestXValue(mouseX)
		  
		  // Iterate the XY charts (main price chart and indicator charts) in the FinanceChart
		  
		  dim u as integer = m.getChartCount-1
		  for i as integer = 0 to u
		    dim c as CDXYChartMBS = CDXYChartMBS(m.getChart(i))
		    
		    // Variables to hold the legend entries
		    dim ohlcLegend as string
		    dim legendEntries(-1) as string
		    
		    // Iterate through all layers to find the highest data point
		    dim lu as integer = c.getLayerCount-1
		    for j as integer = 0 to lu
		      dim layer as CDLayerMBS = c.getLayerByZ(j)
		      dim xIndex as integer = layer.getXIndexOf(xValue)
		      dim dataSetCount as integer = layer.getDataSetCount
		      
		      // In a FinanceChart, only layers showing OHLC data can have 4 data sets
		      if (dataSetCount = 4) then
		        dim highValue as double = layer.getDataSet(0).getValue(xIndex)
		        dim lowValue as double = layer.getDataSet(1).getValue(xIndex)
		        dim openValue as double = layer.getDataSet(2).getValue(xIndex)
		        dim closeValue as double = layer.getDataSet(3).getValue(xIndex)
		        
		        if (closeValue <> CDBaseChartMBS.kNoValue) then
		          // Build the OHLC legend
		          ohlcLegend = "      <*block*>"
		          ohlcLegend = ohlcLegend + "Open: " + c.formatValue(openValue, "{value|P4}")
		          ohlcLegend = ohlcLegend + ", High: " + c.formatValue(highValue, "{value|P4}")
		          ohlcLegend = ohlcLegend + ", Low: " + c.formatValue(lowValue, "{value|P4}")
		          ohlcLegend = ohlcLegend + ", Close: " + c.formatValue(closeValue, "{value|P4}")
		          
		          // We also draw an upward or downward triangle for up and down days and the %
		          // change
		          dim lastCloseValue as double = layer.getDataSet(3).getValue(xIndex - 1)
		          if (lastCloseValue <> CDBaseChartMBS.kNoValue) then
		            dim change as double = closeValue - lastCloseValue
		            dim percent as double = change * 100 / closeValue
		            dim symbol as string = "<*font,color=CC0000*><*img=@invertedtriangle,width=8,color=CC0000*>"
		            if change >= 0 then symbol = "<*font,color=008800*><*img=@triangle,width=8,color=008800*>"
		            
		            ohlcLegend = ohlcLegend + "  " + symbol + " " + c.formatValue(change, "{value|P4}")
		            ohlcLegend = ohlcLegend + " (" + c.formatValue(percent, "{value|2}") + "%)<*/font*>"
		          end if
		          
		          ohlcLegend = ohlcLegend + "<*/*>"
		        end if
		      else
		        // Iterate through all the data sets in the layer
		        dim ku as integer = layer.getDataSetCount-1
		        for k as integer = 0 to ku
		          dim dataSet as CDDataSetMBS = layer.getDataSetByZ(k)
		          
		          dim name as string = dataSet.getDataName
		          dim value as double = dataSet.getValue(xIndex)
		          if (name.len>0 and (value <> CDBaseChartMBS.kNoValue)) then
		            
		            // In a FinanceChart, the data set name consists of the indicator name and its
		            // latest value. It is like "Vol: 123M" or "RSI (14): 55.34". As we are
		            // generating the values dynamically, we need to extract the indictor name
		            // out, and also the volume unit (if any).
		            
		            // The volume unit
		            dim unitChar as string
		            
		            // The indicator name is the part of the name up to the colon character.
		            dim delimiterPosition as integer = name.instr(":")
		            if delimiterPosition>0 then
		              
		              // The unit, if any, is the trailing non-digit character(s).
		              dim lastDigitPos as integer = name.FindLastOf("0123456789")
		              if (lastDigitPos>0) and (lastDigitPos + 1 < len(name)) and (lastDigitPos > delimiterPosition) then
		                unitChar = mid(name, lastDigitPos + 1)
		                
		                name = left(name, delimiterPosition-1)
		              end if
		              
		              // In a FinanceChart, if there are two data sets, it must be representing a
		              // range.
		              if (dataSetCount = 2) then
		                // We show both values in the range in a single legend entry
		                value = layer.getDataSet(0).getValue(xIndex)
		                dim value2 as double = layer.getDataSet(1).getValue(xIndex)
		                name = name + ": " + c.formatValue(min(value, value2), "{value|P3}")
		                name = name + " - " + c.formatValue(max(value, value2), "{value|P3}")
		              else
		                // In a FinanceChart, only the layer for volume bars has 3 data sets for
		                // up/down/flat days
		                if (dataSetCount = 3) then
		                  // The actual volume is the sum of the 3 data sets.
		                  value = layer.getDataSet(0).getValue(xIndex) + layer.getDataSet(1).getValue(xIndex) + layer.getDataSet(2).getValue(xIndex)
		                end if
		                
		                // Create the legend entry
		                name = name + ": " + c.formatValue(value, "{value|P3}") + unitChar
		              end if
		              
		              // Build the legend entry, consist of a colored square box and the name (with
		              // the data value in it).
		              dim legendEntry as string
		              dim h as string = hex(dataSet.getDataColor)
		              while h.len<6
		                h = "0" + h
		              wend
		              legendEntry = "<*block*><*img=@square,width=8,edgeColor=000000,color=" + h + "*> " + name + "<*/*>"
		              legendEntries.append legendEntry
		            end if
		          end if
		        next
		      end if
		    next
		    
		    // Get the plot area position relative to the entire FinanceChart
		    dim plotArea as CDPlotAreaMBS = c.getPlotArea
		    dim plotAreaLeftX as integer = plotArea.getLeftX + c.getAbsOffsetX
		    dim plotAreaTopY as integer = plotArea.getTopY + c.getAbsOffsetY
		    
		    // The legend begins with the date label, then the ohlcLegend (if any), and then the
		    // entries for the indicators.
		    dim legendText as string
		    legendText = "<*block,valign=top,maxWidth=" + str(plotArea.getWidth - 5) + "*><*font=arialbd.ttf*>[" + c.xAxis.getFormattedLabel(xValue, "mmm dd, yyyy") + "]<*/font*>" + ohlcLegend
		    for ii as integer = UBound(legendEntries) downto 0
		      legendText = legendText + "      " + legendEntries(ii)
		    next
		    legendText = legendText + "<*/*>"
		    
		    // Draw a vertical track line at the x-position
		    d.vline(plotAreaTopY, plotAreaTopY + plotArea.getHeight, c.getXCoor(xValue) + c.getAbsOffsetX, d.dashLineColor(&h000000, &h0101))
		    
		    // Display the legend on the top of the plot area
		    dim t as CDTTFTextMBS = d.text(legendText, "arial.ttf", 8)
		    t.draw(plotAreaLeftX + 5, plotAreaTopY + 3, &h000000, CDBaseChartMBS.kTopLeft)
		    t.destroy
		  next
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Notes
		This sample program demonstrates a track cursor for a finance chart programmed with the following features:
		
		* A vertical line that follows the mouse cursor on the plot area and snaps to the nearest trading session.
		* Dynamically updated legend entries that show the price, volume and other technical indicators at the nearest trading session.
		
		The code first draws the finance chart with the legend box set to transparent (so that the default legend box is not displayed). 
		It then sets the track cursor to the right side of the plot area. This ensures the chart initially has a dynamic legend for the latest trading session.
		
		The trackFinance method is the routine that draws the track cursor. Its key elements are:
		
		* To draw dynamic contents on the chart, the code obtains the DrawArea object for drawing on the dynamic layer of the chart using BaseChart.initDynamicLayer.
		* The nearest trading session is obtained from the first XYChart in the FinanceChart using XYChart.getNearestXValue.
		* The code iterates through all the XYChart objects in the FinanceChart. For each XYChart, the code iterates through all the layers to create dynamic legend entries. The FinanceChart creates default static legend entries for all indicators showing their latest values (even though the default static legend box is set to transparent in the chart). The code creates the dynamic legend entries by replacing the values in the static legend entries.
		* If a layer contains 4 data sets, the code assumes it is either a CandleStickLayer or HLOCLayer. It formats a legend entry consisting of the open, high, low, close values, as well as an up/down icon and the percentage change.
		* If a layer contains 2 data sets, the code assumes the layer is for a "band" or "channel" (such as Bollinger Band or Donchian Channel). The code formats a legend entry by replacing the values in the default legend entry (obtained using DataSet.getDataName).
		* If a layer contains 3 data sets, the code assumes the layer is for volume bars, with the 3 data sets representing volume bars of different colors for up, down and flat days. The code computes the volume by adding the values from the three data sets, and formats a legend entry by replacing the value in the default legend entry (obtained using DataSet.getDataName) with the computed value.
		* In all other cases, the code iterates the data sets. For each of them, it formats a legend by replacing the value in the default legend entry (obtained using DataSet.getDataName) with the value for the nearest trading session (obtained using DataSet.getValue).
		* Finally, the code combines all the legend entries into a legend box and draws it on top of the plot area using DrawArea.text. It also draws a vertical line at the nearest trading session using DrawArea.vline.
		
		
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		m As CDFinanceChartMBS
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
