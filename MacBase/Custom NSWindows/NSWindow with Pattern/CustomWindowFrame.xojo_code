#tag Class
Protected Class CustomWindowFrame
Inherits CustomNSViewMBS
	#tag Event
		Function acceptsFirstMouse(e as NSEventMBS) As boolean
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Function acceptsFirstResponder() As boolean
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub DrawRect(g as NSGraphicsMBS, left as double, top as double, width as double, height as double)
		  g.saveGraphicsState
		  dim iw,ih,c,w,y,h As Integer
		  
		  // Border image
		  if BorderImage<>Nil then
		    iw=BorderImage.Width
		    ih=BorderImage.height
		    w=frameWidth
		    h=frameHeight
		    c=22
		    y=frameHeight-c
		    g.drawInRect BorderImage, 0,y, c,c, 0,ih-c, c,c, NSGraphicsMBS.NSCompositeSourceOver, 1.0 // top left part
		    g.drawInRect BorderImage, c,y, w-c-c,c, c,ih-c, 1,c, NSGraphicsMBS.NSCompositeSourceOver, 1.0 // top middle part
		    g.drawInRect BorderImage, w-c,y, c,c, iw-c,ih-c, c,c, NSGraphicsMBS.NSCompositeSourceOver, 1.0 // top right part
		    y=c
		    g.drawInRect BorderImage, 0,y, c,h-c-c, 0,c, c,1, NSGraphicsMBS.NSCompositeSourceOver, 1.0 // left part
		    g.drawInRect BorderImage, w-c,y, c,h-c-c, iw-c,c, c,1, NSGraphicsMBS.NSCompositeSourceOver, 1.0 // right part
		    y=0
		    g.drawInRect BorderImage, 0,y, c,c, 0,0, c,c, NSGraphicsMBS.NSCompositeSourceOver, 1.0 // bottom left part
		    g.drawInRect BorderImage, c,y, w-c-c,c, c,0, 1,c, NSGraphicsMBS.NSCompositeSourceOver, 1.0 // bottom middle part
		    g.drawInRect BorderImage, w-c,y, c,c, iw-c,0, c,c, NSGraphicsMBS.NSCompositeSourceOver, 1.0 // bottom right part
		  end if
		  
		  // Window title + icon
		  if TitleText<>"" then
		    w=g.sizeWithAttributes( TitleText, TitleAttributes ).Width + TitleIconSpace
		    if TitleIcon<>Nil then TitleIconSpace=19 else TitleIconSpace=0
		    
		    if w<width-130 then
		      dim pos As New NSPointMBS
		      pos.X=(width/2)-(w/2)+TitleIconSpace
		      pos.Y=frameHeight-TitleTopPadding
		      g.drawAtPoint TitleText, pos, TitleShadowAttributes
		      pos.Y=pos.Y+TitleShadowDeltaY
		      g.drawAtPoint TitleText, pos, TitleAttributes
		      if TitleIcon<>Nil then
		        pos.X=pos.X-TitleIconSpace
		        pos.Y=frameHeight-TitleTopPadding-1
		        g.drawAtPoint TitleIcon, pos.X,pos.Y, 0,0, 16,16, NSGraphicsMBS.NSCompositeSourceAtop, 1.0
		      end if
		    end if
		  end if
		  
		  g.restoreGraphicsState
		End Sub
	#tag EndEvent

	#tag Event
		Function mouseMoved(e as NSEventMBS, x as double, y as double) As boolean
		  if x>8 and x<70 and y>0 then
		    needsDisplay=true
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Sub viewDidMoveToWindow()
		  Dim tx,ts As NSColorMBS
		  Dim NSFont as NSFontMBS = NSFontMBS.boldSystemFontOfSize(0)
		  
		  TitleAttributes = New Dictionary
		  tx=NSColorMBS.colorWithDeviceHSV( TitleColor.Hue, TitleColor.Saturation, TitleColor.Value, 1.0 )
		  TitleAttributes.Value( NSAttributedStringMBS.NSFontAttributeName )=NSFont
		  TitleAttributes.Value( NSAttributedStringMBS.NSForegroundColorAttributeName )=tx
		  
		  TitleShadowAttributes = New Dictionary
		  ts=NSColorMBS.colorWithDeviceHSV( TitleShadowColor.Hue, TitleShadowColor.Saturation, TitleShadowColor.Value, 1.0 )
		  TitleShadowAttributes.Value( NSAttributedStringMBS.NSFontAttributeName )=NSFont
		  TitleShadowAttributes.Value( NSAttributedStringMBS.NSForegroundColorAttributeName )=ts
		  
		  if window<>Nil then
		    window.initialFirstResponder = Self
		  end if
		End Sub
	#tag EndEvent


	#tag Note, Name = Thanks
		
		Thanks to David Della Rocca <dellarocca.david@free.fr> for providing this example.
		
	#tag EndNote


	#tag Property, Flags = &h0
		BackColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		BorderImage As NSImageMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		TitleAttributes As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		TitleColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		TitleIcon As NSImageMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		TitleIconSpace As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		TitleShadowAttributes As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		TitleShadowColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		TitleShadowDeltaY As Integer = 1
	#tag EndProperty

	#tag Property, Flags = &h0
		TitleText As String
	#tag EndProperty

	#tag Property, Flags = &h0
		TitleTopPadding As Integer = 19
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
			Name="BackColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TitleIconSpace"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TitleText"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TitleColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TitleShadowColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TitleShadowDeltaY"
			Visible=false
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TitleTopPadding"
			Visible=false
			Group="Behavior"
			InitialValue="19"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
