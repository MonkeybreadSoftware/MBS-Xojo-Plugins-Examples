#tag Class
Protected Class app
Inherits Application
	#tag Event
		Sub Open()
		  
		  
		  // We need to watch for some events:
		  
		  c = new CarbonApplicationEvents
		  c.Listen
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h1
		Protected c As carbonapplicationEventsMBS
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
