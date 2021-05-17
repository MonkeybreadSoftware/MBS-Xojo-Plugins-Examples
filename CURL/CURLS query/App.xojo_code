#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim header(-1) as string
		  dim c as new MyCURL
		  
		  // this example sends a xml request to a server
		  
		  c.OptionVerbose=true
		  c.OptionURL = "http://www.someserver.com/service"
		  
		  c.OptionPost = true
		  c.OptionCustomRequest="POST"
		  
		  Dim request as String = "<?xml version=""1.0""?><methodCall><methodName>application.getValue</methodName><params><param><value>info</value></param></params></methodCall>"
		  
		  c.InputData = request
		  
		  header.Append "Content-Type: text/xml"
		  c.SetOptionHTTPHeader header
		  
		  msgbox str(c.Perform)
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
