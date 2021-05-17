#tag Class
Protected Class MyCustomNSView
Inherits CustomNSViewMBS
	#tag Event
		Function acceptsFirstResponder() As boolean
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Function drawFocusRingMask(g as NSGraphicsMBS) As boolean
		  // Here we draw the mask used for the focus ring.
		  // It can be a shape, a picture or a bezier path.
		  
		  g.SetColor NSColorMBS.blackColor
		  g.fillRect 0,frameheight/4,framewidth,frameheight/2
		  g.fillRect framewidth/4,0,framewidth/2,frameheight
		  
		  Return True
		  
		  // Execute Self.noteFocusRingMaskChanged if you change
		  // the shape of the focus ring. Then it will be updated.
		End Function
	#tag EndEvent

	#tag Event
		Sub DrawRect(g as NSGraphicsMBS, left as double, top as double, width as double, height as double)
		  g.SetColor NSColorMBS.whiteColor
		  
		  g.fillRect 0,frameheight/4,framewidth,frameheight/2
		  g.fillRect framewidth/4,0,framewidth/2,frameheight
		End Sub
	#tag EndEvent

	#tag Event
		Function focusRingMaskBounds() As NSRectMBS
		  Return Self.bounds
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
