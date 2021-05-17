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
   Height          =   180
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
   Title           =   "compactline"
   Visible         =   True
   Width           =   180
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  //
		  //    We use a random number generator to simulate the data from 9:30am to 4:30pm
		  //    with one data point every 4 minutes. The total number of points during that
		  //    period is 106.  (7 hours x 15 points/hour + 1)
		  //
		  dim noOfPoints as integer = 106
		  
		  // Assume we have not reached the end of the day yet, and only 85 points are
		  // available. Create a random table object of 1 col x 85 rows, using 9 as seed.
		  dim rantable as new CDRanTableMBS(9, 1, 85)
		  
		  // Set the 1st column to start with 1800 and with random delta from -5 to 5.
		  rantable.setCol(0, 1800, -5, 5)
		  
		  // Get the data as the 1st column of the random table
		  dim data as CDArrayMBS = rantable.getCol(0)
		  
		  // The x-axis labels for the chart
		  dim labels(-1) as string = array("-", "10am", "-", " ", "-", "12am", "-", " ", "-", "2pm", "-", " ", "-", "4pm", "-")
		  
		  //
		  //    Now we obtain the data into arrays, we can start to draw the chart using
		  //    ChartDirector
		  //
		  
		  // Create a XYChart object of size 180 x 180 pixels with a blue background
		  // (0x9c9cce)
		  dim c as new CDXYChartMBS(180, 180, &h9c9cce)
		  
		  // Add titles to the top and bottom of the chart using 7.5pt Arial font. The text
		  // is white 0xffffff on a deep blue 0x31319C background.
		  call c.addTitle(C.kTop, "STAR TECH INDEX  2003-01-28", "arial.ttf", 7.5, &Hffffff, &H31319c)
		  call c.addTitle(c.kBottom, "LATEST  STI:1809.41 (+14.51)", "arial.ttf", 7.5, &hffffff, &H31319c)
		  
		  // Set the plotarea at (31, 21) and of size 145 x 124 pixels, with a pale yellow
		  // (0xffffc8) background.
		  call c.setPlotArea(31, 21, 145, 124, &hffffc8)
		  
		  // Add custom text at (176, 21) (top right corner of plotarea) using 11pt Times
		  // Bold Italic font/red (0xc09090) color
		  dim t as CDTextBoxMBS
		  t=c.addText(176, 21, "Chart Demo", "timesbi.ttf", 11, &hc09090)
		  t.setAlignment(c.kTopRight)
		  
		  // Use 7.5 pts Arial as the y axis label font
		  call c.yAxis.setLabelStyle("", 7.5)
		  
		  // Set the labels on the x axis by spreading the labels evenly between the first
		  // point (index = 0) and the last point (index = noOfPoints - 1)
		  c.xAxis().setLinearScale(0, noOfPoints - 1, labels)
		  
		  // Use 7.5 pts Arial as the x axis label font
		  call c.xAxis.setLabelStyle("", 7.5)
		  
		  // Add a deep blue (0x000080) line layer to the chart
		  call c.addLineLayer(data, &h000080)
		  
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
