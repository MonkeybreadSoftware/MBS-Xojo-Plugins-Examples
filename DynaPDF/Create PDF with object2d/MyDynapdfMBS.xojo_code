#tag Class
Protected Class MyDynapdfMBS
Inherits DynapdfMBS
	#tag Event
		Function Error(ErrorCode as integer, ErrorMessage as string, ErrorType as integer) As integer
		  // output all messages on the console:
		  System.DebugLog str(ErrorCode)+": "+ErrorMessage
		  
		  // and display dialog:
		  Dim d as New MessageDialog //declare the MessageDialog object
		  Dim b as MessageDialogButton //for handling the result
		  
		  d.icon=MessageDialog.GraphicCaution //display warning icon
		  d.ActionButton.Caption="Continue"
		  d.CancelButton.Visible=True    //show the Cancel button
		  
		  // a warning or an error?
		  
		  if BitAnd(ErrorType, me.kE_WARNING) = me.kE_WARNING then
		    // if user decided to ignore, we'll ignore
		    if IgnoreWarnings then Return 0
		    
		    d.Message="A warning occurred while processing your PDF code."
		    
		    // we add a third button to display all warnings
		    d.AlternateActionButton.Caption = "Ignore warnings"
		    d.AlternateActionButton.Visible = true
		  else
		    d.Message="An error occurred while processing your PDF code."
		  end if
		  
		  d.Explanation = str(ErrorCode)+": "+ErrorMessage
		  
		  b=d.ShowModal //display the dialog
		  
		  Select Case b //determine which button was pressed.
		  Case d.ActionButton
		    Return 0 // ignore
		  Case d.AlternateActionButton
		    IgnoreWarnings = true
		    Return 0 // ignore
		  Case d.CancelButton
		    Return -1 // stop
		  End select
		  
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub DrawGroup(g as Group2D)
		  dim i,c as integer
		  
		  SetupGraphicsState g
		  
		  c=g.Count-1
		  for i=0 to c
		    drawObject g.Item(i)
		    
		  next
		  
		  call me.RestoreGraphicState
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub drawObject(o as Object2d)
		  
		  
		  if o isa Group2D then
		    DrawGroup Group2D(o)
		    
		  elseif o isa OvalShape then
		    DrawOval OvalShape(o)
		  elseif o isa PixmapShape then
		    DrawPixmap PixmapShape(o)
		    
		  elseif o isa RectShape then
		    DrawRect RectShape(o)
		  elseif o isa StringShape then
		    DrawString StringShape(o)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawObject(o as Object2d, offsetX as integer, offsetY as integer)
		  call me.SaveGraphicState
		  
		  call me.TranslateCoords offsetx, offsety
		  
		  drawObject o
		  
		  call me.RestoreGraphicState
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawOval(o as OvalShape)
		  SetupGraphicsState o
		  
		  call me.DrawCircle(0,0,(o.width+o.height)/4.0, kfmFill)
		  
		  call me.RestoreGraphicState
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawPixmap(p as PixmapShape)
		  SetupGraphicsState p
		  
		  call me.SetUseTransparency(false)
		  call me.InsertPicture(p.Image, -p.Width/2.0, -p.Height/2.0, p.Width, p.Height)
		  
		  call me.RestoreGraphicState
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawRect(r as RectShape)
		  SetupGraphicsState r
		  
		  dim m as integer=-1
		  
		  if r.Border>0 then
		    if r.Fill>0 then
		      m=me.kfmFillStroke
		    else
		      m=me.kfmStroke
		    end if
		  else
		    if r.Fill>0 then
		      m=me.kfmFill
		    else
		      m=0
		    end if
		  end if
		  
		  if m>=0 then
		    call me.Rectangle -r.Width/2.0, -r.Height/2.0, r.Width, r.Height, m
		  end if
		  
		  call me.RestoreGraphicState
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawString(s as StringShape)
		  SetupGraphicsState s
		  
		  dim fontstyle as integer
		  
		  if s.Bold then
		    fontstyle=fontstyle+me.kfsBold
		  end if
		  if s.Italic then
		    fontstyle=fontstyle+me.kfsItalic
		  end if
		  if s.Underline then
		    fontstyle=fontstyle+me.kfsUnderlined
		  end if
		  
		  call me.SetFont s.TextFont, fontstyle, s.TextSize, true, me.kcp1252
		  
		  dim w as integer = me.GetPageWidth
		  dim h as integer = me.GetFTextHeight(me.ktaCenter,s.text)
		  
		  call me.WriteFTextEx -w/2.0, h, w, -1, me.ktaCenter, s.Text
		  'call me.Rectangle -w/2.0, 0, w, h, me.kfmStroke
		  
		  call me.RestoreGraphicState
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetupGraphicsState(o as Object2D)
		  const pi=3.14159265
		  call me.SaveGraphicState
		  
		  call me.SetLineWidth o.BorderWidth
		  
		  call me.SetStrokeColor o.BorderColor.blue*65536+o.BorderColor.green*256+o.BorderColor.red
		  call me.SetFillColor o.FillColor.blue*65536+o.FillColor.green*256+o.FillColor.red
		  
		  
		  call me.ScaleCoords o.Scale, o.Scale
		  call me.TranslateCoords o.x, -o.y
		  call me.RotateCoords 360.0-o.Rotation*180.0/pi, 0, 0
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		
		This is a very basic extension for DynaPDF to use Object2D.
		
		
		If you add code, send it to me so I can include it with this example project.
		
		still todo:
		* transparency
		* other shapes
		
		Disadvantages:
		* Input Object2D may not have sizes correct for the page format used.
		* PictureShape uses RB picture object. Adding JPEG/TIFF file directly may result into smaller PDF files.
		* Font handling expects the font names to match between RB and DynaPDF, but some translation is needed there.
		
		Greetings
		Christian
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		IgnoreWarnings As Boolean
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
			Name="IgnoreWarnings"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
