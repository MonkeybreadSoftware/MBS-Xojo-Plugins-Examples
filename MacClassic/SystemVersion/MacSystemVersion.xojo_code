#tag Class
Protected Class MacSystemVersion
	#tag Method, Flags = &h0
		Sub Constructor()
		  dim l as integer
		  dim major,minor,bug as integer
		  
		  if System.Gestalt("sys1",major) then
		    if System.Gestalt("sys2",minor) then
		      if System.Gestalt("sys3",bug) then
		        valid=true
		        Third=bug
		        second=minor
		        first=major
		        Return
		      end if
		    end if
		  end if
		  
		  if System.Gestalt("sysv",l) then
		    valid=true
		    Third=Bitwiseand(l,15)
		    second=Bitwiseand(l\16,15)
		    first=Bitwiseand(l\256,15)+10*Bitwiseand(l\256\16,15)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name() As string
		  if valid then
		    if First>=10 then
		      Return "Mac OS X "+str(First)+"."+str(Second)+"."+str(third)
		    else
		      Return "Mac OS "+str(First)+"."+str(Second)+"."+str(third)
		    end if
		  end if
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		First As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Second As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Third As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		valid As boolean
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
			Name="First"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Second"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Third"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="valid"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
