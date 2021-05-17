#tag Class
Protected Class MyCustomNSSearchFieldMBS
Inherits CustomNSSearchFieldMBS
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
		Sub Action()
		  log CurrentMethodName
		  
		End Sub
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
		Function mouseDown(e as NSEventMBS, x as double, y as double) As boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function mouseUp(e as NSEventMBS, x as double, y as double) As boolean
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


	#tag Method, Flags = &h0
		Sub log(s as string)
		  if l = nil then Return
		  
		  l.AddRow s
		  l.ScrollPosition = l.ListCount
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
