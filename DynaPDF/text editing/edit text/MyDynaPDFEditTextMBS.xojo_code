#tag Class
Protected Class MyDynaPDFEditTextMBS
Inherits DynaPDFEditTextMBS
	#tag Event
		Function PrepareWrite(M as DynaPDFMatrixMBS, text as string, FillCS as Integer, FillColor as UInt32, StrokeCS as Integer, StrokeColor as UInt32, FontSize as double, x as double, y as double, w as double, h as double, font as DynaPDFFontMBS) As boolean
		  call parent.SetFillColorSpace parent.kcsDeviceRGB
		  call parent.SetFillColor parent.kPDF_RED
		  call parent.SetStrokeColor parent.kPDF_RED
		  
		  Return false // allow text drawing
		  
		End Function
	#tag EndEvent


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
