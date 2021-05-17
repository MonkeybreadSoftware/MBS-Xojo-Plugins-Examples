#tag Class
Protected Class CocoaWindowButtons
Inherits CustomNSViewMBS
	#tag Event
		Function acceptsFirstMouse(e as NSEventMBS) As boolean
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Function acceptsFirstResponder() As boolean
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Function canBecomeKeyView() As boolean
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub DrawRect(g as NSGraphicsMBS, left as double, top as double, width as double, height as double)
		  g.saveGraphicsState
		  
		  dim dx,dy As Integer
		  Active=window.isKeyWindow
		  
		  if ButtonImage<>Nil then
		    if Dirty then dx=AppearenceDX+btWidth else dx=AppearenceDX
		    if Active and ButtonCloseEnabled then
		      if clicked=0 then
		        dy=btHeight*2
		      elseif hover=0 then
		        dy=btHeight*3
		      else
		        dy=btHeight*4
		      end if
		    elseif Not Active then
		      dy=0
		    else
		      dy=btHeight
		    end if
		    g.drawInRect ButtonImage, btLeft,btTop, btWidth,btHeight, dx,dy, btWidth,btHeight, NSGraphicsMBS.NSCompositeSourceAtop, 1.0
		    
		    dx=AppearenceDX+(btWidth*2)
		    if Active and ButtonMiniaturizeEnabled then
		      if clicked=1 then
		        dy=btHeight*2
		      elseif hover=0 then
		        dy=btHeight*3
		      else
		        dy=btHeight*4
		      end if
		    elseif Not Active then
		      dy=0
		    else
		      dy=btHeight
		    end if
		    g.drawInRect ButtonImage, btLeft+20,btTop, btWidth,btHeight, dx,dy, btWidth,btHeight, NSGraphicsMBS.NSCompositeSourceAtop, 1.0
		    
		    dx=AppearenceDX+(btWidth*3)
		    if Active and ButtonZoomEnabled then
		      if clicked=2 then
		        dy=btHeight*2
		      elseif hover=0 then
		        dy=btHeight*3
		      else
		        dy=btHeight*4
		      end if
		    elseif Not Active then
		      dy=0
		    else
		      dy=btHeight
		    end if
		    g.drawInRect ButtonImage, btLeft+40,btTop, btWidth,btHeight, dx,dy, btWidth,btHeight, NSGraphicsMBS.NSCompositeSourceAtop, 1.0
		  end if
		  
		  g.restoreGraphicsState
		End Sub
	#tag EndEvent

	#tag Event
		Function mouseDown(e as NSEventMBS, x as double, y as double) As boolean
		  if x>btLeft and x<btLeft+btWidth and y>btTop and y<btTop+btHeight then // Close button
		    clicked=0
		  elseif x>btLeft+20 and x<btLeft+btWidth+20 and y>btTop and y<btTop+btHeight then // Miniaturize button
		    clicked=1
		  elseif x>btLeft+40 and x<btLeft+btWidth+40 and y>btTop and y<btTop+btHeight then // Zoom button
		    clicked=2
		  end if
		  
		  needsDisplay=True
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Function mouseDragged(e as NSEventMBS, x as double, y as double) As boolean
		  // Cancels clic if the mouse goes out of the clicked button
		  
		  if clicked=0 then
		    if X<btLeft or X>btLeft+btWidth or y<=btTop or y>=btTop+btHeight then // Close button
		      clicked=-1
		      needsDisplay=True
		    end if
		    
		  elseif clicked=1 then
		    if X<btLeft+20 or X>btLeft+btWidth+20 or y<=btTop or y>=btTop+btHeight then // Miniaturize button
		      clicked=-1
		      needsDisplay=True
		    end if
		    
		  elseif clicked=2 then
		    if X<btLeft+40 or X>btLeft+btWidth+40 or y<=btTop or y>=btTop+btHeight then // Zoom button
		      clicked=-1
		      needsDisplay=True
		    end if
		  end if
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Function mouseMoved(e as NSEventMBS, x as double, y as double) As boolean
		  // mouse is over the window buttons
		  if x>btLeft and x<btTotalWidth and y>btTop and y<btTop+btHeight then
		    hover=0
		    needsDisplay=True
		    
		  elseif hover<>-1 then
		    hover=-1
		    needsDisplay=True
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Function mouseUp(e as NSEventMBS, x as double, y as double) As boolean
		  if clicked<>-1 then
		    dim n As Integer=clicked
		    clicked=-1
		    needsDisplay=True
		    
		    // Perform window action
		    Select case n
		    case 0
		      window.performClose
		    case 1
		      window.performMiniaturize
		    case 2
		      window.performZoom
		    End Select
		    
		    Return True
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Sub viewDidMoveToWindow()
		  
		  if window<>Nil then
		    // Hide current window buttons
		    dim bt As NSButtonMBS
		    bt=window.standardWindowButton( NSWindowMBS.NSWindowCloseButton )
		    if bt<>Nil then bt.isHidden=True
		    bt=window.standardWindowButton( NSWindowMBS.NSWindowMiniaturizeButton )
		    if bt<>Nil then bt.isHidden=True
		    bt=window.standardWindowButton( NSWindowMBS.NSWindowZoomButton )
		    if bt<>Nil then bt.isHidden=True
		    
		    // Important to get mouse events in this view at startup
		    window.initialFirstResponder = Self
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor(left As double, top As double, w As Window, BtImage As Picture)
		  // Calling the overridden superclass constructor.
		  //———————————————————————
		  // Default left position: use the constant ButtonHorizontalPadding
		  // Default top position: do superview.frameheight - ButtonVerticalPadding
		  // The current view is 4 pixels bigger than the button size.
		  
		  Super.Constructor( left-2,top-2, btTotalWidth+4, btHeight+4 )
		  autoresizingMask=NSViewMBS.NSViewMinYMargin+NSViewMBS.NSViewNotSizable
		  
		  ButtonCloseEnabled=w.CloseButton
		  ButtonMiniaturizeEnabled=w.MinimizeButton
		  ButtonZoomEnabled=w.MaximizeButton
		  
		  // Appearence theme and Pictures
		  dim s As String=CurrentAppearanceThemeMBS
		  if s="com.apple.theme.appearance.aqua.graphite" then AppearenceDX=56
		  if BtImage<>Nil then
		    ButtonImage=New NSImageMBS( BtImage )
		  end if
		End Sub
	#tag EndMethod


	#tag Note, Name = Thanks
		
		Thanks to David Della Rocca <dellarocca.david@free.fr> for providing this example.
		
	#tag EndNote


	#tag Property, Flags = &h0
		Active As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private AppearenceDX As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ButtonCloseEnabled As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		ButtonImage As NSImageMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		ButtonMiniaturizeEnabled As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		ButtonZoomEnabled As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private clicked As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		Dirty As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private hover As Integer = -1
	#tag EndProperty


	#tag Constant, Name = btHeight, Type = Double, Dynamic = False, Default = \"16", Scope = Public
	#tag EndConstant

	#tag Constant, Name = btLeft, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = btTop, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = btTotalWidth, Type = Double, Dynamic = False, Default = \"54", Scope = Public
	#tag EndConstant

	#tag Constant, Name = btWidth, Type = Double, Dynamic = False, Default = \"14", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ButtonHorizontalPadding, Type = Double, Dynamic = False, Default = \"7", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ButtonVerticalPadding, Type = Double, Dynamic = False, Default = \"20", Scope = Public
	#tag EndConstant


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
			Name="Active"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ButtonCloseEnabled"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ButtonMiniaturizeEnabled"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ButtonZoomEnabled"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Dirty"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
