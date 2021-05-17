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
   Height          =   360
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
   Title           =   "markbar"
   Visible         =   True
   Width           =   480
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The data for the bars and the marks
		  dim barData(-1) as double = array(100.0, 125, 245, 147, 67, 96, 160, 145, 97, 167, 220, 125)
		  dim markData(-1) as double = array(85.0, 156, 220, 120, 80, 110, 140, 130, 111, 180, 175, 100)
		  
		  // The labels for the bar chart
		  dim labels(-1) as string = array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec")
		  
		  // Create a XYChart object of size 480 x 360 pixels. Use a vertical gradient
		  // color from pale blue (e8f0f8) to sky blue (aaccff) spanning half the chart
		  // height as background. Set border to blue (88aaee). Use rounded corners. Enable
		  // soft drop shadow.
		  dim c as new CDXYChartMBS(480, 360)
		  c.setBackground(c.linearGradientColor(0, 0, 0, c.getHeight / 2, &he8f0f8, &haaccff), &h88aaee)
		  c.setRoundedFrame
		  c.setDropShadow
		  
		  // Add a title to the chart using 15 points Arial Italic font. Set top/bottom
		  // margins to 12 pixels.
		  dim title as CDTextBoxMBS = c.addTitle("Bars with Marks Demonstration", "ariali.ttf", 15)
		  title.setMargin(0, 0, 12, 12)
		  
		  // Tentatively set the plotarea to 50 pixels from the left edge to allow for the
		  // y-axis, and to just under the title. Set the width to 65 pixels less than the
		  // chart width, and the height to reserve 90 pixels at the bottom for the x-axis
		  // and the legend box. Use pale blue (e8f0f8) background, transparent border, and
		  // grey (888888) dotted horizontal grid lines.
		  call c.setPlotArea(50, title.getHeight, c.getWidth - 65, c.getHeight - title.getHeight - 90, &he8f0f8, -1, CDXYChartMBS.kTransparent, c.dashLineColor(&h888888, CDXYChartMBS.kDotLine))
		  
		  // Add a legend box where the bottom-center is anchored to the 15 pixels above
		  // the bottom-center of the chart. Use horizontal layout and 8 points Arial font.
		  dim legendBox as CDLegendBoxMBS = c.addLegend(c.getWidth / 2, c.getHeight - 15, false, "arial.ttf", 8)
		  legendBox.setAlignment(CDXYChartMBS.kBottomCenter)
		  
		  // Set the legend box background and border to pale blue (e8f0f8) and bluish grey
		  // (445566)
		  legendBox.setBackground(&he8f0f8, &h445566)
		  
		  // Use rounded corners of 5 pixel radius for the legend box
		  legendBox.setRoundedCorners(5)
		  
		  // Use line style legend key
		  legendBox.setLineStyleKey
		  
		  // Set axes to transparent
		  c.xAxis.setColors(CDXYChartMBS.kTransparent)
		  c.yAxis.setColors(CDXYChartMBS.kTransparent)
		  
		  // Set the labels on the x axis
		  call c.xAxis.setLabels(labels)
		  
		  // Add a box-whisker layer with just the middle mark visible for the marks. Use
		  // red (ff0000) color for the mark, with a line width of 2 pixels and 10%
		  // horizontal gap
		  dim data(-1) as double
		  
		  dim markLayer as CDBoxWhiskerLayerMBS = c.addBoxWhiskerLayer(data, data, data, data, markData, -1, &hff0000)
		  
		  markLayer.setLineWidth(2)
		  markLayer.setDataGap(0.1)
		  
		  // Add the legend key for the mark line
		  legendBox.addKey("Target", &hff0000, 2)
		  
		  // Add a blue (0066cc) bar layer using the given data.
		  dim barLayer as CDBarLayerMBS = c.addBarLayer(barData, &h0066cc, "Actual")
		  
		  // Use soft lighting effect for the bars with light direction from left.
		  call barLayer.setBorderColor(CDXYChartMBS.kTransparent, CDXYChartMBS.softLighting(CDXYChartMBS.kLeft))
		  
		  // Adjust the plot area size, such that the bounding box (inclusive of axes) is
		  // 10 pixels from the left edge, just below the title, 15 pixels from the right
		  // edge, and 10 pixels above the legend box.
		  c.packPlotArea(10, title.getHeight, c.getWidth - 15, c.layoutLegend.getTopY - 10)
		  
		  
		  Backdrop=c.MakeChartPicture
		  
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
