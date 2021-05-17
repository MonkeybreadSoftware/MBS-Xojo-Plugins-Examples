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
   Title           =   "fontxy"
   Visible         =   True
   Width           =   540
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The data for the chart
		  dim Data0(-1) as double = array(100, 125, 245, 147, 67.0)
		  dim Data1(-1) as double = array(85, 156, 179, 211, 123.0)
		  dim Data2(-1) as double = array(97, 87, 56, 267, 157.0)
		  dim labels(-1) as string = array("Mon Jun 4", "Tue Jun 5", "Wed Jun 6", "Thu Jun 7","Fri Jun 8")
		  
		  // Create a XYChart object of size 540 x 350 pixels
		  dim c as new CDXYChartMBS(540, 350)
		  
		  // Set the plot area to start at (120, 40) and of size 280 x 240 pixels
		  call c.setPlotArea(120, 40, 280, 240)
		  
		  // Add a title to the chart using 20 pts Times Bold Italic (timesbi.ttf) font and
		  // using a deep blue color (&h000080)
		  call c.addTitle("Weekly Server Load", "timesbi.ttf", 20, &h000080)
		  
		  // Add a legend box at (420, 100) (right of plot area) using 12 pts Times Bold
		  // font. Sets the background of the legend box to light grey &hd0d0d0 with a 1
		  // pixel 3D border.
		  c.addLegend(420, 100, true, "timesbd.ttf", 12).setBackground(&hd0d0d0, &hd0d0d0, 1)
		  
		  // Add a title to the y-axis using 12 pts Arial Bold/deep blue (&h000080) font.
		  // Set the background to yellow (&hffff00) with a 2 pixel 3D border.
		  c.yAxis.setTitle("Throughput (per hour)", "arialbd.ttf", 12, &h000080).setBackground(&hffff00, &hffff00, 2)
		  
		  // Use 10 pts Arial Bold/orange (&hcc6600) font for the y axis labels
		  call c.yAxis.setLabelStyle("arialbd.ttf", 10, &hcc6600)
		  
		  // Set the axis label format to "nnn MBytes"
		  c.yAxis.setLabelFormat("{value} MBytes")
		  
		  // Use 10 pts Arial Bold/green (&h008000) font for the x axis labels. Set the
		  // label angle to 45 degrees.
		  c.xAxis.setLabelStyle("arialbd.ttf", 10, &h008000).setFontAngle(45)
		  
		  // Set the labels on the x axis.
		  call c.xAxis.setLabels(labels)
		  
		  // Add a 3D stack bar layer with a 3D depth of 5 pixels
		  dim layer as CDBarLayerMBS
		  layer = c.addBarLayer(CDXYChartMBS.kStack, 5)
		  
		  // Use Arial Italic as the default data label font in the bars
		  call layer.setDataLabelStyle("ariali.ttf")
		  
		  // Use 10 pts Times Bold Italic (timesbi.ttf) as the aggregate label font. Set
		  // the background to flesh (&hffcc66) color with a 1 pixel 3D border.
		  layer.setAggregateLabelStyle("timesbi.ttf", 10).setBackground(&hffcc66, CDXYChartMBS.kTransparent, 1)
		  
		  // Add the first data set to the stacked bar layer
		  call layer.addDataSet(data0, -1, "Server #1")
		  
		  // Add the second data set to the stacked bar layer
		  call layer.addDataSet(data1, -1, "Server #2")
		  
		  // Add the third data set to the stacked bar layer, and set its data label font
		  // to Arial Bold Italic.
		  dim TextBox as CDTextBoxMBS
		  dim dataset as CDDataSetMBS
		  dataset = layer.addDataSet(data2, -1, "Server #3")
		  textbox= dataset.setDataLabelStyle( "arialbi.ttf")
		  
		  // Set the data label font color for the third data set to yellow (&hffff00)
		  textbox.setFontColor(&hffff00)
		  
		  // Set the data label background color to the same color as the bar segment, with
		  // a 1 pixel 3D border.
		  textbox.setBackground(CDXYChartMBS.kSameAsMainColor, CDXYChartMBS.kTransparent, 1)
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
