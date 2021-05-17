#tag Class
Protected Class OpenCLDataMemoryBlock
Inherits OpenCLData
	#tag Method, Flags = &h0
		Sub ClearCLMemory()
		  
		  me.DataCL = nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(theData as MemoryBlock, theDataCount as Integer)
		  
		  me.Data = theData
		  me.DataCount = theDataCount // Number of items in the memory block (i.e., number of bytes, number of ints, number of floats, etc. Not the same as MemoryBlock.Size if data is anything other than bytes.)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateCLMemory(context as CLContextMBS, flags as UInt64)
		  
		  me.DataCL = new CLMemMBS(context, flags,  me.Data.Size)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetParameterDeclaration() As String
		  
		  Return " __global uchar* " + me.ParameterName + ", const unsigned int " + me.ParameterName + "Count"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetKernelArguments(kernel as clKernelMBS, argumentOffset as Integer) As Integer
		  
		  kernel.SetKernelArgMem(argumentOffset, me.DataCL) // Input data buffer
		  kernel.SetKernelArgInt32(argumentOffset + 1, me.DataCount) // Number of data items in buffer
		  
		  Return 2
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteCLMemory(queue as CLCommandQueueMBS)
		  
		  queue.EnqueueWriteBuffer(me.DataCL, 0, me.Data.Size, me.Data)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Data As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h0
		DataCL As CLMemMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		DataCount As Integer
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
			Name="DataCount"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
