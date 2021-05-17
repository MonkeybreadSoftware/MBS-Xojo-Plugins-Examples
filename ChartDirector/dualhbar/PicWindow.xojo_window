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
   Height          =   320
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
   Title           =   "dualhbar"
   Visible         =   True
   Width           =   590
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The age groups
		  dim labels(-1) as string = array("0 - 4", "5 - 9", "10 - 14", "15 - 19", "20 - 24", "24 - 29", "30 - 34", "35 - 39", "40 - 44", "44 - 49", "50 - 54", "55 - 59", "60 - 64", "65 - 69", "70 - 74", "75 - 79", "80+")
		  
		  // The male population (in thousands)
		  dim male(-1) as double = array(215, 238, 225, 236, 235, 260, 286, 340, 363, 305, 259, 164, 135, 127, 102, 68, 66.0)
		  
		  // The female population (in thousands)
		  dim female(-1) as double = array(194, 203, 201, 220, 228, 271, 339, 401, 384, 304, 236, 137, 116, 122, 112, 85, 110.0)
		  
		  
		  //=============================================================
		  //    Draw the right bar chart
		  //=============================================================
		  
		  // Create a XYChart object of size 320 x 300 pixels
		  dim c as new CDXYChartMBS(320, 300)
		  
		  // Set the plotarea at (50, 0) and of size 250 x 255 pixels. Use pink (0xffdddd)
		  // as the background.
		  call c.setPlotArea(50, 0, 250, 255, &hffdddd)
		  
		  // Add a custom text label at the top right corner of the right bar chart
		  dim t as CDTextBoxMBS
		  t=c.addText(300, 0, "Female", "timesbi.ttf", 12, &ha07070)
		  t.setAlignment(c.kTopRight)
		  
		  // Add the pink (0xf0c0c0) bar chart layer using the female data
		  dim femaleLayer as CDBarLayerMBS
		  femaleLayer = c.addBarLayer(female, &hf0c0c0)
		  
		  // Swap the axis so that the bars are drawn horizontally
		  c.swapXY(true)
		  
		  // Set the bar to touch each others
		  femaleLayer.setBarGap(c.kTouchBar,c.knovalue)
		  
		  // Set the border style of the bars to 1 pixel 3D border
		  femaleLayer.setBorderColor(-1, 1)
		  
		  // Add a Transparent line layer to the chart using the male data. As it is
		  // Transparent, only the female bar chart can be seen. We need to put both male
		  // and female data in both left and right charts, because we want auto-scaling to
		  // produce the same scale for both chart.
		  call c.addLineLayer(male, c.kTransparent)
		  
		  // Set the y axis label font to Arial Bold
		  call c.yAxis.setLabelStyle("arialbd.ttf")
		  
		  // Set the labels between the two bar charts, which can be considered as the
		  // x-axis labels for the right chart
		  dim tb as CDTextBoxMBS
		  tb = c.xAxis.setLabels(labels)
		  
		  // Use a fix width of 50 for the labels (height = automatic) with center
		  // alignment
		  tb.setSize(50, 0)
		  tb.setAlignment(c.kCenter)
		  
		  // Set the label font to Arial Bold
		  tb.setFontStyle("arialbd.ttf")
		  
		  // Disable ticks on the x-axis by setting the tick length to 0
		  c.xAxis.setTickLength(0)
		  
		  //=============================================================
		  //    Draw the left bar chart
		  //=============================================================
		  
		  // Create a XYChart object of size 280 x 300 pixels with a transparent
		  // background.
		  dim c2 as new CDXYChartMBS(280, 300, c.kTransparent)
		  
		  // Set the plotarea at (20, 0) and of size 250 x 255 pixels. Use pale blue
		  // (0xddddff) as the background.
		  call c2.setPlotArea(20, 0, 250, 255, &hddddff)
		  
		  // Add a custom text label at the top left corner of the left bar chart
		  call c2.addText(20, 0, "Male", "timesbi.ttf", 12, &h7070a0)
		  
		  // Add the pale blue (0xaaaaff) bar chart layer using the male data
		  dim maleLayer as CDBarLayerMBS
		  maleLayer = c2.addBarLayer(male, &haaaaff)
		  
		  // Swap the axis so that the bars are drawn horizontally
		  c2.swapXY(true)
		  
		  // Reverse the direction of the y-axis so it runs from right to left
		  c2.yAxis.setReverse
		  
		  // Set the bar to touch each others
		  maleLayer.setBarGap(c.kTouchBar,c.knovalue)
		  
		  // Set the border style of the bars to 1 pixel 3D border
		  maleLayer.setBorderColor(-1, 1)
		  
		  // Add a Transparent line layer to the chart using the female data. As it is
		  // Transparent, only the male bar chart can be seen. We need to put both male and
		  // female data in both left and right charts, because we want auto-scaling to
		  // produce the same scale for both chart.
		  call c2.addLineLayer(female,c.kTransparent)
		  
		  // Set the y axis label font to Arial Bold
		  call c2.yAxis.setLabelStyle("arialbd.ttf")
		  
		  //=============================================================
		  //    Use a MultiChart to contain both bar charts
		  //=============================================================
		  
		  // Create a MultiChart object of size 590 x 320 pixels.
		  dim m as new CDMultiChartMBS(590, 320)
		  
		  // Add a title to the chart using Arial Bold Italic font
		  call m.addTitle("Demographics Hong Kong Year 2002", "arialbi.ttf")
		  
		  // Add another title at the bottom using Arial Bold Italic font
		  call m.addTitle(c.kBottom, "Population (in thousands)", "arialbi.ttf", 10)
		  
		  // Put the right chatr at (270, 25)
		  m.addChart(270, 25, c)
		  
		  // Put the left char at (0, 25)
		  m.addChart(0, 25, c2)
		  
		  // Output the chart
		  Backdrop=m.makeChartPicture
		  
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
