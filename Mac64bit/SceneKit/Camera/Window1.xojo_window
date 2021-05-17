#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   430
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1409159167
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Camera Control"
   Visible         =   True
   Width           =   600
   Begin SCNControlMBS Mapp
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   430
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Visible         =   True
      Width           =   600
      Begin PushButton Top
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   True
         Caption         =   "Got to top"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Mapp"
         Italic          =   False
         Left            =   260
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   0
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton left
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   True
         Caption         =   "Go to Left"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Mapp"
         Italic          =   False
         Left            =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   170
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton right
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   True
         Caption         =   "Go to Right"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Mapp"
         Italic          =   False
         Left            =   509
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   170
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   91
      End
      Begin PushButton Front
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   True
         Caption         =   "Go to Front"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Mapp"
         Italic          =   False
         Left            =   260
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   410
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   98
      End
      Begin CheckBox CameraControlCheck
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Camera Control"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Mapp"
         Italic          =   False
         Left            =   460
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   410
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   140
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub Rotate90Degree()
		  
		  //Add the Node to the Scene 
		  Dim NodeOneGeometry As New SCNPyramidMBS(1, 1, 1)
		  Dim NodeOne As New SCNNodeMBS(NodeOneGeometry)
		  NodeOneGeometry.firstMaterial.diffuse.contents = NSColorMBS.purpleColor
		  NodeOne.Position = New SCNVector3MBS(0, 0, 0)
		  MyScene.rootNode.addChildNode(NodeOne)
		  
		  
		  //The angle must be given as radians 
		  //Convert: angleDegree*(Pi/180)
		  
		  Dim angleDegree As Double = 90
		  Const Pi = 3.14159265358979323846264338327950
		  Dim angleRad As Double
		  angleRad = angleDegree * (Pi / 180)
		  
		  //create the movements
		  Dim rotate90 As SCNActionMBS = SCNActionMBS.rotateBy(angleRad, 0, 0, 2)
		  Dim moveBy As SCNActionMBS = SCNActionMBS.moveBy(1, 0, 0, 1)
		  Dim pos As New SCNVector3MBS(0, 0, 0)
		  Dim moveTo As SCNActionMBS = SCNActionMBS.moveTo(pos, 1)
		  
		  Dim sequence As SCNActionMBS = SCNActionMBS.sequence(Array (rotate90, moveBy, moveTo))
		  Dim repeat As SCNActionMBS = SCNActionMBS.repeatActionForever(sequence)
		  NodeOne.runAction(repeat)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CameraNode As SCNNodeMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		MyCamera As SCNCameraMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		MyScene As SCNSceneMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		MyView As SCNViewMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events Mapp
	#tag Event
		Sub Open()
		  MyView = Me.View 
		  MyScene = New SCNSceneMBS
		  MyView.scene = MyScene
		  myView.autoenablesDefaultLighting = True 
		  
		  MyCamera = New SCNCameraMBS
		  CameraNode = New SCNNodeMBS
		  CameraNode.Camera = MyCamera
		  CameraNode.Position = New SCNVector3MBS(0, 0, 7)
		  
		  MyCamera.zNear = 0.7
		  MyCamera.zFar = 23
		  
		  myview.pointOfView = CameraNode
		  
		  MyView.allowsCameraControl = True
		  myView.backgroundColor = NSColorMBS.blackColor 
		  Rotate90Degree
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Top
	#tag Event
		Sub Action()
		  // Set the Point of view on the top 
		  
		  CameraNode.Position = New SCNVector3MBS(0, 7, 0)
		  CameraNode.EulerAngles = New SCNVector3MBS(4.71239, 0, 0)
		  myview.pointOfView = CameraNode
		  myview.play
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events left
	#tag Event
		Sub Action()
		  // Set the Point of view on the left side 
		  CameraNode.Position = New SCNVector3MBS(7, 0, 0)
		  CameraNode.EulerAngles = New SCNVector3MBS(0, 1.5708, 0)
		  myview.pointOfView = CameraNode
		  myview.play
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events right
	#tag Event
		Sub Action()
		  // Set the Point of view on the right side 
		  CameraNode.Position = New SCNVector3MBS(-7, 0, 0)
		  CameraNode.EulerAngles = New SCNVector3MBS(0, 4.71239, 0)
		  myview.pointOfView = CameraNode
		  
		  myview.play
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Front
	#tag Event
		Sub Action()
		  // Set the Point of view on the front 
		  CameraNode.Position = New SCNVector3MBS(0, 0, 7)
		  CameraNode.EulerAngles = New SCNVector3MBS(0, 0, 0)
		  myview.pointOfView = CameraNode
		  myview.play
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CameraControlCheck
	#tag Event
		Sub Action()
		  MyView.allowsCameraControl = Me.value
		  
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
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
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
#tag EndViewBehavior
