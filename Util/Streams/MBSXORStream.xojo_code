#tag Class
Protected Class MBSXORStream
Implements MBSStream
	#tag Method, Flags = &h0
		Sub Constructor(dest as MBSStream, xcode as string)
		  d=Dest
		  code=xcode
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Read(n as integer) As string
		  dim s as string
		  
		  s=d.Read(n)
		  
		  return StringXORMBS(s,code)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(data as string)
		  dim s as string
		  
		  s=StringXORMBS(data,code)
		  
		  d.Write s
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		XORs every byte in the stream written or read.
		Doesn't care for buffer size
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		code As string
	#tag EndProperty

	#tag Property, Flags = &h0
		d As MBSStream
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
		#tag ViewProperty
			Name="code"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
