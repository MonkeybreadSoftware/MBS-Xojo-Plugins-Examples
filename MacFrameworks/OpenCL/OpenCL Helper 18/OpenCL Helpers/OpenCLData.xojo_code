#tag Class
Protected Class OpenCLData
	#tag Method, Flags = &h0
		Sub ClearCLMemory()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateCLMemory(context as CLContextMBS, flags as UInt64)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetParameterDeclaration() As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetKernelArguments(kernel as clKernelMBS, argumentOffset as Integer) As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteCLMemory(queue as CLCommandQueueMBS)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ParameterName As String
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
			Name="ParameterName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
