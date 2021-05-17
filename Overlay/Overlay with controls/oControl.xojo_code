#tag Class
Protected Class oControl
	#tag Method, Flags = &h0
		Sub AddChild(o as oControl)
		  Children.Append o
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub draw(g as Graphics, px as integer, py as integer)
		  for each c as oControl in Children
		    c.draw g,px+x,py+y
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawmask(g as Graphics, px as integer, py as integer)
		  for each c as oControl in Children
		    c.drawmask g,px+x,py+y
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function inside(mx as integer, my as integer) As Boolean
		  if mx<0 then Return false
		  if my<0 then Return false
		  
		  if mx>=width then Return false
		  if my>=height then Return false
		  
		  Return true
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MouseDown(mx as integer, my as integer) As Boolean
		  
		  
		  for each c as oControl in Children
		    dim xx as integer = mx-c.x
		    dim yy as integer = my-c.y
		    
		    if c.inside(xx,yy) then
		      dim b as Boolean = c.MouseDown(xx,yy)
		      
		      if c.NeedRedraw then
		        NeedRedraw=true
		      end if
		      
		      if b then 
		        Return true
		      end if
		    end if
		    
		  next
		  
		  Return false
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MouseUp(mx as integer, my as integer) As Boolean
		  
		  for each c as oControl in Children
		    dim xx as integer = mx-c.x
		    dim yy as integer = my-c.y
		    
		    if c.inside(xx,yy) then
		      dim b as Boolean = c.MouseUp(xx,yy)
		      
		      if c.NeedRedraw then
		        NeedRedraw=true
		      end if
		      
		      if b then 
		        Return true
		      end if
		    end if
		    
		  next
		  
		  Return false
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Children(-1) As oControl
	#tag EndProperty

	#tag Property, Flags = &h0
		height As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		NeedRedraw As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		root As oControl
	#tag EndProperty

	#tag Property, Flags = &h0
		width As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		x As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		y As Integer
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
			Name="NeedRedraw"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
