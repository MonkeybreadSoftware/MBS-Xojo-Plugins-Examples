#tag Class
Protected Class MyPDFPageMBS
Inherits PDFPageMBS
	#tag Event
		Sub drawRect(box as integer, g as NSGraphicsMBS)
		  
		  transformContextForBox(box)
		  
		  g.SetColorRGB 1.0, 0.0, 0.0, 1.0
		  g.fillRect 100, 100, 100, 100
		  
		  dim d as new Dictionary
		  d.Value(NSAttributedStringMBS.NSFontAttributeName) = NSFontMBS.fontWithName("Zapfino", 50)
		  
		  g.drawAtPoint("Hello World", new NSPointMBS(100, 600), d)
		  
		  
		  g.drawAtPoint("Hello World", new NSPointMBS(100, 500))
		  
		End Sub
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
