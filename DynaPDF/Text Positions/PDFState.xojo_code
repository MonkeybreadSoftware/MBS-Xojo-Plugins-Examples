#tag Class
Protected Class PDFState
	#tag Method, Flags = &h0
		Sub constructor()
		  matrix = new DynaPDFMatrixMBS // makes new identity matrix
		  FontSize = 1.0
		  CharSpacing = 0.0
		  TextDrawMode = DynaPDFMBS.kdmNormal
		  TextScale = 100.0
		  WordSpacing = 0.0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(other as PDFState)
		  self.CharSpacing  = other.CharSpacing
		  self.ExtGState    = other.ExtGState
		  self.FontHandle   = other.FontHandle
		  self.FontInfo     = other.FontInfo
		  self.FontName     = other.FontName
		  self.FontSize     = other.FontSize
		  self.FontStyle    = other.FontStyle
		  self.MiterLimit   = other.MiterLimit
		  self.textDrawMode = other.textDrawMode
		  self.TextScale    = other.TextScale
		  self.WordSpacing  = other.WordSpacing
		  self.matrix       = new DynaPDFMatrixMBS(other.matrix) // copy
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CharSpacing As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		ExtGState As DynaPDFExtGState2MBS
	#tag EndProperty

	#tag Property, Flags = &h0
		FontHandle As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		FontInfo As DynaPDFFontInfoMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		FontName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		FontSize As double
	#tag EndProperty

	#tag Property, Flags = &h0
		FontStyle As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Leading As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		matrix As DynaPDFMatrixMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		MiterLimit As double
	#tag EndProperty

	#tag Property, Flags = &h0
		textDrawMode As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		TextScale As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		WordSpacing As Double
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
		#tag ViewProperty
			Name="CharSpacing"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="textDrawMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="WordSpacing"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextScale"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MiterLimit"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Leading"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontStyle"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontSize"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FontHandle"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
