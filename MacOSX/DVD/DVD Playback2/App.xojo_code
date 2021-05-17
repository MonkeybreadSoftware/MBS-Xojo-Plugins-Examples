#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  // found volume mount event
		  c=new MyCarbonApplicationEventsMBS
		  c.Listen
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		c As mycarbonApplicationEventsMBS
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
