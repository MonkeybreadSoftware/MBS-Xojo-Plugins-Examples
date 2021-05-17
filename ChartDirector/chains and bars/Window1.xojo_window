#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   600
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1608567447
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "chains and bars"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // The data for the bar chart
		  dim data(-1) as double = array(1.0, 0.6, 1.3, 1.6, 1.0)
		  dim i,count as integer
		  dim data1(-1) as double
		  
		  count=UBound(Data)
		  data1.Append data(0)
		  for i=1 to count
		    data1.Append CDXYChartMBS.kNoValue
		    data1.Append CDXYChartMBS.kNoValue
		    data1.Append CDXYChartMBS.kNoValue
		    data1.Append data(i)
		  next
		  
		  // Create a XYChart object of size 600 x 250 pixels
		  dim c as new CDXYChartMBS(600, 600)
		  
		  // Add a title to the chart using Arial Bold Italic font
		  call c.addTitle("Noten", "arialbi.ttf")
		  
		  // Set the plotarea at (100, 30) and of size 400 x 200 pixels. Set the plotarea
		  // border, background and grid lines to Transparent
		  call c.setPlotArea(100, 30, 400, 540)
		  
		  // Add a bar chart layer using the given data. Use a gradient color for the bars,
		  // where the gradient is from dark green (0x008000) to white (0xffffff)
		  dim layer as CDBarLayerMBS
		  layer = c.addBarLayer(data1,c.gradientColor(100, 0, 500, 0, &h008000, &hffffff))
		  layer.setBarWidth 5
		  
		  // Swap the axis so that the bars are drawn horizontally
		  c.swapXY(true)
		  
		  // Set the labels on the x axis
		  dim textbox as CDTextBoxMBS
		  textbox = c.xAxis.setLabels(data1)
		  c.xAxis.setLabelStep 1
		  
		  // Set the x axis label font to 10pt Arial Bold Italic
		  textbox.setFontStyle("arialbi.ttf")
		  textbox.setFontSize(10)
		  
		  for i=0 to count-1
		    // Add a spline layer to the chart
		    dim layer2 as CDSplineLayerMBS
		    layer2 = c.addSplineLayer
		    
		    dim data2(-1) as double
		    data2.Append CDXYChartMBS.kNoValue
		    dim j as integer
		    
		    for j=1 to count
		      data2.Append CDXYChartMBS.kNoValue
		      data2.Append CDXYChartMBS.kNoValue
		      data2.Append CDXYChartMBS.kNoValue
		      data2.Append CDXYChartMBS.kNoValue
		    next
		    
		    dim b as double
		    const a=1.0
		    
		    // CosHMBS is in the MBS Xojo Util Plugin
		    b=a*CosHMBS(-1.0/a)
		    
		    data2(i*4+0)=a*CosHMBS(-1.0/a)-b+(data(i)*4.0+data(i+1)*0.0)/4.0
		    data2(i*4+1)=a*CosHMBS(-0.5/a)-b+(data(i)*3.0+data(i+1)*1.0)/4.0
		    data2(i*4+2)=a*CosHMBS(0-0/a)-b+(data(i)*2.0+data(i+1)*2.0)/4.0
		    data2(i*4+3)=a*CosHMBS(0.5/a)-b+(data(i)*1.0+data(i+1)*3.0)/4.0
		    data2(i*4+4)=a*CosHMBS(1.0/a)-b+(data(i)*0.0+data(i+1)*4.0)/4.0
		    
		    // Set the default line width to 2 pixels
		    layer2.setLineWidth(2)
		    
		    // Add a data set to the spline layer, using blue (0000c0) as the line color,
		    
		    call layer2.addDataSet(data2, &h0000c0)
		    
		  next
		  
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
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="300"
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
