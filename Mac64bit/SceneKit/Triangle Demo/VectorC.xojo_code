#tag Class
Protected Class VectorC
	#tag Method, Flags = &h0
		Function Blue() As double
		  return Simulation.blue/255
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(xx as double, yy as double, zz as double, col as color)
		  // Calling the overridden superclass constructor.
		  x=xx
		  y=yy
		  z= zz
		  Simulation=col
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Green() As double
		  return Simulation.Green/255
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Red() As double
		  return Simulation.red/255
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VectorValue() As SCNVector3MBS
		  return new SCNVector3MBS( x, y, z)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Simulation As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		x As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		y As double
	#tag EndProperty

	#tag Property, Flags = &h0
		z As double
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
			InitialValue=""
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Simulation"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="x"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="y"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="z"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
