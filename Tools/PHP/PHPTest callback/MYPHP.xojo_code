#tag Class
Protected Class MYPHP
Inherits PHPMBS
	#tag Event
		Function Callback(ArgumentCount as Integer) As variant
		  MsgBox "callback "+CallbackArgumentString(0)+" "+CallbackArgumentString(1)
		  
		  Return "returnvalue "+CallbackArgumentString(0)+" "+CallbackArgumentString(1)
		End Function
	#tag EndEvent

	#tag Event
		Sub LogMessage(message as string)
		  MsgBox "LogMessage"+EndOfLine+EndOfLine+message
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Write(data as string)
		  MsgBox "Write"+EndOfLine+EndOfLine+data
		  
		End Sub
	#tag EndEvent


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
	#tag EndViewBehavior
End Class
#tag EndClass
