#tag Module
Protected Module Encryption
	#tag Method, Flags = &h0
		Function Decrypt(data as string, password as string) As string
		  dim b as BlowfishMBS
		  dim temp as MemoryBlock
		  
		  b=new BlowfishMBS
		  b.SetKey password
		  
		  Return b.DecryptCFB64(data,temp)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Encrypt(data as string, password as string) As string
		  dim b as BlowfishMBS
		  dim temp as MemoryBlock
		  
		  b=new BlowfishMBS
		  b.SetKey password
		  
		  Return b.EncryptCFB64(data,temp)
		  
		End Function
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
End Module
#tag EndModule
