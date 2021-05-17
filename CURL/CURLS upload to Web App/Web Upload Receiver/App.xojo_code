#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Function HandleSpecialURL(Request As WebRequest) As Boolean
		  dim r as string = Request.Entity
		  
		  dim msg as string = "Received request with "+str(len(r))+" bytes attached."
		  
		  dim c as integer = SessionCount-1
		  for i as integer = 0 to c
		    dim s as session = session(SessionAtIndex(i))
		    s.WebPage1.ListBox1.AddRow msg
		  next
		  
		  Return true
		  
		End Function
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
