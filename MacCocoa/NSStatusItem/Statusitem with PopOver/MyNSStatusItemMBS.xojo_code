#tag Class
Protected Class MyNSStatusItemMBS
Inherits NSStatusItemMBS
	#tag Event
		Sub Action()
		  if pw<>nil then
		    pw.performClose
		    pw = nil
		    vc = nil
		  else
		    
		    tv = new NSTextFieldMBS(10,10, 180, 50)
		    
		    tv.StringValue = "Hello World"
		    tv.Editable = false
		    tv.textColor = NSColorMBS.whiteColor
		    tv.drawsBackground = false
		    'tv.backgroundColor = NSColorMBS.blackColor
		    tv.Bordered = false
		    
		    dim vv as new NSViewMBS(0,0,200,70)
		    vv.addSubview tv
		    
		    vc = new NSViewControllerMBS
		    vc.view = vv
		    
		    pw = new NSPopoverMBS
		    pw.animates = true
		    pw.contentViewController = vc
		    pw.behavior = pw.NSPopoverBehaviorSemitransient
		    'pw.appearance = pw.NSPopoverAppearanceHUD
		    
		    dim f as NSRectMBS = self.window.frame
		    dim r as NSRectMBS = NSMakeRectMBS(0, 0, f.Width, f.Height)
		    dim v as NSViewMBS = self.window.contentView
		    
		    pw.showRelativeToRect(r, v, pw.MaxYEdge)
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		pw As NSPopoverMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		tv As NSTextFieldMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		vc As NSViewControllerMBS
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
