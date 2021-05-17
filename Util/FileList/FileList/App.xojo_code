#tag Class
Protected Class App
Inherits Application
	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  MsgBox Introspection.GetType(error).fullname+EndOfLine+EndOfLine+error.Message+EndOfLine+Join(error.Stack, EndOfLine)
		  Return True
		  
		End Function
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
