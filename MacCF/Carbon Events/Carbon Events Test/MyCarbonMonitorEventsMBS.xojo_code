#tag Class
Protected Class MyCarbonMonitorEventsMBS
Inherits CarbonMonitorEventsMBS
	#tag Event
		Function KeyboardRawKeyDown(maccharcode as integer, keycode as integer, modifiers as integer, keyboardtype as integer) As boolean
		  if MainWindow.CheckMonitor.Value then
		    List.InsertRow 0,"Monitor: Keyboard raw key down "+str(keycode)
		  end if
		  
		  Return true
		End Function
	#tag EndEvent

	#tag Event
		Function KeyboardRawKeyModifiersChanged(modifierkeys as integer) As boolean
		  if MainWindow.CheckMonitor.Value then
		    List.InsertRow 0,"Monitor: Keyboard key modifiers changed "+str(modifierkeys)  
		  end if
		  
		  Return true
		End Function
	#tag EndEvent

	#tag Event
		Function KeyboardRawKeyRepeat(maccharcode as integer, keycode as integer, modifiers as integer, keyboardtype as integer) As boolean
		  if MainWindow.CheckMonitor.Value then
		    List.InsertRow 0,"Monitor: Keyboard raw key repeat "+str(keycode)
		  end if
		  
		  Return true
		End Function
	#tag EndEvent

	#tag Event
		Function KeyboardRawKeyUp(maccharcode as integer, keycode as integer, modifiers as integer, keyboardtype as integer) As boolean
		  if MainWindow.CheckMonitor.Value then
		    List.InsertRow 0,"Monitor: Keyboard raw key up "+str(keycode)
		  end if
		  
		  Return true
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(x as single, y as single, modifierKeys as integer, button as integer, clickcount as integer, MouseChord as integer) As boolean
		  if MainWindow.CheckMonitor.Value then
		    List.InsertRow 0,"Monitor: Mouse down "+str(x)+"/"+str(y)
		  end if
		  
		  Return true
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDragged(x as single, y as single, modifierKeys as integer, deltax as single, deltay as single, button as integer, clickcount as integer, MouseChord as integer) As boolean
		  if MainWindow.CheckMonitor.Value then
		    List.InsertRow 0,"Monitor: Mouse dragged "+str(x)+"/"+str(y)
		  end if
		  
		  Return true
		End Function
	#tag EndEvent

	#tag Event
		Function MouseMoved(x as single, y as single, modifierKeys as integer, deltax as single, deltay as single) As boolean
		  if MainWindow.CheckMonitor.Value then
		    List.InsertRow 0,"Monitor: Mouse moved "+str(x)+"/"+str(y)
		  end if
		  
		  Return true
		End Function
	#tag EndEvent

	#tag Event
		Function MouseUp(x as single, y as single, modifierKeys as integer, button as integer, clickcount as integer, MouseChord as integer) As boolean
		  if MainWindow.CheckMonitor.Value then
		    List.InsertRow 0,"Monitor: Mouse up "+str(x)+"/"+str(y)
		  end if
		  
		  Return true
		End Function
	#tag EndEvent

	#tag Event
		Function MouseWheelMoved(modifierKeys as integer, axis as integer, delta as integer) As boolean
		  if MainWindow.CheckMonitor.Value then
		    List.InsertRow 0,"Monitor: Mouse wheel moved "+str(delta)
		  end if
		  
		  Return true
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
