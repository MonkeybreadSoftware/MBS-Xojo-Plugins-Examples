#tag Class
Protected Class App
Inherits Application
	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  MsgBox "Unhandled "+Introspection.GetType(error).name+": "+error.Message+EndOfLine+EndOfLine+join(error.Stack, EndOfLine)
		  Return true
		  
		End Function
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
