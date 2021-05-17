#tag Class
Protected Class MyView
Inherits CustomNSViewMBS
	#tag Event
		Function acceptsFirstMouse(e as NSEventMBS) As boolean
		  Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Function acceptsFirstResponder() As boolean
		  Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub DrawRect(g as NSGraphicsMBS, left as double, top as double, width as double, height as double)
		  g.setColor NSColorMBS.clearColor
		  g.fillRect(0,0,500,500, g.NSCompositeCopy)
		  
		  g.drawatpoint pic, 0, 0, 0, 0, 500, 500, g.NSCompositeCopy, 1.0
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function isOpaque() As boolean
		  Return false
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		pic As NSImageMBS
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
