#tag Module
Protected Module DynaPDFAddon
	#tag Method, Flags = &h0
		Function AngleRectangle(extends pdf as DynaPDFMBS, Angle as Double, PosX as Double, PosY as Double, Radius as Double, YOrigin as double, Width as double, Height as Double, FillMode as Integer) As Boolean
		  const RAD = 0.017453292519943295769236907684886
		  call pdf.SaveGraphicState
		  
		  dim matrix as DynapdfMatrixMBS
		  call pdf.GetMatrix(matrix)
		  
		  Angle = Angle * RAD
		  dim si as double = sin(Angle)
		  dim co as double = cos(Angle)
		  dim d as Double
		  dim PageCoords as integer = pdf.GetPageCoords
		  
		  
		  if PageCoords = pdf.kpcTopDown then
		    matrix.RightMultiply(co, -si, si, co, PosX, PosY)
		    d = -1.0
		  else
		    matrix.RightMultiply(co, si, -si, co, PosX, PosY)
		    d = 1.0
		  end if
		  
		  'dim m as new DynapdfMatrixMBS(1.0, 0.0, 0.0, d, Radius, YOrigin)
		  
		  matrix.RightMultiply(1.0, 0.0, 0.0, d, Radius, YOrigin)
		  
		  call pdf.SetMatrix(matrix)
		  call pdf.Rectangle(0, 0, Width, Height, FillMode)
		  
		  
		  call pdf.RestoreGraphicState
		  
		End Function
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
End Module
#tag EndModule
