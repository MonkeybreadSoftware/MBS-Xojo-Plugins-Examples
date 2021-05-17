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
   Height          =   320
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
   Title           =   "legendpie2"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The data for the pie chart
		  dim data(-1) as double = array(21.0, 18, 15, 12, 8, 24)
		  
		  // The labels for the pie chart
		  dim labels(-1) as string = array("Labor", "Licenses", "Taxes", "Legal", "Facilities", "Production")
		  
		  // The colors to use for the sectors
		  dim colors(-1) as integer
		  
		  colors.Append &h66aaee
		  colors.Append &heebb22
		  colors.Append &hbbbbbb
		  colors.Append &h8844ff
		  colors.Append &hdd2222
		  colors.Append &h009900
		  
		  // Create a PieChart object of size 600 x 320 pixels. Use a vertical gradient
		  // color from light blue (99ccff) to white (ffffff) spanning the top 100 pixels
		  // as background. Set border to grey (888888). Use rounded corners. Enable soft
		  // drop shadow.
		  dim c as new CDPieChartMBS(600, 320)
		  c.setBackground(c.linearGradientColor(0, 0, 0, 100, &h99ccff, &hffffff),&h888888)
		  c.setRoundedFrame
		  c.setDropShadow
		  
		  // Add a title using 18 pts Times New Roman Bold Italic font. Add 16 pixels top
		  // margin to the title.
		  c.addTitle("Pie Chart With Legend Demonstration", "timesbi.ttf", 18).setMargin(0, 0, 16, 0)
		  
		  // Set the center of the pie at (160, 165) and the radius to 110 pixels
		  c.setPieSize(160, 165, 110)
		  
		  // Draw the pie in 3D with a pie thickness of 25 pixels
		  c.set3D(25)
		  
		  // Set the pie data and the pie labels
		  c.setData(data, labels)
		  
		  // Set the sector colors
		  c.setColors(CDPieChartMBS.kDataColor, colors)
		  
		  // Use local gradient shading for the sectors
		  c.setSectorStyle(CDPieChartMBS.kLocalGradientShading)
		  
		  // Use the side label layout method, with the labels positioned 16 pixels from
		  // the pie bounding box
		  c.setLabelLayout(CDPieChartMBS.kSideLayout, 16)
		  
		  // Show only the sector number as the sector label
		  c.setLabelFormat("{={sector}+1}")
		  
		  // Set the sector label style to Arial Bold 10pt, with a dark grey (444444)
		  // border
		  c.setLabelStyle("arialbd.ttf", 10).setBackground(CDPieChartMBS.kTransparent, &h444444)
		  
		  // Add a legend box, with the center of the left side anchored at (330, 175), and
		  // using 10 pts Arial Bold Italic font
		  dim b as CDLegendBoxMBS = c.addLegend(330, 175, true, "arialbi.ttf", 10)
		  b.setAlignment(CDPieChartMBS.kLeft)
		  
		  // Set the legend box border to dark grey (444444), and with rounded conerns
		  b.setBackground(CDPieChartMBS.kTransparent, &h444444)
		  b.setRoundedCorners
		  
		  // Set the legend box margin to 16 pixels, and the extra line spacing between the
		  // legend entries as 5 pixels
		  b.setMargin(16)
		  b.setKeySpacing(0, 5)
		  
		  // Set the legend box icon to have no border (border color same as fill color)
		  b.setKeyBorder(CDPieChartMBS.kSameAsMainColor)
		  
		  // Set the legend text to show the sector number, followed by a 120 pixels wide
		  // block showing the sector label, and a 40 pixels wide block showing the
		  // percentage
		  b.setText("<*block,valign=top*>{={sector}+1}.<*advanceTo=22*><*block,width=120*>{label}<*/*><*block,width=40,halign=right*>{percent}<*/*>%")
		  
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
