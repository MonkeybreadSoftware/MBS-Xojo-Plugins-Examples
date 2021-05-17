#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  if TargetWin32 then
		    // Disable error dialog from Windows with missing disc in drive
		    
		    soft Declare Function SetErrorMode Lib "kernel32" (wMode As integer) As integer
		    
		    call SetErrorMode 3
		    
		  end if
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
