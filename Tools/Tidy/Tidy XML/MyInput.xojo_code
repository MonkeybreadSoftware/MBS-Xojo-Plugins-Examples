#tag Class
Protected Class MyInput
Inherits TidyInputMBS
	#tag Event
		Function EndOfFile() As boolean
		  Return index=count
		End Function
	#tag EndEvent

	#tag Event
		Function GetByte() As integer
		  // return one byte
		  index=index+1
		  Return ascb(midb(data,index,1))
		End Function
	#tag EndEvent

	#tag Event
		Sub UngetByte(value as integer)
		  index=index-1
		  // we hope the value is the one from the string
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(s as string)
		  data=s
		  count=lenb(s)
		  index=0
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private count As integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private data As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private index As integer
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
			InitialValue=""
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
