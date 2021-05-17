#tag Class
Protected Class MonitorAppEvents
Inherits CarbonApplicationEventsMBS
	#tag Event
		Function MouseDown(x as single, y as single, modifierKeys as integer, button as integer, clickcount as integer, MouseChord as integer) As boolean
		  window1.Status.text = "Clicked inside App"
		  return Window1.MouseDown(x, y)
		  
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor()
		  me.Listen
		End Sub
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
