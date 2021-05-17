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
		  g.setFillColor NSColorMBS.redColor.colorWithAlphaComponent(0.5)
		  g.fillRect left, top, width, height, g.NSCompositeSourceOver
		End Sub
	#tag EndEvent

	#tag Event
		Function otherMouseDown(e as NSEventMBS, x as double, y as double) As boolean
		  MsgBox "Clicked in MyView."
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
