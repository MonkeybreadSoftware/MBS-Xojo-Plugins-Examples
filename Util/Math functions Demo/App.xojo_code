#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  TestIntOps()
		  MsgBox "The bitwise integer functions seem to be working fine."
		  
		  quit
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
