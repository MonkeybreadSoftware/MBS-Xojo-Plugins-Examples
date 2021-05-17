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
   Height          =   450
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
   Resizeable      =   True
   Title           =   "xyline"
   Visible         =   True
   Width           =   450
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  render
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  render
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  render
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub render()
		  // The (x, y) data for the first line
		  dim dataX0(-1) as double = array(20, 90, 40, 30, 12.0)
		  dim dataY0(-1) as double = array(10, 40, 75, 54, 20.0)
		  
		  // The (x, y) data for the second line
		  dim dataX1(-1) as double = array(10, 40, 75, 54, 60.0)
		  dim dataY1(-1) as double = array(50, 90, 40, 30, 10.0)
		  
		  // Create a XYChart object of size 450 x 450 pixels
		  dim c as new CDXYChartMBS(me.Width, me.Height)
		  
		  // Set the plotarea at (55, 65) and of size 350 x 300 pixels, with white
		  // background and a light grey border (0xc0c0c0). Turn on both horizontal and
		  // vertical grid lines with light grey color (0xc0c0c0)
		  call c.setPlotArea(55, 65, me.Width-100, me.Height-150, &hffffff, -1, &hc0c0c0, &hc0c0c0, -1)
		  
		  // Add a legend box at (50, 30) (top of the chart) with horizontal layout. Use 12
		  // pts Times Bold Italic font. Set the background and border color to
		  // Transparent.
		  c.addLegend(50, 30, false, "timesbi.ttf", 12).setBackground(c.kTransparent)
		  
		  // Add a title to the chart using 18 pts Times Bold Itatic font
		  call c.addTitle("Reaction Path", "timesbi.ttf", 18)
		  
		  // Add a title to the y axis using 12 pts Arial Bold Italic font
		  call c.yAxis.setTitle("Temperature (Celcius)", "arialbi.ttf", 12)
		  
		  // Set the y axis line width to 3 pixels
		  c.yAxis.setWidth(3)
		  
		  // Add a title to the x axis using 12 pts Arial Bold Italic font
		  call c.xAxis.setTitle("Pressure (Pa)", "arialbi.ttf", 12)
		  
		  // Set the x axis line width to 3 pixels
		  c.xAxis.setWidth(3)
		  
		  // Add a red (0xff3333) line layer using dataX0 and dataY0
		  dim layer1 as CDLineLayerMBS
		  layer1 = c.addLineLayer(dataY0, &hff3333, "Compound AAA")
		  layer1.setXData(dataX0)
		  
		  // Set the line width to 3 pixels
		  layer1.setLineWidth(3)
		  
		  // Use 9 pixel square symbols for the data points
		  layer1.getDataSet(0).setDataSymbol(c.kSquareSymbol, 9)
		  
		  // Add custom text labels to the first and last point on the scatter plot using
		  // Arial Bold font
		  call layer1.addCustomDataLabel(0, 0, "Start", "arialbd.ttf")
		  call layer1.addCustomDataLabel(0, 4, "End", "arialbd.ttf")
		  
		  // Add a green (0x33ff33) line layer using dataX1 and dataY1
		  dim layer2 as CDLineLayerMBS
		  layer2 = c.addLineLayer(dataY1, &h33ff33, "Compound BBB")
		  layer2.setXData(dataX1)
		  
		  // Set the line width to 3 pixels
		  layer2.setLineWidth(3)
		  
		  // Use 11 pixel diamond symbols for the data points
		  layer2.getDataSet(0).setDataSymbol(c.kDiamondSymbol, 11)
		  
		  // Add custom text labels to the first and last point on the scatter plot using
		  // Arial Bold font
		  call layer2.addCustomDataLabel(0, 0, "Start", "arialbd.ttf")
		  call layer2.addCustomDataLabel(0, 4, "End", "arialbd.ttf")
		  
		  // output the chart
		  Backdrop=c.makeChartPicture
		  
		End Sub
	#tag EndMethod


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
