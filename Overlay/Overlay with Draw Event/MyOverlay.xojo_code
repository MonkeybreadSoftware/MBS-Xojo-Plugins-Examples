#tag Class
Protected Class MyOverlay
Inherits OverlayMBS
	#tag Event
		Sub Draw(CGContext as Variant, NSGraphicsContext as Variant)
		  dim c as CGContextMBS = CGContext
		  'dim n as NSGraphicsMBS = NSGraphicsContext
		  
		  dim red   as CGColorMBS = CGColorMBS.CreateGenericRGB(1, 0, 0)
		  dim white as CGColorMBS = CGColorMBS.CreateGenericRGB(1, 1, 1)
		  
		  dim w as integer = me.Width
		  dim h as integer = me.Height
		  
		  dim r1 as new CGRectMBS(0,0, w, h)
		  dim r2 as new CGRectMBS(pos,pos, w/2, h/2)
		  
		  c.SetFillColor white
		  c.FillEllipseInRect r1
		  
		  c.SetFillColor red
		  c.FillEllipseInRect r2
		  'c.Flush
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(x as integer, y as integer, modifiers as integer) As boolean
		  log CurrentMethodName+" "+str(x)+" "+str(y)
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseEnter(x as integer, y as integer, modifiers as integer)
		  log CurrentMethodName+" "+str(x)+" "+str(y)
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit(x as integer, y as integer, modifiers as integer)
		  log CurrentMethodName+" "+str(x)+" "+str(y)
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseUp(x as integer, y as integer, modifiers as integer) As boolean
		  log CurrentMethodName+" "+str(x)+" "+str(y)
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseWheel(x as integer, y as integer, dx as double, dy as double, modifiers as integer)
		  log CurrentMethodName+" "+str(x)+" "+str(y)+", delta "+str(dx)+"/"+str(dy)
		End Sub
	#tag EndEvent

	#tag Event
		Sub WindowBoundsChanged()
		  log "windowboundschanged"
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub WindowClosed()
		  log "windowclosed"
		  
		  MainWindow.AnimationTimer.Mode = timer.ModeOff
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
		  MainWindow.AnimationTimer.Mode = timer.ModeMultiple
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub log(s as string)
		  System.DebugLog s
		  
		  if Window1open then
		    MainWindow.Listbox1.InsertRow 0,s
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Window1open() As Boolean
		  dim i,c as integer
		  
		  c=WindowCount-1
		  for i=0 to c
		    if window(i) isa MainWindow then
		      Return true
		    end if
		  next
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		growing As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		pos As Integer
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
			Name="pos"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="growing"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
