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
		Sub concludeDragOperation(sender as NSDraggingInfoMBS)
		  // DraggingDestination
		  log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub draggingEnded(sender as NSDraggingInfoMBS)
		  // DraggingDestination
		  log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function draggingEntered(sender as NSDraggingInfoMBS) As integer
		  // DraggingDestination
		  log CurrentMethodName
		  
		  Return NSDraggingInfoMBS.NSDragOperationCopy
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub draggingExited(sender as NSDraggingInfoMBS)
		  // DraggingDestination
		  log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function draggingUpdated(sender as NSDraggingInfoMBS) As integer
		  // DraggingDestination
		  log CurrentMethodName
		  
		  Return NSDraggingInfoMBS.NSDragOperationCopy
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub DrawRect(g as NSGraphicsMBS, left as double, top as double, width as double, height as double)
		  g.SetColorRGB 1.0,0.0,0.0,1.0
		  g.fillRect left,top,width,height
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function ignoreModifierKeysForDraggingSession(session as NSDraggingSessionMBS) As boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function mouseDown(e as NSEventMBS, x as double, y as double) As boolean
		  Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Function performDragOperation(sender as NSDraggingInfoMBS) As boolean
		  // DraggingDestination
		  log CurrentMethodName
		  
		  dim p as NSPasteboardMBS = sender.draggingPasteboard
		  
		  dim types() as string = p.types
		  log "Types: "+Join(types,", ")
		  
		  dim url as string = p.URLFromPasteboard
		  log "URL: "+URL
		  
		  dim file as FolderItem = GetFolderItem(url, FolderItem.PathTypeURL)
		  log "File: "+file.NativePath
		  
		  Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Function prepareForDragOperation(sender as NSDraggingInfoMBS) As boolean
		  // DraggingDestination
		  log CurrentMethodName
		  
		  Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub updateDraggingItemsForDrag(sender as NSDraggingInfoMBS)
		  // DraggingDestination
		  log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function wantsPeriodicDraggingUpdates() As boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub log(s as string)
		  list.AddRow s
		  list.ScrollPosition = list.ListCount
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		list As listbox
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
