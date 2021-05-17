#tag Class
Protected Class MyOverlayMBS
Inherits OverlayMBS
	#tag Event
		Function MouseDown(x as integer, y as integer, modifiers as integer) As boolean
		  #Pragma unused x
		  #Pragma unused y
		  #Pragma unused modifiers
		  
		  Return True
		  
		End Function
	#tag EndEvent

	#tag Event
		Function MouseUp(x as integer, y as integer, modifiers as integer) As boolean
		  #Pragma unused x
		  #Pragma unused y
		  #Pragma unused modifiers
		  
		  app.t.Mode = 0
		  app.t = nil
		  me.hide
		  
		  app.GotAWindow TargetWindowNumber, me.left, me.top, me.Width, me.Height, TargetInfo
		  
		  Return true
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		TargetInfo As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		TargetWindowNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		timer As MyTimer
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
			Name="TargetWindowNumber"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
