#tag Class
Protected Class Listener
Inherits NSXPCListenerMBS
	#tag Event
		Function CallMethod(Name as string, Parameters() as variant) As variant()
		  System.DebugLog CurrentMethodName
		  
		  dim results() as Variant
		  
		  dim d1 as Double = results(0)
		  dim d2 as Double = results(0)
		  dim sum as Double = d1+d2
		  
		  results.Append sum
		  
		  Return results
		  
		End Function
	#tag EndEvent

	#tag Event
		Function shouldAcceptNewConnection(newConnection as NSXPCConnectionMBS) As boolean
		  // accept everyone
		  
		  System.DebugLog CurrentMethodName
		  
		  newConnection.resume
		  
		  Return true
		  
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
