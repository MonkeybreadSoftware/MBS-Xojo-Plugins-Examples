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
   Height          =   310
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
   Title           =   "dualxaxis"
   Visible         =   True
   Width           =   310
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The data for the chart
		  dim Data0(-1) as double = array(42, 49, 33, 38, 51, 46, 29, 41, 44, 57, 59, 52, 37, 34, 51, 56, 56, 60, 70, 76, 63, 67, 75, 64, 51.0)
		  dim Data1(-1) as double = array(50, 55, 47, 34, 42, 49, 63, 62, 73, 59, 56, 50, 64, 60, 67, 67, 58, 59, 73, 77, 84, 82, 80, 84, 98.0)
		  
		  // The labels for the bottom x axis. Note the "-" means a minor tick.
		  dim labels0(-1) as string = array("0"+endofline.unix+"Jun 4", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "0"+endofline.unix+"Jun 5")
		  
		  // The labels for the top x axis. Note that "-" means a minor tick.
		  dim labels1(-1) as string = array("Jun 3"+endofline.unix+"12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "Jun 4"+endofline.unix+"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12")
		  
		  // Create a XYChart object of size 310 x 310 pixels
		  dim c as new CDXYChartMBS(310, 310)
		  
		  // Set the plotarea at (50, 50) and of size 200 x 200 pixels
		  call c.setPlotArea(50, 50, 200, 200)
		  
		  // Add a title to the primary (left) y axis
		  call c.yAxis.setTitle("US Dollars")
		  
		  // Set the tick length to -4 pixels (-ve means ticks inside the plot area)
		  c.yAxis.setTickLength(-4)
		  
		  // Add a title to the secondary (right) y axis
		  call c.yAxis2.setTitle("HK Dollars (1 USD = 7.8 HKD)")
		  
		  // Set the tick length to -4 pixels (-ve means ticks inside the plot area)
		  c.yAxis2.setTickLength(-4)
		  
		  // Synchronize the y-axis such that y2 = 7.8 x y1
		  c.syncYAxis(7.8)
		  
		  // Add a title to the bottom x axis
		  call c.xAxis.setTitle("Hong Kong Time")
		  
		  // Set the labels on the x axis.
		  call c.xAxis.setLabels(labels0)
		  
		  // Display 1 out of 3 labels on the x-axis. Show minor ticks for remaining
		  // labels.
		  c.xAxis.setLabelStep(3, 1)
		  
		  // Set the major tick length to -4 pixels and minor tick length to -2 pixels (-ve
		  // means ticks inside the plot area)
		  c.xAxis.setTickLength(-4, -2)
		  
		  // Set the distance between the axis labels and the axis to 6 pixels
		  c.xAxis.setLabelGap(6)
		  
		  // Add a title to the top x-axis
		  call c.xAxis2.setTitle("New York Time")
		  
		  // Set the labels on the x axis.
		  call c.xAxis2.setLabels(labels1)
		  
		  // Display 1 out of 3 labels on the x-axis. Show minor ticks for remaining
		  // labels.
		  c.xAxis2.setLabelStep(3, 1)
		  
		  // Set the major tick length to -4 pixels and minor tick length to -2 pixels (-ve
		  // means ticks inside the plot area)
		  c.xAxis2.setTickLength(-4, -2)
		  
		  // Set the distance between the axis labels and the axis to 6 pixels
		  c.xAxis2.setLabelGap(6)
		  
		  // Add a line layer to the chart with a line width of 2 pixels
		  call c.addLineLayer(data0, -1, "Red Transactions").setLineWidth(2)
		  
		  // Add an area layer to the chart with no area boundary line
		  call c.addAreaLayer(data1, -1, "Green Transactions").setLineWidth(0)
		  
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
