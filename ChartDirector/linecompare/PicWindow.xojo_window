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
   Height          =   300
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
   Title           =   "linecompare"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The data for the upper and lower bounding lines
		  dim upperY(-1) as double = array(60, 60, 100, 100, 60, 60.0)
		  dim lowerY(-1) as double = array(40, 40, 80, 80, 40, 40.0)
		  dim zoneX(-1) as double = array(0, 2.5, 3.5, 5.5, 6.5, 10)
		  
		  // The data for the spline curve
		  dim curveY(-1) as double = array(50, 44, 54, 48, 58, 50, 90, 85, 104, 82, 96, 90, 74, 52, 35, 58, 46, 54, 48, 52, 50.0)
		  dim curveX(-1) as double = array(0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10)
		  
		  // Create a XYChart object of size 600 x 300 pixels, with a light grey (cccccc)
		  // background, black border, and 1 pixel 3D border effect.
		  dim c as new CDXYChartMBS(600, 300, &hcccccc, &h000000, 1)
		  
		  // Set the plotarea at (55, 58) and of size 520 x 195 pixels, with white
		  // background. Turn on both horizontal and vertical grid lines with light grey
		  // color (cccccc)
		  call c.setPlotArea(55, 58, 520, 195, &hffffff, -1, -1, &hcccccc, &hcccccc)
		  
		  // Add a legend box at (55, 32) (top of the chart) with horizontal layout. Use 9
		  // pts Arial Bold font. Set the background and border color to Transparent.
		  c.addLegend(55, 32, false, "arialbd.ttf", 9).setBackground(c.kTransparent)
		  
		  // Add a title box to the chart using 15 pts Times Bold Italic font. The title is
		  // in CDML and includes embedded images for highlight. The text is white (ffffff)
		  // on a black background, with a 1 pixel 3D border.
		  
		  dim path as string=c.GetPath(FindFile("star.png"))
		  c.addTitle("<*block,valign=absmiddle*><*img="+path+"*><*img="+path+"*> Performance Enhancer <*img="+path+"*><*img="+path+"*><*/*>", "timesbi.ttf", 15, &hffffff).setBackground(&h000000, -1, 1)
		  
		  // Add a title to the y axis
		  call c.yAxis.setTitle("Temperature")
		  
		  // Add a title to the x axis using CMDL
		  path=c.GetPath(FindFile("clock.png"))
		  call c.xAxis.setTitle("<*block,valign=absmiddle*><*img="+path+"*>  Elapsed Time (hour)<*/*>")
		  
		  // Set the axes width to 2 pixels
		  c.xAxis.setWidth(2)
		  c.yAxis.setWidth(2)
		  
		  // Add a purple (800080) spline layer to the chart with a line width of 2 pixels
		  dim splineLayer as CDSplineLayerMBS
		  splineLayer = c.addSplineLayer(curveY, &h800080, "Molecular Temperature")
		  splineLayer.setXData(Curvex)
		  splineLayer.setLineWidth(2)
		  
		  // Add a line layer to the chart with two dark green (338033) data sets, and a
		  // line width of 2 pixels
		  dim linelayer as CDLineLayerMBS
		  lineLayer = c.addLineLayer
		  call lineLayer.addDataSet(upperY, &h338033, "Target Zone")
		  call lineLayer.addDataSet(lowerY, &h338033)
		  lineLayer.setXData(zoneX)
		  lineLayer.setLineWidth(2)
		  
		  // Color the zone between the upper zone line and lower zone line as
		  // semi-transparent light green (8099ff99)
		  call c.addInterLineLayer(lineLayer.getLine(0), lineLayer.getLine(1), &h8099FF99, &h8099FF99)
		  
		  // If the spline line gets above the upper zone line, color to area between the
		  // lines red (ff0000)
		  call c.addInterLineLayer(splineLayer.getLine(0), lineLayer.getLine(0), &hff0000, c.kTransparent)
		  
		  // If the spline line gets below the lower zone line, color to area between the
		  // lines blue (0000ff)
		  call c.addInterLineLayer(splineLayer.getLine(0), lineLayer.getLine(1), c.kTransparent, &h0000ff)
		  
		  // Add a custom CDML text at the bottom right of the plot area as the logo
		  path=c.GetPath(FindFile("small_molecule.png"))
		  c.addText(575, 250, "<*block,valign=absmiddle*><*img="+path+"*> <*block*><*font=timesbi.ttf,size=10,color=804040*>Molecular"+EndOfLine.unix+"Engineering<*/*>").setAlignment(c.kBottomRight)
		  
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
