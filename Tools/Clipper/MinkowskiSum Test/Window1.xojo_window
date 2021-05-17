#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   604
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   409073663
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "MinkowskiSum"
   Visible         =   True
   Width           =   588
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  
		  dim p as new Picture(Width, Height, 32)
		  dim g as Graphics = p.Graphics
		  
		  dim path as ClipperPathMBS
		  dim pattern as ClipperPathMBS
		  dim solution as ClipperPathsMBS
		  
		  //Greek capital sigma (sum sign) ...
		  dim ints1() as integer = Array( 300, 400, 100, 400, 200, 300, 100, 200, 300, 200 )
		  path = IntsToPolygon(ints1)
		  
		  //diagonal brush pattern ...
		  dim ints2() as integer = Array(  4, -6, 6, -6, -4, 6, -6, 6 )
		  pattern = IntsToPolygon(ints2)
		  
		  ClipperMBS.MinkowskiSum(pattern, path, solution, false)
		  //move 'pattern' to the end of 'path' ...
		  
		  pattern = pattern.TranslatePath(300, 200)
		  
		  //Display solution ± pattern ...
		  
		  DrawPolygon g, path, &cFFFF00 // yellow for original path
		  DrawPolygons g, solution, &c0000FF // blue for drawing path
		  DrawPolygon g, pattern, &cFF0000 // red for pattern
		  
		  
		  Backdrop = p
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DrawPolygon(g as graphics, p as ClipperPathMBS, c as color, ox as integer = 0, oy as integer = 0)
		  dim coordinates(0) as integer
		  dim points() as ClipperPointMBS = p.Values
		  
		  for each point as ClipperPointMBS in points
		    coordinates.Append point.x + ox
		    coordinates.Append point.y + oy
		  next
		  
		  g.ForeColor = c
		  g.FillPolygon coordinates
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawPolygons(g as Graphics, paths as ClipperPathsMBS, c1 as color, c2 as color, ox as integer = 0, oy as integer = 0)
		  dim pathsList() as ClipperPathMBS = paths.Values
		  
		  dim b as Boolean
		  
		  for each p as ClipperPathMBS in pathsList 
		    
		    if b then
		      DrawPolygon(g, p, c2, ox, oy)
		    else
		      DrawPolygon(g, p, c1, ox, oy)
		    end if
		    
		    b = not b
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawPolygons(g as Graphics, paths as ClipperPathsMBS, c as color, ox as integer = 0, oy as integer = 0)
		  dim pathsList() as ClipperPathMBS = paths.Values
		  
		  dim b as Boolean
		  
		  for each p as ClipperPathMBS in pathsList 
		    
		    DrawPolygon(g, p, c, ox, oy)
		    
		    b = not b
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IntsToPolygon(points() as int32) As ClipperPathMBS
		  dim path as new ClipperPathMBS
		  
		  dim u as integer = UBound(points)-1
		  
		  for i as integer = 0 to u step 2
		    
		    path.Append points(i), points(i+1)
		    
		  next
		  
		  return path
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IntsToPolygon(points() as int64) As ClipperPathMBS
		  dim path as new ClipperPathMBS
		  
		  dim u as integer = UBound(points)-1
		  
		  for i as integer = 0 to u step 2
		    
		    path.Append points(i), points(i+1)
		    
		  next
		  
		  return path
		  
		  
		  
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
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
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
		InitialValue="True"
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
