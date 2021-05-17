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
   Title           =   "Free form: cube"
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
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub cube()
		  // Following the tutorial: https://github.com/d-ronnqvist/blogpost-codesample-CustomGeometry/blob/master/CustomGeometry/CustomGeometryView.m
		  
		  Dim cubeSide As Double = 15.0
		  Dim halfSide As Double = cubeSide / 2
		  
		  //The 8 corner coordinates
		  //We repeat them because we want to use them in different ways 
		  Dim positions() As SCNVector3MBS
		  positions.append New SCNVector3MBS(-halfSide, -halfSide,  halfSide)
		  positions.append New SCNVector3MBS( halfSide, -halfSide,  halfSide)
		  positions.append New SCNVector3MBS(-halfSide, -halfSide, -halfSide)
		  positions.append New SCNVector3MBS( halfSide, -halfSide, -halfSide)
		  positions.append New SCNVector3MBS(-halfSide,  halfSide,  halfSide)
		  positions.append New SCNVector3MBS( halfSide,  halfSide,  halfSide)
		  positions.append New SCNVector3MBS(-halfSide,  halfSide, -halfSide)
		  positions.append New SCNVector3MBS(halfSide, halfSide, - halfSide)
		  
		  // repeat exactly the same
		  positions.append New SCNVector3MBS(-halfSide, -halfSide,  halfSide)
		  positions.append New SCNVector3MBS( halfSide, -halfSide,  halfSide)
		  positions.append New SCNVector3MBS(-halfSide, -halfSide, -halfSide)
		  positions.append New SCNVector3MBS( halfSide, -halfSide, -halfSide)
		  positions.append New SCNVector3MBS(-halfSide,  halfSide,  halfSide)
		  positions.append New SCNVector3MBS( halfSide,  halfSide,  halfSide)
		  positions.append New SCNVector3MBS(-halfSide,  halfSide, -halfSide)
		  positions.append New SCNVector3MBS( halfSide,  halfSide, -halfSide)
		  
		  // repeat exactly the same
		  positions.append New SCNVector3MBS(-halfSide, -halfSide,  halfSide)
		  positions.append New SCNVector3MBS( halfSide, -halfSide,  halfSide)
		  positions.append New SCNVector3MBS(-halfSide, -halfSide, -halfSide)
		  positions.append New SCNVector3MBS( halfSide, -halfSide, -halfSide)
		  positions.append New SCNVector3MBS(-halfSide,  halfSide,  halfSide)
		  positions.append New SCNVector3MBS(halfSide, halfSide, halfSide)
		  positions.append New SCNVector3MBS(-halfSide,  halfSide, -halfSide)
		  positions.append New SCNVector3MBS( halfSide,  halfSide, -halfSide)
		  
		  
		  //Description of the individual triangles that together construct the cube  
		  
		  Dim indices() As Integer
		  // bottom
		  indices.append 0
		  indices.append 2
		  indices.append 1
		  
		  indices.append 1
		  indices.append 2
		  indices.append 3
		  
		  // back
		  indices.append 10 //2
		  indices.append 14//6
		  indices.append 11//3
		  
		  indices.append 11//3
		  indices.append 14//6
		  indices.append 15//7
		  
		  // left
		  indices.append 16//0
		  indices.append 20//4
		  indices.append 18//2
		  
		  indices.append 18//2
		  indices.append 20//4
		  indices.append 22//6
		  
		  // right
		  indices.append 17//1
		  indices.append 19//3
		  indices.append 21//5
		  
		  indices.append 19//3
		  indices.append 23//7
		  indices.append 21//5
		  
		  // front
		  indices.append 8//0
		  indices.append 9//1
		  indices.append 12//4
		  
		  indices.append 9//1
		  indices.append 13//5
		  indices.append 12//4
		  
		  // top
		  indices.append 4
		  indices.append 5
		  indices.append 6
		  
		  indices.append 5
		  indices.append 7
		  indices.append 6
		  
		  
		  
		  Dim mem As New MemoryBlock(4 * 36)
		  Dim offset As Integer 
		  For row As Integer = 0 To indices.Ubound
		    mem.Int32Value(offset) = indices(row)
		    offset = offset + 4
		  Next
		  
		  //Determining the normal vectors
		  Dim normals(23) As SCNVector3MBS
		  
		  normals(0) = New SCNVector3MBS(0, -1, 0)
		  normals(1) = New SCNVector3MBS(0, -1, 0)
		  normals(2) = New SCNVector3MBS(0, -1, 0)
		  normals(3) = New SCNVector3MBS(0, -1, 0)
		  
		  normals(4) = New SCNVector3MBS(0, 1, 0)
		  normals(5) = New SCNVector3MBS(0, 1, 0)
		  normals(6) = New SCNVector3MBS(0, 1, 0)
		  normals(7) = New SCNVector3MBS(0, 1, 0)
		  
		  normals(8) = New SCNVector3MBS(0, 0, 1)
		  normals(9) = New SCNVector3MBS(0, 0, 1)
		  normals(10) = New SCNVector3MBS(0, 0, -1)
		  normals(11) = New SCNVector3MBS(0, 0, -1)
		  
		  normals(12) = New SCNVector3MBS(0, 0, 1)
		  normals(13) = New SCNVector3MBS(0, 0, 1)
		  normals(14) = New SCNVector3MBS(0, 0, -1)
		  normals(15) = New SCNVector3MBS(0, 0, -1)
		  
		  normals(16) = New SCNVector3MBS(-1, 0, 0)
		  normals(17) = New SCNVector3MBS(1, 0, 0)
		  normals(18) = New SCNVector3MBS(-1, 0, 0)
		  normals(19) = New SCNVector3MBS(1, 0, 0)
		  
		  normals(20) = New SCNVector3MBS(-1, 0, 0)
		  normals(21) = New SCNVector3MBS(1, 0, 0)
		  normals(22) = New SCNVector3MBS(-1, 0, 0)
		  normals(23) = New SCNVector3MBS(1, 0, 0)
		  
		  
		  //Construction of a geometry source from the corner coodinates 
		  Dim vertexSource As SCNGeometrySourceMBS = SCNGeometrySourceMBS.geometrySourceWithVertices(positions)
		  
		  //Construction of a geometry source from the normal vectors
		  Dim normalSource As SCNGeometrySourceMBS = SCNGeometrySourceMBS.geometrySourceWithNormals(normals)
		  
		  Const SCNGeometryPrimitiveTypeTriangles = 0
		  
		  //Construction of the geometry element with : the memory block of the coordinates of each triangle, the indication that the geometry is triangular, Specify how many triangles there are and the size of the blocks of information 
		  Dim element As SCNGeometryElementMBS = SCNGeometryElementMBS.geometryElementWithData(mem, SCNGeometryPrimitiveTypeTriangles, 12, 4)
		  
		  //The actual geometry then consists of the two geometry sources of the vertices and the normal vectors, 
		  //as well as the geometry element from the triangles 
		  Dim geometry As SCNGeometryMBS = SCNGeometryMBS.geometryWithSources(Array(vertexSource, normalSource), Array(element))
		  
		  
		  // Then we can use the geometry as usual 
		  // Give the cube a red colored material
		  Dim redMaterial As New SCNMaterialMBS
		  redMaterial.diffuse.contents = NSColorMBS.redColor
		  
		  geometry.setMaterials Array(redMaterial)
		  
		  
		  Dim NodeOne As New SCNNodeMBS(geometry)
		  MyScene.rootNode.addChildNode(NodeOne)
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Camera As SCNCameraMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		CameraNode As SCNNodeMBS
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
		  //Initializing my environment
		  MyView = Me.View 
		  MyScene = New SCNSceneMBS
		  MyView.scene = MyScene
		  
		  myView.autoenablesDefaultLighting = False
		  MyView.allowsCameraControl = True
		  myView.backgroundColor = NSColorMBS.whiteColor
		  
		  //Initializing  the camera
		  CameraNode = New SCNNodeMBS
		  Camera = New SCNCameraMBS
		  CameraNode.Camera = Camera
		  Camera.zFar = 300
		  Camera.zNear = 5
		  //Starting position of the camera
		  CameraNode.Position = New SCNVector3MBS(50, 70, -30)
		  CameraNode.orientation = New SCNVector4MBS(-0.38458, 0.767000, 0.211688, 0.467966)
		  MyView.pointOfView = CameraNode
		  
		  
		  //Add ambient light source
		  Dim AmbientLight As New SCNNodeMBS
		  AmbientLight.light = New SCNLightMBS
		  AmbientLight.Light.Type = SCNLightMBS.SCNLightTypeAmbient
		  AmbientLight.Light.Intensity = 400
		  AmbientLight.light.Color = NSColorMBS.colorWithWhite(0.75, 1)
		  MyScene.rootNode.addChildNode(AmbientLight)
		  
		  //Add omni light source
		  Dim OmniLight1 As New SCNNodeMBS
		  OmniLight1.Position = New SCNVector3MBS(10, 10, -10)
		  OmniLight1.light = New SCNLightMBS
		  OmniLight1.Light.Type = SCNLightMBS.SCNLightTypeOmni
		  OmniLight1.Light.Intensity = 2000
		  OmniLight1.light.Color = NSColorMBS.colorWithWhite(0.75, 1)
		  MyScene.rootNode.addChildNode(OmniLight1)
		  
		  //Add omni light source
		  Dim OmniLight2 As New SCNNodeMBS
		  OmniLight2.Position = New SCNVector3MBS(10, 10, 10)
		  OmniLight2.light = New SCNLightMBS
		  OmniLight2.Light.Type = SCNLightMBS.SCNLightTypeOmni
		  OmniLight2.Light.Intensity = 2000
		  OmniLight2.light.Color = NSColorMBS.colorWithWhite(0.75, 1)
		  MyScene.rootNode.addChildNode(OmniLight2)
		  
		  //Create the cube 
		  cube
		  
		  
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
