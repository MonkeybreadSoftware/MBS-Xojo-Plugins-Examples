#tag Interface
Protected Interface StreamWriter
	#tag Method, Flags = &h0
		Sub flush()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getPosition() As uint64
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub rewind(bytes as uint64)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub skip(bytes as uint64)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub writeCString(text as string)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub writeInt16(value as int16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub writeInt32(value as int32)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub writeInt64(value as Int64)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub writeInt8(value as int8)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub writePString(text as string)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub writeString(text as string)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub writeUInt16(value as Uint16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub writeUInt32(value as Uint32)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub writeUInt64(value as Uint64)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub writeUInt8(value as Uint8)
		  
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
