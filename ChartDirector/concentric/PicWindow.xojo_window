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
   Height          =   360
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
   Title           =   "concentric"
   Visible         =   True
   Width           =   450
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // Data for outer ring
		  dim data(-1) as double=array(88.0, 124, 96)
		  
		  // Data for inner ring
		  dim data2(-1) as double=array(77.0, 87, 45)
		  
		  // Labels for the sectors
		  dim labels(-1) as string =array("Hardware", "Software", "Services")
		  
		  // Colors for the sectors
		  dim color1 as integer=&hff9999
		  dim color2 as integer=&h9999ff
		  dim color3 as integer=&h66ff66
		  
		  dim colors(-1) as integer= array(color1, color2, color3)
		  
		  //
		  // Create the main chart, which contains the chart title, the outer ring, and the
		  // legend box
		  //
		  
		  // Create a PieChart object of size 450 x 360 pixels, with transparent background
		  dim c as new CDPieChartMBS(450, 360)
		  
		  // Add a title to the chart with 18pts Times Bold Italic font
		  call c.addTitle("Concentric Donut Chart", "timesbi.ttf", 18)
		  
		  // Set donut center at (160, 200), and outer/inner radii as 150/100 pixels
		  c.setDonutSize(160, 200, 150, 100)
		  
		  // Add a label at the bottom-right corner of the ring to label the outer ring Use
		  // 12pts Arial Bold Italic font in white (ffffff) color, on a green (008800)
		  // background, with soft lighting effect and 5 pixels rounded corners
		  dim t as CDTextBoxMBS
		  t = c.addText(260, 300, " Year 2006 ", "arialbi.ttf", 12, &hffffff)
		  t.setBackground(&h008800, c.kTransparent, C.softLighting())
		  t.setRoundedCorners(5)
		  
		  // Set the legend box at (320, 50) with 12 pts Arial Bold Italic font, with no
		  // border
		  t=c.addLegend(320, 50, true, "arialbi.ttf", 13)
		  t.setBackground(c.kTransparent,c.kTransparent)
		  
		  // Set the pie data and the pie labels
		  c.setData(data,labels)
		  
		  // Set the pie colors
		  c.setColors(c.kDataColor, colors)
		  
		  // Set pie border color to white (ffffff)
		  c.setLineColor(&hffffff)
		  
		  // Set pie label to value in $###M format, percentage in (##.#%) format, in two
		  // lines.
		  c.setLabelFormat("${value}M<*br*>({percent|1}%)")
		  
		  // Use 10pts Airal Bold for the sector labels
		  call c.setLabelStyle("arialbd.ttf", 10)
		  
		  // Set the label position to -25 pixels from the sector (which would be internal
		  // to the sector)
		  c.setLabelPos(-25)
		  
		  //
		  // Create the inner ring.
		  //
		  
		  // Create a PieChart object of size 280 x 320 pixels, with transparent background
		  dim c2 as new CDPieChartMBS(280, 320, c.kTransparent)
		  
		  // Set donut center at (110, 110), and outer/inner radii as 100/50 pixels
		  c2.setDonutSize(110, 110, 100, 50)
		  
		  // Add a label at the center of the ring to label the inner ring. Use 12pts Arial
		  // Bold Italic font in white (ffffff) color, on a deep blue (0000cc) background,
		  // with soft lighting effect and 5 pixels rounded corners
		  t=c2.addText(110, 110, " Year 2005 ", "arialbi.ttf", 12, &hffffff, c.kCenter)
		  t.setBackground(&h0000cc, c.kTransparent, c.softLighting())
		  t.setRoundedCorners(5)
		  
		  // Set the pie data and the pie labels
		  c2.setData(data2,labels)
		  
		  // Set the pie colors
		  c2.setColors(c.kDataColor, colors)
		  
		  // Set pie border color to white (ffffff)
		  c2.setLineColor(&hffffff)
		  
		  // Set pie label to value in $###M format, percentage in (##.#%) format, in two
		  // lines.
		  c2.setLabelFormat("${value}M<*br*>({percent|1}%)")
		  
		  // Use 10pts Airal Bold for the sector labels
		  call c2.setLabelStyle("arialbd.ttf", 10)
		  
		  // Set the label position to -25 pixels from the sector (which would be internal
		  // to the sector)
		  c2.setLabelPos(-25)
		  
		  // merge the inner ring into the outer ring at (50, 90)
		  c.makeChart.merge(c2.makeChart, 50, 90, c.kTopLeft, 0)
		  
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
