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
   Title           =   "SceneKit Primitives"
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
   BeginSegmented SegmentedControl SegmentedControl1
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
      Segments        =   "Primitives\n\nFalse\rStairs\n\nFalse\rTree\n\nFalse\rToy\n\nFalse\rGraph\n\nFalse"
      SelectionType   =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      Top             =   20
      Transparent     =   False
      Visible         =   True
      Width           =   560
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub Graph()
		  MyScene = new SCNSceneMBS
		  
		  MyView.scene = MyScene
		  
		  
		  const gridSize = 25
		  
		  dim capsuleRadius as double = 1.0 / (gridSize - 1)
		  dim capsuleHeight as double = capsuleRadius * 4.0
		  
		  dim z as double = (-gridSize + 1) * (capsuleRadius)
		  
		  for row as integer = 0 to gridSize-1
		    dim x as double = (-gridSize + 1) * (capsuleRadius)
		    for column as integer = 0 to gridSize-1
		      
		      dim capsule as new SCNCapsuleMBS( capsuleRadius, capsuleHeight)
		      
		      dim hue as double = (abs(x * z))
		      dim color as NSColorMBS = NSColorMBS.colorWithHSV( hue, 1.0, 1.0, 1.0)
		      
		      capsule.firstMaterial.diffuse.contents = color
		      
		      dim capsuleNode as new SCNNodeMBS(capsule)
		      
		      MyScene.rootNode.addChildNode(capsuleNode)
		      
		      capsuleNode.position = SCNVector3MBS.Vector(x, 0.0, z)
		      
		      // dim y as double = (squareFunction(x, z))
		      dim y as double = (sinFunction(x, z))
		      
		      dim moveUp   as SCNActionMBS = SCNActionMBS.moveBy(0,  y, 0, 1.0)
		      dim moveDown as SCNActionMBS = SCNActionMBS.moveBy(0, -y, 0, 1.0)
		      
		      dim sequence as SCNActionMBS = SCNActionMBS.sequence(array(moveUp,moveDown))
		      dim repeatedSequence as SCNActionMBS = SCNActionMBS.repeatActionForever(sequence)
		      
		      capsuleNode.runAction(repeatedSequence)
		      
		      x = x + 2.0 * (capsuleRadius)
		      
		    next
		    
		    z = z + 2.0 * (capsuleRadius)
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrimitvesCircle()
		  MyScene = new SCNSceneMBS
		  
		  MyView.scene = MyScene
		  
		  
		  
		  redim geometries(-1)
		  geometries.Append new SCNSphereMBS(1.0)
		  geometries.Append new SCNPlaneMBS(1.0,1.5)
		  geometries.Append new SCNBoxMBS(1.0, 1.5, 2.0, 0.0)
		  geometries.Append new SCNPyramidMBS(2.0, 1.5, 1.0)
		  geometries.Append new SCNCylinderMBS(1.0, 1.5)
		  geometries.Append new SCNConeMBS(0.5, 1.0, 1.5)
		  geometries.Append new SCNTorusMBS(1.0, 0.2)
		  geometries.Append new SCNTubeMBS(0.5, 1.0, 1.5)
		  geometries.Append new SCNCapsuleMBS(0.5, 2.0)
		  
		  
		  
		  
		  dim pi as Double = 3.1415926535
		  dim angle  as double = 0.0
		  dim radius as double = 4.0
		  
		  
		  dim count as integer = geometries.Ubound + 1
		  dim angleIncrement as double = PI * 2.0 / count
		  
		  
		  for index as integer = 0 to geometries.Ubound
		    
		    dim hue as double = (index) / (count)
		    dim color as NSColorMBS = NSColorMBS.colorWithHSV(hue, 1.0, 1.0, 1.0)
		    
		    dim geometry as SCNGeometryMBS = geometries(index)
		    geometry.firstMaterial.diffuse.contents = color
		    
		    dim node as new SCNNodeMBS(geometry)
		    
		    dim x as double = radius * cos(angle)
		    dim z as double = radius * sin(angle)
		    
		    node.position = SCNVector3MBS.Vector(x, 0, z)
		    
		    MyScene.rootNode.addChildNode(node)
		    
		    angle = angle + angleIncrement
		    
		    
		    
		    
		    dim sign as double = -1
		    if index mod 2 = 0 then
		      sign = 1
		    end if
		    
		    dim move1 as SCNActionMBS = SCNActionMBS.moveBy(0.0, sign * ( 1.0), 0.0, 1.0)
		    dim move2 as SCNActionMBS = SCNActionMBS.moveBy(0.0, sign * (-1.0), 0.0, 1.0)
		    dim sequence as SCNActionMBS = SCNActionMBS.sequence(array(move1,move2))
		    dim repeatedSequence as SCNActionMBS = SCNActionMBS.repeatActionForever(sequence)
		    
		    node.runAction repeatedSequence
		    
		  next
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function sinFunction(x as Double, z as Double) As Double
		  return 0.2 * sin(x * 5 + z * 3) + 0.1 * cos(x * 5 + z * 10 + 0.6) + 0.05 * cos(x * x * z)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function squareFunction(x as Double, z as Double) As double
		  return x * x + z * z
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stairs()
		  
		  const numberOfStairs = 20
		  dim stairWidth as double = 1.0
		  dim stairHeight as double = 0.2
		  dim stairLength as double = 0.5
		  
		  dim z as double = 0.0
		  dim y as double = 0.0
		  
		  MyScene = new SCNSceneMBS
		  
		  
		  for index as integer = 0 to numberOfStairs-1
		    
		    dim hue as double = (index) / (numberOfStairs)
		    
		    dim box as new SCNBoxMBS(stairWidth, stairHeight, stairLength, 0.0)
		    dim stairNode as new SCNNodeMBS(box)
		    
		    if (index mod 3 = 0) then
		      stairNode.geometry.firstMaterial.diffuse.contents = NSColorMBS.redColor()
		    elseif (index mod 3 = 1) then
		      stairNode.geometry.firstMaterial.diffuse.contents = NSColorMBS.orangeColor()
		    else
		      stairNode.geometry.firstMaterial.diffuse.contents = NSColorMBS.purpleColor()
		    end if
		    
		    stairNode.position = SCNVector3MBS.Vector(0.0, y, z)
		    
		    y = y + (stairHeight)
		    z = z + (stairLength)
		    
		    MyScene.rootNode.addChildNode(stairNode)
		    
		  next
		  
		  MyView.scene = MyScene
		  MyScene.rootNode.runAction SCNActionMBS.rotateByAngle(3, MyScene.rootNode.localUp, 10)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Toy()
		  MyScene = new SCNSceneMBS
		  
		  
		  const numberOfTori = 6
		  dim cylinderRadius as double = 0.5
		  dim pipeRadius as double = 0.3
		  
		  dim cylinderHeight as double = 2.5
		  
		  dim cylinder as new SCNConeMBS( 0.15, cylinderRadius, cylinderHeight)
		  dim cylinderNode as new SCNNodeMBS(cylinder)
		  
		  cylinderNode.position = new SCNVector3MBS(0, (cylinderHeight) / 2.0 - (pipeRadius), 0)
		  MyScene.rootNode.addChildNode(cylinderNode)
		  
		  
		  
		  dim y as double = 0.0
		  for index as integer = 0 to numberOfTori-1
		    dim torus as new SCNTorusMBS(cylinderRadius + pipeRadius, pipeRadius)
		    
		    dim hue as double = (index) / (numberOfTori)
		    dim color as NSColorMBS = NSColorMBS.colorWithHSV(hue, 1.0, 1.0, 1.0)
		    
		    torus.firstMaterial.diffuse.contents = color
		    torus.firstMaterial.transparency = 0.8
		    
		    dim torusNode as new SCNNodeMBS(torus)
		    
		    torusNode.position = SCNVector3MBS.Vector(0.0, y, 0.0)
		    
		    MyScene.rootNode.addChildNode(torusNode)
		    
		    y = y + (pipeRadius)
		    
		    
		    cylinderRadius = cylinderRadius * 0.8
		    pipeRadius = pipeRadius * 0.8
		    
		    
		    y = y + (pipeRadius)
		  next
		  
		  
		  
		  
		  MyView.scene = MyScene
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Tree()
		  MyScene = new SCNSceneMBS
		  
		  dim baseHeight as double = 0.8
		  dim cylinder as new SCNCylinderMBS(0.2, baseHeight)
		  dim treeBase as new SCNNodeMBS(cylinder)
		  
		  treeBase.geometry.firstMaterial.diffuse.contents = NSColorMBS.brownColor()
		  MyScene.rootNode.addChildNode treeBase
		  
		  const numberOfLevels = 4
		  
		  dim y as double = (baseHeight / 2.0)
		  dim bottomRadius    as double = 0.8
		  dim topRadius       as double = 0.5
		  dim leaveHeight     as double = 0.4
		  dim lastLevelHeight as double = 0.6
		  
		  dim scale as double = 0.8
		  for i as integer = 0 to numberOfLevels-1
		    
		    if (i = numberOfLevels - 1) then
		      
		      topRadius = 0.0
		      y = y + ((lastLevelHeight - leaveHeight) / 2.0)
		      leaveHeight = lastLevelHeight
		      
		    end if
		    
		    dim cone as new SCNConeMBS(topRadius, bottomRadius, leaveHeight)
		    dim leavesNode as new SCNNodeMBS(cone)
		    
		    leavesNode.position = new SCNVector3MBS(0, y, 0)
		    y = y + (leaveHeight)
		    
		    leavesNode.geometry.firstMaterial.diffuse.contents = NSColorMBS.greenColor()
		    
		    treeBase.addChildNode(leavesNode)
		    'MyScene.rootNode.addChildNode leavesNode
		    
		    bottomRadius = bottomRadius * scale
		    topRadius    = topRadius    * scale
		    
		  next
		  
		  
		  
		  
		  MyView.scene = MyScene
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Note
		
		 Based on code found in the tutorial
		
		Introduction To SceneKit – Part 2
		
		
		 https://www.weheartswift.com/introduction-scenekit-part-2/
		
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		geometries() As SCNGeometryMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		geometryNodes() As SCNNodeMBS
	#tag EndProperty

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
#tag EndEvents
#tag Events SegmentedControl1
	#tag Event
		Sub Action(itemIndex as integer)
		  Select case itemIndex 
		  case 0
		    
		    
		    PrimitvesCircle
		    
		    
		  case 1
		    
		    Stairs
		    
		  case 2
		    
		    Tree
		    
		  case 3
		    
		    Toy
		    
		  case 4
		    
		    Graph
		    
		  End Select
		  
		  
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
