#tag Class
Protected Class MBSBufferedZipStream
Implements MBSStream
	#tag Method, Flags = &h0
		Sub Constructor(dest as MBSStream, Level as integer=9, BufferSize as integer=100000)
		  // first collect stuff in a buffer stream, than zip it and collect results
		  
		  ob=new MBSBufferStream(dest,BufferSize)
		  z=new MBSZipStream(ob,Level)
		  ib=new MBSBufferStream(z,BufferSize)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Read(n as integer) As string
		  Return ib.Read(n)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(data as string)
		  ib.Write data
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		Zip Compression stream with Buffering
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		ib As MBSBufferStream
	#tag EndProperty

	#tag Property, Flags = &h0
		ob As MBSBufferStream
	#tag EndProperty

	#tag Property, Flags = &h0
		theDestination As MBSStream
	#tag EndProperty

	#tag Property, Flags = &h0
		z As MBSZipStream
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
			InitialValue="2147483648"
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
End Class
#tag EndClass
