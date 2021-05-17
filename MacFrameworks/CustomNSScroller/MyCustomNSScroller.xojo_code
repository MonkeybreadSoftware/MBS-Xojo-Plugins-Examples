#tag Class
Protected Class MyCustomNSScroller
Inherits CustomNSScrollerMBS
	#tag Event
		Sub drawArrow(g as NSGraphicsMBS, Arrow as integer, highlight as boolean)
		  dim w,h,dx As Integer
		  
		  if Arrow=NSScrollerIncrementArrow then
		    if IncrArrowImage<>Nil then
		      // Arrow size and position
		      IncrArrowRect=Self.rectForPart( NSScrollerIncrementArrow )
		      // Draw arrow image
		      w=IncrArrowImage.width
		      h=IncrArrowImage.height
		      if highlight then dx=w/2
		      g.drawInRect IncrArrowImage, DecrArrowRect.X,DecrArrowRect.Y, w,h, dx,0, w,h, NSGraphicsMBS.NSCompositeSourceOver, 1.0
		    end if
		    
		  elseif Arrow=NSScrollerDecrementArrow then
		    if DecrArrowImage<>Nil then
		      // Arrow size and position
		      DecrArrowRect=Self.rectForPart( NSScrollerDecrementArrow )
		      // Draw arrow image
		      w=IncrArrowImage.width
		      h=IncrArrowImage.height
		      if highlight then dx=w/2
		      g.drawInRect IncrArrowImage, DecrArrowRect.X,DecrArrowRect.Y, w,h, dx,0, w,h, NSGraphicsMBS.NSCompositeSourceOver, 1.0
		    end if
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub drawKnob(g as NSGraphicsMBS)
		  // Knob size and position
		  knobRect=Self.rectForPart( NSScrollerKnob )
		  
		  // Draw knob image
		  if knobImage<>Nil then
		    dim w,h,hm,rh As Integer
		    w=knobImage.width
		    h=knobImage.height
		    hm=Floor( h/2 )
		    rh=knobRect.Height
		    if rh>h then
		      g.drawInRect knobImage, knobRect.X,knobRect.Y, w,hm, 0,0, w,hm, NSGraphicsMBS.NSCompositeSourceOver, 1.0 // bottom part
		      g.drawInRect knobImage, knobRect.X,knobRect.Y+hm, w,rh-(hm*2), 0,hm, w,1, NSGraphicsMBS.NSCompositeSourceOver, 1.0 // middle part
		      g.drawInRect knobImage, knobRect.X,knobRect.Y+rh-hm, w,hm, 0,h-hm, w,hm, NSGraphicsMBS.NSCompositeSourceOver, 1.0 // top part
		    end if
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub drawKnobSlotInRect(g as NSGraphicsMBS, slotRect as NSRectMBS, highlight as boolean)
		  // Draw knob slot image
		  if knobSlotImage<>Nil then
		    dim w,h,hm,rh As Integer
		    w=knobSlotImage.width
		    h=knobSlotImage.height
		    hm=Floor( h/2 )
		    rh=slotRect.Height
		    
		    if BackColor<>Nil then
		      g.SetColor BackColor
		      g.fillRect slotRect.X, slotRect.Y, slotRect.Width, slotRect.Height
		    end if
		    
		    if rh>h then
		      g.drawInRect knobSlotImage, slotRect.X,slotRect.Y, w,hm, 0,0, w,hm, NSGraphicsMBS.NSCompositeSourceOver, 1.0 // bottom part
		      g.drawInRect knobSlotImage, slotRect.X,slotRect.Y+hm, w,rh-(hm*2), 0,hm, w,1, NSGraphicsMBS.NSCompositeSourceOver, 1.0 // middle part
		      g.drawInRect knobSlotImage, slotRect.X,slotRect.Y+rh-hm, w,hm, 0,h-hm, w,hm, NSGraphicsMBS.NSCompositeSourceOver, 1.0 // top part
		    end if
		  end if
		End Sub
	#tag EndEvent


	#tag Note, Name = Thanks
		
		
		Thanks to David Della Rocca <dellarocca.david@free.fr> for sharing this example with us.
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		BackColor As NSColorMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		DecrArrowImage As NSImageMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private DecrArrowRect As NSRectMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		IncrArrowImage As NSImageMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private IncrArrowRect As NSRectMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		knobImage As NSImageMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private knobRect As NSRectMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		knobSlotImage As NSImageMBS
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
