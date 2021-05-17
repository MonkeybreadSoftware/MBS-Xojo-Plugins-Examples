#tag Class
Protected Class MyDynaPDFParseInterfaceMBS
Inherits DynaPDFParseInterfaceMBS
	#tag Event
		Function ApplyPattern(ObjectPtr as integer, Type as integer, PatternPtr as integer) As integer
		  Write CurrentMethodName
		End Function
	#tag EndEvent

	#tag Event
		Function BeginLayer(OCHandle as integer, InVisible as boolean) As integer
		  dim s as string
		  
		  if InVisible then
		    s = ", visible"
		  else
		    s = ", non visible"
		  end if
		  
		  Write CurrentMethodName 
		End Function
	#tag EndEvent

	#tag Event
		Function BeginPattern(ObjectPtr as integer, Fill as Boolean, PatternType as integer, BBox as DynaPDFRectMBS, Matrix as DynaPDFMatrixMBS, XStep as double, YStep as double) As integer
		  Write CurrentMethodName
		End Function
	#tag EndEvent

	#tag Event
		Function BeginTemplate(ObjectPtr as integer, Handle as integer, BBox as DynaPDFRectMBS, Matrix as DynaPDFMatrixMBS) As integer
		  Write CurrentMethodName
		End Function
	#tag EndEvent

	#tag Event
		Function BezierTo1(ObjectPtr as integer, x1 as double, y1 as double, x3 as double, y3 as double) As integer
		  Write CurrentMethodName+" "+str(x1)+"/"+str(y1)+" to "+str(x3)+"/"+str(y3)
		End Function
	#tag EndEvent

	#tag Event
		Function BezierTo2(ObjectPtr as integer, x2 as double, y2 as double, x3 as double, y3 as double) As integer
		  Write CurrentMethodName+" "+str(x2)+"/"+str(y2)+" to "+str(x3)+"/"+str(y3)
		End Function
	#tag EndEvent

	#tag Event
		Function BezierTo3(ObjectPtr as integer, x1 as double, y1 as double, x2 as double, y2 as double, x3 as double, y3 as double) As integer
		  Write CurrentMethodName+" "+str(x1)+"/"+str(y1)+" to "+str(x2)+"/"+str(y2)+" to "+str(x3)+"/"+str(y3)
		End Function
	#tag EndEvent

	#tag Event
		Function ClipPath(ObjectPtr as integer, EvenOdd as boolean, Mode as integer) As integer
		  Write CurrentMethodName
		End Function
	#tag EndEvent

	#tag Event
		Function ClosePath(ObjectPtr as integer, Mode as integer) As integer
		  Write CurrentMethodName
		End Function
	#tag EndEvent

	#tag Event
		Function DrawShading(ObjectPtr as integer, Type as integer, Shading as integer) As integer
		  Write CurrentMethodName
		End Function
	#tag EndEvent

	#tag Event
		Sub EndLayer(OCHandle as integer, InVisible as boolean)
		  Write CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub EndPattern()
		  Write CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub EndTemplate()
		  Write CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Function InsertImage(image as DynaPDFImageMBS) As integer
		  Write CurrentMethodName
		End Function
	#tag EndEvent

	#tag Event
		Function LineTo(ObjectPtr as integer, x as double, y as double) As integer
		  Write CurrentMethodName+" "+str(x)+"/"+str(y)
		  
		End Function
	#tag EndEvent

	#tag Event
		Function MoveTo(ObjectPtr as integer, x as double, y as double) As integer
		  Write CurrentMethodName+" "+str(x)+"/"+str(y)
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub MulMatrix(ObjectPtr as integer, matrix as DynaPDFMatrixMBS)
		  Write CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Function Rectangle(ObjectPtr as integer, x as double, y as double, w as double, h as double) As integer
		  Write CurrentMethodName+" "+str(x)+"/"+str(y)+" with size "+str(w)+"/"+str(h)
		  
		End Function
	#tag EndEvent

	#tag Event
		Function RestoreGraphicState() As integer
		  prefix = mid(prefix, 4)
		  
		  Write CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function SaveGraphicState() As integer
		  Write CurrentMethodName
		  prefix = prefix + "   "
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub SetCharSpacing(ObjectPtr as integer, Value as double)
		  Write CurrentMethodName+" "+str(value)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub SetExtGState(ObjectPtr as integer, GS as DynaPDFExtGState2MBS)
		  Write CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub SetFillColor(ObjectPtr as integer, NumComps as integer, Color1 as double, Color2 as double, Color3 as double, Color4 as double, Colors() as double, ColorspaceType as integer, ColorSpace as DynaPDFColorSpaceMBS)
		  dim lines(-1) as string
		  
		  for i as integer = 0 to NumComps-1
		    lines.Append str(colors(i))
		  next
		  
		  Write CurrentMethodName+" "+Join(lines, ", ")
		End Sub
	#tag EndEvent

	#tag Event
		Sub SetFont(ObjectPtr as integer, fontType as integer, Embedded as boolean, FontName as string, Style as integer, FontSize as double, FontHandle as integer, FontInfo as DynaPDFFontInfoMBS)
		  Write CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub SetLeading(ObjectPtr as integer, Value as double)
		  Write CurrentMethodName+" "+str(value)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub SetLineCapStyle(ObjectPtr as integer, Style as integer)
		  Write CurrentMethodName+" "+str(style)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub SetLineDashPattern(ObjectPtr as integer, dash() as Double, NumValues as integer, Phase as Double)
		  Write CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub SetLineJoinStyle(ObjectPtr as integer, Style as integer)
		  Write CurrentMethodName+" "+str(Style)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub SetLineWidth(ObjectPtr as integer, Value as double)
		  Write CurrentMethodName+" "+str(value)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub SetMiterLimit(ObjectPtr as integer, Value as double)
		  Write CurrentMethodName+" "+str(value)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub SetStrokeColor(ObjectPtr as integer, NumComps as integer, Color1 as double, Color2 as double, Color3 as double, Color4 as double, Colors() as double, ColorspaceType as integer, ColorSpace as DynaPDFColorSpaceMBS)
		  dim lines(-1) as string
		  
		  for i as integer = 0 to NumComps-1
		    lines.Append str(colors(i))
		  next
		  
		  Write CurrentMethodName+" "+Join(lines, ", ")
		End Sub
	#tag EndEvent

	#tag Event
		Sub SetTextDrawMode(ObjectPtr as integer, Mode as integer)
		  Write CurrentMethodName+" "+str(mode)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub SetTextScale(ObjectPtr as integer, Value as double)
		  Write CurrentMethodName+" "+str(value)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub SetWordSpacing(ObjectPtr as integer, Value as double)
		  Write CurrentMethodName+" "+str(value)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function ShowTextArrayA(ObjectPtr as integer, Matrix as DynaPDFMatrixMBS, Kerning() as DynaPDFTextRecordAMBS, Count as integer, Width as double) As integer
		  dim texts() as string
		  for each k as DynaPDFTextRecordAMBS in Kerning
		    texts.Append k.Text
		  next
		  
		  Write CurrentMethodName+" "+Join(texts)
		  
		End Function
	#tag EndEvent

	#tag Event
		Function ShowTextArrayW(Source() as DynaPDFTextRecordAMBS, Matrix as DynaPDFMatrixMBS, Kerning() as DynaPDFTextRecordWMBS, Count as integer, Width as double, Decoded as boolean) As integer
		  dim texts() as string
		  for each k as DynaPDFTextRecordWMBS in Kerning
		    texts.Append k.Text
		  next
		  
		  Write CurrentMethodName+" "+Join(texts)
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Write(s as string)
		  const cn = "MyDynaPDFParseInterfaceMBS."
		  if left(s,len(cn)) = cn then
		    s = mid(s, len(cn)+1)
		  end if
		  w.List.AddRow prefix+s
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Counter As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		dest As folderitem
	#tag EndProperty

	#tag Property, Flags = &h0
		pdf As dynaPDFmbs
	#tag EndProperty

	#tag Property, Flags = &h0
		prefix As string
	#tag EndProperty

	#tag Property, Flags = &h0
		w As window1
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
			Name="Counter"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="prefix"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
