#tag Class
Protected Class MyNSEventMonitor
Inherits NSEventMonitorMBS
	#tag Event
		Sub GlobalEvent(e as NSEventMBS)
		  // Not used in this app
		End Sub
	#tag EndEvent

	#tag Event
		Function LocalEvent(e as NSEventMBS) As NSEventMBS
		  Dim mc As ModifierKeyClass
		  
		  Select Case e.type
		    
		  Case 1, 3 // LMouseDown, RMousedown
		    MouseDown e.type = 3
		    
		  Case 2, 4 // LMouseUp, RMouseUp
		    MouseUp e.type = 4
		    
		  Case 10 // KeyDown
		    mc = new ModifierKeyClass( e.modifierFlags )
		    KeyDown e.characters, e.keyCode, e.isARepeat, e.modifierFlags, mc
		    
		  Case 11 // KeyUp
		    mc = new ModifierKeyClass( e.modifierFlags )
		    KeyUp e.characters, e.keyCode, e.modifierFlags, mc
		    
		  Case 12 // FlagsChanged (Modifier)
		    mc = new ModifierKeyClass( e.modifierFlags )
		    ModifierKeyHasChanged e, e.modifierFlags, e.keyCode, mc
		    
		  End Select
		  
		  // AnyLocalEvet
		  AnyLocalEvent e
		  
		  
		  Finally
		    
		    // Return event, because else your app can't do anything
		    Return e
		End Function
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event AnyLocalEvent(e As NSEventMBS)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event KeyDown(Key As String, KeyCode As Integer, Repeated As Boolean, Modifier As Integer, mc As ModifierKeyClass)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event KeyUp(Key As String, KeyCode As Integer, Modifier As Integer, mc As ModifierKeyClass)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ModifierKeyHasChanged(e As NSEventMBS, Flags As Integer, KeyCode As Integer, mc As ModifierKeyClass)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDown(RightClick As Boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseUp(RightClick As Boolean)
	#tag EndHook


	#tag Note, Name = Future Code
		
		Select Case e.type
		
		Case 1, 3 // LMouseDown, RMousedown
		MouseDown e.type = 3
		
		Case 2, 4 // LMouseUp, RMouseUp
		MouseUp e.type = 4
		
		Case 5 // MouseMoved
		
		Case 6 // MouseDragged
		
		Case 7 // RMouseDragged
		
		Case 8 // MouseEntered
		
		Case 9 // MouseExited
		
		Case 10 // KeyDown
		KeyDown e.characters, e.keyCode, e.modifierFlags, e.isARepeat
		
		Case 11 // KeyUp
		KeyUp e.characters, e.keyCode, e.modifierFlags
		
		Case 12 // FlagsChanged (Modifier)
		
		if LastModifierFlags <> e.modifierFlags then
		ModifierKeyHasChanged e, e.modifierFlags, e.keyCode
		LastModifierFlags = e.modifierFlags
		end if
		
		Case 13 // kitdefined
		
		Case 14 // SysDefined
		
		Case 17 // CursorUpdate
		
		Case 19 // BeginGesture
		
		Case 20 // EndGesture
		
		Case 21 // ProcessNotification
		
		Case 22 // ScrollWheel
		
		
		Else
		
		break
		End Select
		
		'Window1.Title = str( e.type )
		
		
		Finally
		
		// Return event, because else your app can't do anything
		Return e
	#tag EndNote

	#tag Note, Name = ModifierFlags
		000000100000000000000000 Shift Key
		000000100000000000000010 Left Shift
		000000100000000000000100 Right Shift
		
		000010000000000000000000 alt Key
		000010000000000000100000 Left alt
		000010000000000001000000 Right alt
		
		000100000000000000000000 cmd Key
		000100000000000000001000 Left cmd
		000100000000000000010000 Right cmd
		
		100000000000000000000000 fn Key
		000001000000000000000001 ctrl key
		000000010000000000000000 Caps Lock
		
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private LastModifierFlags As Integer = 256
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
