#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Sub Open()
		  startdate = new date
		  
		  ' register plugins here
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		StartDate As date
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
