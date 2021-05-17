#tag Class
Protected Class NewPDFPageMBS
Inherits PDFPageMBS
	#tag Event
		Sub drawRect(box as integer, g as NSGraphicsMBS)
		  // draw custom page content
		  
		  if page <> nil then
		    // draw old PDF page
		    page.drawWithBox(box)
		  end if
		  
		  if overlay isa NSImageMBS then
		    // draw overlay image
		    dim image as NSImageMBS = overlay
		    dim b as NSRectMBS = boundsForBox(box)
		    g.drawInRect(image, 0, 0, b.Width, b.Height, 0, 0, image.width, image.height, g.NSCompositeSourceOver, 1.0)
		  end if
		  
		  if overlay isa PDFPageMBS then
		    // draw overlay page
		    dim p as PDFPageMBS = overlay
		    p.drawWithBox(box)
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		overlay As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		page As PDFPageMBS
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
