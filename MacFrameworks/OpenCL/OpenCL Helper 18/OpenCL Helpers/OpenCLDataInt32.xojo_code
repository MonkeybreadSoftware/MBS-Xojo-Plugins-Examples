#tag Class
Protected Class OpenCLDataInt32
Inherits OpenCLData
	#tag Method, Flags = &h0
		Sub Constructor(v as Int32)
		  
		  me.Value = v
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetParameterDeclaration() As String
		  
		  Return " const unsigned int " + me.ParameterName
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetKernelArguments(kernel as clKernelMBS, argumentOffset as Integer) As Integer
		  
		  kernel.SetKernelArgInt32(argumentOffset, me.Value)
		  
		  Return 1
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Value As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ParameterName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
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
			Name="Value"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
