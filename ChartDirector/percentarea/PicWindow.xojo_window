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
   Height          =   280
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
   Title           =   "percentarea"
   Visible         =   True
   Width           =   500
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The data for the area chart
		  dim data0(-1) as double=array(42, 49, 33, 38, 51, 46, 29, 41, 44, 57, 59, 52, 37, 34, 51, 56, 56, 60, 70, 76, 63, 67, 75, 64, 51.0)
		  dim data1(-1) as double=array(50, 55, 47, 34, 42, 49, 63, 62, 73, 59, 56, 50, 64, 60, 67, 67, 58, 59, 73, 77, 84, 82, 80, 84, 98.0)
		  dim data2(-1) as double=array(87, 89, 85, 66, 53, 39, 24, 21, 37, 56, 37, 23, 21, 33, 13, 17, 14, 23, 16, 25, 29, 30, 45, 47, 46.0)
		  
		  // The timestamps on the x-axis
		  dim labels(-1) as double = array(CDXYChartMBS.chartTime(1996, 1, 1), CDXYChartMBS.chartTime(1996, 4, 1), CDXYChartMBS.chartTime(1996, 7, 1), _
		  CDXYChartMBS.chartTime(1996, 10, 1), CDXYChartMBS.chartTime(1997, 1, 1), CDXYChartMBS.chartTime(1997, 4, 1), CDXYChartMBS.chartTime(1997, 7, 1), _
		  CDXYChartMBS.chartTime(1997, 10, 1), CDXYChartMBS.chartTime(1998, 1, 1), CDXYChartMBS.chartTime(1998, 4, 1), CDXYChartMBS.chartTime(1998, 7, 1), _
		  CDXYChartMBS.chartTime(1998, 10, 1), CDXYChartMBS.chartTime(1999, 1, 1), CDXYChartMBS.chartTime(1999, 4, 1), CDXYChartMBS.chartTime(1999, 7, 1), _
		  CDXYChartMBS.chartTime(1999, 10, 1), CDXYChartMBS.chartTime(2000, 1, 1), CDXYChartMBS.chartTime(2000, 4, 1), CDXYChartMBS.chartTime(2000, 7, 1), _
		  CDXYChartMBS.chartTime(2000, 10, 1), CDXYChartMBS.chartTime(2001, 1, 1), CDXYChartMBS.chartTime(2001, 4, 1), CDXYChartMBS.chartTime(2001, 7, 1), _
		  CDXYChartMBS.chartTime(2001, 10, 1), CDXYChartMBS.chartTime(2002, 1, 1))
		  
		  // Create a XYChart object of size 500 x 280 pixels, using &hffffcc as background
		  // color, with a black border, and 1 pixel 3D border effect
		  dim c as new CDXYChartMBS(500, 280, &hffffcc, 0, 1)
		  
		  // Set the plotarea at (50, 45) and of size 320 x 200 pixels with white
		  // background. Enable horizontal and vertical grid lines using the grey
		  // (&hc0c0c0) color.
		  c.setPlotArea(50, 45, 320, 200, &hffffff).setGridColor(&hc0c0c0, &hc0c0c0)
		  
		  // Add a legend box at (370, 45) using vertical layout and 8 points Arial Bold
		  // font.
		  dim legendBox as CDLegendBoxMBS
		  legendBox = c.addLegend(370, 45, true, "arialbd.ttf", 8)
		  
		  // Set the legend box background and border to transparent
		  legendBox.setBackground(CDXYChartMBS.kTransparent, CDXYChartMBS.kTransparent)
		  
		  // Set the legend box icon size to 16 x 32 pixels to match with custom icon size
		  legendBox.setKeySize(16, 32)
		  
		  // Add a title to the chart using 14 points Times Bold Itatic font and white font
		  // color, and &h804020 as the background color
		  c.addTitle("Quarterly Product Sales", "timesbi.ttf", 14, &hffffff).setBackground(&h804020)
		  
		  // Set the labels on the x axis.
		  call c.xAxis.setLabels(labels)
		  
		  // Set multi-style axis label formatting. Start of year labels are displayed as
		  // yyyy. For other labels, just show minor tick.
		  call c.xAxis.setMultiFormat(CDXYChartMBS.StartOfYearFilter, "{value|yyyy}", CDXYChartMBS.AllPassFilter, "-")
		  
		  // Add a percentage area layer to the chart
		  dim layer as CDAreaLayerMBS
		  layer = c.addAreaLayer(CDXYChartMBS.kPercentage)
		  
		  // Add the three data sets to the area layer, using icons images with labels as
		  // data set names
		  call layer.addDataSet(data0, &h40ddaa77, "<*block,valign=absmiddle*><*img="+c.GetPath(FindFile("service.png"))+"*> Service<*/*>")
		  call layer.addDataSet(data1, &h40aadd77, "<*block,valign=absmiddle*><*img="+c.GetPath(FindFile("software.png"))+"*> Software<*/*>")
		  call layer.addDataSet(data2, &h40aa77dd, "<*block,valign=absmiddle*><*img="+c.GetPath(FindFile("computer.png"))+"*> Hardware<*/*>")
		  
		  // For a vertical stacked chart with positive data only, the last data set is
		  // always on top. However, in a vertical legend box, the last data set is at the
		  // bottom. This can be reversed by using the setLegend method.
		  layer.setLegend(CDXYChartMBS.kReverseLegend)
		  
		  
		  // Output the chart
		  Backdrop=c.makeChartPicture
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
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
