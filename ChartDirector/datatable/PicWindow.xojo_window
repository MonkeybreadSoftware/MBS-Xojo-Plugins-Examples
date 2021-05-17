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
   Title           =   "datatable"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The data for the line chart
		  dim data0(-1) as double = array(42.0, 49, 33, 38, 64, 56, 29, 41, 44, 57, 59, 42)
		  dim data1(-1) as double = array(65.0, 75, 47, 34, 42, 49, 73, 62, 90, 69, 66, 78)
		  dim data2(-1) as double = array(36.0, 28, 25, 28, 38, 20, 22, 30, 25, 33, 30, 24)
		  dim labels(-1) as string = array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug","Sep", "Oct", "Nov", "Dec")
		  
		  // Create a XYChart object of size 600 x 400 pixels
		  dim c as new CDXYChartMBS(600, 400)
		  
		  // Add a title to the chart using 18 pts Times Bold Italic font
		  dim title as CDTextBoxMBS = c.addTitle("Product Line Global Revenue", "timesbi.ttf", 18)
		  
		  // Tentatively set the plotarea at (50, 55) and of (chart_width - 100) x
		  // (chart_height - 120) pixels in size. Use a vertical gradient color from sky
		  // blue (aaccff) t0 light blue (f9f9ff) as background. Set both horizontal and
		  // vertical grid lines to dotted semi-transprent black (aa000000).
		  dim plotArea as CDPlotAreaMBS = c.setPlotArea(50, 55, c.getWidth - 100, c.getHeight - 120, c.linearGradientColor(0, 55, 0, 55 + c.getHeight - 120, &haaccff, &hf9fcff), -1, -1, c.dashLineColor(&haa000000, c.kDotLine), -1)
		  
		  // Add a legend box and anchored the top center at the horizontal center of the
		  // chart, just under the title. Use 10pts Arial Bold as font, with transparent
		  // background and border.
		  dim legendBox as CDLegendBoxMBS = c.addLegend(c.getWidth / 2, title.getHeight, false, "arialbd.ttf", 10)
		  legendBox.setAlignment(c.kTopCenter)
		  legendBox.setBackground(c.kTransparent, c.kTransparent)
		  
		  // Set y-axis title using 10 points Arial Bold Italic font, label style to 8
		  // points Arial Bold, and axis color to transparent
		  call c.yAxis.setTitle("Revenue (USD millions)", "arialbi.ttf", 10)
		  call c.yAxis.setLabelStyle("arialbd.ttf", 8)
		  call c.yAxis.setColors(c.kTransparent)
		  
		  // Set y-axis tick density to 30 pixels. ChartDirector auto-scaling will use this
		  // as the guideline when putting ticks on the y-axis.
		  c.yAxis.setTickDensity(30)
		  
		  // Add a line layer to the chart
		  dim layer as CDLineLayerMBS = c.addLineLayer
		  
		  // Set the line width to 3 pixels
		  layer.setLineWidth(3)
		  
		  // Add the three data sets to the line layer, using circles, diamands and X
		  // shapes as symbols
		  layer.addDataSet(data0, &hff0000, "Quantum Computer").setDataSymbol(c.kCircleSymbol, 9)
		  layer.addDataSet(data1, &h00ff00, "Atom Synthesizer").setDataSymbol(c.kDiamondSymbol, 11)
		  layer.addDataSet(data2, &hff6600, "Proton Cannon").setDataSymbol(CDBaseChartMBS.Cross2Shape, 11)
		  
		  // Set the x axis labels
		  call c.xAxis.setLabels(labels)
		  
		  // Convert the labels on the x-axis to a CDMLTable
		  dim table as CDMLTableMBS = c.xAxis.makeLabelTable
		  
		  // Set the default top/bottom margins of the cells to 3 pixels
		  table.getStyle.setMargin(0, 0, 3, 3)
		  
		  // Use Arial Bold as the font for the first row
		  table.getRowStyle(0).setFontStyle("arialbd.ttf")
		  
		  //
		  // We can add more information to the table. In this sample code, we add the data
		  // series and the legend icons to the table.
		  //
		  
		  // Add 3 more rows to the table. Set the background of the 1st and 3rd rows to
		  // light grey (eeeeee).
		  call table.appendRow.setBackground(&heeeeee, c.kLineColor)
		  call table.appendRow
		  call table.appendRow.setBackground(&heeeeee, c.kLineColor)
		  
		  // Put the values of the 3 data series to the cells in the 3 rows
		  
		  for i as integer = 0 to UBound(data0)
		    call table.setText(i, 1, str(data0(i)))
		    call table.setText(i, 2, str(data1(i)))
		    call table.setText(i, 3, str(data2(i)))
		  next
		  
		  // Insert a column on the left for the legend icons. Use 5 pixels left/right
		  // margins and 3 pixels top/bottom margins for the cells in this column.
		  table.insertCol(0).setMargin(5, 5, 3, 3)
		  
		  // The top cell is set to transparent, so it is invisible
		  table.getCell(0, 0).setBackground(c.kTransparent, c.kTransparent)
		  
		  // The other 3 cells are set to the legend icons of the 3 data series
		  call table.setText(0, 1, layer.getLegendIcon(0))
		  call table.setText(0, 2, layer.getLegendIcon(1))
		  call table.setText(0, 3, layer.getLegendIcon(2))
		  
		  // Layout legend box first, so we can get its size
		  call c.layoutLegend
		  
		  // Adjust the plot area size, such that the bounding box (inclusive of axes) is 2
		  // pixels from the left, right and bottom edge, and is just under the legend box.
		  c.packPlotArea(2, legendBox.getTopY + legendBox.getHeight, c.getWidth - 3, c.getHeight - 3)
		  
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
