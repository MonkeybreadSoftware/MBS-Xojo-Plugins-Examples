#tag Class
Protected Class MyCGFunction
Inherits CGFunctionMBS
	#tag Event
		Sub Evaluate(Input as memoryblock, Output as memoryblock)
		  #if Target32Bit then
		    
		    dim inVal as Single = Input.SingleValue(0)
		    
		    Output.SingleValue(0*4) = (1.0 - inVal) * r1 + inVal * r2
		    Output.SingleValue(1*4) = (1.0 - inVal) * g1 + inVal * g2
		    Output.SingleValue(2*4) = (1.0 - inVal) * b1 + inVal * b2
		    Output.SingleValue(3*4) = (1.0 - inVal) * a1 + inVal * a2
		    
		  #else
		    
		    dim inVal as Single = Input.DoubleValue(0)
		    
		    Output.DoubleValue(0*8) = (1.0 - inVal) * r1 + inVal * r2
		    Output.DoubleValue(1*8) = (1.0 - inVal) * g1 + inVal * g2
		    Output.DoubleValue(2*8) = (1.0 - inVal) * b1 + inVal * b2
		    Output.DoubleValue(3*8) = (1.0 - inVal) * a1 + inVal * a2
		    
		    
		  #endif
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		a1 As single
	#tag EndProperty

	#tag Property, Flags = &h0
		a2 As single
	#tag EndProperty

	#tag Property, Flags = &h0
		b1 As single
	#tag EndProperty

	#tag Property, Flags = &h0
		b2 As single
	#tag EndProperty

	#tag Property, Flags = &h0
		g1 As single
	#tag EndProperty

	#tag Property, Flags = &h0
		g2 As single
	#tag EndProperty

	#tag Property, Flags = &h0
		r1 As single
	#tag EndProperty

	#tag Property, Flags = &h0
		r2 As single
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
			Name="r1"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="single"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="g1"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="single"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="b1"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="single"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="a1"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="single"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="r2"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="single"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="g2"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="single"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="b2"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="single"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="a2"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="single"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
