#tag Class
Protected Class CustomNSView
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
		Function becomeFirstResponder() As boolean
		  Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Function canBecomeKeyView() As boolean
		  Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub draggingSessionEndedAtPoint(session as NSDraggingSessionMBS, screenPoint as NSPointMBS, operation as integer)
		  log CurrentMethodName+" "+Str(screenPoint.X)+"/"+Str(screenPoint.Y)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub draggingSessionMovedToPoint(session as NSDraggingSessionMBS, screenPoint as NSPointMBS)
		  log CurrentMethodName+" "+Str(screenPoint.X)+"/"+Str(screenPoint.Y)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function draggingSessionSourceOperationMaskForDraggingContext(session as NSDraggingSessionMBS, context as integer) As integer
		  log CurrentMethodName
		  
		  if context = NSDraggingSessionMBS.NSDraggingContextOutsideApplication then
		    Return NSDraggingInfoMBS.NSDragOperationCopy
		  end if
		  
		  if context = NSDraggingSessionMBS.NSDraggingContextWithinApplication then
		    Return NSDraggingInfoMBS.NSDragOperationCopy
		  end if
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub draggingSessionWillBeginAtPoint(session as NSDraggingSessionMBS, screenPoint as NSPointMBS)
		  log CurrentMethodName+" "+Str(screenPoint.X)+"/"+Str(screenPoint.Y)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DrawRect(g as NSGraphicsMBS, left as double, top as double, width as double, height as double)
		  g.SetColorRGB 1.0,1.0,1.0,1.0
		  g.fillRect left,top,width,height
		  
		  'g.drawInRect(image, 0, 0, myImage.width, myImage.height, 0, 0, anotherImage.width, anotherImage.height, myGraphics.NSCompositeSourceOver, 1.0)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function ignoreModifierKeysForDraggingSession(session as NSDraggingSessionMBS) As boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function mouseDown(e as NSEventMBS, x as double, y as double) As boolean
		  logo = LogoMBS(500)
		  image = new NSImageMBS(logo)
		  
		  
		  '/*------------------------------------------------------
		  'catch mouse down events in order to start drag
		  '--------------------------------------------------------*/
		  
		  dataProvider = new MyNSPasteboardItemDataProviderMBS
		  dataProvider.image = image
		  
		  '/* Dragging operation occur within the context of a special pasteboard (NSDragPboard).
		  '* All items written or read from a pasteboard must conform to NSPasteboardWriting or
		  '* NSPasteboardReading respectively.  NSPasteboardItem implements both these protocols
		  '* and is as a container for any object that can be serialized to NSData. */
		  
		  item = new NSPasteboardItemMBS
		  '/* Our pasteboard item will support public.tiff, public.pdf, and our custom UTI (see comment in -draggingEntered)
		  '* representations of our data (the image).  Rather than compute both of these representations now, promise that
		  '* we will provide either of these representations when asked.  When a receiver wants our data in one of the above
		  '* representations, we'll get a call to  the NSPasteboardItemDataProvider protocol method –pasteboard:item:provideDataForType:. */
		  
		  dim types() as string
		  types.Append NSPasteboardMBS.NSPasteboardTypeTIFF
		  'types.Append NSPasteboardMBS.NSPasteboardTypePDF
		  
		  call item.setDataProviderForType(dataprovider, types)
		  
		  //create a new NSDraggingItem with our pasteboard item.
		  dragItem = new NSDraggingItemMBS(item)
		  
		  '/* The coordinates of the dragging frame are relative to our view.  Setting them to our view's bounds will cause the drag image
		  '* to be the same size as our view.  Alternatively, you can set the draggingFrame to an NSRect that is the size of the image in
		  '* the view but this can cause the dragged image to not line up with the mouse if the actual image is smaller than the size of the
		  '* our view. */
		  dim draggingRect as NSRectMBS = self.bounds
		  
		  '/* While our dragging item is represented by an image, this image can be made up of multiple images which
		  '* are automatically composited together in painting order.  However, since we are only dragging a single
		  '* item composed of a single image, we can use the convince method below. For a more complex example
		  '* please see the MultiPhotoFrame sample. */
		  dragItem.setDraggingFrame(draggingRect, image)
		  
		  //create a dragging session with our drag item and ourself as the source.
		  dim dragItems() as Variant
		  dragItems.Append dragItem
		  draggingSession = self.beginDraggingSessionWithItems(dragItems, e, self)
		  
		  //causes the dragging item to slide back to the source if the drag fails.
		  if draggingSession<>Nil then
		    draggingSession.animatesToStartingPositionsOnCancelOrFail = true
		    draggingSession.draggingFormation = draggingSession.NSDraggingFormationNone
		  end if
		  
		  Return true
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub log(s as string)
		  window1.List.AddRow s
		  window1.List.ScrollPosition = window1.List.ListCount
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		dataProvider As MyNSPasteboardItemDataProviderMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		draggingSession As NSDraggingSessionMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		dragItem As NSDraggingItemMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		image As NSImageMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		item As NSPasteboardItemMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		list As listbox
	#tag EndProperty

	#tag Property, Flags = &h0
		logo As Picture
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
			Name="logo"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
