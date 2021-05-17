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
   Title           =   "Multi-Level Tree Map"
   Visible         =   True
   Width           =   480
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  CDBaseChartMBS.ScaleFactor = 2
		  
		  // The first level nodes of the tree map. There are 5 nodes.
		  Dim animals() As String = Array("Fish", "Amphibian", "Reptile", "Bird", "Mammal")
		  
		  // In this example, the colors are based on the first level nodes.
		  Dim colors() As Integer = Array( CType(&hff5555, Integer), &hff9933, &hffff44, &h66ff66, &h44ccff)
		  
		  // Data for the second level nodes in "Fish"
		  Dim fish_names() As String = Array("Shark", "Ray", "Swordfish", "Sawfish", "Eel", "Lionfish", "Seahorse")
		  Dim fish_data() As Double = Array(170.0, 144, 109, 115, 75, 45, 54)
		  
		  // Data for the second level nodes in "Bird"
		  Dim bird_names() As String = Array("Swan", "Ostrich", "Eagle", "Penguin", "Kiwi", "Flamingo", "Owl", "Peacock")
		  Dim bird_data() As Double = Array(89.0, 64, 94, 106, 68, 81, 40, 73)
		  
		  // Data for the second level nodes in "Amphibian"
		  Dim amphibian_names() As String = Array("Toad", "Salamander", "Frog", "Caecilian")
		  Dim amphibian_data() As Double = Array(67.0, 47, 58, 36)
		  
		  // Data for the second level nodes in "Reptile"
		  Dim reptile_names() As String = Array("Turtle", "Crocodile", "Lizard", "Snake")
		  Dim reptile_data() As Double = Array(58.0, 154, 97, 41)
		  
		  // Data for the second level nodes in "Mammal"
		  Dim mammal_names() As String = Array("Big Cat", "Primate", "Panda", "Elephant", "Hippo", "Rhino", "Giraffe")
		  Dim mammal_data() As Double = Array(266.0, 207, 160, 194, 168, 149, 202)
		  
		  // Create a Tree Map object of size 600 x 600 pixels
		  Dim c As New CDTreeMapChartMBS(600, 600)
		  
		  // Add a title to the chart
		  Call c.addTitle("Animal Kingdom Census", "Arial Bold Italic", 18)
		  
		  // Set the plotarea at (30, 30) and of size 540 x 540 pixels
		  c.setPlotArea(30, 30, 540, 540)
		  
		  // Obtain the root of the tree map, which is the entire plot area
		  Dim root As CDTreeMapNodeMBS = c.RootNode
		  
		  // Add first level nodes to the root. We do not need to provide data as they will be computed as
		  // the sum of the second level nodes.
		  Dim empty() As Double
		  root.setData(empty, animals, colors)
		  
		  // Add second level nodes to each of the first level node
		  root.Node(0).setData(fish_data, fish_names)
		  root.Node(1).setData(amphibian_data, amphibian_names)
		  root.Node(2).setData(reptile_data, reptile_names)
		  root.Node(3).setData(bird_data, bird_names)
		  root.Node(4).setData(mammal_data, mammal_names)
		  
		  // Get the prototype (template) for the first level nodes.
		  Dim nodeConfig As CDTreeMapNodeMBS = c.getLevelPrototype(1)
		  
		  // Set the label format for the nodes to show the label with 8pt Arial Bold font in
		  // semi-transparent black color (&h77000000). Put the text at the top left corner of the cell.
		  nodeConfig.setLabelFormat("{label}", "Times New Roman Bold Italic", 18, &h77000000, CDBaseChartMBS.kTopLeft)
		  
		  // Set the border color to white (ffffff)
		  nodeConfig.setColors(-1, &hffffff)
		  
		  // Get the prototype (template) for the second level nodes.
		  Dim nodeConfig2 As CDTreeMapNodeMBS = c.getLevelPrototype(2)
		  
		  // Set the label format for the nodes to show the label and value with 8pt Arial Bold font. Put
		  // the text at the center of the cell.
		  nodeConfig2.setLabelFormat("{label}<*br*>{value}", "Arial Bold", 8, CDBaseChartMBS.kTextColor, CDBaseChartMBS.kCenter)
		  
		  // Set the border color to white (ffffff)
		  nodeConfig2.setColors(-1, &hffffff)
		  
		  
		  
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
