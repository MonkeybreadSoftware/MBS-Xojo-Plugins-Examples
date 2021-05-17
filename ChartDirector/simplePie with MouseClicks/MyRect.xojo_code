#tag Class
Protected Class MyRect
	#tag Method, Flags = &h0
		Sub setCoords(s as string)
		  // set coordinates
		  
		  dim co(-1) as string
		  
		  co=split(s,",")
		  
		  left=val(co(0))
		  top=val(co(1))
		  right=val(co(2))
		  bottom=val(co(3))
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setSector(s as string)
		  // set sector
		  
		  if left(s,9)="a?sector=" then
		    sector=val(mid(s,10))
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		bottom As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		left As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		right As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		sector As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		top As Integer
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
			InitialValue="2147483648"
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
			Name="sector"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="right"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="bottom"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
