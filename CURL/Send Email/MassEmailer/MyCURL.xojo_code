#tag Class
Protected Class MyCURL
Inherits CURLSMBS
	#tag Method, Flags = &h0
		Sub sendMail()
		  MassEmailWindow.CURLTimer.Mode = 2
		  
		  started = true
		  
		  CurlMulti.add(me)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CurlMulti As MyCURLMulti
	#tag EndProperty

	#tag Property, Flags = &h0
		destEmail As string
	#tag EndProperty

	#tag Property, Flags = &h0
		email As CURLEmailMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		EmailLine As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Failed As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Finished As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		SecondTry As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		started As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		TriedAgain As Boolean
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
			Name="started"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="destEmail"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TriedAgain"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Failed"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EmailLine"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Finished"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SecondTry"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
