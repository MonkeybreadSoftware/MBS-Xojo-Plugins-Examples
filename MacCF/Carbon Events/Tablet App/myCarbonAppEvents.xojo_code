#tag Class
Protected Class myCarbonAppEvents
Inherits CarbonApplicationEventsMBS
	#tag Event
		Function MouseDown(x as single, y as single, modifierKeys as integer, button as integer, clickcount as integer, MouseChord as integer) As boolean
		  if TabletPoint<>nil then
		    Window1.updateTabletPoint TabletPoint
		  end if
		  
		  if TabletProximity<>nil then
		    Window1.UpdatetabletProximity TabletProximity
		  end if
		  
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDragged(x as single, y as single, modifierKeys as integer, deltax as single, deltay as single, button as integer, clickcount as integer, MouseChord as integer) As boolean
		  if TabletPoint<>nil then
		    Window1.updateTabletPoint TabletPoint
		  end if
		  
		  if TabletProximity<>nil then
		    Window1.UpdatetabletProximity TabletProximity
		  end if
		  
		End Function
	#tag EndEvent

	#tag Event
		Function MouseMoved(x as single, y as single, modifierKeys as integer, deltax as single, deltay as single) As boolean
		  if TabletPoint<>nil then
		    Window1.updateTabletPoint TabletPoint
		  end if
		  
		  if TabletProximity<>nil then
		    Window1.UpdatetabletProximity TabletProximity
		  end if
		  
		End Function
	#tag EndEvent

	#tag Event
		Function MouseUp(x as single, y as single, modifierKeys as integer, button as integer, clickcount as integer, MouseChord as integer) As boolean
		  if me.TabletPoint<>nil then
		    Window1.updateTabletPoint TabletPoint
		  end if
		  
		  if TabletProximity<>nil then
		    Window1.UpdatetabletProximity TabletProximity
		  end if
		  
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
