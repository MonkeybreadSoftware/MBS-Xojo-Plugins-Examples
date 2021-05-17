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
   Title           =   "SceneKit Hanoi"
   Visible         =   True
   Width           =   600
   Begin SCNControlMBS MyControl
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   360
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
      Top             =   20
      Visible         =   True
      Width           =   560
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub createBoard()
		  boardWidth  = diskRadius * 6.0 + boardPadding
		  boardLength = diskRadius * 2.0 + boardPadding
		  
		  dim boardColor as NSColorMBS = NSColorMBS.brownColor()
		  
		  dim boardGeometry as new SCNBoxMBS( boardWidth, boardHeight, boardLength, 0.1)
		  boardGeometry.firstMaterial.diffuse.contents = NSColorMBS.brownColor()
		  
		  dim boardNode as new SCNNodeMBS(boardGeometry)
		  
		  rootNode.addChildNode(boardNode)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub createDisks()
		  dim firstPeg as SCNNodeMBS = pegs(0)
		  
		  dim y as double = (boardHeight / 2.0 + diskHeight / 2.0)
		  
		  dim radius as double = diskRadius
		  for i as integer = 0 to numberOfDisks-1
		    
		    dim tube as new SCNTubeMBS(pegRadius, radius, diskHeight)
		    
		    dim hue as double = (i) / (numberOfDisks)
		    dim color as NSColorMBS = NSColorMBS.colorWithHSV(hue, 1.0, 1.0, 1.0)
		    tube.firstMaterial.diffuse.contents = color
		    
		    dim tubeNode as new SCNNodeMBS(tube)
		    
		    tubeNode.position = SCNVector3MBS.Vector( firstPeg.position.x, y, 0)
		    
		    rootNode.addChildNode(tubeNode)
		    disks.append(tubeNode)
		    
		    y = y + (diskHeight)
		    radius = radius - 0.1
		    
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub createPegs()
		  // Create the 3 Pegs on the board
		  
		  pegHeight = (numberOfDisks + 1) * diskHeight
		  
		  dim x as double = (-boardWidth / 2.0 + boardPadding / 2.0 + diskRadius)
		  
		  for i as integer = 0 to 2
		    dim cylinder as new SCNCylinderMBS(pegRadius, pegHeight)
		    dim cylinderNode as new SCNNodeMBS(cylinder)
		    cylinder.firstMaterial.diffuse.contents = NSColorMBS.brownColor()
		    
		    cylinderNode.position = new SCNVector3MBS(x, (pegHeight / 2.0 + boardHeight / 2.0), 0.0)
		    
		    rootNode.addChildNode(cylinderNode)
		    pegs.append(cylinderNode)
		    
		    x = x + (diskRadius * 2)
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Solve()
		  solver = new HanoiSolver(numberOfDisks)
		  
		  // make some variables accessible in solver
		  solver.pegsNodes = pegs
		  solver.disks = disks
		  solver.pegHeight = pegHeight
		  solver.boardHeight = boardHeight
		  solver.diskHeight = diskHeight
		  
		  solver.computeMoves
		  solver.recursiveAnimation(0)
		  
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Note
		
		 Based on code found in the tutorial
		
		 Introduction To SceneKit – Part 3
		
		
		https://www.weheartswift.com/introduction-scenekit-part-3/
	#tag EndNote


	#tag Property, Flags = &h0
		boardHeight As Double = 0.2
	#tag EndProperty

	#tag Property, Flags = &h0
		boardLength As double
	#tag EndProperty

	#tag Property, Flags = &h0
		boardPadding As Double = 0.8
	#tag EndProperty

	#tag Property, Flags = &h0
		boardWidth As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		diskHeight As Double = 0.2
	#tag EndProperty

	#tag Property, Flags = &h0
		diskRadius As double = 1.0
	#tag EndProperty

	#tag Property, Flags = &h0
		disks() As SCNNodeMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		MyScene As SCNSceneMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		MyView As SCNViewMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		numberOfDisks As integer = 5
	#tag EndProperty

	#tag Property, Flags = &h0
		pegHeight As Double = 0.0
	#tag EndProperty

	#tag Property, Flags = &h0
		pegRadius As Double = 0.1
	#tag EndProperty

	#tag Property, Flags = &h0
		pegs() As SCNNodeMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		rootNode As SCNNodeMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		solver As HanoiSolver
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
		  
		  
		  rootNode = MyScene.rootNode
		  
		  
		  createBoard
		  createPegs
		  createDisks
		  
		  Solve
		  
		  // set in in play mode, so animations don't stop
		  MyView.play
		  
		  
		  
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
		Name="diskRadius"
		Visible=false
		Group="Behavior"
		InitialValue="1.0"
		Type="double"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="boardWidth"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Double"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="boardLength"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="double"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="boardPadding"
		Visible=false
		Group="Behavior"
		InitialValue="0.8"
		Type="Double"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="boardHeight"
		Visible=false
		Group="Behavior"
		InitialValue="0.2"
		Type="Double"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="numberOfDisks"
		Visible=false
		Group="Behavior"
		InitialValue="4"
		Type="integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="diskHeight"
		Visible=false
		Group="Behavior"
		InitialValue="0.2"
		Type="Double"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="pegHeight"
		Visible=false
		Group="Behavior"
		InitialValue="0.0"
		Type="Double"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="pegRadius"
		Visible=false
		Group="Behavior"
		InitialValue="0.1"
		Type="Double"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
