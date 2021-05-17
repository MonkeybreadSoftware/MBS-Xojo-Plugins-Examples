#tag Window
Begin Window PicWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   420
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
   Title           =   "scatter"
   Visible         =   True
   Width           =   450
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   2
      Period          =   100
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The XY points for the scatter chart
		  // the actual data and labels are just examples
		  // it shows the speed with over 20000 data points in just a few milliseconds
		  
		  
		  dim dataX0n(-1) as double = array(10, 15, 6, 12, 14, 8, 13, 13, 16, 12, 10.5)
		  dim dataY0n(-1) as double = array(130, 150, 80, 110, 110, 105, 130, 115, 170, 125, 125.0)
		  
		  dim dataX1n(-1) as double = array(6, 12, 4, 3.5, 7, 8, 9, 10, 12, 11, 8.0)
		  dim dataY1n(-1) as double = array(65, 80, 40, 45, 70, 80, 80, 90, 100, 105.0, 60)
		  
		  #pragma DisableBackgroundTasks true
		  
		  for each d as Double in dataX0n
		    for i as integer = 0 to 1000
		      dataX0.Append d + rnd*4 - 2
		    next
		  next
		  
		  for each d as Double in dataX1n
		    for i as integer = 0 to 1000
		      dataX1.Append d + rnd*4 - 2
		    next
		  next
		  
		  for each d as Double in dataY0n
		    for i as integer = 0 to 1000
		      dataY0.Append d + rnd*4 - 2
		    next
		  next
		  
		  for each d as Double in dataY1n
		    for i as integer = 0 to 1000
		      dataY1.Append d + rnd*4 - 2
		    next
		  next
		  
		  render
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub modify()
		  #pragma DisableBackgroundTasks true
		  
		  dim u as integer = UBound(dataX0)
		  for i as integer = 0 to u
		    
		    dataX0(i) = dataX0(i) + rnd
		    dataX1(i) = dataX1(i) + rnd
		    dataY0(i) = dataY0(i) + rnd
		    dataY1(i) = dataY1(i) + rnd
		    
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub render()
		  dim m as Double = Microseconds
		  
		  // Create a XYChart object of size 450 x 420 pixels
		  dim c as new CDXYChartMBS(450, 420)
		  
		  // Set the plotarea at (55, 65) and of size 350 x 300 pixels, with a light grey
		  // border (&hc0c0c0). Turn on both horizontal and vertical grid lines with light
		  // grey color (&hc0c0c0)
		  call c.setPlotArea(55, 65, 350, 300, -1, -1, &hc0c0c0, &hc0c0c0, -1)
		  
		  // Add a legend box at (50, 30) (top of the chart) with horizontal layout. Use 12
		  // pts Times Bold Italic font. Set the background and border color to
		  // Transparent.
		  c.addLegend(50, 30, false, "timesbi.ttf", 12).setBackground(c.kTransparent)
		  
		  
		  // Add a title to the chart using 18 pts Times Bold Itatic font.
		  call c.addTitle("Genetically Modified Predator", "timesbi.ttf", 18)
		  
		  // Add a title to the y axis using 12 pts Arial Bold Italic font
		  call c.yAxis.setTitle("Length (cm)", "arialbi.ttf", 12)
		  
		  // Add a title to the x axis using 12 pts Arial Bold Italic font
		  call c.xAxis.setTitle("Weight (kg)", "arialbi.ttf", 12)
		  
		  // Set the axes line width to 3 pixels
		  c.xAxis.setWidth(3)
		  c.yAxis.setWidth(3)
		  
		  // Add an orange (&hff9933) scatter chart layer, using 13 pixel diamonds as
		  // symbols
		  call c.addScatterLayer(dataX0, dataY0, "Genetically Engineered", c.kSquareSymbol, 3, &hff9933)
		  
		  // Add a green (&h33ff33) scatter chart layer, using 11 pixel triangles as
		  // symbols
		  call c.addScatterLayer(dataX1, dataY1, "Natural", c.kSquareSymbol, 3, &h33ff33)
		  
		  // Output the chart
		  Backdrop=c.makeChartPicture
		  
		  Title = str((Microseconds-m)/1000, "0.0")+" ms "+str(UBound(dataX0)+2+UBound(dataX1))+" points"
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		dataX0() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		dataX1() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		dataY0() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		dataY1() As Double
	#tag EndProperty


#tag EndWindowCode

#tag Events Timer1
	#tag Event
		Sub Action()
		  modify
		  render
		  
		End Sub
	#tag EndEvent
#tag EndEvents
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
		InitialValue="True"
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
