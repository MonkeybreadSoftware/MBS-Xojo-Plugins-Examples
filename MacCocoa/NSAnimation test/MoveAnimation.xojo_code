#tag Class
Protected Class MoveAnimation
Inherits NSAnimationMBS
	#tag Event
		Sub CurrentProgressChanged(progress as double)
		  if DistanceY <> 0 then
		    c.top = StartTop + DistanceY * progress
		  end if
		  
		  if DistanceX <> 0 then
		    c.left = StartLeft + DistanceX * progress
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		c As RectControl
	#tag EndProperty

	#tag Property, Flags = &h0
		DistanceX As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		DistanceY As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		StartLeft As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		StartTop As Integer
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
			Name="StartLeft"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StartTop"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DistanceX"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DistanceY"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
