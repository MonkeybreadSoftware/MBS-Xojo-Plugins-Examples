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
   Height          =   480
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
   Title           =   "Wafer Map"
   Visible         =   True
   Width           =   520
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  CDBaseChartMBS.ScaleFactor = 2
		  
		  // The diameter of the wafer
		  Const diameter = 20
		  Dim radius As Double = diameter / 2.0
		  
		  // The random data array are for a square grid of 20 x 20 cells
		  Dim r As New CDRanSeriesMBS(2)
		  Dim zData() As Double = r.get2DSeries(diameter, diameter, 0, 100)
		  
		  // We remove cells that are outside the wafer circle by setting them to NoValue
		  For i As Integer = 0 To zData.ubound
		    Dim x As Double = (i Mod diameter) + 0.5
		    Dim y As Double = (i - x) / diameter + 0.5
		    If ((x - radius) * (x - radius) + (y - radius) * (y - radius) > radius * radius) Then
		      // out of wafer, so clear value
		      zData(i) = CDBaseChartMBS.kNoValue
		    end if
		  Next
		  
		  // Create an XYChart object of size 520 x 480 pixels.
		  Dim c As New CDXYChartMBS(520, 480)
		  
		  // Add a title the chart with 15pt Arial Bold font
		  Call c.addTitle("Wafer Map Demonstration", "Arial Bold", 15)
		  
		  // Set the plotarea at (50, 40) and of size 400 x 400 pixels. Set the backgound and border to
		  // transparent. Set both horizontal and vertical grid lines to light grey. (&hdddddd)
		  Dim p As CDPlotAreaMBS =c.setPlotArea(50, 40, 400, 400, -1, -1, CDBaseChartMBS.kTransparent, &hdddddd, &hdddddd)
		  
		  // Create a discrete heat map with 20 x 20 cells
		  Dim layer As CDDiscreteHeatMapLayerMBS = c.addDiscreteHeatMapLayer(zData, diameter)
		  
		  // Set the x-axis scale. Use 8pt Arial Bold font. Set axis color to transparent, so only the
		  // labels visible. Set 0.5 offset to position the labels in between the grid lines.
		  c.xAxis.setLinearScale(0, diameter, 1)
		  Call c.xAxis.setLabelStyle("Arial Bold", 8)
		  c.xAxis.setColors(CDBaseChartMBS.kTransparent, CDBaseChartMBS.kTextColor)
		  c.xAxis.setLabelOffset(0.5)
		  
		  // Set the y-axis scale. Use 8pt Arial Bold font. Set axis color to transparent, so only the
		  // labels visible. Set 0.5 offset to position the labels in between the grid lines.
		  c.yAxis.setLinearScale(0, diameter, 1)
		  Call c.yAxis.setLabelStyle("Arial Bold", 8)
		  c.yAxis.setColors(CDBaseChartMBS.kTransparent, CDBaseChartMBS.kTextColor)
		  c.yAxis.setLabelOffset(0.5)
		  
		  // Position the color axis 20 pixels to the right of the plot area and of the same height as the
		  // plot area. Put the labels on the right side of the color axis. Use 8pt Arial Bold font for
		  // the labels.
		  Dim cAxis As CDColorAxisMBS = layer.setColorAxis(p.getRightX + 20, p.getTopY, CDBaseChartMBS.kTopLeft, p.getHeight, CDBaseChartMBS.kRight)
		  call cAxis.setLabelStyle("Arial Bold", 8)
		  
		  
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
