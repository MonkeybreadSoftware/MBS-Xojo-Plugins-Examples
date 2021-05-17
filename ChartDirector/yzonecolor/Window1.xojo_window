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
   Height          =   330
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
   Title           =   "yzonecolor"
   Visible         =   True
   Width           =   500
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The data for the chart
		  dim data(-1) as double = array(30, 28, 40, 55, 75, 68, 54, 60, 50, 62, 75, 65, 75, 89, 60, 55, 53, 35, 50, 66, 56, 48, 52, 65, 62.0)
		  
		  // The labels for the chart
		  dim labels(-1) as string = array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24")
		  
		  // Create a XYChart object of size 500 x 300 pixels, with a pale yellow
		  // (&hffffc0) background, a black border, and 1 pixel 3D border effect
		  dim c as new CDXYChartMBS(500, 330, &hffffc0, &h000000, 1)
		  
		  // Set the plotarea at (55, 50) and of size 420 x 205 pixels, with white
		  // background. Turn on both horizontal and vertical grid lines with light grey
		  // color (&hc0c0c0)
		  c.setPlotArea(55, 50, 420, 205, &hffffff).setGridColor(&hc0c0c0, &hc0c0c0)
		  
		  // Add a legend box at (55, 25) (top of the chart) with horizontal layout. Use 8
		  // pts Arial font. Set the background and border color to Transparent.
		  dim legendBox as CDLegendBoxMBS
		  legendBox = c.addLegend(55, 25, false, "", 8)
		  legendBox.setBackground(CDXYChartMBS.kTransparent)
		  
		  // Add keys to the legend box to explain the color zones
		  legendBox.addKey("Normal Zone", &h8033FF33)
		  legendBox.addKey("Alert Zone", &h80FF3333)
		  
		  // Add a title box to the chart using 13 pts Arial Bold Italic font. The title is
		  // in CDML and includes embedded images for highlight. The text is white
		  // (&hffffff) on a black background, with a 1 pixel 3D border.
		  
		  dim path as string
		  path=c.GetPath(FindFile("star.png"))
		  c.addTitle("<*block,valign=absmiddle*><*img="+path+"*><*img="+path+"*> Y Zone Color Demo <*img="+path+"*><*img="+path+"*><*/*>", "arialbi.ttf", 13, &hffffff).setBackground(&h000000, -1, 1)
		  
		  // Add a title to the y axis
		  call c.yAxis.setTitle("Energy Concentration (KJ per liter)")
		  
		  // Set the labels on the x axis.
		  call c.xAxis.setLabels(labels)
		  
		  // Display 1 out of 3 labels on the x-axis.
		  c.xAxis.setLabelStep(3)
		  
		  // Add a title to the x axis using CDML
		  call c.xAxis.setTitle("<*block,valign=absmiddle*><*img="+c.GetPath(FindFile("clock.png"))+"*>  Elapsed Time (hour)<*/*>")
		  
		  // Set the axes width to 2 pixels
		  c.xAxis.setWidth(2)
		  c.yAxis.setWidth(2)
		  
		  // Add an area layer to the chart. The area is using a y zone color, where the
		  // color is semi-transparent green below 60, and semi-transparent red above 60.
		  call c.addAreaLayer(data, c.yZoneColor(60, &h8033FF33, &h80FF3333))
		  
		  // Add a custom CDML text at the bottom right of the plot area as the logo
		  c.addText(475, 255,"<*block,valign=absmiddle*><*img="+c.GetPath(FindFile("small_molecule.png"))+"*> <*block*><*font=timesbi.ttf,size=10,color=804040*>Molecular"+endofline.unix+"Engineering<*/*>").setAlignment(CDXYChartMBS.kBottomRight)
		  
		  // output the chart
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
