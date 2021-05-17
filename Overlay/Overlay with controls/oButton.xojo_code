#tag Class
Protected Class oButton
Inherits oControl
	#tag Method, Flags = &h0
		Sub draw(g as Graphics, px as integer, py as integer)
		  if down then
		    
		    g.DrawPicture DownPicture, px+x, py+y
		    
		  else
		    
		    g.DrawPicture NormalPicture, px+x, py+y
		    
		  end if
		  
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
		  down=True
		  NeedRedraw=True
		  
		  Return super.MouseDown(mx,my)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MouseUp(mx as integer, my as integer) As Boolean
		  down=false
		  NeedRedraw=True
		  
		  Return super.MouseDown(mx,my)
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Down As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		DownPicture As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		NormalPicture As Picture
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
			Name="DownPicture"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NormalPicture"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Down"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
