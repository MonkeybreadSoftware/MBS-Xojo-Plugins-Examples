#tag Class
Protected Class MyOverlayRenderer
Inherits MKCustomOverlayRendererMBS
	#tag Event
		Function canDrawMapRect(mapRect as MKMapRectMBS, zoomScale as Double) As Boolean
		  Return True
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub DrawMapRect(mapRect as MKMapRectMBS, zoomScale as Double, context as CGContextMBS)
		  // change coordinate system to show just our area
		  Dim rect As CGRectMBS = Self.RectForMapRect(overlay.boundingMapRect)
		  context.ScaleCTM(1.0, -1.0)
		  context.TranslateCTM(0.0, -rect.size.height)
		  
		  // and fill it all in red
		  context.SetRGBFillColor 1,0,0,0.3
		  context.FillRect rect
		  
		  context.Flush
		  
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
	#tag EndViewBehavior
End Class
#tag EndClass
