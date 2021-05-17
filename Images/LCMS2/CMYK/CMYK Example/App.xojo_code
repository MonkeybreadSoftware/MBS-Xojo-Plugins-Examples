#tag Class
Protected Class App
Inherits Application
	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  
		  #if DebugBuild
		  #else
		    if error isa NilObjectException then
		      MsgBox "There was a nil object exception somewhere."
		    else
		      MsgBox "There was an exception somewhere." 
		    end if
		    
		    Return true
		  #endif
		  
		End Function
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
