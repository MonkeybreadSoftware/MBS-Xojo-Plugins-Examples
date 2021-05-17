#tag Class
Protected Class MacPopover
	#tag Method, Flags = &h0
		Sub ClosePopover()
		  If pw<>Nil Then
		    pw.performClose
		    pw = Nil
		    vc = Nil
		    Return
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowMessage(msg as string, control as RectControl)
		  If TargetCocoa = False Then Return
		  If NSPopoverMBS.available = False Then Return
		  
		  If pw<>Nil Then
		    ClosePopover
		    Return
		  End If
		  
		  Dim tv As New NSTextFieldMBS(10,10, 180, 50)
		  tv.StringValue = msg
		  tv.sizeToFit
		  tv.Editable = False
		  
		  Dim rc As NSRectMBS = tv.bounds
		  
		  'tv.TextColor = NSColorMBS.blackColor
		  tv.drawsBackground = False
		  tv.Bordered = False
		  
		  Dim vv As New NSViewMBS(0,0,rc.Size.Width+40,rc.size.height+20)
		  vv.addSubview tv
		  
		  vc = New NSViewControllerMBS
		  vc.view = vv
		  
		  pw = New NSPopoverMBS
		  pw.animates = True
		  pw.contentViewController = vc
		  pw.behavior = pw.NSPopoverBehaviorSemitransient
		  'pw.appearance = pw.NSPopoverAppearanceHUD
		  
		  Dim v As NSViewMBS = control.NSViewMBS
		  Dim r As NSRectMBS = v.bounds
		  
		  pw.animates = True
		  
		  pw.showRelativeToRect(r, v, pw.MaxXEdge)
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private pw As NSPopoverMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private vc As NSViewControllerMBS
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
			InitialValue="-2147483648"
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
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
