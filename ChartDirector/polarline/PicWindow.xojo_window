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
   Height          =   500
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
   Title           =   "polarline"
   Visible         =   True
   Width           =   460
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The data for the chart
		  dim data0(-1) as double = array(90, 25, 40, 55, 68, 44, 79, 85, 50.0)
		  dim angles0(-1) as double = array(15, 60, 110, 180, 230, 260, 260, 310, 340.0)
		  
		  dim data1(-1) as double = array(80, 91, 66, 80, 92, 87.0)
		  dim angles1(-1) as double = array(40, 65, 88, 110, 150, 200.0)
		  
		  // Create a PolarChart object of size 460 x 500 pixels, with a grey (e0e0e0)
		  // background and 1 pixel 3D border
		  dim c as new CDPolarChartMBS(460, 500, &he0e0e0, &h000000, 1)
		  
		  // Add a title to the chart at the top left corner using 15pts Arial Bold Italic
		  // font. Use a wood pattern as the title background.
		  call c.addTitle("Polar Line Chart Demo", "arialbi.ttf", 15).setBackground(c.patternColor(FindFile("wood.png")))
		  
		  // Set center of plot area at (230, 280) with radius 180 pixels, and white
		  // (ffffff) background.
		  c.setPlotArea(230, 280, 180, &hffffff)
		  
		  // Set the grid style to circular grid, with grids below the chart layers
		  c.setGridStyle(false, false)
		  
		  // Add a legend box at top-center of plot area (230, 35) using horizontal layout.
		  // Use 10 pts Arial Bold font, with 1 pixel 3D border effect.
		  dim b as CDLegendBoxMBS
		  b = c.addLegend(230, 35, false, "arialbd.ttf", 9)
		  b.setAlignment(CDPolarChartMBS.kTopCenter)
		  b.setBackground(CDPolarChartMBS.kTransparent, CDPolarChartMBS.kTransparent, 1)
		  
		  // Set angular axis as 0 - 360, with a spoke every 30 units
		  c.angularAxis.setLinearScale(0, 360, 30)
		  
		  // Add a blue (&hff) line layer to the chart using (data0, angle0)
		  dim layer0 as CDPolarLineLayerMBS
		  layer0 = c.addLineLayer(data0, &h0000ff, "Close Loop Line")
		  layer0.setAngles(angles0)
		  
		  // Set the line width to 2 pixels
		  layer0.setLineWidth(2)
		  
		  // Use 11 pixel triangle symbols for the data points
		  layer0.setDataSymbol(CDPolarChartMBS.kTriangleSymbol, 11)
		  
		  // Enable data label and set its format
		  layer0.setDataLabelFormat("({value},{angle})")
		  
		  // Set the data label text box with light blue (&h9999ff) backgruond color and 1
		  // pixel 3D border effect
		  layer0.setDataLabelStyle.setBackground(&h9999ff, CDPolarChartMBS.kTransparent, 1)
		  
		  // Add a red (&hff0000) line layer to the chart using (data1, angle1)
		  dim layer1 as CDPolarLineLayerMBS
		  layer1 = c.addLineLayer(data1, &hff0000, "Open Loop Line")
		  layer1.setAngles(angles1)
		  
		  // Set the line width to 2 pixels
		  layer1.setLineWidth(2)
		  
		  // Use 11 pixel diamond symbols for the data points
		  layer1.setDataSymbol(CDPolarChartMBS.kDiamondSymbol, 11)
		  
		  // Set the line to open loop
		  layer1.setCloseLoop(false)
		  
		  // Enable data label and set its format
		  layer1.setDataLabelFormat("({value},{angle})")
		  
		  // Set the data label text box with light red (&hff9999) backgruond color and 1
		  // pixel 3D border effect
		  layer1.setDataLabelStyle.setBackground(&hff9999, CDPolarChartMBS.kTransparent, 1)
		  
		  
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
