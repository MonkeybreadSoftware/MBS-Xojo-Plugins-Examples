#tag Class
Protected Class MyWindowEvents
Inherits CarbonWindowsEventsMBS
	#tag Event
		Sub WindowBoundsChanging(original as object, previous as object, current as object, flags as integer)
		  system.debuglog "WindowBoundsChanging"
		End Sub
	#tag EndEvent

	#tag Event
		Function WindowClose() As boolean
		  MsgBox "Close"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowCloseAll() As boolean
		  system.debuglog "CloseAll"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowCollapse() As boolean
		  system.debuglog "Collapse"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowCollapseAll() As boolean
		  system.debuglog "CollapseAll"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowCollapsed() As boolean
		  system.debuglog "Collapsed"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowCollapsing() As boolean
		  system.debuglog "Collapsing"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowExpand() As boolean
		  system.debuglog "Expand"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowExpandAll() As boolean
		  system.debuglog "ExpandAll"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowExpanded() As boolean
		  system.debuglog "Expanded"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowExpanding() As boolean
		  system.debuglog "Expanding"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowHidden() As boolean
		  system.debuglog "Hidden"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowHiding() As boolean
		  system.debuglog "Hiding"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowShowing() As boolean
		  system.debuglog "Showing"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowShown() As boolean
		  system.debuglog "Shown"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowZoom() As boolean
		  system.debuglog "Zoom"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowZoomAll() As boolean
		  system.debuglog "ZoomAll"
		End Function
	#tag EndEvent

	#tag Event
		Function WindowZoomed() As boolean
		  system.debuglog "Zoomed"
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
