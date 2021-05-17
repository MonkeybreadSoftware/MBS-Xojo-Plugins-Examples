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
   Title           =   "fontpie"
   Visible         =   True
   Width           =   480
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The data for the pie chart
		  dim data(-1) as Double=array(25.0, 18, 15, 12, 8, 30, 35)
		  
		  // The labels for the pie chart
		  dim labels(-1) as string=array("Labor", "Licenses", "Taxes", "Legal", "Insurance", "Facilities", "Production")
		  
		  // Create a PieChart object of size 480 x 300 pixels
		  dim c as new CDPieChartMBS(480, 300)
		  
		  // Use a blue marble pattern as the background wallpaper, with a black border,
		  // and 1 pixel 3D border effect
		  c.setBackground(c.patternColor(FindFile("marble.png")), &h000000, 1)
		  
		  // Set the center of the pie at (150, 150) and the radius to 100 pixels
		  c.setPieSize(150, 150, 100)
		  
		  // Add a title to the pie chart using Times Bold Italic/15 points/deep blue
		  // (0x000080) as font, with a wood pattern as the title background
		  dim t as CDTextBoxMBS
		  t=c.addTitle("Project Cost Breakdown", "timesbi.ttf", 15, &h000080)
		  t.setBackground(c.patternColor(FindFile("wood.png")))
		  
		  // Draw the pie in 3D
		  c.set3D
		  
		  // Add a legend box using Arial Bold Italic/11 points font. Use a pink marble
		  // pattern as the background wallpaper, with a 1 pixel 3D border. The legend box
		  // is top-right aligned relative to the point (465, 70)
		  dim b as CDLegendBoxMBS
		  
		  b = c.addLegend(465, 70, true, "arialbi.ttf", 11)
		  b.setBackground(c.patternColor(FindFile("marble2.png")), c.kTransparent, 1)
		  b.setAlignment(c.kTopRight)
		  
		  // Set the default font for all sector labels to Arial Bold/8 pts/dark green
		  // (0x008000).
		  t=c.setLabelStyle("arialbd.ttf", 8, &h008000)
		  
		  // Set the pie data and the pie labels
		  c.setData(data, labels)
		  
		  // Explode the 3rd sector
		  c.setExplode(2, 40)
		  
		  // Use Arial Bold/12 pts/red as label font for the 3rd sector
		  dim s as CDSectorMBS
		  s=c.sector(2)
		  t=s.setLabelStyle("arialbd.ttf", 12, &hff0000)
		  
		  // Use Arial/8 pts/deep blue as label font for the 5th sector. Add a background
		  // box using the sector fill color (SameAsMainColor), with a black (0x000000)
		  // edge and 2 pixel 3D border.
		  s=c.sector(4)
		  t=s.setLabelStyle("arial.ttf", 8, &h000080)
		  t.setBackground(c.kSameAsMainColor, &h000000, 2)
		  
		  // Use Arial Italic/8 pts/light red (0xff9999) as label font for the 6th sector.
		  // Add a dark blue (0x000080) background box with a 2 pixel 3D border.
		  s=c.sector(0)
		  t=s.setLabelStyle("ariali.ttf", 8, &hff9999)
		  t.setBackground(&h000080, c.kTransparent, 2)
		  
		  // Use Times Bold Italic/8 pts/deep green (0x008000) as label font for 7th
		  // sector. Add a yellow (0xFFFF00) background box with a black (0x000000) edge.
		  s=c.sector(6)
		  t=s.setLabelStyle("timesbi.ttf", 8, &h008000)
		  t.setBackground(&hffff00,&h000000)
		  
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
