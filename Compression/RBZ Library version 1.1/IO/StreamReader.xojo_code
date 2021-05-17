#tag Interface
Protected Interface StreamReader
	#tag Method, Flags = &h0
		Function eof() As boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getPosition() As uint64
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readAll(encoding as TextEncoding = nil) As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readCString(encoding as TextEncoding = nil) As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readInt16() As int16
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readInt32() As int32
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readInt64() As int64
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readInt8() As int8
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readPString(encoding as TextEncoding = nil) As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readString(bytes as uint64, encoding as TextEncoding = nil) As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readUInt16() As Uint16
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readUInt32() As Uint32
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readUInt64() As Uint64
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readUInt8() As Uint8
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub skip(bytes as uint64)
		  
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
