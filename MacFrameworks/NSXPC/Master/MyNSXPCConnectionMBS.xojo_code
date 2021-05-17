#tag Class
Protected Class MyNSXPCConnectionMBS
Inherits NSXPCConnectionMBS
	#tag Event
		Sub CallMethodReturned(name as string, tag as variant, Parameters() as variant, Results() as variant)
		  System.DebugLog CurrentMethodName
		  
		  MsgBox "Got result: "+Results(0)
		End Sub
	#tag EndEvent

	#tag Event
		Sub ErrorHandler(error as NSErrorMBS)
		  System.DebugLog CurrentMethodName
		  
		  MsgBox "Got error: "+error.LocalizedDescription
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub InterruptionHandler()
		  System.DebugLog CurrentMethodName
		  
		  MsgBox "Service app crashed."
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub InvalidationHandler()
		  System.DebugLog CurrentMethodName
		  MsgBox "Service app invalidated connection."
		  
		  
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
