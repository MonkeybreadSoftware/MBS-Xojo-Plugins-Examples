#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Function HandleSpecialURL(Request As WebRequest) As Boolean
		  #Pragma BackgroundTasks False
		  
		  if Request.Path = "Status" then
		    Dim j As New JSONItem
		    Dim a As app = app
		    
		    j.Value("MemoryUsed") = runtime.MemoryUsed
		    j.Value("ObjectCount") = runtime.ObjectCount
		    j.Value("SessionCount") = a.SessionCount
		    j.Value("Name") = a.ExecutableFile.Name
		    
		    Request.Print j.ToString
		    return true
		  end if
		  
		End Function
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
