#tag MobileScreen
Begin MobileScreen Screen1
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   HasNavigationBar=   True
   LargeTitleDisplayMode=   2
   Left            =   0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   "&h00000000"
   Title           =   "SceneKit"
   Top             =   0
   Begin SCNIOSControlMBS MyControl
      AutoLayout      =   MyControl, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   MyControl, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   MyControl, 3, TopLayoutGuide, 3, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   MyControl, 4, BottomLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      Enabled         =   True
      Height          =   503
      Left            =   0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      Top             =   65
      Top             =   65
      Visible         =   True
      Width           =   320
   End
End
#tag EndMobileScreen

#tag WindowCode
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


	#tag Property, Flags = &h0
		MyScene As SCNSceneMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		MyView As SCNViewMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events MyControl
	#tag Event
		Sub Opening()
		  MyView = Me.View
		  
		  MyScene = New SCNSceneMBS
		  
		  MyView.scene = MyScene
		  MyView.backgroundColor = NSColorMBS.blackColor
		  MyView.autoenablesDefaultLighting = True
		  Myview.allowsCameraControl = True
		  
		  
		  CreateSphere
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
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
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackButtonCaption"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasNavigationBar"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIcon"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LargeTitleDisplayMode"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="MobileScreen.LargeTitleDisplayModes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabBarVisible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TintColor"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="ColorGroup"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
