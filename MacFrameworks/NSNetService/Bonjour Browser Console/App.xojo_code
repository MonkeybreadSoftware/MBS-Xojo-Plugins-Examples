#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  Const domain = "local." // default
		  const type = "_test._tcp."
		  const name = "My Test Service"
		  const port = 12345
		  
		  testService = new NetworkService(domain, type, name, port)
		  testService.publish
		  
		  do
		    
		    // run event loop once
		    NSRunLoopMBS.currentRunLoop.runOnce
		    
		    DoEvents
		  loop
		  
		End Function
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		testService As Networkservice
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
