#tag Class
Protected Class MyNSPopoverMBS
Inherits NSPopoverMBS
	#tag Event
		Function detachableWindowForPopover() As NSWindowMBS
		  // we create another copy of the PopoverWindow with same text to detach
		  dim w as new PopoverWindow
		  
		  if c <> nil then
		    w.ContainerControl11.TextField1.Text = c.TextField1.Text
		  end if
		  
		  detachableWindow = w
		  Return w.NSWindowMBS
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		c As ContainerControl1
	#tag EndProperty

	#tag Property, Flags = &h0
		detachableWindow As window
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
			Name="detachableWindow"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="window"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
