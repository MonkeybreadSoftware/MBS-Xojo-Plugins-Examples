#tag Class
Protected Class MyDynaPDFParseInterfaceMBS
Inherits DynaPDFParseInterfaceMBS
	#tag Event
		Function BeginTemplate(ObjectPtr as integer, Handle as integer, BBox as DynaPDFRectMBS, Matrix as DynaPDFMatrixMBS) As integer
		  If matrix <> Nil Then
		    current.matrix = current.matrix * matrix
		  End If
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub MulMatrix(ObjectPtr as integer, matrix as DynaPDFMatrixMBS)
		  If matrix <> Nil Then
		    current.matrix = current.matrix * matrix
		  Else
		    Break // should not happen
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function RestoreGraphicState() As integer
		  current = states.pop
		  
		End Function
	#tag EndEvent

	#tag Event
		Function SaveGraphicState() As integer
		  states.Append current
		  current = new PDFState(Current)
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub SetCharSpacing(ObjectPtr as integer, Value as double)
		  current.CharSpacing = value
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub SetExtGState(ObjectPtr as integer, GS as DynaPDFExtGState2MBS)
		  current.ExtGState = gs
		End Sub
	#tag EndEvent

	#tag Event
		Sub SetFont(ObjectPtr as integer, fontType as integer, Embedded as boolean, FontName as string, Style as integer, FontSize as double, FontHandle as integer, FontInfo as DynaPDFFontInfoMBS)
		  current.FontName   = FontName
		  current.FontStyle  = Style
		  current.FontSize   = FontSize
		  current.FontInfo   = FontInfo
		  current.FontHandle = FontHandle
		End Sub
	#tag EndEvent

	#tag Event
		Sub SetLeading(ObjectPtr as integer, Value as double)
		  current.Leading = value
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub SetMiterLimit(ObjectPtr as integer, Value as double)
		  current.MiterLimit = value
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub SetTextDrawMode(ObjectPtr as integer, Mode as integer)
		  current.textDrawMode = mode
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub SetTextScale(ObjectPtr as integer, Value as double)
		  current.TextScale = value
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub SetWordSpacing(ObjectPtr as integer, Value as double)
		  current.WordSpacing = value
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function ShowTextArrayA(ObjectPtr as integer, Matrix as DynaPDFMatrixMBS, Kerning() as DynaPDFTextRecordAMBS, Count as integer, Width as double) As integer
		  dim t as new PDFText
		  
		  t.State = new PDFState(current)
		  t.Count = Count
		  t.Width = Width
		  t.KerningA = Kerning
		  t.Matrix = matrix
		  
		  texts.Append t
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(p as MyDynaPDFMBS)
		  self.current = new PDFState
		  self.pdf = p
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		current As PDFState
	#tag EndProperty

	#tag Property, Flags = &h0
		pdf As dynaPDFmbs
	#tag EndProperty

	#tag Property, Flags = &h0
		States() As PDFState
	#tag EndProperty

	#tag Property, Flags = &h0
		Texts() As PDFText
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
	#tag EndViewBehavior
End Class
#tag EndClass
