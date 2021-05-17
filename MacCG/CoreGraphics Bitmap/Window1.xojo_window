#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   476
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   -1178075104
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Untitled"
   Visible         =   True
   Width           =   544
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  dim c as CGBitmapContextMBS
		  dim r as CGRectMBS
		  dim p as Picture
		  dim n,i,k,w as integer
		  dim g as Graphics
		  
		  const size=500.0
		  
		  r=CGMakeRectMBS(0,0,size,size)
		  // Create the context
		  
		  dim pic as new Picture(size, size, 32)
		  c = CGBitmapContextMBS.CreateWithPicture(pic)
		  
		  if c.Handle=0 then // failed
		    beep
		  end if
		  
		  // First color background in white
		  c.SetRGBFillColor 1.0,1.0,1.0,1.0
		  c.FillRect r
		  
		  c.SetRGBFillColor 0.0,0.0,0.0, 1.0
		  c.SelectFont "Times New Roman", 18.0, 1.0
		  c.ShowTextAtPoint "Hello World in Times New Roman",10,100
		  
		  
		  c.SetRGBFillColor 0.4, 0.7, 0.9, 1.0 
		  c.SelectFont "Helvetica", 36.0, 1.0
		  c.SetTextDrawingMode 5
		  c.ShowTextAtPoint "revenge of the razorback frogs",0,r.height/2
		  
		  c.SetRGBFillColor 0.4, 0.7, 0.9, 1.0 
		  c.FillRect r
		  
		  c.SetLineWidth 2
		  DrawStarburst c,size
		  
		  
		  // We've finished rendering the page
		  c.Flush
		  
		  w=size/2
		  p = new Picture(size,w,32) // we don't need a larger mask
		  p.Graphics.ForeColor=rgb(0,0,0)
		  p.Graphics.fillrect 0,0,size,size
		  k=0
		  n=255
		  g=p.Graphics
		  for i=0 to 255
		    g.ForeColor=rgb(n,n,n)
		    g.fillrect 0,k,w,1
		    n=n-1
		    k=k+1
		  next
		  
		  pic.mask = p
		  
		  Backdrop = pic
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DrawStarburst(c as cgcontextmbs, size as single)
		  dim kFullCircleInRadians as single
		  dim rotation as single
		  
		  kFullCircleInRadians    = 3.14159265358979323846 * 2.0
		  
		  // Draw 50 lines as a starburst
		  
		  c.SetLineWidth 2
		  rotation = 0.0
		  while rotation<kFullCircleInRadians
		    // Start a new path
		    c.BeginPath
		    
		    // Save the graphics state so we can start with a
		    // fresh rotation each time
		    c.SaveGState
		    
		    //
		    // Translate the CTM to the center of the page, then
		    // rotate the CTM by our current translation. Note
		    // that order is important -- if you rotate the CTM
		    // before the translation, the translation coordinates
		    // will be rotated. In this example, we want to draw
		    // in the center of the page, so we translate before
		    // we rotate.
		    //
		    c.TranslateCTM size * 0.5, size * 0.5 
		    c.RotateCTM rotation 
		    
		    //
		    // Draw a simple horizontal line
		    // - First, set the current point to 0,0
		    // - Second, add the horizontal line
		    //      (We now have a path consisting of a horizontal line)
		    // - Third, stroke the line to paint it onto the page
		    //
		    c.MoveToPoint 0.0, 0.0 
		    c.AddLineToPoint size * 0.5, 0.0      
		    c.StrokePath
		    
		    // Restore the graphics state
		    c.RestoreGState
		    
		    rotation = rotation+ (kFullCircleInRadians/200.0)
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakePicture(p as picture,m as picture) As picture
		  dim n as Picture
		  
		  if m=nil then
		    Return p
		  else
		    n = new Picture(p.Width,p.Height,32)
		    n.Graphics.DrawPicture p,0,0
		    n.Mask.Graphics.DrawPicture m,0,0
		    Return n
		  end if
		End Function
	#tag EndMethod


#tag EndWindowCode

#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
