#tag Class
Protected Class MyOverlay
Inherits OverlayMBS
	#tag Event
		Function MouseDown(x as integer, y as integer, modifiers as integer) As boolean
		  dim b as Boolean = root.MouseDown(x,y)
		  
		  if root.NeedRedraw then
		    redraw
		    Update
		  end if
		  
		  Return b
		  
		End Function
	#tag EndEvent

	#tag Event
		Function MouseUp(x as integer, y as integer, modifiers as integer) As boolean
		  dim b as Boolean = root.MouseUp(x,y)
		  
		  if root.NeedRedraw then
		    redraw
		    Update
		  end if
		  
		  Return b
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub WindowBoundsChanged()
		  log "windowboundschanged"
		  redraw
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub WindowClosed()
		  log "windowclosed"
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub WindowHidden()
		  log "windowhidden"
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub WindowShown()
		  log "windowShown"
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(left As integer, top As integer, width As integer, height As integer)
		  Super.Constructor(left, top, width, height)
		  
		  dim p,m as Picture
		  
		  p = new Picture(width,height,32)
		  m = new Picture(width,height,32)
		  
		  me.Pict=p
		  me.Mask=m
		  
		  dim r as new oControl
		  
		  r.x=0
		  r.y=0
		  r.width=width
		  r.height=height
		  
		  me.root=r
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub log(s as string)
		  System.DebugLog s
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub redraw()
		  dim g as Graphics
		  
		  g=me.pict.Graphics
		  g.ForeColor=&cFFFFFF
		  g.FillRect 0,0,g.Width,g.Height
		  
		  root.draw g,0,0
		  
		  g=me.Mask.Graphics
		  g.ForeColor=&cFFFFFF
		  g.FillRect 0,0,g.Width,g.Height
		  
		  root.drawmask g,0,0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Window1open() As Boolean
		  dim i,c as integer
		  
		  c=WindowCount-1
		  for i=0 to c
		    if window(i) isa window1 then
		      Return true
		    end if
		  next
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		root As oControl
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
