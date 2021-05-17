#tag Class
Protected Class Triangle3D
	#tag Method, Flags = &h0
		Sub Constructor(pts() as vectorC, MultiColour as boolean)
		  
		  node = New SCNNodeMBS
		  Var positions(2) As SCNVector3MBS
		  
		  For i As Integer = 0 To 2
		    positions(i) = pts(i).VectorValue
		  Next
		  
		  ' describe the triangle
		  var indices() As Integer = Array(0,1,2)
		  
		  
		  'for setting up the vertex specific colour
		  ' modify these to set 
		  Var channelSize As Integer = 4 ' 
		  Var Channels As Integer = 3 ' 
		  Var coloursize As Integer = channelSize*channels
		  
		  
		  Var memColour As MemoryBlock
		  
		  If MultiColour Then memColour = New memoryBlock(ColourSize*indices.Count)
		  
		  
		  var mem As New MemoryBlock(4*indices.count)  ' for referencing the vertex
		  var offset As Integer 
		  For row As Integer = 0 To 2
		    
		    If MultiColour Then
		      ' **** i have tried setting this to single and double and using and not using an alpha.
		      memColour.SingleValue( row*coloursize )= pts(row).red
		      memColour.SingleValue( row*coloursize+channelsize )= pts(row).Green
		      memColour.SingleValue( row*coloursize+channelsize*2 )= pts(row).blue
		    End If
		    
		    mem.Int32Value(offset) = indices(row)
		    offset = offset + 4
		  Next
		  
		  Var normals(0) As SCNVector3MBS
		  normals(0)=GetSurfaceNormal( positions(0), positions(1), positions(2))
		  
		  //Construction of a geometry source from the corner coodinates 
		  var vertexSource As SCNGeometrySourceMBS = SCNGeometrySourceMBS.geometrySourceWithVertices(positions)
		  
		  //Construction of a geometry source from the normal vectors
		  var normalSource As SCNGeometrySourceMBS = SCNGeometrySourceMBS.geometrySourceWithNormals(normals)
		  
		  Const SCNGeometryPrimitiveTypeTriangles = 0
		  
		  //Construction of the geometry element with : the memory block of the coordinates of each triangle, the indication that the geometry is triangular, Specify how many triangles there are and the size of the blocks of information 
		  var element As SCNGeometryElementMBS = SCNGeometryElementMBS.geometryElementWithData(mem, SCNGeometryPrimitiveTypeTriangles, 12, 4)
		  
		  //The actual geometry then consists of the two geometry sources of the vertices and the normal vectors, 
		  //as well as the geometry element from the triangles 
		  var geometry As SCNGeometryMBS 
		  If MultiColour Then
		    Var colourSource As SCNGeometrySourceMBS =SCNGeometrySourceMBS.geometrySourceWithData( memColour, SCNGeometrySourceMBS.SCNGeometrySourceSemanticColor,3, True, channels,channelsize,0,coloursize)
		    
		    geometry = SCNGeometryMBS.geometryWithSources(Array(vertexSource, normalSource, colourSource), Array(element))
		    
		  Else
		    Geometry = SCNGeometryMBS.geometryWithSources(Array(vertexSource, normalSource), Array(element))
		    
		  End If
		  
		  
		  
		  If MultiColour=False Then
		    ' render the triangle from an average of it's three associated colours
		    Var rr, gg, bb As Double
		    
		    
		    rr = (pts(0).red+pts(1).red+pts(2).red)/3
		    gg = (pts(0).green+pts(1).Green+pts(2).green)/3
		    bb = (pts(0).blue+pts(1).blue+pts(2).blue)/3
		    
		    var theMaterial As New SCNMaterialMBS
		    theMaterial.diffuse.contents = NSColorMBS.colorWithRGB(rr,gg,bb,1)
		    
		    geometry.setMaterials Array(theMaterial)
		    ' option, the material can be set to double sided if you want it to be visible from both sides.
		  End If
		  
		  var TriangleNode As New SCNNodeMBS(geometry)
		  
		  
		  node.addChildNode TriangleNode
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CrossProduct(V1 as SCNVector3MBS, V2 as SCNVector3MBS) As SCNVector3MBS
		  Var cross As New SCNVector3MBS
		  cross.x=v1.y*v2.z-v1.z*v2.y
		  cross.y = v1.z*v2.x-v1.x*v2.z
		  cross.z = v1.x*v2.y-v1.y*v2.x
		  return cross
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetSurfaceNormal(v1 as SCNVector3MBS, v2 as SCNVector3MBS, v3 as SCNVector3MBS) As SCNVector3MBS
		  Var p1 As New SCNVector3MBS( v2.x-v1.x, v2.y-v1.y, v2.z-v1.z)
		  Var p2 As New SCNVector3MBS( v3.x-v1.x, v3.y-v1.y ,v3.z-v1.z)
		  
		  Var cross As SCNVector3MBS= CrossProduct(p1, p2)
		  normalize(cross)
		  return cross
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Normalize(v as SCNVector3MBS)
		  Var l As Double = Sqrt((v.x*v.x)+(v.y*v.y)+(v.z*v.z))
		  v.x=v.x/l
		  v.y=v.y/l
		  v.z=v.z/l
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		node As SCNNodeMBS
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
	#tag EndViewBehavior
End Class
#tag EndClass
