#tag Class
Protected Class MyShellMBS
Inherits ShellMBS
	#tag Event
		Sub Completed()
		  
		  output = output + Me.ReadOutput
		  errors = errors + Me.ReadError
		  MainWindow.Log.Text = output+Errors
		  
		  MsgBox "Completed"
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DataAvailable(AvailableBytesError as Integer, AvailableBytesOutput as Integer)
		  output = output + Me.ReadOutput
		  errors = errors + Me.ReadError
		  MainWindow.Log.Text = output+Errors
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		Errors As string
	#tag EndProperty

	#tag Property, Flags = &h0
		output As string
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
			Name="output"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Errors"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
