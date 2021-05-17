#tag Class
Protected Class MyCustomNSTextFieldMBS
Inherits CustomNSTextFieldMBS
	#tag Event
		Function acceptsFirstMouse(e as NSEventMBS) As boolean
		  log CurrentMethodName
		  
		  Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Function acceptsFirstResponder() As boolean
		  log CurrentMethodName
		  
		  Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Action()
		  log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function becomeFirstResponder() As boolean
		  log CurrentMethodName
		  
		  Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Function canBecomeKeyView() As boolean
		  log CurrentMethodName
		  
		  Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Close()
		  log CurrentMethodName
		  l = nil
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function keyDown(e as NSEventMBS) As boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function keyUp(e as NSEventMBS) As boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function menuForEvent(e as NSEventMBS, defaultMenu as NSMenuMBS) As NSMenuMBS
		  log CurrentMethodName
		  
		  Return defaultMenu
		  
		End Function
	#tag EndEvent

	#tag Event
		Function mouseDown(e as NSEventMBS, x as double, y as double) As boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function mouseDownCanMoveWindow() As boolean
		  log CurrentMethodName
		  Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Function mouseDragged(e as NSEventMBS, x as double, y as double) As boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function mouseEntered(e as NSEventMBS, x as double, y as double) As boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function mouseExited(e as NSEventMBS, x as double, y as double) As boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function mouseMoved(e as NSEventMBS, x as double, y as double) As boolean
		  // disabled as it makes a lot of messages
		  
		  'log CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function mouseUp(e as NSEventMBS, x as double, y as double) As boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function otherMouseDown(e as NSEventMBS, x as double, y as double) As boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function otherMouseDragged(e as NSEventMBS, x as double, y as double) As boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function otherMouseUp(e as NSEventMBS, x as double, y as double) As boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function resignFirstResponder() As boolean
		  log CurrentMethodName
		  
		  Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Function rightMouseDown(e as NSEventMBS, x as double, y as double) As boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function rightMouseDragged(e as NSEventMBS, x as double, y as double) As boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function rightMouseUp(e as NSEventMBS, x as double, y as double) As boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function scrollWheel(e as NSEventMBS) As boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function textShouldBeginEditing(fieldEditor as NSTextMBS) As boolean
		  log CurrentMethodName
		  
		  Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Function textShouldEndEditing(fieldEditor as NSTextMBS) As boolean
		  log CurrentMethodName
		  
		  Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub viewDidMoveToWindow()
		  log CurrentMethodName
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub log(s as string)
		  System.DebugLog s
		  
		  
		  if l<>Nil then
		    l.InsertRow 0, s
		    
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		l As listbox
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
