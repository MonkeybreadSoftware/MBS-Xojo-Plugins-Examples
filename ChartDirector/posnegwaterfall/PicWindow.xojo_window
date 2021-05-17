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
   Title           =   "posnegwaterfall"
   Visible         =   True
   Width           =   500
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // 4 data points to represent the cash flow for the Q1 - Q4
		  dim data(-1) as double = array(230, -140, 220, 330.0)
		  
		  // We want to plot a waterfall chart showing the 4 quarters as well as the total
		  dim labels(-1) as string = array("1st Quarter", "2nd Quarter", "3rd Quarter", "4th Quarter", "Total")
		  
		  // The top side of the bars in a waterfall chart is the accumulated data. We use
		  // the ChartDirector ArrayMath utility to accumulate the data. The "total" is
		  // handled by inserting a zero point at the end before accumulation (after
		  // accumulation it will become the total).
		  dim boxTop as new CDArrayMBS(data)
		  boxtop.insert(0, 1, 4)
		  boxtop.acc
		  
		  // The botom side of the bars is just the top side of the previous bar. So we
		  // shifted the top side data to obtain the bottom side data.
		  dim boxBottom as new CDArrayMBS(boxTop)
		  boxbottom.shift(1, 0)
		  
		  // The last point (total) is different. Its bottom side is always 0.
		  boxBottom.trim(0, 4)
		  boxBottom.insert(0, 1)
		  
		  // In this example, we want to use different colors depending on the data is
		  // positive or negative.
		  dim posColor as integer = &h00ff00
		  dim negColor as integer = &hff0000
		  
		  // Create a XYChart object of size 500 x 280 pixels. Set background color to
		  // light blue (ccccff), with 1 pixel 3D border effect.
		  dim c as new CDXYChartMBS(500, 300, &hccccff, &h000000, 1)
		  
		  // Add a title to the chart using 13 points Arial Bold Itatic font, with white
		  // (ffffff) text on a deep blue (&h80) background
		  c.addTitle("Corporate Cash Flow - Year 2004", "arialbi.ttf", 13, &hffffff).setBackground(&h000080)
		  
		  // Set the plotarea at (55, 50) and of size 430 x 215 pixels. Use alternative
		  // white/grey background.
		  call c.setPlotArea(55, 50, 430, 215, &hffffff, &heeeeee)
		  
		  // Add a legend box at (55, 25) using 8 pts Arial Bold font with horizontal
		  // layout, with transparent background and border color.
		  dim b as CDLegendBoxMBS
		  b = c.addLegend(55, 25, false, "arialbd.ttf", 8)
		  b.setBackground(c.kTransparent, c.kTransparent)
		  
		  // Add keys to show the colors for positive and negative cash flows
		  b.addKey("Positive Cash Flow", posColor)
		  b.addKey("Negative Cash Flow", negColor)
		  
		  // Set the labels on the x axis using Arial Bold font
		  c.xAxis.setLabels(labels).setFontStyle("arialbd.ttf")
		  
		  // Set the x-axis ticks and grid lines to be between the bars
		  c.xAxis.setTickOffset(0.5)
		  
		  // Use Arial Bold as the y axis label font
		  call c.yAxis.setLabelStyle("arialbd.ttf")
		  
		  // Add a title to the y axis
		  call c.yAxis.setTitle("USD (in millions)")
		  
		  dim bTop(-1) as Double
		  dim bBottom(-1) as Double
		  dim i,count as integer
		  
		  count=boxtop.count-1
		  for i=0 to count
		    btop.append boxtop.getvalue(i)
		  next
		  
		  count=boxbottom.count-1
		  for i=0 to count
		    bbottom.append boxbottom.getvalue(i)
		  next
		  
		  // Add a box-whisker layer to represent the waterfall bars
		  dim layer as CDBoxWhiskerLayerMBS
		  layer = c.addBoxWhiskerLayer(bTop, bBottom)
		  
		  for i=0 to boxTop.count-1
		    
		    if (boxTop.getvalue(i) >= boxBottom.getvalue(i)) then
		      call layer.setBoxColor(i, posColor)
		    else
		      call layer.setBoxColor(i, negColor)
		    end if
		  next
		  
		  // Put data labels on the bars to show the cash flow using Arial Bold font
		  layer.setDataLabelFormat("{={top}-{bottom}}M")
		  layer.setDataLabelStyle("arialbd.ttf").setAlignment(c.kCenter)
		  
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
