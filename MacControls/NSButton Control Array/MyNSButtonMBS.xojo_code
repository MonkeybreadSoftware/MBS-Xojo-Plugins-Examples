#tag Class
Protected Class MyNSButtonMBS
Inherits NSButtonMBS
	#tag Event
		Sub Action()
		  
		  // set state to off from other buttons
		  for each b as MyNSButtonMBS in buttons
		    if b<>self then
		      b.state = 0
		    end if
		  next
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		buttons(-1) As MyNSButtonMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		index As Integer
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
