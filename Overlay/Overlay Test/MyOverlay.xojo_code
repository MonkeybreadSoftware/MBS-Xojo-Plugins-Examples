#tag Class
Protected Class MyOverlay
Inherits OverlayMBS
	#tag Event
		Function MouseDown(x as integer, y as integer, modifiers as integer) As boolean
		  log CurrentMethodName+" "+str(x)+" "+str(y)
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDragged(x as integer, y as integer, modifiers as integer) As boolean
		  if window1.CheckMove.Value then
		    log CurrentMethodName+" "+str(x)+" "+str(y)
		  end if
		  
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
		Function MouseMoved(x as integer, y as integer, modifiers as integer) As boolean
		  if window1.CheckMove.Value then
		    log CurrentMethodName+" "+str(x)+" "+str(y)
		  end if
		  
		End Function
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


	#tag Method, Flags = &h21
		Private Sub log(s as string)
		  System.DebugLog s
		  
		  if Window1open then
		    window1.Listbox1.InsertRow 0,s
		  end if
		  
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
