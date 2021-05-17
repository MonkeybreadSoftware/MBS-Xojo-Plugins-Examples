#tag Class
Protected Class MyCarbonWindowsEventsMBS
Inherits CarbonWindowsEventsMBS
	#tag Event
		Function MouseDown(x as single, y as single, modifierKeys as integer, button as integer, clickcount as integer, MouseChord as integer) As boolean
		  if MainWindow.CheckMouse.Value then
		    Write "MouseDown @ "+str(x)+" / "+str(y)
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDragged(x as single, y as single, modifierKeys as integer, deltax as single, deltay as single, button as integer, clickcount as integer, MouseChord as integer) As boolean
		  if MainWindow.CheckMouse.Value then
		    Write "MouseDragged @ "+str(x)+" / "+str(y)
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Function MouseMoved(x as single, y as single, modifierKeys as integer, deltax as single, deltay as single) As boolean
		  if MainWindow.CheckMouse.Value then
		    Write "MouseMoved @ "+str(x)+" / "+str(y)
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Function MouseUp(x as single, y as single, modifierKeys as integer, button as integer, clickcount as integer, MouseChord as integer) As boolean
		  if MainWindow.CheckMouse.Value then
		    Write "MouseUp @ "+str(x)+" / "+str(y)
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Function MouseWheelMoved(modifierKeys as integer, axis as integer, delta as integer) As boolean
		  // We prefer the one from the application's events
		End Function
	#tag EndEvent

	#tag Event
		Sub WindowBoundsChanging(original as object, previous as object, current as object, flags as integer)
		  dim c as IntegerRectMBS
		  
		  c=integerrectmbs(current)
		  List.Width=c.Width+2
		  List.Height=c.Height-13
		  List.Refresh
		  MainWindow.UpdateNow
		End Sub
	#tag EndEvent

	#tag Event
		Function WindowClose() As boolean
		  ' Never seen that this event is fired
		  write "WindowClose"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowCloseAll() As boolean
		  ' Never seen that this event is fired
		  speakandwrite "WindowCloseAll"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowCollapse() As boolean
		  ' This even works in built applications.
		  speakandwrite "WindowCollapse"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowCollapseAll() As boolean
		  ' This even works in built applications.
		  speakandwrite "WindowCollapseAll"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowCollapsed() As boolean
		  ' This even works in built applications.
		  speakandwrite "WindowCollapsed"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowCollapsing() As boolean
		  ' This even works in built applications.
		  speakandwrite "WindowCollapsing"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowExpand() As boolean
		  ' Never seen that this event is fired
		  speakandwrite "WindowExpand"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowExpandAll() As boolean
		  ' Never seen that this event is fired
		  speakandwrite "WindowExpandAll"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowExpanded() As boolean
		  ' This even works in built applications.
		  speakandwrite "WindowExpanded"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowExpanding() As boolean
		  ' This even works in built applications.
		  speakandwrite "WindowExpanding"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowHidden() As boolean
		  ' This even works in built applications.
		  speakandwrite "WindowHidden"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowHiding() As boolean
		  ' This even works in built applications.
		  speakandwrite "WindowHiding"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowRestoreFromDock() As boolean
		  if rnd>0.5 then
		    speakandwrite "Let us block the dock"
		    Return true
		  else
		    speakandwrite "Let us not block the dock"
		    Return false
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Function WindowShowing() As boolean
		  ' This even works in built applications.
		  speakandwrite "WindowShowing"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowShown() As boolean
		  ' This even works in built applications.
		  speakandwrite "WindowShown"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowToolbarButtonClicked() As boolean
		  ' This even works in built applications.
		  MainWindow.toolbar=not MainWindow.toolbar
		  
		  if MainWindow.toolbar then
		    speakandwrite "Switching Toolbar on"
		    MainWindow.Title="Carbon Events - Toolbar on"
		  else
		    speakandwrite "Switching Toolbar off"
		    MainWindow.Title="Carbon Events - Toolbar off"
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Function WindowZoom() As boolean
		  ' Never seen that this event is fired
		  speakandwrite "WindowZoom"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowZoomAll() As boolean
		  ' Never seen that this event is fired
		  speakandwrite "WindowZoomAll"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowZoomed() As boolean
		  ' Never seen that this event is fired
		  speakandwrite "WindowZoomed"
		End Function
	#tag EndEvent


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
