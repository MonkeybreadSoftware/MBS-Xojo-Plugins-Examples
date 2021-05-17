#tag Class
Protected Class ZipProgress
	#tag Method, Flags = &h0
		Sub constructor(total as uint64, monitor as ProgressMonitor)
		  me.total = total
		  me.monitor = monitor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub increment(amount as uint64)
		  complete = complete + amount
		  monitor.update complete / total
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private complete As uint64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private monitor As ProgressMonitor
	#tag EndProperty

	#tag Property, Flags = &h0
		total As uint64
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
			Name="total"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="uint64"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
