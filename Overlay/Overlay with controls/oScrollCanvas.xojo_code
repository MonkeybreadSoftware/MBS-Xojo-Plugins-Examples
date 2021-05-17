#tag Class
Protected Class oScrollCanvas
Inherits oControl
	#tag Method, Flags = &h0
		Sub Constructor()
		  pic = new Picture(300,50,32)
		  
		  dim g as Graphics = pic.Graphics
		  
		  g.ForeColor=&cFFFFFF
		  g.FillRect 0, 0, g.Width, g.Height
		  
		  dim f as color = &cFF0000
		  dim y as Double = 25.0
		  
		  g.ForeColor=&c777777
		  g.DrawLine 0, 25, 299, 25
		  
		  dim ly as Double
		  
		  
		  for x=0 to 299
		    
		    if x mod 10=0 then
		      g.ForeColor=&c777777
		      g.DrawLine x,20,x,30
		    end if
		    
		    y=y+rnd*4.0-2.0
		    
		    if y<=0 then
		      y=0
		    elseif y>=50 then
		      y=49
		    end if
		    
		    g.ForeColor=&cFF0000
		    g.DrawLine x-1, ly, x, y
		    ly=Y
		  next
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub draw(g as Graphics, px as integer, py as integer)
		  g.DrawPicture pic, x+px, y+py, width, height, offset, 0, width, height
		  
		  super.draw(g,px,py)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawMask(g as Graphics, px as integer, py as integer)
		  g.ForeColor=&c000000
		  g.FillRect x+px,y+py,width,height
		  
		  super.drawMask(g,px,py)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MouseDown(mx as integer, my as integer) As Boolean
		  
		  NeedRedraw=True
		  
		  Return true
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MouseUp(mx as integer, my as integer) As Boolean
		  if mx*2<width then
		    
		    if offset>0 then
		      offset=offset-5
		    end if
		    
		  else
		    
		    if offset<pic.Width-width then
		      offset=offset+5
		    end if
		    
		  end if
		  
		  NeedRedraw=True
		  
		  Return true
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		offset As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		pic As Picture
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="NeedRedraw"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
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
		#tag ViewProperty
			Name="x"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="y"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="width"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="height"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="pic"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="offset"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
