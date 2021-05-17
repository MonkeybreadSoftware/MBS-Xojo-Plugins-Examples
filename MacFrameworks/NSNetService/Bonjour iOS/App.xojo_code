#tag Class
Protected Class App
Inherits IOSApplication
	#tag CompatibilityFlags = TargetIOS
	#tag Event
		Function Open(launchOptionsHandle as Ptr) As Boolean
		  // register test service
		  
		  
		  const domain = "" // default
		  const type = "_test._tcp."
		  const name = "My Test Service"
		  const port = 12345
		  
		  testService = new NSNetServiceMBS(domain, type, name, port)
		  testService.publish
		  
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		testService As NSNetServiceMBS
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
