#tag Class
Protected Class MyPoly
	#tag Method, Flags = &h0
		Sub setCoords(s as string)
		  // set coordinates
		  
		  dim co(-1) as string
		  
		  co=split(s,",")
		  
		  dim u as integer=UBound(co)
		  for i as integer=0 to u
		    x.Append val(co(i))
		    i=i+1
		    y.Append val(co(i))
		  next
		  
		  
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
		sector As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		x(-1) As double
	#tag EndProperty

	#tag Property, Flags = &h0
		y(-1) As double
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
	#tag EndViewBehavior
End Class
#tag EndClass
