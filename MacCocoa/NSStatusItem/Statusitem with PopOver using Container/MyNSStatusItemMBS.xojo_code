#tag Class
Protected Class MyNSStatusItemMBS
Inherits NSStatusItemMBS
	#tag Event
		Sub Action()
		  if pvrTask <> nil then
		    pvrTask.performClose
		    pvrTask = nil
		    vcTask = nil
		  else
		    vcTask = new NSViewControllerMBS
		    vcTask.view = conMain.NSViewMBS
		    
		    pvrTask = new NSPopoverMBS
		    pvrTask.animates = true
		    pvrTask.contentViewController = vcTask
		    //pvrTask.behavior = pvrTask.NSPopoverBehaviorSemitransient
		    'pvrTask.appearance = pvrTask.NSPopoverAppearanceHUD
		    
		    dim f as NSRectMBS = self.window.frame
		    dim r as NSRectMBS = NSMakeRectMBS(0, 0, f.Width, f.Height)
		    dim v as NSViewMBS = self.window.contentView
		    
		    pvrTask.showRelativeToRect(r, v, pvrTask.MaxYEdge)
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		conMain As ContainerControl
	#tag EndProperty

	#tag Property, Flags = &h0
		pvrTask As NSPopoverMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		txtTask As NSTextFieldMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		vcTask As NSViewControllerMBS
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
