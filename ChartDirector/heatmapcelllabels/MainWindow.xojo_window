#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   540
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1697791
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Heat Map Cell Labels"
   Visible         =   True
   Width           =   480
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  CDBaseChartMBS.ScaleFactor = 2
		  
		  // The x-axis and y-axis labels
		  Dim xLabels() As String = Array("A", "B", "C", "D", "E", "F", "G", "H", "I", "J")
		  Dim xLabels_size As Integer = xLabels.Ubound + 1
		  
		  Dim yLabels() As String = Array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9")
		  Dim yLabels_size As Integer = yLabels.Ubound + 1
		  
		  // Random data for the 10 x 10 cells
		  Dim rand As New CDRanSeriesMBS(2)
		  Dim zData() As Double = rand.get2DSeries(xLabels_size, yLabels_size, 0, 100)
		  
		  // We set the middle 5 x 5 cells to NoValue to remove them from the chart
		  For x As Integer = 3 To 6
		    For y As Integer = 3 To 6
		      zData(y * xLabels_size + x) = CDBaseChartMBS.kNoValue
		    Next
		  Next
		  
		  // Create an XYChart object of size 480 x 540 pixels.
		  Dim c As New CDXYChartMBS(480, 540)
		  
		  // Set the plotarea at (50, 40) and of size 400 x 400 pixels. Set the background, border, and
		  // grid lines to transparent.
		  Dim p As CDPlotAreaMBS = c.setPlotArea(50, 40, 400, 400, -1, -1, CDBaseChartMBS.kTransparent, CDBaseChartMBS.kTransparent)
		  
		  // Create a discrete heat map with 10 x 10 cells
		  Dim layer As CDDiscreteHeatMapLayerMBS = c.addDiscreteHeatMapLayer(zData, xLabels_size)
		  
		  // Set the x-axis labels. Use 8pt Arial Bold font. Set axis stem to transparent, so only the
		  // labels are visible. Set 0.5 offset to position the labels in between the grid lines. Position
		  // the x-axis at the top of the chart.
		  Call c.xAxis.setLabels(xLabels)
		  Call c.xAxis.setLabelStyle("Arial Bold", 8)
		  c.xAxis.setColors(CDBaseChartMBS.kTransparent, CDBaseChartMBS.kTextColor)
		  c.xAxis.setLabelOffset(0.5)
		  Call c.xAxis.setTitle("X axis title placeholder", "Arial Bold", 12)
		  c.setXAxisOnTop
		  
		  // Set the y-axis labels. Use 8pt Arial Bold font. Set axis stem to transparent, so only the
		  // labels are visible. Set 0.5 offset to position the labels in between the grid lines. Reverse
		  // the y-axis so that the labels are flowing top-down instead of bottom-up.
		  Call c.yAxis.setLabels(yLabels)
		  Call c.yAxis.setLabelStyle("Arial Bold", 8)
		  c.yAxis.setColors(CDBaseChartMBS.kTransparent, CDBaseChartMBS.kTextColor)
		  c.yAxis.setLabelOffset(0.5)
		  Call c.yAxis.setTitle("Y axis title placeholder", "Arial Bold", 12)
		  c.yAxis.setReverse
		  
		  // Set a 3-pixel gap between cells
		  layer.setCellGap(3)
		  
		  // Use the z value as the cell label
		  layer.setDataLabelFormat("{z|0}")
		  
		  // Position the color axis 20 pixels below the plot area and of the width as the plot area. Put
		  // the labels at the bottom side of the color axis. Use 8pt Arial Bold font for the labels.
		  Dim cAxis As CDColorAxisMBS = layer.setColorAxis(p.getLeftX, p.getBottomY + 20, CDBaseChartMBS.kTopLeft, p.getWidth, CDBaseChartMBS.kBottom)
		  Call cAxis.setLabelStyle("Arial Bold", 8)
		  Call cAxis.setTitle("Color legend title placeholder", "Arial Bold", 12)
		  
		  // Set the color stops and scale of the color axis
		  Dim colorScale() As Double = Array(0.0, &h00ff00, 50, &hffff00, 80, &hff6600, 100, &hff0000)
		  
		  cAxis.setColorScale(colorScale)
		  cAxis.setLinearScale(0, 100, 10)
		  
		  // Output the chart
		  pic = c.makeChartPicture
		  
		  // drawn in paint event
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If pic <> Nil Then
		    
		    // scale to window
		    g.DrawPicture pic, 0, 0, g.Width, g.Height, 0, 0, pic.Width, pic.Height
		    
		  End If
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		pic As Picture
	#tag EndProperty


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
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="pic"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
