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
   Height          =   520
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
   Title           =   "Tree Map Colors"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  CDBaseChartMBS.ScaleFactor = 2
		  
		  // The first level nodes of the tree map. There are 3 nodes.
		  Dim allRegions() As String = Array("Alpha", "Beta", "Gamma")
		  
		  // Each first level node branches to become 7 second level nodes.
		  Dim energy_types() As String = Array("Coal", "Oil", "Gas", "Nuclear", "Hydro", "Solar", "Wind")
		  Dim energy_types_size as Integer = energy_types.Ubound + 1
		  
		  // Colors for the second level nodes.
		  Dim colors() As Integer = Array(CType(&h222222, Integer), &h666666, &h884488, &hcc0000, &h3366cc, &h33cc33, &h77bbff)
		  
		  // The data for the 3 groups of second level nodes
		  Dim region0() As Double = Array(0.0, 50, 70, 0, 60, 120, 140)
		  Dim region1() As Double = Array(200.0, 50, 30, 65, 60, 40, 40)
		  Dim region2() As Double = Array(0.0, 100, 70, 100, 60, 35, 40)
		  
		  // Create a Tree Map object of size 600 x 520 pixels
		  Dim c As New CDTreeMapChartMBS(600, 520)
		  
		  // Add a title to the chart
		  Call c.addTitle("Energy Usage by Region", "Arial Bold Italic", 18)
		  
		  // Set the plotarea at (10, 35) and of size 480 x 480 pixels
		  c.setPlotArea(10, 35, 480, 480)
		  
		  // Obtain the root of the tree map, which is the entire plot area
		  Dim root As CDTreeMapNodeMBS = c.RootNode
		  
		  // Add first level nodes to the root. We do not need to provide data as they will be computed as
		  // the sum of the second level nodes.
		  dim emptyArray() as double
		  root.setData(emptyArray, allRegions)
		  
		  // Add second level nodes to each of the first level node
		  root.Node(0).setData(region0, energy_types, colors)
		  root.Node(1).setData(region1, energy_types, colors)
		  root.Node(2).setData(region2, energy_types, colors)
		  
		  // Get the prototype (template) for the first level nodes.
		  Dim nodeConfig As CDTreeMapNodeMBS = c.getLevelPrototype(1)
		  
		  // Set the label format for the nodes to show the label with 8pt Arial Bold font in
		  // semi-transparent black color (&h77000000). Put the text at the top left corner of the cell.
		  nodeConfig.setLabelFormat("{label}", "Arial Bold", 18, &h77ffffff, CDBaseChartMBS.kTopLeft)
		  
		  // Set the border color to white (ffffff). Use 2 pixel thick flat border style.
		  nodeConfig.setColors(-1, &hffffff, CDBaseChartMBS.flatBorder(2))
		  
		  // Get the prototype (template) for the second level nodes.
		  Dim nodeConfig2 As CDTreeMapNodeMBS = c.getLevelPrototype(2)
		  
		  // Set the label format for the nodes to show the label and value with 8pt Arial Bold font. Put
		  // the text at the center of the cell.
		  nodeConfig2.setLabelFormat("{label}<*br*>{value}MW", "Arial Bold", 8, &hffffff, CDBaseChartMBS.kCenter)
		  
		  // Set the border color to white (ffffff)
		  nodeConfig2.setColors(-1, &hffffff)
		  
		  // Add a legend box at (500, 35) with 12pt Arial font and transparent background and border.
		  Dim b As CDLegendBoxMBS = c.addLegend(500, 35, True, "Arial", 12)
		  b.setBackground(CDBaseChartMBS.kTransparent, CDBaseChartMBS.kTransparent)
		  
		  // Add the legend keys for the colors
		  For i As Integer = 0 To energy_types_size - 1
		    b.addKey(energy_types(i), colors(i))
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
