#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   350
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
   Title           =   "varwidthbar"
   Visible         =   True
   Width           =   500
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The data for the chart
		  dim data(-1) as double = array(800.0, 600.0, 1000, 1400)
		  dim widths(-1) as double = array(250.0, 500, 960, 460)
		  dim labels(-1) as string = array("Wind", "Hydro", "Coal", "Natural Gas")
		  
		  // The colors to use
		  dim colors(-1) as integer 
		  colors.Append &h00aa00
		  colors.Append &h66aaee
		  colors.Append &hee6622
		  colors.Append &hffbb00
		  
		  // Create a XYChart object of size 500 x 350 pixels
		  dim c as new CDXYChartMBS(500, 350)
		  
		  // Add a title to the chart using 15 pts Arial Italic font
		  call c.addTitle("Energy Generation Breakdown", "ariali.ttf", 15)
		  
		  // Set the plotarea at (60, 60) and of (chart_width - 90) x (chart_height - 100)
		  // in size. Use a vertical gradient color from light blue (f9f9ff) to sky blue
		  // (aaccff) as background. Set grid lines to white (ffffff).
		  dim plotAreaBgColor as integer = c.linearGradientColor(0, 60, 0, c.getHeight() - 40, &haaccff, &hf9fcff)
		  call c.setPlotArea(60, 60, c.getWidth() - 90, c.getHeight() - 100, plotAreaBgColor, -1, -1, &hffffff)
		  
		  // Add a legend box at (50, 30) using horizontal layout and transparent
		  // background.
		  c.addLegend(55, 30, false).setBackground(c.kTransparent)
		  
		  // Add titles to x/y axes with 10 points Arial Bold font
		  call c.xAxis.setTitle("Mega Watts", "arialbd.ttf", 10)
		  call c.yAxis.setTitle("Cost per MWh (dollars)", "arialbd.ttf", 10)
		  
		  // Set the x axis rounding to false, so that the x-axis will fit the data exactly
		  c.xAxis.setRounding(false, false)
		  
		  // In ChartDirector, there is no bar layer that can have variable bar widths, but
		  // you may create a bar using an area layer. (A bar can be considered as the area
		  // under a rectangular outline.) So by using a loop to create one bar per area
		  // layer, we can achieve a variable width bar chart.
		  
		  // starting position of current bar
		  dim currentX as double = 0
		  
		  dim i as integer
		  
		  for i=0 to UBound(data)
		    // ending position of current bar
		    dim nextX as double = currentX + widths(i)
		    
		    // outline of the bar
		    dim dataX(-1) as double = array(currentX, currentX, nextX, nextX)
		    dim dataY(-1) as double = array(0, data(i), data(i), 0)
		    
		    // create the area layer to fill the bar
		    dim layer as cdAreaLayerMBS = c.addAreaLayer(dataY, colors(i), labels(i))
		    layer.setXData dataX
		    
		    // the ending position becomes the starting position of the next bar
		    currentX = nextX
		  next
		  
		  // Output the chart
		  Backdrop=c.makechartPicture
		  
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
