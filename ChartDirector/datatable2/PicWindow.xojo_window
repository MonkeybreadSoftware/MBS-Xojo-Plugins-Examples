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
   Height          =   400
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
   Title           =   "datatable2"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  // The data for the line chart
		  dim data0(-1) as double = array(410.0, 420, 500, 590)
		  dim data1(-1) as double = array(500.0, 370, 680, 850)
		  dim labels(-1) as string = array("Q1", "Q2", "Q3", "Q4")
		  
		  // Create a XYChart object of size 600 x 400 pixels
		  dim c as new CDXYChartMBS(600, 400)
		  
		  // Add a title to the chart using 18 pts Times Bold Italic font
		  dim title as CDTextBoxMBS = c.addTitle("Product Line Global Revenue", "timesbi.ttf", 18)
		  
		  // Tentatively set the plotarea at (50, 55) and of (chart_width - 100) x
		  // (chart_height - 150) pixels in size. Use a vertical gradient color from sky
		  // blue (aaccff) t0 light blue (f9f9ff) as background. Set both horizontal and
		  // vertical grid lines to dotted semi-transprent black (aa000000).
		  dim plotArea as CDPlotAreaMBS = c.setPlotArea(50, 55, c.getWidth - 100, c.getHeight - 150, c.linearGradientColor(0, 55, 0, 55 + c.getHeight - 150, &haaccff, &hf9fcff), -1, -1, c.dashLineColor(&haa000000, CDXYChartMBS.kDotLine), -1)
		  
		  // Set y-axis title using 12 points Arial Bold Italic font, and set its position
		  // 10 pixels from the axis.
		  call c.yAxis.setTitle("Revenue (USD millions)", "arialbi.ttf", 12)
		  c.yAxis.setTitlePos(CDXYChartMBS.kLeft, 10)
		  
		  // Set y-axis label style to 10 points Arial Bold and axis color to transparent
		  call c.yAxis.setLabelStyle("arialbd.ttf", 10)
		  call c.yAxis.setColors(CDXYChartMBS.kTransparent)
		  
		  // Set y-axis tick density to 30 pixels. ChartDirector auto-scaling will use this
		  // as the guideline when putting ticks on the y-axis.
		  c.yAxis.setTickDensity(30)
		  
		  // Add a bar layer to the chart with side layout
		  dim layer as CDBarLayerMBS = c.addBarLayer(CDXYChartMBS.kSide)
		  
		  // Add two data sets to the bar layer
		  call layer.addDataSet(data0, &hff6600, "FY 2007")
		  call layer.addDataSet(data1, &h0088ff, "FY 2008")
		  
		  // Use soft lighting effect with light direction from the left
		  layer.setBorderColor(CDXYChartMBS.kTransparent, CDXYChartMBS.softLighting(CDXYChartMBS.kLeft))
		  
		  // Set the x axis labels
		  call c.xAxis.setLabels(labels)
		  
		  // Convert the labels on the x-axis to a CDMLTable
		  dim table AS CDMLTableMBS = c.xAxis.makeLabelTable
		  
		  // Set the default left/right margins to 5 pixels and top/bottom margins to 3
		  // pixels. Set the default font size to 10 points
		  dim cellStyle as CDTextBoxMBS = table.getStyle
		  cellStyle.setMargin(5, 5, 4, 3)
		  cellStyle.setFontSize(10)
		  
		  // Set the first row to use Arial Bold font, with a light grey (eeeeee)
		  // background.
		  dim firstRowStyle as CDTextBoxMBS = table.getRowStyle(0)
		  firstRowStyle.setFontStyle("arialbd.ttf")
		  firstRowStyle.setBackground(&heeeeee, CDXYChartMBS.kLineColor)
		  
		  //
		  // We can add more information to the table. In this sample code, we add the data
		  // series and the legend icons to the table.
		  //
		  
		  // Add 3 more rows to the table. Set the background of the 2nd row to light grey
		  // (eeeeee).
		  call table.appendRow 
		  call table.appendRow.setBackground(&heeeeee, CDXYChartMBS.kLineColor)
		  call table.appendRow
		  
		  // Put the values of the 2 data series in the first 2 rows. Put the percentage
		  // differences in the 3rd row.
		  
		  for i as integer = 0 to ubound(data0)
		    call table.setText(i, 1, str(data0(i)))
		    call table.setText(i, 2, str(data1(i)))
		    
		    dim percentageDiff as double = (data1(i) - data0(i)) / data0(i) * 100
		    
		    // Use red or green color depending on whether the difference is positive or
		    // negative
		    dim formatString as string= "<*color=008800*>+{value|1}%"
		    if percentageDiff < 0 then
		      formatString = "<*color=cc0000*>{value|1}%"
		    end if
		    
		    call table.setText(i, 3, c.formatValue(percentageDiff, formatString))
		  next
		  
		  // Insert a column on the left for the legend icons using Arial Bold font.
		  table.insertCol(0).setFontStyle("arialbd.ttf")
		  
		  // The top cell is set to transparent, so it is invisible
		  table.getCell(0, 0).setBackground(CDXYChartMBS.kTransparent, CDXYChartMBS.kTransparent)
		  
		  // The next 2 cells are set to the legend icons and names of the 2 data series
		  call table.setText(0, 1, layer.getLegendIcon(0)+"  FY 2007")
		  call table.setText(0, 2, layer.getLegendIcon(1)+"  FY 2008")
		  
		  // The last cell is set to "Change"
		  call table.setText(0, 3, "Change")
		  
		  // Append a column on the right for the total values.
		  call table.appendCol
		  
		  // Put "Total" in the top cell as the heading of this column
		  call table.setText(table.getColCount - 1, 0, "Total")
		  
		  // The next two cells are the total of the data series
		  dim total0 as double=0.0
		  dim total1 as double=0.0
		  for each v as double in data0
		    total0=total0+v
		  next
		  for each v as double in data1
		    total1=total1+v
		  next
		  
		  call table.setText(table.getColCount - 1, 1, str(total0))
		  call table.setText(table.getColCount - 1, 2, str(total1))
		  
		  // The last cell is the percentage differences of the total
		  dim totalPercentageDiff as double = (total1 - total0) / total0 * 100
		  
		  // Use red or green color depending on whether the difference is positive or
		  // negative
		  dim totalFormatString as string= "<*color=008800*>+{value|1}%"
		  if totalPercentageDiff < 0 then
		    totalFormatString = "<*color=cc0000*>{value|1}%"
		  end if
		  call table.setText(table.getColCount - 1, 3, c.formatValue(totalPercentageDiff, totalFormatString))
		  
		  //
		  // We now demonstrate how to adjust the plot area positions, to allow space for
		  // the newly inserted left and right columns in the table.
		  //
		  
		  // We layout the axis first in order to get the axis metrics (including table
		  // metrics)
		  c.layoutAxes
		  
		  // If the first column is wider than the left y-axis, we need to reserve for some
		  // left margin to ensure the first column stays within the chart.
		  dim leftMargin as integer = 0
		  if table.getColWidth(0) > c.yAxis.getThickness then
		    leftMargin = table.getColWidth(0) - c.yAxis.getThickness
		  end if
		  
		  // Similarly, we need to reserve some right margin for the last column
		  dim rightMargin as integer = table.getColWidth(table.getColCount - 1)
		  
		  // Adjust the plot area size, such that the bounding box (inclusive of axes)
		  // using the given left and right margin, plus 2 more pixels. Put the plot area
		  // 10 pixels below the title and use 2 pixels as the bottom margin. from the
		  // left, right and bottom edge, and is just under the legend box.
		  call c.packPlotArea(leftMargin + 2, title.getHeight + 10, c.getWidth - 3 - rightMargin, c.getHeight - 3)
		  
		  // After determining the exact plot area position, we may adjust title position
		  // so that it is centered relative to the plot area (instead of the chart)
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
