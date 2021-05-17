#tag Class
Protected Class Script
Inherits RbScript
	#tag Event
		Sub CompilerError(line As Integer, errorNumber As Integer, errorMsg As String)
		  if app.c.writeConsole("Compile error at line "+str(line)+" with error "+str(errornumber)+": "+errorMsg+"."+app.crlf) then
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Function Input(prompt As String) As String
		  if app.c.writeConsole(prompt+app.crlf) then
		    return app.c.ReadConsole(80)
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Sub Print(msg As String)
		  if app.c.writeConsole(msg+app.crlf) then
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub RuntimeError(line As Integer, error As RuntimeException)
		  if app.c.writeConsole("Runtime error at line "+str(line)+"."+app.crlf) then
		  end if
		End Sub
	#tag EndEvent


	#tag ViewBehavior
		#tag ViewProperty
			Name="State"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
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
		#tag ViewProperty
			Name="Source"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
