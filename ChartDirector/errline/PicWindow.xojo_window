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
   Title           =   "errline"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The data with error information
		  dim data(-1) as double = array( 42, 49, 33, 38, 51, 46, 29, 41, 44, 57, 59, 52, 37, 34, 51, 56, 56, 60, 70, 76, 63, 67, 75, 64, 51.0)
		  dim errData(-1) as double = array( 5, 6, 5.1, 6.5, 6.6, 8, 5.4, 5.1, 4.6, 5.0, 5.2, 6.0, 4.9, 5.6, 4.8, 6.2, 7.4, 7.1, 6.0, 6.6, 7.1, 5.3, 5.5, 7.9, 6.1)
		  
		  // The labels for the chart
		  dim labels(-1) as string = array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24")
		  
		  // Create a XYChart object of size 600 x 300 pixels, with a light grey (eeeeee)
		  // background, black border, 1 pixel 3D border effect and rounded corners.
		  dim c as new CDXYChartMBS(600, 300, &heeeeee, &h000000, 1)
		  c.setRoundedFrame
		  
		  // Set the plotarea at (55, 55) and of size 520 x 195 pixels, with white (ffffff)
		  // background. Set horizontal and vertical grid lines to grey (cccccc).
		  call c.setPlotArea(55, 55, 520, 195, &hffffff, -1, -1, &hcccccc, &hcccccc)
		  
		  // Add a title box to the chart using 15 pts Times Bold Italic font. The title is
		  // in CDML and includes embedded images for highlight. The text is on a light
		  // grey (dddddd) background, with glass lighting effect.
		  dim path as string=c.getpath(FindFile("star.png"))
		  c.addTitle("<*block,valign=absmiddle*><*img="+path+"*><*img="+path+"*> Molecular Temperature Control <*img="+path+"*><*img="+path+"*><*/*>", "timesbi.ttf", 15).setBackground(&hdddddd, 0, c.glassEffect)
		  
		  // Add a title to the y axis
		  call c.yAxis.setTitle("Temperature")
		  
		  // Add a title to the x axis using CMDL
		  path=c.getpath(FindFile("clock.png"))
		  call c.xAxis.setTitle("<*block,valign=absmiddle*><*img="+path+"*>  Elapsed Time (hour)<*/*>")
		  
		  // Set the labels on the x axis.
		  call c.xAxis.setLabels(labels)
		  
		  // Display 1 out of 3 labels on the x-axis. Show minor ticks for remaining
		  // labels.
		  c.xAxis.setLabelStep(3, 1)
		  
		  // Set the axes width to 2 pixels
		  c.xAxis.setWidth(2)
		  c.yAxis.setWidth(2)
		  
		  // Add a line layer to the chart
		  dim LineLayer as CDLineLayerMBS
		  lineLayer = c.addLineLayer
		  
		  // Add a blue (0xff) data set to the line layer, with yellow (0xffff80) diamond
		  // symbols
		  lineLayer.addDataSet(data, &h0000ff).setDataSymbol(c.kDiamondSymbol, 12, &hffff80)
		  
		  // Set the line width to 2 pixels
		  lineLayer.setLineWidth(2)
		  
		  // Add a box whisker layer to the chart. Use the upper and lower mark of the box
		  // whisker layer to act as error zones. The upper and lower marks are computed
		  // using the ArrayMath object.
		  dim errLayer as CDBoxWhiskerLayerMBS
		  dim boxtop(-1) as double
		  dim boxbottom(-1) as double
		  dim maxdata(-1) as double
		  dim mindata(-1) as double
		  dim middata(-1) as double
		  dim i,count as integer
		  
		  count=UBound(data)
		  for i=0 to Count
		    middata.Append data(i)
		    mindata.Append data(i)-errData(i)
		    maxdata.Append data(i)+errData(i)
		  next
		  
		  errLayer = c.addBoxWhiskerLayer(boxtop, boxbottom, maxdata, mindata, middata, c.kTransparent, &hbb6633)
		  
		  // Set the line width to 2 pixels
		  errLayer.setLineWidth(2)
		  
		  // Set the error zone to occupy half the space between the symbols
		  errLayer.setDataGap(0.5)
		  
		  // Add a custom CDML text at the bottom right of the plot area as the logo
		  path=c.getpath(FindFile("small_molecule.png"))
		  c.addText(575, 247, "<*block,valign=absmiddle*><*img="+path+"*> <*block*><*font=timesbi.ttf,size=10,color=804040*>Molecular"+EndOfLine.unix+"Engineering<*/*>").setAlignment(c.kBottomRight)
		  
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
