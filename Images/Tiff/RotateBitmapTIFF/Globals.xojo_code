#tag Module
Protected Module Globals
	#tag Method, Flags = &h0
		Sub RotateBitmap()
		  RotateTiff = New RotateTiffThread
		  RotateTiff.Run
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RotateDone()
		  TiffDone = New Timer_Done
		  TiffDone.Period = 100
		  TiffDone.Mode = 1
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Degrees As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		InputFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		Messages() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		RotateTiff As RotateTiffThread
	#tag EndProperty

	#tag Property, Flags = &h0
		TiffDone As Timer_Done
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
			Name="Degrees"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
