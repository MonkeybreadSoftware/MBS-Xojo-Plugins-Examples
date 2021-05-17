#tag Module
Protected Module Util
	#tag Method, Flags = &h0
		Sub AddOval(extends c as CGContextMBS, center as CGPOintMBS, a as single, b as single)
		  dim pi as single
		  
		  pi=ACos(0)*2.0
		  
		  c.SaveGState
		  c.TranslateCTM center.x, center.y
		  c.ScaleCTM a,b
		  c.MoveToPoint 1,0
		  c.AddArc 0, 0, 1, 0.0, 2*pi, false
		  
		  c.ClosePath
		  c.RestoreGState
		  
		End Sub
	#tag EndMethod


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
			InitialValue="2147483648"
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
End Module
#tag EndModule
