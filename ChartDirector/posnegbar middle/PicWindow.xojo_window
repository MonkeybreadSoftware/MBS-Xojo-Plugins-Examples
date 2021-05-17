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
   Title           =   "posnegbar"
   Visible         =   True
   Width           =   500
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The data for the bar chart
		  dim data(-1) as double = array( 4.3, 2.3, 0.7, 3.4, 2.2, 2.9, 0.1, 0.1, 3.3, 2.2, 4.3, 1.6)
		  
		  // The labels for the bar chart
		  dim labels(-1) as string = array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
		  
		  // Create a XYChart object of size 500 x 320 pixels
		  dim c as new CDXYChartMBS(500, 320)
		  
		  // Add a title to the chart using Arial Bold Italic font
		  call c.addTitle("Productivity Change - Year 2005", "arialbi.ttf")
		  
		  // Set the plotarea at (50, 30) and of size 400 x 250 pixels
		  call c.setPlotArea(50, 30, 400, 250)
		  
		  // Add a bar layer to the chart using the Overlay data combine method
		  dim layer as CDBarLayerMBS
		  layer = c.addBarLayer(c.kOverlay)
		  
		  
		  
		  // Select positive data and add it as data set with blue (6666ff) color
		  dim d(-1) as Double
		  dim i,count as integer
		  
		  count=UBound(data)
		  for i=0 to count
		    if data(i)>=2.5 then
		      d.append data(i)
		    else
		      d.append c.knoValue
		    end if
		  next
		  
		  call layer.addDataSet(d, &h6666ff)
		  
		  redim d(-1)
		  
		  count=UBound(data)
		  for i=0 to count
		    if data(i)<2.5 then
		      d.append data(i)
		    else
		      d.append c.knoValue
		    end if
		  next
		  
		  'A transparent axis of which the y = 0 is in the middle
		  Call c.yAxis.setLinearScale(-1, 1, 2)
		  Call c.yAxis.setColors(c.kTransparent, c.kTransparent, c.kTransparent, c.kTransparent)
		  c.yAxis.setLabelFormat(" ")
		  
		  'Now the x-axis can be put in the middle
		  Call c.setAxisAtOrigin(c.kXAxisAtOrigin)
		  
		  // Select negative data and add it as data set with orange (ff6600) color
		  call layer.addDataSet(d, &hff6600)
		  
		  // Add labels to the top of the bar using 8 pt Arial Bold font. The font color is
		  // configured to be red (0xcc3300) below zero, and blue (0x3333ff) above zero.
		  call layer.setAggregateLabelStyle("arialbd.ttf", 8, layer.yZoneColor(2.5, &hcc3300, &h3333ff))
		  Call Layer.setUseYAxis2()
		  
		  // Set the labels on the x axis and use Arial Bold as the label font
		  dim t as CDTextBoxMBS
		  t=c.xAxis.setLabels(labels)
		  t.setFontStyle("arialbd.ttf")
		  
		  // Draw the y axis on the right of the plot area
		  c.setYAxisOnRight(true)
		  
		  // Use Arial Bold as the y axis label font
		  call c.yAxis2.setLabelStyle("arialbd.ttf")
		  
		  // Add a title to the y axis
		  call c.yAxis2.setTitle("Percentage")
		  
		  // Add a light blue (0xccccff) zone for positive part of the plot area
		  call c.yAxis2.addZone(2.5, 9999, &hccccff)
		  
		  
		  // Add a pink (0xffffcc) zone for negative part of the plot area
		  call c.yAxis2.addZone(-9999, 2.5, &hffcccc)
		  
		  
		  'Put the transparent y-axis on right, and so the yAxis2 will be on the left side
		  Call c.setYAxisOnRight()
		  'Use the secondary y-axis for the grid lines
		  Call c.getPlotArea().setGridAxis(c.xAxis(), c.yAxis2())
		  
		  
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
