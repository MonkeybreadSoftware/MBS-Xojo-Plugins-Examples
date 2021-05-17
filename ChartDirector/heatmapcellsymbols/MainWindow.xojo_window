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
   Height          =   500
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
   Title           =   "Heat Map Cell Symbols"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  CDBaseChartMBS.ScaleFactor = 2
		  
		  // The x-axis and y-axis labels
		  Dim xLabels() As String = Array("Alpha", "Beta", "Gamma", "Delta", "Epsilon", "Zeta", "Eta", "Theta", "Iota", "Kappa")
		  Dim xLabels_size As Integer = xLabels.Ubound + 1
		  Dim yLabels() As String = Array("Ant", "Bear", "Cat", "Dog", "Elephant", "Fox", "Goat", "Horse", "Insect", "Jellyfish")
		  Dim yLabels_size As Integer = yLabels.Ubound + 1
		  
		  // Random data for the 10 x 10 cells
		  Dim rand As New CDRanSeriesMBS(2)
		  Dim zData() As Double = rand.getSeries(xLabels_size * yLabels_size, 0, 10)
		  
		  // The coordinates for the first set of scatter symbols
		  Dim symbolX() As Double = Array(2.5, 6.5, 3.5, 8.5)
		  Dim symbolY() As Double = Array(4.5, 7.5, 9.5, 8.5)
		  
		  // The coordinates for the second set of scatter symbols
		  Dim symbol2X() As Double = Array(6.5, 3.5, 7.5, 1.5)
		  Dim symbol2Y() As Double = Array(0.5, 7.5, 3.5, 2.5)
		  
		  // Create an XYChart object of size 600 x 500 pixels.
		  Dim c As New CDXYChartMBS(600, 500)
		  
		  // Set the plotarea at (80, 80) and of size 400 x 400 pixels. Set the background, border, and
		  // grid lines to transparent.
		  Dim p As CDPlotAreaMBS = c.setPlotArea(80, 80, 400, 400, -1, -1, CDBaseChartMBS.kTransparent, CDBaseChartMBS.kTransparent)
		  
		  // Add the first set of scatter symbols. Use grey (&h555555) cross shape symbols.
		  Call c.addScatterLayer(symbolX, symbolY, "Disputed", CDBaseChartMBS.Cross2Shape(0.2), 15, &h555555)
		  
		  // Add the first set of scatter symbols. Use yellow (&hffff66) star shape symbols.
		  Call c.addScatterLayer(symbol2X, symbol2Y, "Audited", CDBaseChartMBS.StarShape(5), 19, &hffff66)
		  
		  // Create a discrete heat map with 10 x 10 cells
		  Dim layer As CDDiscreteHeatMapLayerMBS = c.addDiscreteHeatMapLayer(zData, xLabels_size)
		  
		  // Set the x-axis labels. Use 10pt Arial Bold font rotated by 90 degrees. Set axis stem to
		  // transparent, so only the labels are visible. Set 0.5 offset to position the labels in between
		  // the grid lines. Position the x-axis at the top of the chart.
		  Call c.xAxis.setLabels(xLabels)
		  Call c.xAxis.setLabelStyle("Arial Bold", 10, CDBaseChartMBS.kTextColor, 90)
		  c.xAxis.setColors(CDBaseChartMBS.kTransparent, CDBaseChartMBS.kTextColor)
		  c.xAxis.setLabelOffset(0.5)
		  c.setXAxisOnTop
		  
		  // Set the y-axis labels. Use 10pt Arial Bold font. Set axis stem to transparent, so only the
		  // labels are visible. Set 0.5 offset to position the labels in between the grid lines. Reverse
		  // the y-axis so that the labels are flowing top-down instead of bottom-up.
		  Call c.yAxis.setLabels(yLabels)
		  Call c.yAxis.setLabelStyle("Arial Bold", 10)
		  c.yAxis.setColors(CDBaseChartMBS.kTransparent, CDBaseChartMBS.kTextColor)
		  c.yAxis.setLabelOffset(0.5)
		  c.yAxis.setReverse
		  
		  // Set the color stops and scale
		  Dim colorScale() As Double = Array(0.0, &hff0000, 1, &hff8800, 3, &h4488cc, 7, &h99ccff, 9, &h00ff00, 10)
		  Dim colorLabels() As String = Array("Poor", "Fair", "Good", "Very Good", "Excellent")
		  Dim colorLabels_size As Integer = colorLabels.Ubound + 1
		  layer.colorAxis.setColorScale(colorScale)
		  
		  // Position the legend box 20 pixels to the right of the plot area. Use 10pt Arial Bold font.
		  // Set the key icon size to 15 x 15 pixels. Set vertical key spacing to 8 pixels.
		  Dim b As CDLegendBoxMBS = c.addLegend(p.getRightX + 20, p.getTopY, True, "Arial Bold", 10)
		  b.setBackground(CDBaseChartMBS.kTransparent, CDBaseChartMBS.kTransparent)
		  b.setKeySize(15, 15)
		  b.setKeySpacing(0, 8)
		  
		  // Add the color scale label to the legend box
		  For i As Integer = colorLabels_size - 1 DownTo 0
		    Dim n As Integer = colorScale(i * 2 + 1)
		    b.addKey(colorLabels(i), n)
		  Next
		  
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
