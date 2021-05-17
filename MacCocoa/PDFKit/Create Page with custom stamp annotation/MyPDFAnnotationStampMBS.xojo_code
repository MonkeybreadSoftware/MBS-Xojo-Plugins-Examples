#tag Class
Protected Class MyPDFAnnotationStampMBS
Inherits PDFAnnotationStampMBS
	#tag Event
		Function drawWithBox(box as integer, g as NSGraphicsMBS) As boolean
		  dim p as PDFPageMBS = me.page
		  
		  if p<>nil then
		    p.transformContextForBox box
		  end if
		  
		  // set clipping path
		  dim path as NSBezierPathMBS = NSBezierPathMBS.bezierPathWithRect(self.bounds)
		  g.setClip(path)
		  
		  // draw a blue rectangle
		  dim b as NSRectMBS = me.bounds
		  g.setFillColor NSColorMBS.blueColor
		  g.fillRect b
		  
		  g.setFillColor NSColorMBS.blackColor
		  g.drawAtPoint "Annotation", NSMakePointMBS(b.x+10, b.y + 20)
		  
		  // return true to disable the default drawing from PDFKit
		  Return true
		  
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
