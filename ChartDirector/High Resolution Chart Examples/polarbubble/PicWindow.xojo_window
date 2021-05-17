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
   Height          =   460
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
   Title           =   "polarbubble"
   Visible         =   True
   Width           =   460
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  const f=3 // scale factor, 1 for screen and 4 or more for printing
		  
		  dim data0(-1) as double = array(6, 12.5, 18.2, 15.0)
		  dim angles0(-1) as double = array(45, 96, 169, 258.0)
		  dim size0(-1) as double = array(f*41, f*105, f*12, f*20.0)
		  
		  dim data1(-1) as double = array(18, 16, 11, 14.0)
		  dim angles1(-1) as double = array(30, 210, 240, 310.0)
		  dim size1(-1) as double = array(f*30, f*45, f*12, f*90.0)
		  
		  // Create a PolarChart object of size 460 x 460 pixels
		  dim c as new CDPolarChartMBS(f*460, f*460)
		  
		  // Add a title to the chart at the top left corner using 15pts Arial Bold Italic
		  // font
		  call c.addTitle(CDPolarChartMBS.kTopLeft, "<*underline=2*>EM Field Strength", "arialbi.ttf", f*15)
		  
		  // Set center of plot area at (230, 240) with radius 180 pixels
		  c.setPlotArea(f*230, f*240, f*180)
		  
		  // Use alternative light grey/dark grey circular background color
		  c.setPlotAreaBg(&hdddddd, &heeeeee)
		  
		  // Set the grid style to circular grid
		  c.setGridStyle(false)
		  
		  // Add a legend box at the top right corner of the chart using 9 pts Arial Bold
		  // font
		  c.addLegend(f*459, f*0, true, "arialbd.ttf", f*9).setAlignment(CDPolarChartMBS.kTopRight)
		  
		  // Set angular axis as 0 - 360, with a spoke every 30 units
		  c.angularAxis.setLinearScale(0, 360, 30)
		  
		  c.radialAxis.setLinearScale 0, 20,5
		  // Set the radial axis label format
		  c.radialAxis.setLabelFormat("{value} km")
		  
		  c.angularAxis.setLabelGap f*8
		  
		  call c.angularAxis.setLabelStyle "",8*f
		  call c.radialAxis.setLabelStyle "",8*f
		  
		  
		  // Add a blue (&h9999ff) line layer to the chart using (data0, angle0)
		  dim layer0 as CDPolarLineLayerMBS
		  layer0 = c.addLineLayer(data0, &h9999ff, "Cold Spot")
		  layer0.setAngles(angles0)
		  
		  // Disable the line by setting its width to 0, so only the symbols are visible
		  layer0.setLineWidth(0)
		  
		  // Use a circular data point symbol
		  layer0.setDataSymbol(CDPolarChartMBS.kCircleSymbol, f*11)
		  
		  // Modulate the symbol size by size0 to produce a bubble chart effect
		  layer0.setSymbolScale(size0)
		  
		  // Add a red (&hff9999) line layer to the chart using (data1, angle1)
		  dim layer1 as CDPolarLineLayerMBS
		  layer1 = c.addLineLayer(data1,&hff9999, "Hot Spot")
		  layer1.setAngles(angles1)
		  
		  // Disable the line by setting its width to 0, so only the symbols are visible
		  layer1.setLineWidth(0)
		  
		  // Use a circular data point symbol
		  layer1.setDataSymbol(CDPolarChartMBS.kCircleSymbol, f*11)
		  
		  // Modulate the symbol size by size1 to produce a bubble chart effect
		  layer1.setSymbolScale(size1)
		  
		  // Output the chart
		  Backdrop=c.makeChartPicture
		  
		  Width=c.getWidth
		  Height=c.getHeight
		  
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
