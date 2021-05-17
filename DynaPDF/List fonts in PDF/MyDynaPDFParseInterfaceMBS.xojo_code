#tag Class
Protected Class MyDynaPDFParseInterfaceMBS
Inherits DynaPDFParseInterfaceMBS
	#tag Event
		Sub SetFont(ObjectPtr as integer, fontType as integer, Embedded as boolean, FontName as string, Style as integer, FontSize as double, FontHandle as integer, FontInfo as DynaPDFFontInfoMBS)
		  if fonts.IndexOf(FontName)<0 then
		    fonts.Append FontName
		    window1.Listbox1.AddRow FontName
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		Counter As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		fonts(-1) As string
	#tag EndProperty

	#tag Property, Flags = &h0
		pdf As dynaPDFmbs
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
	#tag EndViewBehavior
End Class
#tag EndClass
