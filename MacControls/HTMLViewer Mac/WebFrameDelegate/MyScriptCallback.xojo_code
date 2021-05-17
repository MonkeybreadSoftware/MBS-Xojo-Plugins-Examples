#tag Class
Protected Class MyScriptCallback
Inherits WebScriptCallbackMBS
	#tag Event
		Function Callback(Name as string) As variant
		  // Javascript called this function
		  
		  MsgBox "The function "+name+" was called"+EndOfLine+_
		   "Parameter 1: "+me.ArgumentValue(0)+EndOfLine+_
		   "Parameter 2: "+me.ArgumentValue(1)+EndOfLine+_
		   "Parameter 3: "+me.ArgumentValue(2)
		  
		End Function
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
