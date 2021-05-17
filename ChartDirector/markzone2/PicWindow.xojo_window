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
   Height          =   270
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
   Title           =   "markzone2"
   Visible         =   True
   Width           =   400
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The data for the chart
		  dim data(-1) as double = array(50, 55, 47, 34, 42, 49, 63, 62, 73, 59, 56, 50, 64, 60, 67, 67, 58, 59, 73, 77, 84, 82, 80, 84, 89.0)
		  
		  // The labels for the chart. Note the "-" means a minor tick.
		  dim labels(-1) as string = array("0"+endofline.unix+"Jun 4", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "0"+endofline.unix+"Jun 5")
		  
		  // Create a XYChart object of size 400 x 270 pixels
		  dim c as new CDXYChartMBS(400, 270)
		  
		  // Set the plotarea at (80, 25) and of size 300 x 200 pixels. Use alternate color
		  // background (&heeeeee) and (&hffffff). Set border and grid colors to grey
		  // (&hc0c0c0).
		  call c.setPlotArea(50, 25, 300, 200, &heeeeee, &hffffff, &hc0c0c0, &hc0c0c0, &hc0c0c0)
		  
		  // Add a title to the chart using 14 pts Times Bold Italic font
		  call c.addTitle("Server Monitor", "timesbi.ttf", 14)
		  
		  // Add a title to the y axis
		  call c.yAxis.setTitle("Server Load (MBytes)")
		  
		  // Set the y axis width to 2 pixels
		  c.yAxis.setWidth(2)
		  
		  // Set the labels on the x axis.
		  call c.xAxis.setLabels(labels)
		  
		  // Display 1 out of 3 labels on the x-axis. Show minor ticks for remaining
		  // labels.
		  c.xAxis.setLabelStep(3, 1)
		  
		  // Set the x axis width to 2 pixels
		  c.xAxis.setWidth(2)
		  
		  // Add a horizontal red (&h800080) mark line at y = 80
		  dim yMark as CDMarkMBS
		  yMark = c.yAxis.addMark(80, &hff0000, "Critical Threshold Set Point")
		  
		  // Set the mark line width to 2 pixels
		  yMark.setLineWidth(2)
		  
		  // Put the mark label at the top center of the mark line
		  yMark.setAlignment(CDXYChartMBS.kTopCenter)
		  
		  // Add an orange (&hffcc66) zone from x = 18 to x = 20
		  c.xAxis.addZone(18, 20, &hffcc66)
		  
		  // Add a vertical brown (&h995500) mark line at x = 18
		  dim xMark1 as CDMarkMBS
		  xMark1 = c.xAxis.addMark(18, &h995500, "Backup Start")
		  
		  // Set the mark line width to 2 pixels
		  xMark1.setLineWidth(2)
		  
		  // Put the mark label at the left of the mark line
		  xMark1.setAlignment(CDXYChartMBS.kLeft)
		  
		  // Rotate the mark label by 90 degrees so it draws vertically
		  xMark1.setFontAngle(90)
		  
		  // Add a vertical brown (&h995500) mark line at x = 20
		  dim xMark2 as CDMarkMBS
		  xMark2 = c.xAxis.addMark(20, &h995500, "Backup End")
		  
		  // Set the mark line width to 2 pixels
		  xMark2.setLineWidth(2)
		  
		  // Put the mark label at the right of the mark line
		  xMark2.setAlignment(CDXYChartMBS.kRight)
		  
		  // Rotate the mark label by 90 degrees so it draws vertically
		  xMark2.setFontAngle(90)
		  
		  // Add a green (&h00cc00) line layer with line width of 2 pixels
		  call c.addLineLayer(data, &h00cc00).setLineWidth(2)
		  
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
