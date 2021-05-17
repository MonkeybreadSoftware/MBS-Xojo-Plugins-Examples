#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Sub Open(args() as String)
		  EventTimer = new EventTimer
		  
		  // register test service
		  
		  
		  const domain = "local." // default
		  const type = "_test._tcp."
		  const name = "My Test Service"
		  const port = 12345
		  
		  testService = New NSNetServiceMBS(domain, type, name, port)
		  testService.publish
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		EventTimer As Timer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected testService As NSNetServiceMBS
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
