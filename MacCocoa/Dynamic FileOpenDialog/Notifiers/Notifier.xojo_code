#tag Interface
Protected Interface Notifier
	#tag Method, Flags = &h0
		Sub AddNotifier(recv As Receiver)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Data() As Variant
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NotifyAll()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveNotifier(rcv As Receiver)
		  
		End Sub
	#tag EndMethod


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
	#tag EndViewBehavior
End Interface
#tag EndInterface
