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
   Title           =   "SceneKit Images"
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
      Segments        =   "One Image\n\nFalse\rImage Cube\n\nFalse\rFading\n\nFalse\rCube 3D\n\nFalse"
      SelectionType   =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      Top             =   20
      Transparent     =   False
      Visible         =   True
      Width           =   560
   End
   Begin Timer MyTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   5000
      Scope           =   0
      TabPanelIndex   =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub CreateCube()
		  MyScene = new SCNSceneMBS
		  
		  
		  dim pic as Picture = LogoMBS(500)
		  dim box as new SCNBoxMBS(500, 500, 500, 0)
		  
		  box.firstMaterial.diffuse.contents = pic 
		  
		  dim node as new SCNNodeMBS(box)
		  
		  MyScene.rootNode.addChildNode node
		  
		  
		  // show scene
		  MyView.scene = MyScene
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateCube3d()
		  // See tutorial here:
		  // https://code.tutsplus.com/tutorials/an-introduction-to-scenekit-fundamentals--cms-23847
		  
		  const pi = 3.1415926535897932384626433
		  
		  dim scene as new SCNSceneMBS
		  myView.scene = scene
		  
		  dim camera as new SCNCameraMBS
		  dim cameraNode as new SCNNodeMBS
		  cameraNode.camera = camera
		  cameraNode.position = SCNVector3MBS.Vector( -3.0, 3.0, 3.0)
		  
		  
		  // spot light
		  dim light as new SCNLightMBS
		  light.type = SCNLightMBS.SCNLightTypeSpot
		  light.spotInnerAngle = 30.0
		  light.spotOuterAngle = 80.0
		  light.castsShadow = true
		  dim lightNode as new SCNNodeMBS
		  lightNode.light = light
		  lightNode.position = SCNVector3MBS.Vector(1.5, 1.5, 1.5)
		  
		  
		  // add cube
		  dim cubeGeometry as new SCNBoxMBS( 1.0, 1.0, 1.0, 0.0)
		  dim cubeNode as new SCNNodeMBS(cubeGeometry)
		  
		  // ground plate
		  dim planeGeometry as new SCNPlaneMBS( 50.0, 50.0)
		  dim planeNode as new SCNNodeMBS(planeGeometry)
		  planeNode.eulerAngles = SCNVector3MBS.Vector( -90 * pi / 180.0, 0, 0)
		  planeNode.position = SCNVector3MBS.Vector( 0, -0.5, 0)
		  
		  
		  // add some colors
		  dim redMaterial as new SCNMaterialMBS
		  redMaterial.diffuse.contents = NSColorMBS.redColor
		  cubeGeometry.setMaterials array(redMaterial)
		  
		  dim greenMaterial as new SCNMaterialMBS
		  greenMaterial.diffuse.contents = NSColorMBS.greenColor
		  planeGeometry.setMaterials array(greenMaterial)
		  
		  
		  // background light
		  dim ambientLight as new SCNLightMBS
		  ambientLight.type = SCNLightMBS.SCNLightTypeAmbient
		  ambientLight.color = NSColorMBS.colorWithRGB( 0.2, 0.2, 0.2, 1.0)
		  cameraNode.light = ambientLight
		  
		  
		  // limit moving
		  dim constraint as new SCNLookAtConstraintMBS(cubeNode)
		  constraint.gimbalLockEnabled = true
		  cameraNode.setConstraints array(constraint)
		  lightNode.setConstraints array(constraint)
		  
		  
		  
		  
		  scene.rootNode.addChildNode(lightNode)
		  scene.rootNode.addChildNode(cameraNode)
		  scene.rootNode.addChildNode(cubeNode)
		  scene.rootNode.addChildNode(planeNode)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateFading()
		  MyScene = new SCNSceneMBS
		  
		  redim nodes(-1)
		  
		  dim w as integer = MyControl.Width
		  dim h as integer = MyControl.Height
		  
		  dim pics() as Picture
		  
		  pics.Append NewPicture(MyControl.Width, MyControl.Height, &cFF0000)
		  pics.Append NewPicture(MyControl.Width, MyControl.Height, &c00FF00)
		  pics.Append NewPicture(MyControl.Width, MyControl.Height, &c0000FF)
		  pics.Append NewPicture(MyControl.Width, MyControl.Height, &c00FFFF)
		  pics.Append NewPicture(MyControl.Width, MyControl.Height, &cFF00FF)
		  pics.Append NewPicture(MyControl.Width, MyControl.Height, &cFFFF00)
		  pics.Append NewPicture(MyControl.Width, MyControl.Height, &cFFFFFF)
		  
		  dim rootNode as SCNNodeMBS = MyScene.rootNode
		  
		  dim planes() as SCNPlaneMBS
		  dim sequence() as SCNActionMBS
		  
		  for each p as Picture in pics
		    dim plane as new SCNPlaneMBS(w,h)
		    plane.firstMaterial.diffuse.contents = p
		    
		    dim node as new SCNNodeMBS(plane)
		    node.opacity = 0
		    nodes.append node
		    rootNode.addChildNode node
		    
		  next
		  
		  
		  
		  NodeIndex = 0
		  nodes(NodeIndex).Opacity = 1
		  
		  
		  
		  dim sequenceAction as SCNActionMBS = SCNActionMBS.sequence(sequence)
		  rootNode.runAction sequenceAction
		  
		  
		  
		  MyView.play
		  
		  
		  
		  // show scene
		  MyView.scene = MyScene
		  'dim p as SCNVector3MBS = MyView.pointOfView.Position
		  
		  // zoom to full for this view
		  dim n as new SCNNodeMBS
		  n.Position = SCNVector3MBS.Vector(0, 0, 380)
		  MyView.pointOfView = n
		  
		  
		  
		  MyTimer.Mode = 2
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateImage()
		  MyScene = new SCNSceneMBS
		  
		  
		  dim pic as Picture = LogoMBS(500)
		  dim plane as new SCNPlaneMBS(500,500)
		  
		  plane.firstMaterial.diffuse.contents = pic 
		  
		  dim node as new SCNNodeMBS(plane)
		  
		  MyScene.rootNode.addChildNode node
		  
		  
		  // show scene
		  MyView.scene = MyScene
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function NewPicture(w as integer, h as integer, c as color) As Picture
		  dim p as new Picture(w, h)
		  
		  dim g as Graphics = p.Graphics
		  g.ForeColor = c
		  g.FillRect 0, 0, w, h
		  
		  return p
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Note
		
		 Based on code found in the tutorial
		
		 Introduction To SceneKit – Part 1
		
		
		 https://www.weheartswift.com/introduction-scenekit-part-1/
		
		
		
	#tag EndNote

	#tag Note, Name = Plugins needed
		
		MBS Xojo AVFoundation Plugin.xojo_plugin
		MBS Xojo Mac64bit Plugin.xojo_plugin
		MBS Xojo MacBase Plugin.xojo_plugin
		MBS Xojo MacCF Plugin.xojo_plugin
		MBS Xojo MacCG Plugin.xojo_plugin
		MBS Xojo MacCloud Plugin.xojo_plugin
		MBS Xojo MacCocoa Plugin.xojo_plugin
		MBS Xojo MacControls Plugin.xojo_plugin
		MBS Xojo Main Plugin.xojo_plugin
		
	#tag EndNote


	#tag Property, Flags = &h0
		MyScene As SCNSceneMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		MyView As SCNViewMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		NodeIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		nodes() As SCNNodeMBS
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
		  
		  
		  
		  // show three cylinders.
		  dim c1 as new SCNCylinderMBS(0.5, 100)
		  dim c2 as new SCNCylinderMBS(0.5, 100)
		  dim c3 as new SCNCylinderMBS(0.5, 100)
		  
		  
		  dim n1 as new SCNNodeMBS(c1)
		  dim n2 as new SCNNodeMBS(c2)
		  dim n3 as new SCNNodeMBS(c3)
		  
		  const pi = 3.1415926535897932384626433
		  
		  n2.eulerAngles = SCNVector3MBS.Vector(pi/2, 0, 0)
		  n3.eulerAngles = SCNVector3MBS.Vector(0, 0, pi/2)
		  
		  
		  MyScene.rootNode.addChildNode n1
		  MyScene.rootNode.addChildNode n2
		  MyScene.rootNode.addChildNode n3
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SegmentedControl1
	#tag Event
		Sub Action(itemIndex as integer)
		  Select case itemIndex
		    
		  case 0
		    CreateImage
		    
		  case 1
		    CreateCube
		    
		  case 2
		    CreateFading
		    
		  case 3
		    CreateCube3d
		    
		  end Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MyTimer
	#tag Event
		Sub Action()
		  
		  dim LastIndex as integer = NodeIndex
		  
		  NodeIndex = (NodeIndex + 1) mod (nodes.Ubound+1)
		  
		  
		  nodes(LastIndex).runAction SCNActionMBS.fadeOut(2)
		  nodes(NodeIndex).runAction SCNActionMBS.fadeIn(2)
		  
		  
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
	#tag ViewProperty
		Name="NodeIndex"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
