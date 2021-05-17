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
   Title           =   "splineline"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The data for the chart
		  dim data0(-1) as double = array(32, 39, 23, 28, 41, 38, 26, 35, 29.0)
		  dim data1(-1) as double = array(50, 55, 47, 34, 47, 53, 38, 40, 51.0)
		  
		  // The labels for the chart
		  dim labels(-1) as string = array("0", "1", "2", "3", "4", "5", "6", "7", "8")
		  
		  // Create a XYChart object of size 600 x 300 pixels, with a pale red (ffdddd)
		  // background, black border, 1 pixel 3D border effect and rounded corners.
		  dim c as new CDXYChartMBS(600, 300, &hffdddd, &h000000, 1)
		  c.setRoundedFrame
		  
		  // Set the plotarea at (55, 58) and of size 520 x 195 pixels, with white (ffffff)
		  // background. Set horizontal and vertical grid lines to grey (cccccc).
		  call c.setPlotArea(55, 58, 520, 195, &hffffff, -1, -1, &hcccccc, &hcccccc)
		  
		  // Add a legend box at (55, 32) (top of the chart) with horizontal layout. Use 9
		  // pts Arial Bold font. Set the background and border color to Transparent.
		  call c.addLegend(55, 32, false, "arialbd.ttf", 9).setBackground(c.kTransparent)
		  
		  // Add a title box to the chart using 15 pts Times Bold Italic font. The title is
		  // in CDML and includes embedded images for highlight. The text is white (ffffff)
		  // on a dark red (880000) background, with soft lighting effect from the right
		  // side.
		  
		  dim path as string =c.GetPath(FindFile("star.png"))
		  
		  call c.addTitle("<*block,valign=absmiddle*><*img="+path+"*><*img="+path+"*> Performance Enhancer <*img="+path+"*><*img="+path+"*><*/*>", "timesbi.ttf", 15, &hffffff).setBackground(&h880000, -1, c.softLighting(c.kRight))
		  
		  // Add a title to the y axis
		  call c.yAxis.setTitle("Energy Concentration (KJ per liter)")
		  
		  // Set the labels on the x axis
		  call c.xAxis.setLabels(labels)
		  
		  // Add a title to the x axis using CMDL
		  path=c.GetPath(FindFile("clock.png"))
		  call c.xAxis.setTitle("<*block,valign=absmiddle*><*img="+path+"*>  Elapsed Time (hour)<*/*>")
		  
		  // Set the axes width to 2 pixels
		  c.xAxis.setWidth(2)
		  c.yAxis.setWidth(2)
		  
		  // Add a spline layer to the chart
		  dim layer as CDSplineLayerMBS
		  layer = c.addSplineLayer
		  
		  // Set the default line width to 2 pixels
		  layer.setLineWidth(2)
		  
		  // Add a data set to the spline layer, using blue (0000c0) as the line color,
		  // with yellow (ffff00) circle symbols.
		  layer.addDataSet(data1, &h0000c0, "Target Group").setDataSymbol(c.kCircleSymbol, 9, &hffff00)
		  
		  // Add a data set to the spline layer, using brown (982810) as the line color,
		  // with pink (f040f0) diamond symbols.
		  layer.addDataSet(data0, &h982810, "Control Group").setDataSymbol(c.kDiamondSymbol, 11, &hf040f0)
		  
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
