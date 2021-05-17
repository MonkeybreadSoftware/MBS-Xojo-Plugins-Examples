#tag Class
Protected Class TextDragSource
Inherits WindowsDragSourceMBS
	#tag Event
		Function GiveFeedback(Effect as integer) As integer
		  Return DRAGDROP_S_USEDEFAULTCURSORS
		  
		End Function
	#tag EndEvent

	#tag Event
		Function QueryContinueDrag(EscapePressed as boolean, KeyState as integer) As integer
		  
		  if EscapePressed then
		    Return DRAGDROP_S_CANCEL
		  end if
		  
		  if Bitwise.BitAnd(KeyState, MK_LBUTTON)=0 then
		    return DRAGDROP_S_DROP
		  end if
		  
		  Return S_OK
		  
		End Function
	#tag EndEvent


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
