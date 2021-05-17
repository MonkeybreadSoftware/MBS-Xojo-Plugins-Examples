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
   Height          =   225
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
   Title           =   "pareto"
   Visible         =   True
   Width           =   400
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The data for the chart
		  dim data(-1) as double = array(40, 15, 7, 5, 2.0)
		  
		  // The labels for the chart
		  dim labels(-1) as string = array("Hard Disk", "PCB", "Printer", "CDROM", "Keyboard")
		  
		  // Create a XYChart object of size 400 x 225 pixels. Use golden background color,
		  // with a 2 pixel 3D border.
		  dim c as new CDXYChartMBS(400, 225, CDXYChartMBS.goldColor, -1, 2)
		  
		  // Add a title box using Arial Bold/11 pt font. Set the background color to
		  // metallic blue (9999FF). Use a 1 pixel 3D border.
		  
		  dim t as CDTextBoxMBS
		  t=c.addTitle("Hardware Defects", "arialbd.ttf", 11)
		  t.setBackground(c.metalColor(&h9999ff), -1, 1)
		  
		  // Set the plotarea at (50, 40) and of 300 x 150 pixels in size, with a silver
		  // background color.
		  call c.setPlotArea(50, 40, 300, 150, c.silverColor)
		  
		  // Add a line layer for the pareto line
		  dim lineLayer as CDLineLayerMBS
		  lineLayer = c.addLineLayer
		  
		  // Compute the pareto line by accumulating the data
		  dim lineData as new CDArrayMBS(data)
		  lineData.acc
		  
		  // Set a scaling factor such as the maximum point of the line is scaled to 100
		  dim scaleFactor as Double
		  scaleFactor = 100 / lineData.max
		  
		  // Add the pareto line using the scaled data. Use deep blue (0x80) as the line
		  // color, with light blue (0x9999ff) diamond symbols
		  dim d as CDDataSetMBS
		  
		  lineData.mulvalue(scaleFactor)
		  d=lineLayer.addDataSet(linedata, &h000080)
		  call d.setDataSymbol(c.kDiamondSymbol, 9, &h9999ff)
		  
		  // Set the line width to 2 pixel
		  lineLayer.setLineWidth(2)
		  
		  // Add a multi-color bar layer using the given data.
		  dim colors(-1) as integer
		  dim barlayer as CDBarLayerMBS
		  barLayer = c.addBarLayer(data, colors)
		  
		  // Bind the layer to the secondary (right) y-axis.
		  barLayer.setUseYAxis2
		  
		  // Set soft lighting for the bars with light direction from the right
		  barLayer.setBorderColor(c.kTransparent, c.softLighting(c.kRight))
		  
		  // Set the labels on the x axis.
		  call c.xAxis.setLabels(labels)
		  
		  // Set the primary y-axis scale as 0 - 100 with a tick every 20 units
		  call c.yAxis.setLinearScale(0, 100, 20)
		  
		  // Set the label format of the y-axis label to include a percentage sign
		  c.yAxis.setLabelFormat("{value}%")
		  
		  // Add a title to the secondary y-axis
		  call c.yAxis2.setTitle("Frequency")
		  
		  // Set the secondary y-axis label foramt to show no decimal point
		  c.yAxis2.setLabelFormat("{value|0}")
		  
		  // Set the relationship between the two y-axes, which only differ by a scaling
		  // factor
		  c.syncYAxis(1.0 / scaleFactor)
		  
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
