#tag Class
Protected Class ListDrawCellHandler
Inherits CustomNSTextFieldCellMBS
	#tag Event
		Function drawWithFrame(cellFrame as NSRectMBS, controlView as NSViewMBS) As boolean
		  dim textFrame as NSRectMBS = titleRectForBounds (cellFrame)
		  
		  dim lb as ListBoxTV = ListBoxTV(mOwner.Value)
		  
		  lb._suppressReload = true
		  
		  dim row as Integer = me.cell._internalUse.Left
		  dim col as Integer = me.cell._internalUse.Right
		  
		  if not lb._cellBackgroundPaint (nil, row, col, textFrame, controlView) then
		    // draw background for entire cell, even if the text is indented
		    if me.backgroundColor <> nil then
		      dim g as new NSGraphicsMBS
		      g.setFillColor me.backgroundColor
		      g.fillRect cellFrame
		    end if
		  end if
		  
		  if cell.nsImage <> nil then
		    #if Target64Bit
		      declare sub drawInRect lib "Cocoa" selector "drawInRect:fromRect:operation:fraction:respectFlipped:hints:" ( _
		      h as Integer, dst as NSRect64, src as NSRect64, operation as Integer, fraction as Double, respectFlipped as Boolean, hints as Ptr)
		      dim dr, zeroRect as NSRect64
		    #else
		      declare sub drawInRect lib "Cocoa" selector "drawInRect:fromRect:operation:fraction:respectFlipped:hints:" ( _
		      h as Integer, dst as NSRect32, src as NSRect32, operation as Integer, fraction as Single, respectFlipped as Boolean, hints as Ptr)
		      dim dr, zeroRect as NSRect32
		    #endif
		    dim img as NSImageMBS = cell.nsImage
		    dr.w = img.width
		    dr.h = img.height
		    dr.x = cellFrame.x + ImageInset
		    dr.y = cellFrame.y + (cellFrame.Height - dr.h) \ 2
		    drawInRect (img.Handle, dr, zeroRect, NSGraphicsMBS.NSCompositeSourceOver, 1, controlView.isFlipped, nil)
		  end if
		  
		  if not lb._cellTextPaint (nil, row, col, 0, 0, textFrame, controlView) then
		    superDrawWithFrame textFrame, controlView
		  end if
		  
		  lb._suppressReload = false
		  
		  return true
		End Function
	#tag EndEvent

	#tag Event
		Function titleRectForBounds(rect as NSRectMBS) As NSRectMBS
		  // Let's indent the text (based on the cell's or column's AlignmentOffset, set in ListBoxTV.dataCellForTableColumn)
		  
		  dim ofs as Integer = me.cell.Indentation
		  
		  if me.cell.nsImage <> nil then
		    ofs = ofs + me.cell.nsImage.width + (2 * ImageInset)
		  end if
		  
		  rect.X = rect.X + ofs
		  rect.Width = rect.Width - ofs
		  
		  return rect
		End Function
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor(owner as WeakRef)
		  mOwner = owner
		  super.Constructor
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		This handles custom drawing for cells.
		
		Note: This only works for "normal" cells, not for Checkbox cells - they would need a different NSCell subclass implementation from MBS, which isn't available (yet).
		
	#tag EndNote


	#tag Property, Flags = &h0
		cell As ListCellTV
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOwner As WeakRef
	#tag EndProperty


	#tag Constant, Name = ImageInset, Type = Double, Dynamic = False, Default = \"3", Scope = Private
	#tag EndConstant


	#tag Structure, Name = NSRect32, Flags = &h21, Attributes = \"StructureAlignment \x3D 1"
		x as Single
		  y as Single
		  w as Single
		h as Single
	#tag EndStructure

	#tag Structure, Name = NSRect64, Flags = &h21, Attributes = \"StructureAlignment \x3D 1"
		x as Double
		  y as Double
		  w as Double
		h as Double
	#tag EndStructure


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
