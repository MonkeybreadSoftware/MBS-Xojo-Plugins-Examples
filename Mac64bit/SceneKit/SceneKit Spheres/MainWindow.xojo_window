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
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   866064383
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "SceneKit Spheres"
   Visible         =   True
   Width           =   600
   Begin SCNControlMBS MyControl
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   324
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   56
      Visible         =   True
      Width           =   560
   End
   BeginSegmented SegmentedControl SegControl
      Enabled         =   True
      Height          =   24
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MacControlStyle =   0
      Scope           =   0
      Segments        =   "Sphere\n\nFalse\rRow\n\nFalse\rGrid\n\nFalse\rTriangle\n\nFalse\rCube\n\nFalse"
      SelectionType   =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   20
      Transparent     =   False
      Visible         =   True
      Width           =   560
   End
   Begin Label Info
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   380
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   560
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub CreateCube()
		  MyScene = New SCNSceneMBS
		  
		  dim y as double = 0.0
		  
		  dim radius as double = 1.0
		  
		  const yCount = 7
		  const zCount = 7
		  const xCount = 7
		  
		  for row as integer = 0 to yCount-1
		    dim z as double = 0.0
		    for depth as integer = 0 to zCount-1
		      dim x as double = 0.0
		      for column as integer = 0 to xCount-1
		        
		        dim sphereGeometry as new SCNSphereMBS(radius)
		        
		        if (row mod 2 = 0) then
		          sphereGeometry.firstMaterial.diffuse.contents = NSColorMBS.orangeColor()
		        else
		          sphereGeometry.firstMaterial.diffuse.contents = NSColorMBS.purpleColor()
		        end if
		        
		        Dim sphereNode As New SCNNodeMBS(sphereGeometry)
		        sphereNode.position = SCNVector3MBS.Vector(x, y, z)
		        sphereNode.name = "Sphere "+str(row)+" "+str(depth)+" "+str(column)
		        
		        MyScene.rootNode.addChildNode(sphereNode)
		        
		        x = x + 2.0 * (radius)
		        
		      next
		      z = z + 2 * (radius)
		    next
		    y = y + 2 * (radius)
		  next
		  
		  
		  // show scene
		  MyView.scene = MyScene
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateGrid()
		  MyScene = New SCNSceneMBS
		  
		  dim y as Double = 0
		  dim radius as Double = 1.0
		  
		  const yCount = 20
		  const xCount = 20
		  
		  for row as integer = 0 to yCount-1
		    dim x as double = 0.0
		    for column as integer = 0 to xCount-1
		      dim sphereGeometry as new SCNSphereMBS(radius)
		      
		      if (row + column) mod 2 = 0  then
		        sphereGeometry.firstMaterial.diffuse.contents = NSColorMBS.orangeColor()
		      else
		        sphereGeometry.firstMaterial.diffuse.contents = NSColorMBS.purpleColor()
		      end if
		      
		      dim sphereNode as new SCNNodeMBS(sphereGeometry)
		      sphereNode.position = SCNVector3MBS.Vector(x, y, 0.0)
		      sphereNode.name = "Sphere "+Str(row)+" "+Str(column)
		      
		      MyScene.rootNode.addChildNode(sphereNode)
		      
		      x = x + 2 * (radius)
		    next
		    y = y + 2 * (radius)
		  next
		  
		  
		  // show scene
		  MyView.scene = MyScene
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateRow()
		  MyScene = New SCNSceneMBS
		  
		  
		  dim x as Double
		  dim radius as Double = 1
		  dim numberOfSpheres as integer = 20
		  
		  for i as integer = 1 to numberOfSpheres
		    
		    dim sphereGeometry as new SCNSphereMBS(radius)
		    
		    if i mod 2 = 0 then
		      sphereGeometry.firstMaterial.diffuse.contents = NSColorMBS.orangeColor
		    else
		      sphereGeometry.firstMaterial.diffuse.contents = NSColorMBS.purpleColor
		    end if
		    
		    dim sphereNode as new SCNNodeMBS(sphereGeometry)
		    sphereNode.position = SCNVector3MBS.Vector(x, 0.0, 0.0)
		    sphereNode.name = "Sphere "+Str(i)
		    
		    MyScene.rootNode.addChildNode(sphereNode)
		    
		    x = x + 3 * radius
		  next
		  
		  
		  // show scene
		  MyView.scene = MyScene
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateSphere()
		  MyScene = New SCNSceneMBS
		  
		  dim sphereGeometry as new SCNSphereMBS(1.0)
		  dim sphereNode as new SCNNodeMBS(sphereGeometry)
		  
		  sphereGeometry.firstMaterial.diffuse.contents = NSColorMBS.redColor
		  MyScene.rootNode.addChildNode(sphereNode)
		  sphereNode.name = "Red Sphere"
		  
		  
		  // second sphere
		  dim secondSphereGeometry as new SCNSphereMBS(0.5)
		  dim secondSphereNode as new SCNNodeMBS(secondSphereGeometry)
		  secondSphereNode.position = New SCNVector3MBS(3.0, 0.0, 0.0)
		  secondSphereGeometry.firstMaterial.diffuse.contents = NSColorMBS.greenColor
		  MyScene.rootNode.addChildNode(secondSphereNode)
		  secondSphereNode.name = "Green Sphere"
		  
		  
		  // show scene
		  MyView.scene = MyScene
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateTriangle()
		  MyScene = New SCNSceneMBS
		  
		  dim y as double = 0.0
		  const radius = 1.0
		  const yCount = 20
		  const xCount = 20
		  
		  for row as integer = 0 to yCount-1
		    dim x as double = (radius) * (row)
		    for column as integer = 0 to xCount-row-1
		      dim sphereGeometry as new SCNSphereMBS(radius)
		      
		      if ((row + column) mod 2 = 0) then
		        sphereGeometry.firstMaterial.diffuse.contents = NSColorMBS.orangeColor()
		      else
		        sphereGeometry.firstMaterial.diffuse.contents = NSColorMBS.purpleColor()
		      end if
		      
		      dim sphereNode as new SCNNodeMBS(sphereGeometry)
		      sphereNode.position = New SCNVector3MBS(x, y, 0.0)
		      sphereNode.name = "Sphere "+str(row)+" "+str(column)
		      
		      MyScene.rootNode.addChildNode(sphereNode)
		      
		      x = x + 2 * (radius)
		    next
		    y = y + sqrt(3.0) * (radius)
		  next
		  
		  // show scene
		  MyView.scene = MyScene
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Note
		
		 Based on code found in the tutorial
		
		 Introduction To SceneKit – Part 1
		
		
		 https://www.weheartswift.com/introduction-scenekit-part-1/
		
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		MyScene As SCNSceneMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		MyView As SCNViewMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events MyControl
	#tag Event
		Sub Open()
		  MyView = me.View
		  
		  MyScene = new SCNSceneMBS
		  
		  MyView.scene = MyScene
		  MyView.backgroundColor = NSColorMBS.blackColor
		  MyView.autoenablesDefaultLighting = true
		  Myview.allowsCameraControl = true
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x as Integer, y as Integer, Modifiers as Integer) As Boolean
		  Dim p As New CGPointMBS(x,y)
		  Dim results() As SCNHitTestResultMBS = myview.hitTest(p)
		  
		  If results <> Nil And results.Ubound >= 0 Then
		    // hit something
		    
		    Dim result As SCNHitTestResultMBS = results(0)
		    info.Text = "Clicked on: "+result.node.Name+" @ "+_
		    Str(result.localCoordinates.x)+"/"+_
		    Str(result.localCoordinates.y)+"/"+_
		    Str(result.localCoordinates.z)
		    
		    'Break 
		    
		    
		  End If
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events SegControl
	#tag Event
		Sub Action(itemIndex as integer)
		  Select case itemIndex 
		  case 0
		    CreateSphere
		  case 1
		    CreateRow
		  case 2
		    CreateGrid
		  case 3
		    CreateTriangle
		  case 4
		    CreateCube
		  end Select
		End Sub
	#tag EndEvent
#tag EndEvents
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
		InitialValue="True"
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
